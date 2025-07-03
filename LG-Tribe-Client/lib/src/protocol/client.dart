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
import 'dart:async' as _i2;
import 'package:lg_tribe_client/src/protocol/auth_level.dart' as _i3;
import 'package:lg_tribe_client/src/protocol/country.dart' as _i4;
import 'protocol.dart' as _i5;

/// {@category Endpoint}
class EndpointUserEndpoints extends _i1.EndpointRef {
  EndpointUserEndpoints(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'userEndpoints';

  _i2.Future<bool> registerUser(
    String firstName,
    String lastName,
    int contacts,
    String email,
    String password,
    _i3.AuthenticationLevel authenticationlevel,
    _i4.Country country,
  ) =>
      caller.callServerEndpoint<bool>(
        'userEndpoints',
        'registerUser',
        {
          'firstName': firstName,
          'lastName': lastName,
          'contacts': contacts,
          'email': email,
          'password': password,
          'authenticationlevel': authenticationlevel,
          'country': country,
        },
      );

  _i2.Future<bool> loginUser(
    int contacts,
    String password,
    _i3.AuthenticationLevel authenticationlevel,
    _i4.Country country,
  ) =>
      caller.callServerEndpoint<bool>(
        'userEndpoints',
        'loginUser',
        {
          'contacts': contacts,
          'password': password,
          'authenticationlevel': authenticationlevel,
          'country': country,
        },
      );
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i5.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    userEndpoints = EndpointUserEndpoints(this);
  }

  late final EndpointUserEndpoints userEndpoints;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup =>
      {'userEndpoints': userEndpoints};

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
