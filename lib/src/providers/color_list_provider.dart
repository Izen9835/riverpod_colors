import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_colors/src/models/color_result.dart';
import 'package:riverpod_colors/src/services/api_service.dart';

part 'color_list_provider.g.dart';

@Riverpod(keepAlive: true) //keepAlive keeps data in cache for fastter loading??
class ColorList extends _$ColorList {
  @override
  List<ColorResult> build() {
    _load();
    return [];
  }

  Future<void> _load() async {
    final results = await ApiService().listTopColors();
    state = results;
  }

  Future<void> refresh() async {
    state = [];
    await _load();
  }

  void like(int id, bool value) {
    final index = state.indexWhere((color) => color.id == id);
    // return -1 if invalid

    if (index >= 0) {
      // in order for UI to reflect the changes you must change the entire state
      // cannot only modify it
      // so this trick allows us to have some shortcut to modify only one value but make the provider think
      // the entire state was changed
      state =
          [...state]
            ..removeAt(index)
            ..insert(index, state[index].like(value));
    }
  }
}
