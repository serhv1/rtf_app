import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rtf_app/models/post_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io/v3/')
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('dfb63938-dbb3-45d6-b66c-46b5025b5f0a')
  Future<List<PostModel>> getPosts();
}
// 2cc24e6b-2cc1-4b55-8af4-0466c10237f5
