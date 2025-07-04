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
import 'user_models.dart' as _i4;
export 'auth_level.dart';
export 'country.dart';
export 'user_models.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.AuthenticationLevel) {
      return _i2.AuthenticationLevel.fromJson(data) as T;
    }
    if (t == _i3.Country) {
      return _i3.Country.fromJson(data) as T;
    }
    if (t == _i4.User) {
      return _i4.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.AuthenticationLevel?>()) {
      return (data != null ? _i2.AuthenticationLevel.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i3.Country?>()) {
      return (data != null ? _i3.Country.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.User?>()) {
      return (data != null ? _i4.User.fromJson(data) : null) as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.AuthenticationLevel) {
      return 'AuthenticationLevel';
    }
    if (data is _i3.Country) {
      return 'Country';
    }
    if (data is _i4.User) {
      return 'User';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'AuthenticationLevel') {
      return deserialize<_i2.AuthenticationLevel>(data['data']);
    }
    if (dataClassName == 'Country') {
      return deserialize<_i3.Country>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i4.User>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
