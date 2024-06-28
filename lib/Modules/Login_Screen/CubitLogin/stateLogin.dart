abstract class AppLoginState {}
class AppLoginInitlState extends AppLoginState {}

class AppStateLodingLoginuserDate extends AppLoginState {}
class AppStateSucssesLoginUserDate extends AppLoginState
{
  final uId;
  AppStateSucssesLoginUserDate(this.uId);
}
class AppStateErrorLoginUserDate extends AppLoginState
{
  final err;
  AppStateErrorLoginUserDate(this.err);
}
class AppStateLodingGoogleLoginuserDate extends AppLoginState {}
class AppStateSucssesGoogleUserDate extends AppLoginState
{
  final uId;
  AppStateSucssesGoogleUserDate(this.uId);
}
class AppStateErrorGoogleUserDate extends AppLoginState
{
  final err;
  AppStateErrorGoogleUserDate(this.err);
}
class AppStateLoginCreateUserGoogleDate extends AppLoginState {}
class AppStateSucssesCreateUserGoogleDate extends AppLoginState {}
class AppStateErrorCreateUserGoogleDate extends AppLoginState
{
  final err;
  AppStateErrorCreateUserGoogleDate(this.err);
}
class AppStateChangeVisbilet extends AppLoginState {}
class AppStateChangeTime extends AppLoginState {}
