// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:repository/api/api_client.dart';
import 'package:repository/models/models.dart';

class PostReporitory {
  PostReporitory({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<List<PostModel>> listPost({
    int page = 1,
    int perPage = 10,
  }) async {
    try {
      final response = await _apiClient.instance.get('/posts');
      final responseData = response.data;
      final postData = List<PostModel>.from(
        (responseData as List<dynamic>).map(
          (e) => PostModel.fromMap(e as Map<String, dynamic>),
        ),
      );
      // return postData.skip((page - 1) * perPage).take(perPage).toList();
      return postData;
    } catch (err, stackTrace) {
      debugPrintStack(label: 'FetchHomeError', stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<void> createPost() async {}
  Future<void> updatePost() async {}
  Future<void> deletePost() async {}
}
