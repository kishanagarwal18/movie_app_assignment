import 'package:dio/dio.dart';
import '../constants/api_constants.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchMovies() async {
    final response = await _dio.get(
      "${ApiConstants.baseUrl}/movie/popular",
      queryParameters: {
        "api_key": ApiConstants.apiKey,
      },
    );
    return response.data['results'];
  }
}
