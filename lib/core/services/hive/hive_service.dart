import 'package:funchat/core/constants/hive_table_constant.dart';
import 'package:funchat/features/auth/data/models/auth_hive_model.dart';
import 'package:hive/hive.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final hiveServiceProvider = Provider<HiveService>((ref) {
  return HiveService();
});

class HiveService {
  // Box names
  static const String _authBoxName = HiveTableConstant.authTable; // 'authBox'
  static const String _settingsBoxName = 'app_settings';
  static const String _currentUserIdKey = 'current_user_id';

  late Box<AuthHiveModel> _authBox;
  late Box<String> _settingsBox;

  /// Initialize HiveService
  Future<void> init() async {
    _registerAdapters();
    await _openBoxes();
  }

  void _registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveTableConstant.authTypeId)) {
      Hive.registerAdapter(AuthHiveModelAdapter());
    }
  }

  Future<void> _openBoxes() async {
    _authBox = await Hive.openBox<AuthHiveModel>(_authBoxName);
    _settingsBox = await Hive.openBox<String>(_settingsBoxName);
  }

  /// LOGIN
  Future<AuthHiveModel?> loginUser(String email, String password) async {
    final lowerEmail = email.toLowerCase();
    final users = _authBox.values.where(
      (user) => user.email.toLowerCase() == lowerEmail && user.password == password,
    );

    if (users.isEmpty) return null;

    final loggedInUser = users.first;

    // Save current user ID
    await _settingsBox.put(_currentUserIdKey, loggedInUser.authId);

    return loggedInUser;
  }

  /// REGISTER
  Future<void> registerUser(AuthHiveModel model) async {
    final userWithId = model.authId.isNotEmpty
        ? model
        : model.copyWith(authId: const Uuid().v4());

    await _authBox.put(userWithId.authId, userWithId);

    // Auto-login after registration
    await _settingsBox.put(_currentUserIdKey, userWithId.authId);
  }

  /// LOGOUT
  Future<void> logoutUser() async {
    await _settingsBox.delete(_currentUserIdKey);
  }

  /// GET CURRENT USER
  Future<AuthHiveModel?> getCurrentUser() async {
    final String? currentUserId = _settingsBox.get(_currentUserIdKey);
    if (currentUserId == null) return null;
    return _authBox.get(currentUserId);
  }

  /// CHECK EMAIL EXISTS
  Future<bool> isEmailExists(String email) async {
    final lowerEmail = email.toLowerCase();
    return _authBox.values.any((user) => user.email.toLowerCase() == lowerEmail);
  }
}
