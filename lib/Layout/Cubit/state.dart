abstract class AppHomeState {}
class AppInitalState extends AppHomeState{}
class AppchangeBottomNavigationBarItemState extends AppHomeState{}
class AppchangePostScreenState extends AppHomeState{}
class AppStateLoginGetUserDate extends AppHomeState {}
class AppStateSucssesGetCreateUserDate extends AppHomeState {}
class AppStateErrorGetCreateUserDate extends AppHomeState
{
  final err;
  AppStateErrorGetCreateUserDate(this.err);
}
//updatauser
class AppStateUpdateUserDataLoding extends AppHomeState {}
class AppStateUpdateUserDataSuccessState extends AppHomeState {}
class AppUpdateUserDataErrorState extends AppHomeState {}
//allgetuser
class AppStateAllUpdateUserDataLoding extends AppHomeState {}
class AppStateAllUpdateUserDataSuccessState extends AppHomeState {}
class AppUpdateAllUserDataErrorState extends AppHomeState {}
//user image state
class AppStateLoginProfileimage extends AppHomeState {}
class AppStateProfileimageSuccessState extends AppHomeState {}
class AppStateErrorProfileimage extends AppHomeState
{
  final err;
  AppStateErrorProfileimage(this.err);
}
class AppStateUplodeProfileimage extends AppHomeState {}
class AppStateUplodeProfileimageSuccessState extends AppHomeState {}
class AppStateUplodeErrorProfileimage extends AppHomeState
{
  final err;
  AppStateUplodeErrorProfileimage(this.err);
}
//cover user image
class AppStateLoginCoverimage extends AppHomeState {}
class AppStateCoverimageSuccessState extends AppHomeState {}
class AppStateErrorCoverimage extends AppHomeState
{
  final err;
  AppStateErrorCoverimage(this.err);
}
class AppStateUplodeCoverimage extends AppHomeState {}
class AppStateUplodeCoverimageSuccessState extends AppHomeState {}
class AppStateUplodeErrorCoverimage extends AppHomeState
{
  final err;
  AppStateUplodeErrorCoverimage(this.err);
}
//Post
class AppLodingCreatePostState extends AppHomeState {}
class AppSuccessCreatePostState extends AppHomeState {}
class AppeErrorCreatePostState extends AppHomeState
{
  final err;
  AppeErrorCreatePostState(this.err);
}
class AppLodingGetPostState extends AppHomeState {}
class AppSuccessGetPostState extends AppHomeState {}
class AppeErrorGetPostState extends AppHomeState
{
  final err;
  AppeErrorGetPostState(this.err);
}
//post image
class AppLoginpostimageStat extends AppHomeState {}
class AppPostimageSuccessState extends AppHomeState {}
class AppPostimageErrorState extends AppHomeState
{
  final err;
  AppPostimageErrorState(this.err);
}
class AppUplodePostimageState extends AppHomeState {}
class AppUplodePostimageSuccessState extends AppHomeState {}
class AppUplodeErrorPostimageState extends AppHomeState
{
  final err;
  AppUplodeErrorPostimageState(this.err);
}
//like
class AppUplodelikeState extends AppHomeState {}
class AppUplodelikeSuccessState extends AppHomeState {}
class AppUplodeErrorlikeeState extends AppHomeState
{
  final err;
  AppUplodeErrorlikeeState(this.err);
}
class AppgetlikeState extends AppHomeState {}
class AppgetlikeSuccessState extends AppHomeState {}
class AppgetErrorlikeeState extends AppHomeState
{
  final err;
  AppgetErrorlikeeState(this.err);
}
//chatmessagestate
class AppUplodeLodingChatemessageState extends AppHomeState {}
class AppUplodeChatemessageSuccessState extends AppHomeState {}
class AppUplodeErrorChatemessageState extends AppHomeState
{
  final err;
  AppUplodeErrorChatemessageState(this.err);
}
class AppGetLodingChatemessageState extends AppHomeState {}
class AppGeteChatemessageSuccessState extends AppHomeState {}
class AppGetErrorChatemessageState extends AppHomeState
{
  final err;
  AppGetErrorChatemessageState(this.err);
}

//Imagechatmessagestate
class AppUplodeLodingImageChatemessageState extends AppHomeState {}
class AppUplodeImageChatemessageSuccessState extends AppHomeState {}
class AppUplodeImageErrorChatemessageState extends AppHomeState
{
  final err;
  AppUplodeImageErrorChatemessageState(this.err);
}
class AppGetLodingImageChatemessageState extends AppHomeState {}
class AppGeteChateImagemessageSuccessState extends AppHomeState {}
class AppGetErrorImageChatemessageState extends AppHomeState
{
  final err;
  AppGetErrorImageChatemessageState(this.err);
}
class Appdeletimage extends AppHomeState {}