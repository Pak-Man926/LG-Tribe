import "package:shared_preferences/shared_preferences.dart";

class StorageService
{
    static Future<void> saveLoginData({required int contacts, required String authLevel, required String Country}) async
    {
        final prefs = await SharedPreferences.getInstance();

        await 
    }
}