// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String id;
  final String email;
  final String publicId;
  final bool accountVerified;
  final bool active;
  final bool isAdmin;
  final bool socialAuth;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Verifications verifications;

  User({
    required this.id,
    required this.email,
    required this.publicId,
    required this.accountVerified,
    required this.active,
    required this.isAdmin,
    required this.socialAuth,
    required this.createdAt,
    required this.updatedAt,
    required this.verifications,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      publicId: json['publicId'] as String,
      accountVerified: json['accountVerified'] as bool,
      active: json['active'] as bool,
      isAdmin: json['isAdmin'] as bool,
      socialAuth: json['socialAuth'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      verifications:
          Verifications.fromJson(json['verifications'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'publicId': publicId,
        'accountVerified': accountVerified,
        'active': active,
        'isAdmin': isAdmin,
        'socialAuth': socialAuth,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'verifications': verifications.toJson(),
      };

  @override
  String toString() {
    return 'User(id: $id, email: $email, publicId: $publicId, accountVerified: $accountVerified, active: $active, isAdmin: $isAdmin, socialAuth: $socialAuth, createdAt: $createdAt, updatedAt: $updatedAt, verifications: $verifications)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.publicId == publicId &&
        other.accountVerified == accountVerified &&
        other.active == active &&
        other.isAdmin == isAdmin &&
        other.socialAuth == socialAuth &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.verifications == verifications;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        publicId.hashCode ^
        accountVerified.hashCode ^
        active.hashCode ^
        isAdmin.hashCode ^
        socialAuth.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        verifications.hashCode;
  }
}

class Verifications {
  final bool email;
  final bool mobile;

  Verifications({
    required this.email,
    required this.mobile,
  });

  factory Verifications.fromJson(Map<String, dynamic> json) {
    return Verifications(
      email: json['email'] as bool,
      mobile: json['mobile'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'mobile': mobile,
      };

  @override
  String toString() => 'Verifications(email: $email, mobile: $mobile)';
}
