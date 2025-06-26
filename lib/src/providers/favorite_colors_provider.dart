import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_colors/src/models/color_result.dart';
import 'package:riverpod_colors/src/providers/color_list_provider.dart';

final favoriteColorsProvider = Provider<List<ColorResult>>((ref) {
  return ref.watch(colorListProvider).where((color) => color.isLiked).toList();
});
