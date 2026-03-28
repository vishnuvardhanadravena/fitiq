import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../networks/dio_client.dart';

final dioProvider = Provider<Dio>((ref) {
  return DioClient.createDio();
});