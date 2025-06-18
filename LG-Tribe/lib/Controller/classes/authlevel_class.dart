import 'dart:math';

class AuthLevel 
{
  final String value;

  const AuthLevel._(this.value);

  static const merchandiser = AuthLevel._("Merchandiser");
  static const promoter = AuthLevel._("Promoter");
  static const floorServiceprovider = AuthLevel._("Floor Service Provider");

  static const values = [
    merchandiser,
    promoter,
    floorServiceprovider
  ];

  static AuthLevel fromString(String val) =>
    values.firstWhere((e) => e.value == val, orElse: () => merchandiser);
    
    // () => throw ArgumentError("Invalid AuthLevel value: $val"));
  
}