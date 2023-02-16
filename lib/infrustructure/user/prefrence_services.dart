import 'package:ethio_agri_ceft_app/infrustructure/user/user_cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefrenceServices {
  void saveSettings(Settings settings) async {
    final prefrences = await SharedPreferences.getInstance();

    await prefrences.setString('email', settings.email);
  }

  Future<Settings> getSettings() async {
    final prefrences = await SharedPreferences.getInstance();
    final email = prefrences.getString('email');
    return Settings(email: email.toString());
  }
}
