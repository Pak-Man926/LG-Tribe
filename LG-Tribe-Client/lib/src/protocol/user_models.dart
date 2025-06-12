/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'auth_level.dart' as _i2;
import 'country.dart' as _i3;

abstract class User implements _i1.SerializableModel {
  User._({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.contacts,
    required this.email,
    required this.password,
    required this.authlevel,
    required this.country,
  });

  factory User({
    int? id,
    required String firstName,
    required String lastName,
    required int contacts,
    required String email,
    required String password,
    required _i2.AuthLevel authlevel,
    required _i3.Country country,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      firstName: jsonSerialization['firstName'] as String,
      lastName: jsonSerialization['lastName'] as String,
      contacts: jsonSerialization['contacts'] as int,
      email: jsonSerialization['email'] as String,
      password: jsonSerialization['password'] as String,
      authlevel:
          _i2.AuthLevel.fromJson((jsonSerialization['authlevel'] as int)),
      country: _i3.Country.fromJson((jsonSerialization['country'] as int)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String firstName;

  String lastName;

  int contacts;

  String email;

  String password;

  _i2.AuthLevel authlevel;

  _i3.Country country;

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  User copyWith({
    int? id,
    String? firstName,
    String? lastName,
    int? contacts,
    String? email,
    String? password,
    _i2.AuthLevel? authlevel,
    _i3.Country? country,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'contacts': contacts,
      'email': email,
      'password': password,
      'authlevel': authlevel.toJson(),
      'country': country.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required String firstName,
    required String lastName,
    required int contacts,
    required String email,
    required String password,
    required _i2.AuthLevel authlevel,
    required _i3.Country country,
  }) : super._(
          id: id,
          firstName: firstName,
          lastName: lastName,
          contacts: contacts,
          email: email,
          password: password,
          authlevel: authlevel,
          country: country,
        );

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  User copyWith({
    Object? id = _Undefined,
    String? firstName,
    String? lastName,
    int? contacts,
    String? email,
    String? password,
    _i2.AuthLevel? authlevel,
    _i3.Country? country,
  }) {
    return User(
      id: id is int? ? id : this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      contacts: contacts ?? this.contacts,
      email: email ?? this.email,
      password: password ?? this.password,
      authlevel: authlevel ?? this.authlevel,
      country: country ?? this.country,
    );
  }
}
