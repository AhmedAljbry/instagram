class AppStateRifster {}
class AppStateInitlRifester extends AppStateRifster {}
class AppStateLodingCreateUserDate extends AppStateRifster {}
class AppStateSucssesCreateUserDate extends AppStateRifster
{
  final String uId;
  AppStateSucssesCreateUserDate(this.uId);
}
class AppStateErrorCreateUserDate extends AppStateRifster
{
  final err;
  AppStateErrorCreateUserDate(this.err);
}
class AppStateLodingCreateUserDate1 extends AppStateRifster {}
class AppStateSucssesCreateUserDate1 extends AppStateRifster
{
  final String uId;
  AppStateSucssesCreateUserDate1(this.uId);
}
class AppStateErrorCreateUserDate1 extends AppStateRifster
{
  final err;
  AppStateErrorCreateUserDate1(this.err);
}
class AppStateChangeVisbilet extends AppStateRifster {}


