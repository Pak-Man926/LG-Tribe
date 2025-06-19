class CountryLocated 
{
  final String name;

  const CountryLocated._(this.name);

  static const kenya = CountryLocated._("Kenya");
  static const ethopia = CountryLocated._("Ethiopia");
  static const tanzania = CountryLocated._("Tanzania");
  static const sudan = CountryLocated._("Sudan");
  static const uganda = CountryLocated._("Uganda");
  static const zambia = CountryLocated._("Zambia");

  static const values = [
    kenya,
    ethopia,
    tanzania,
    sudan,
    uganda,
    zambia
  ];

  static CountryLocated fromString(String val) =>
    values.firstWhere((e) => e.name == val, orElse: () => kenya); 
    
    //throw ArgumentError("Invalid CountryLocated value: $val"));

    Country toServerModel() {
  switch (this) {
    case CountryLocated.kenya:
      return Country.kenya;
    case CountryLocated.ethopia:
      return Country.ethopia;
    case CountryLocated.tanzania:
      return Country.tanzania;
    case CountryLocated.sudan:
      return Country.sudan;
    case CountryLocated.uganda:
      return Country.uganda;
    case CountryLocated.zambia:
      return Country.zambia;
  }
}

}