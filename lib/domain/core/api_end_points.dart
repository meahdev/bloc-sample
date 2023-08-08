import '../../core/constants.dart';
import '../../infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$baseUrl/3/trending/all/day?api_key=$apiKey";
  static const search = "$baseUrl/3/search/movie?api_key=$apiKey";
}
