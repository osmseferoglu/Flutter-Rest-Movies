// ignore_for_file: file_names

class ApiConstants {
  // ignore: constant_identifier_names
  static const String baseUrl = "https://api.themoviedb.org";
  static const String apiKey = "api_key=b155b3b83ec4d1cbb1e9576c41d00503";
  static const String discoverEndpoint = "3/discover/movie";
  static const String languageParam = "language=en-US";
  static const String sortByParam = "sort_by=popularity.desc";
  static const String includeAdultParam = "include_adult=false";
  static const String includeVideoParam = "include_video=false";
  static const String pageParam = "page=";

  static String getUsersEndpoint(int pageNumber) {
    return "$baseUrl/$discoverEndpoint?$apiKey&$languageParam&$sortByParam&$includeAdultParam&$includeVideoParam&$pageParam$pageNumber";
  }
  static const String imageUrlEndPoint = "https://image.tmdb.org/t/p/w500";
  static String getimageEndPoint(String posterPath){
    return "$imageUrlEndPoint$posterPath";
  }
}
