import 'package:funchat/core/services/hive/hive_service.dart';
import 'package:funchat/features/auth/data/datasources/auth_datasource.dart';
import 'package:funchat/features/auth/data/models/auth_hive_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authLocalDatasourceProvider = Provider<AuthLocalDatasource>((ref) {
  final hiveService = ref.watch(hiveServiceProvider);
  return AuthLocalDatasource(hiveService: hiveService);
});

class AuthLocalDatasource implements IAuthDatasource {
  final HiveService _hiveService;

  AuthLocalDatasource({required HiveService hiveService})
    : _hiveService = hiveService;

  @override
  Future<AuthHiveModel?> login(String email, String password) async {
    return await _hiveService.loginUser(email, password);
  }

  @override
  Future<bool> register(AuthHiveModel model) async {
    await _hiveService.registerUser(model);
    return true;
  }

  @override
  Future<bool> logout() async {
    await _hiveService.logoutUser();
    return true;
  }

  @override
  Future<AuthHiveModel?> getCurrentUser() async {
    return await _hiveService.getCurrentUser(); // Temporarily return null - no current user tracking yet
  }

  @override
  Future<bool> isEmailExists(String email) async {
    return await _hiveService.isEmailExists(email);
  }
}