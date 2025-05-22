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
import '../endpoints/user_endpoints.dart' as _i2;
import '../greeting_endpoint.dart' as _i3;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'userEndpoints': _i2.UserEndpoints()
        ..initialize(
          server,
          'userEndpoints',
          null,
        ),
      'greeting': _i3.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
    };
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
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userEndpoints'] as _i2.UserEndpoints).registerUser(
            session,
            params['firstName'],
            params['lastName'],
            params['contacts'],
            params['email'],
            params['password'],
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
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userEndpoints'] as _i2.UserEndpoints).loginUser(
            session,
            params['contacts'],
            params['password'],
          ),
        ),
      },
    );
    connectors['greeting'] = _i1.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['greeting'] as _i3.GreetingEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
  }
}
