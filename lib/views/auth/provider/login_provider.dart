import 'package:fitiq/core/networks/api_endpoints.dart';
import 'package:fitiq/core/providers/api_service_provider.dart';
import 'package:fitiq/core/storage/token_storage.dart';
import 'package:fitiq/core/utils/async_state.dart';
import 'package:fitiq/views/auth/models/login_req_model.dart';
import 'package:fitiq/views/auth/models/login_res_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/legacy.dart';

final loginProvider =
    StateNotifierProvider<LoginNotifier, AsyncState<LoginResModel>>((ref) {
      return LoginNotifier(ref);
    });

class LoginNotifier extends StateNotifier<AsyncState<LoginResModel>> {
  final Ref ref;

  LoginNotifier(this.ref) : super(const AsyncState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final api = ref.read(apiServiceProvider);

      final response = await api.post<Map<String, dynamic>>(
        ApiEndpoints.login,
        data: LoginRequest
        (email: email, password: password).toJson(),
      );

      final result = LoginResModel.fromJson(response.data!);

      if (result.token != null) {
        await TokenStorage.saveToken(result.token!);
        debugPrint("✅ Token saved");
      }

      state = state.copyWith(isLoading: false, data: result);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: "Login failed",
        clearData: true,
      );
    }
  }
}
