import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_colors/src/models/color_result.dart';
import 'package:riverpod_colors/src/services/api_service.dart';

// final colorDetailProvider = FutureProvider<ColorResult?>((ref) async {
//   return await ApiService().retrieve("#000000");
// });

final colorDetailProvider = FutureProvider.family<ColorResult?, String>((
  ref,
  hexcode,
) async {
  return await ApiService().retrieve(hexcode);
});
