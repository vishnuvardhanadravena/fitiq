import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dio_provider.dart';
import '../storage/token_storage.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return ApiService(dio);
});

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    bool requireAuth = false,
  }) async {
    final headers = <String, String>{};

    if (requireAuth) {
      final token = await TokenStorage.getToken();
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    return await dio.post<T>(
      path,
      data: data,
      options: Options(headers: headers),
    );
  }
}