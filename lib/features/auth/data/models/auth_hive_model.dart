import 'package:funchat/core/constants/hive_table_constant.dart';
import 'package:funchat/features/auth/domain/entities/auth_entity.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.authTypeId)
class AuthHiveModel extends HiveObject {
  @HiveField(0)
  final String authId;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String userName;

  @HiveField(3)
  final String? phoneNumber;

  @HiveField(4)
  final String? password;

  @HiveField(5)
  final String? fullName; // optional

  @HiveField(6)
  final String? batchId; // optional

  @HiveField(7)
  final String? profilePicture; // optional

  AuthHiveModel({
    String? authId,
    required this.email,
    required this.userName,
    this.phoneNumber,
    this.password,
    this.fullName,
    this.batchId,
    this.profilePicture,
  }) : authId = authId ?? const Uuid().v4();

  /// Convert from domain entity → Hive
  factory AuthHiveModel.fromEntity(AuthEntity entity) {
    return AuthHiveModel(
      authId: entity.userId ?? const Uuid().v4(),
      email: entity.email,
      userName: entity.username,
      phoneNumber: entity.phoneNumber,
      password: entity.password,
      fullName: entity.fullName ,
      batchId: entity.batchId ,
      profilePicture: entity.profilePicture,
    );
  }

  /// Convert Hive → domain entity
  AuthEntity toEntity() {
    return AuthEntity(
      userId: authId,
      email: email,
      username: userName,
      phoneNumber: phoneNumber,
      password: password,
      fullName: fullName ?? '',
      batchId: batchId ?? '',
      profilePicture: profilePicture,
    );
  }

  /// CopyWith helper
  AuthHiveModel copyWith({
    String? authId,
    String? email,
    String? userName,
    String? phoneNumber,
    String? password,
    String? fullName,
    String? batchId,
    String? profilePicture,
  }) {
    return AuthHiveModel(
      authId: authId ?? this.authId,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
      batchId: batchId ?? this.batchId,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  @override
  String toString() {
    return 'AuthHiveModel(authId: $authId, email: $email, userName: $userName, phone: $phoneNumber)';
  }
}
