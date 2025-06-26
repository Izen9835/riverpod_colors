import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_colors/src/models/color_result.dart';
import 'package:riverpod_colors/src/services/api_service.dart';

part 'color_detail_provider.g.dart';

// final colorDetailProvider = FutureProvider<ColorResult?>((ref) async {
//   return await ApiService().retrieve("#000000");
// });

@Riverpod(keepAlive: true)
Future<ColorResult?> colorDetail(ColorDetailRef ref, String hexcode) async {
  return await ApiService().retrieve(hexcode);
}
