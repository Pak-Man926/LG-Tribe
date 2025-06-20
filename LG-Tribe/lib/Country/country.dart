import "package:country_flags/country_flags.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:lg_tribe/Controller/classes/country_located_class.dart";
import "package:lg_tribe/Controller/userstate_controller_class.dart";

//User selects the country they are in before proceeding to login.
class Country extends StatelessWidget {
  //const Country({super.key});

  final userState = Get.put(UserStateController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: false,
        left: true,
        right: true,
        minimum: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 100, // Diameter of CircleAvatar (2 * radius)
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/LGE_Logo_HeritageRed_Grey_RGB.png',
                      ),
                      fit:
                          BoxFit
                              .scaleDown, // Ensures the image covers the circle fully
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Select Your Country",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Text(
                      "Each Supported Country has it's own cases",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                  ],
                ),
              ],
            ),
            Expanded(
              child: ListView(
                //padding: EdgeInsets.all(10),
                children: [
                  //Kenyan Country
                  MaterialButton(
                    onPressed: () {
                      userState.setCountry(CountryLocated.kenya);
                      Get.toNamed("/userlogin");
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 10),
                        CountryFlag.fromCountryCode(
                          "KE",
                          shape: const Circle(),
                        ),
                        Expanded(
                          //SizedBox(width: 10),
                          child: Text("     Kenya"),
                        ),
                        Icon(Icons.arrow_forward_ios, size: 15),
                      ],
                    ),
                  ),
                  MaterialButton(
                    //Ethiopian Country
                    onPressed: () {
                      userState.setCountry(CountryLocated.ethopia);
                      Get.toNamed("/userlogin");
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 10),
                        CountryFlag.fromCountryCode(
                          "ET",
                          shape: const Circle(),
                        ),
                        Expanded(child: Text("     Ethopia")),
                        Icon(Icons.arrow_forward_ios, size: 15),
                      ],
                    ),
                  ),
                  MaterialButton(
                    //Tanzanian Country
                    onPressed: () {
                      userState.setCountry(CountryLocated.tanzania);
                      Get.toNamed("/userlogin");
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 10),
                        CountryFlag.fromCountryCode(
                          "TZ",
                          shape: const Circle(),
                        ),
                        Expanded(child: Text("     Tanzania")),
                        Icon(Icons.arrow_forward_ios, size: 15),
                      ],
                    ),
                  ),
                  MaterialButton(
                    //Sudanese Country
                    onPressed: () {
                      userState.setCountry(CountryLocated.sudan);
                      Get.toNamed("/userlogin");
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 10),
                        CountryFlag.fromCountryCode(
                          "SD",
                          shape: const Circle(),
                        ),
                        Expanded(child: Text("     Sudan")),
                        Icon(Icons.arrow_forward_ios, size: 15),
                      ],
                    ),
                  ),
                  MaterialButton(
                    //Ugandan Country
                    onPressed: () {
                      userState.setCountry(CountryLocated.uganda);
                      Get.toNamed("/userlogin");
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 10),
                        CountryFlag.fromCountryCode(
                          "UG",
                          shape: const Circle(),
                        ),
                        Expanded(child: Text("     Uganda")),
                        Icon(Icons.arrow_forward_ios, size: 15),
                      ],
                    ),
                  ),
                  MaterialButton(
                    //Zambian Country
                    onPressed: () {
                      userState.setCountry(CountryLocated.zambia);
                      Get.toNamed("/userlogin");
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 10),
                        CountryFlag.fromCountryCode(
                          "ZM",
                          shape: const Circle(),
                        ),
                        Expanded(child: Text("     Zambia")),
                        Icon(Icons.arrow_forward_ios, size: 15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
