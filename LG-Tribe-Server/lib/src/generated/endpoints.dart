/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/profileInfo_endpoints.dart' as _i2;
import '../endpoints/user_endpoints.dart' as _i3;
import 'package:lg_tribe_server/src/generated/auth_level.dart' as _i4;
import 'package:lg_tribe_server/src/generated/country.dart' as _i5;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'profileInfoEndpoints': _i2.ProfileInfoEndpoints()
        ..initialize(
          server,
          'profileInfoEndpoints',
          null,
        ),
      'userEndpoints': _i3.UserEndpoints()
        ..initialize(
          server,
          'userEndpoints',
          null,
        ),
    };
    connectors['profileInfoEndpoints'] = _i1.EndpointConnector(
      name: 'profileInfoEndpoints',
      endpoint: endpoints['profileInfoEndpoints']!,
      methodConnectors: {
        'getProfileInfo': _i1.MethodConnector(
          name: 'getProfileInfo',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['profileInfoEndpoints'] as _i2.ProfileInfoEndpoints)
                  .getProfileInfo(session),
        )
      },
    );
    connectors['userEndpoints'] = _i1.EndpointConnector(
      name: 'userEndpoints',
      endpoint: endpoints['userEndpoints']!,
      methodConnectors: {
        'registerUser': _i1.MethodConnector(
          name: 'registerUser',
          params: {
            'firstName': _i1.ParameterDescription(
              name: 'firstName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'lastName': _i1.ParameterDescription(
              name: 'lastName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'contacts': _i1.ParameterDescription(
              name: 'contacts',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'authenticationlevel': _i1.ParameterDescription(
              name: 'authenticationlevel',
              type: _i1.getType<_i4.AuthenticationLevel>(),
              nullable: false,
            ),
            'country': _i1.ParameterDescription(
              name: 'country',
              type: _i1.getType<_i5.Country>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userEndpoints'] as _i3.UserEndpoints).registerUser(
            session,
            params['firstName'],
            params['lastName'],
            params['contacts'],
            params['email'],
            params['password'],
            params['authenticationlevel'],
            params['country'],
          ),
        ),
        'loginUser': _i1.MethodConnector(
          name: 'loginUser',
          params: {
            'contacts': _i1.ParameterDescription(
              name: 'contacts',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'authenticationlevel': _i1.ParameterDescription(
              name: 'authenticationlevel',
              type: _i1.getType<_i4.AuthenticationLevel>(),
              nullable: false,
            ),
            'country': _i1.ParameterDescription(
              name: 'country',
              type: _i1.getType<_i5.Country>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userEndpoints'] as _i3.UserEndpoints).loginUser(
            session,
            params['contacts'],
            params['password'],
            params['authenticationlevel'],
            params['country'],
          ),
        ),
      },
    );
  }
}
