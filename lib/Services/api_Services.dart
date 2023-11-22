// ignore_for_file: body_might_complete_normally_nullable, file_names, avoid_print

import 'package:homework_flutter_rest_api/Constants.dart';
import 'package:homework_flutter_rest_api/Model/DataModel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<MoviesModel?> getMovies(int pageNumber) async {
    try {
      var url = Uri.parse(ApiConstants.getUsersEndpoint(pageNumber));
      print('Url: $url');
      print('Page Number: $pageNumber');
      var response = await http.get(url);
      

      if (response.statusCode == 200) {
        
        MoviesModel moviesModel = moviesModelFromJson(response.body);
        return moviesModel;
      } 
    } catch (e) {
      print('Error during HTTP request: $e');
      return null;
    }
  }
}

