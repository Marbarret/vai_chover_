import 'package:dio/dio.dart';

class WeatherApiClient {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: "https://api.openweathermap.org/data/2.5/"));

  Future<Map<String, dynamic>> getWeather(
      double latitude, double longitude) async {
    try {
      final response = await _dio.get("weather", queryParameters: {
        "lat": latitude,
        "lon": longitude,
        "appid": "YOUR_API_KEY",
      });

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      throw Exception(
          "Failed to connect to the server. Check your internet connection.");
    }
  }
}

// Exemplo de uso
void main() async {
  final apiClient = WeatherApiClient();

  try {
    final result = await apiClient.getWeather(
        0.0, 0.0); // Substitua 0.0 pelos valores reais
    print(result);
  } catch (e) {
    print("Error: $e");
  }
}
