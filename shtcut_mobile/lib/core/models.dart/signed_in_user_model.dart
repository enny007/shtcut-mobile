import 'package:shtcut_mobile/core/models.dart/user.dart';

class SignedInUserModel {
  final String id;
  final String publicId;
  final String email;
  final String firstName;
  final String lastName;
  final String role;
  final bool accountVerified;
  final bool active;
  final bool isAdmin;
  final bool socialAuth;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Verifications verifications;
  final List<dynamic> modules;
  final List<dynamic> workspaces;

  SignedInUserModel({
    required this.id,
    required this.publicId,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.accountVerified,
    required this.active,
    required this.isAdmin,
    required this.socialAuth,
    required this.createdAt,
    required this.updatedAt,
    required this.verifications,
    required this.modules,
    required this.workspaces,
  });

  factory SignedInUserModel.fromJson(Map<String, dynamic> json) {
    return SignedInUserModel(
      id: json['id'] as String,
      publicId: json['publicId'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      role: json['role'] as String? ?? '',
      accountVerified: json['accountVerified'] as bool,
      active: json['active'] as bool,
      isAdmin: json['isAdmin'] as bool,
      socialAuth: json['socialAuth'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      verifications: Verifications.fromJson(json['verifications'] as Map<String, dynamic>),
      modules: json['modules'] as List<dynamic>? ?? [],
      workspaces: json['workspaces'] as List<dynamic>? ?? [],
    );
  }

  @override
  String toString() {
    return 'User(id: $id, email: $email, firstName: $firstName, lastName: $lastName, accountVerified: $accountVerified)';
  }
}
