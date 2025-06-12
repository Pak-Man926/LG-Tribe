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

enum Country implements _i1.SerializableModel {
  kenya,
  ethiopia,
  tanzania,
  sudan,
  uganda,
  zambia;

  static Country fromJson(int index) {
    switch (index) {
      case 0:
        return Country.kenya;
      case 1:
        return Country.ethiopia;
      case 2:
        return Country.tanzania;
      case 3:
        return Country.sudan;
      case 4:
        return Country.uganda;
      case 5:
        return Country.zambia;
      default:
        throw ArgumentError('Value "$index" cannot be converted to "Country"');
    }
  }

  @override
  int toJson() => index;
  @override
  String toString() => name;
}
