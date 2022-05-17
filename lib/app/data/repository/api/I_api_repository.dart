import 'package:dio/dio.dart';
import 'package:flutter_app/app/data/network/api_client.dart';
import 'package:flutter_app/app/models/post.dart';

class IApiRepository {
  
  final String _baseServicelUrl;

  late ApiClient _apiClient;

  IApiRepository(this._baseServicelUrl) {
    _apiClient = ApiClient(Dio(), _baseServicelUrl);
  }


  Future<List<Post>> getPost() {
    return _apiClient.getPost();
  }

}
