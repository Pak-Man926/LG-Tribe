class CountryLocated {
  final String name;

  const CountryLocated._(this.name);

  static const kenya = CountryLocated._("Kenya");
  static const ethopia = CountryLocated._("Ethiopia");
  static const tanzania = CountryLocated._("Tanzania");
  static const sudan = CountryLocated._("Sudan");
  static const uganda = CountryLocated._("Uganda");
  static const zambia = CountryLocated._("Zambia");

  static const values = [kenya, ethopia, tanzania, sudan, uganda, zambia];

  static CountryLocated fromString(String val) =>
      values.firstWhere((e) => e.name == val, orElse: () => kenya);

  //throw ArgumentError("Invalid CountryLocated value: $val"));

  CountryLocated toServerModel() {
    switch (this) {
      case CountryLocated.kenya:
        return CountryLocated.kenya;
      case CountryLocated.ethopia:
        return CountryLocated.ethopia;
      case CountryLocated.tanzania:
        return CountryLocated.tanzania;
      case CountryLocated.sudan:
        return CountryLocated.sudan;
      case CountryLocated.uganda:
        return CountryLocated.uganda;
      case CountryLocated.zambia:
        return CountryLocated.zambia;
    }
  }
}
