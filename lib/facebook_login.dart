import 'package:flutter_facebook_login/flutter_facebook_login.dart';
var json;
var http;
var profileData;
void initiateFacebookLogin() async {
  var facebookLogin = FacebookLogin();
  var facebookLoginResult =
  await facebookLogin.logInWithReadPermissions(['email']);
  switch (facebookLoginResult.status) {
    case FacebookLoginStatus.error:
      print("Error");
      onLoginStatusChanged(false);
      break;
    case FacebookLoginStatus.cancelledByUser:
      print("CancelledByUser");
      onLoginStatusChanged(false);
      break;
    case FacebookLoginStatus.loggedIn:
      print("LoggedIn");

      var graphResponse = await http.get(
          'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${facebookLoginResult
              .accessToken.token}');

      var profile = json.decode(graphResponse.body);
      print(profile.toString());

      onLoginStatusChanged(true, profileData: profile);
      break;
  }
}
bool isLoggedIn = false;

void onLoginStatusChanged(bool isLoggedIn, {var profileData}) {

}
