import "package:shared_preferences/shared_preferences.dart";

class StorageService
{
    static Future<void> saveLoginData({required int contacts, required String authLevel, required String country}) async
    {
        final prefs = await SharedPreferences.getInstance();

        await prefs.setInt("contacts", contacts);
        await prefs.setString("authLevel", authLevel);
        await prefs.setString("country", country);

    }

    static Future<void> clearLoginData() async
    {
        final prefs = await SharedPreferences.getInstance();

        await prefs.remove("contacts");
        await prefs.remove("authLevel");
        await prefs.remove("country");
    }

    static Future<Map<String, dynamic>> getLoginData() async
    {
        final prefs = await SharedPreferences.getInstance();

        return {
            "contacts": prefs.getInt("contacts"),
            "authLevel": prefs.getString("authLevel"),
            "country": prefs.getString("country"),
        };
    }
}