import 'package:dio/dio.dart';
import 'package:riverpod_colors/src/models/color_result.dart';

class ApiService {
  Future<List<ColorResult>> listTopColors() async {
    final response = await Dio().get(
      "https://www.colourlovers.com/api/colors/top?format=json",
    );
    final results = response.data as List<dynamic>;

    return results.map((item) => ColorResult.fromJson(item)).toList();
  }

  // nullable in case retrieved hexcode is invalid?
  Future<ColorResult?> retrieve(String hexcode) async {
    final id = hexcode.replaceAll("#", "");
    final response = await Dio().get(
      "https://www.colourlovers.com/api/color/$id?format=json",
    );
    final results = response.data as List<dynamic>;

    return ColorResult.fromJson(results.first);
  }
}
