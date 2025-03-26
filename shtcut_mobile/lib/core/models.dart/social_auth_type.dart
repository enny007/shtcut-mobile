// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:shtcut_mobile/core/models.dart/user.dart';

class SocialAuthModel {
  final String id;
  final String publicId;
  final String email;
  final String socialId;
  final String socialType;
  final bool accountVerified;
  final bool socialAuth;
  final bool isAdmin;
  final bool active;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Verifications verifications;

  SocialAuthModel({
    required this.id,
    required this.publicId,
    required this.email,
    required this.socialId,
    required this.socialType,
    required this.accountVerified,
    required this.socialAuth,
    required this.isAdmin,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.verifications,
  });

  factory SocialAuthModel.fromJson(Map<String, dynamic> json) {
    return SocialAuthModel(
      id: json['id'] as String,
      publicId: json['publicId'] as String,
      email: json['email'] as String,
      socialId: json['socialId'] as String,
      socialType: json['socialType'] as String,
      accountVerified: json['accountVerified'] as bool,
      socialAuth: json['socialAuth'] as bool,
      isAdmin: json['isAdmin'] as bool,
      active: json['active'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      verifications:
          Verifications.fromJson(json['verifications'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'publicId': publicId,
        'email': email,
        'socialId': socialId,
        'socialType': socialType,
        'accountVerified': accountVerified,
        'socialAuth': socialAuth,
        'isAdmin': isAdmin,
        'active': active,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'verifications': verifications.toJson(),
      };

  @override
  String toString() {
    return 'SocialAuthModel(id: $id, publicId: $publicId, email: $email, socialId: $socialId, socialType: $socialType, accountVerified: $accountVerified, socialAuth: $socialAuth, isAdmin: $isAdmin, active: $active, createdAt: $createdAt, updatedAt: $updatedAt, verifications: $verifications)';
  }

  @override
  bool operator ==(covariant SocialAuthModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.publicId == publicId &&
        other.email == email &&
        other.socialId == socialId &&
        other.socialType == socialType &&
        other.accountVerified == accountVerified &&
        other.socialAuth == socialAuth &&
        other.isAdmin == isAdmin &&
        other.active == active &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.verifications == verifications;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        publicId.hashCode ^
        email.hashCode ^
        socialId.hashCode ^
        socialType.hashCode ^
        accountVerified.hashCode ^
        socialAuth.hashCode ^
        isAdmin.hashCode ^
        active.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        verifications.hashCode;
  }
}

// Create a separate Verifications class if it doesn't already exist
// class Verifications {
//   final bool email;
//   final bool mobile;

//   Verifications({
//     required this.email,
//     required this.mobile,
//   });

//   factory Verifications.fromJson(Map<String, dynamic> json) {
//     return Verifications(
//       email: json['email'] as bool,
//       mobile: json['mobile'] as bool,
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'email': email,
//         'mobile': mobile,
//       };

//   @override
//   String toString() => 'Verifications(email: $email, mobile: $mobile)';

//   @override
//   bool operator ==(covariant Verifications other) {
//     if (identical(this, other)) return true;

//     return other.email == email && other.mobile == mobile;
//   }

//   @override
//   int get hashCode => email.hashCode ^ mobile.hashCode;
