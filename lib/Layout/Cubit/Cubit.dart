import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/Layout/Cubit/state.dart';
import 'package:instagram/Module/Chatmessage/ChatmessageModle.dart';
import 'package:instagram/Module/Post_Modle/postmodle.dart';
import 'package:instagram/Module/User_Modle/User_Modle.dart';
import 'package:instagram/Modules/ChatScreen/ChatScreen.dart';
import 'package:instagram/Modules/FeedsScreen/FeedsScreen.dart';
import 'package:instagram/Modules/PostScreen/Post.dart';
import 'package:instagram/Modules/SettingScreen/SettingScreen.dart';
import 'package:instagram/Modules/UserScreen/UserScreen.dart';
import 'package:instagram/Share/companets/companes.dart';
import 'package:instagram/Share/companets/content.dart';
import 'package:instagram/Share/style/Icons/icon_broken.dart';

class AppHomeCubit extends Cubit<AppHomeState> {
  AppHomeCubit() :super(AppInitalState());

  static AppHomeCubit get(context) => BlocProvider.of(context);
  List<Widget>screen =
  [
    FeedsScreen(),
    ChatScreen(),
    PostScreen(),
    UserScreen(),
    SettingScreen(),
  ];
  List<String> title =
  [
    'Feeds',
    'Chat',
    'Post',
    'User',
    'Setting'
  ];
  List<BottomNavigationBarItem> itme =
  [
    BottomNavigationBarItem(icon: Icon(IconBroken.Home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(IconBroken.Chat), label: 'Chat'),
    BottomNavigationBarItem(icon: Icon(IconBroken.Paper_Upload), label: 'Post'),
    BottomNavigationBarItem(icon: Icon(IconBroken.Location), label: 'User'),
    BottomNavigationBarItem(icon: Icon(IconBroken.Setting), label: 'Setting'),
  ];
  int crunetindex = 0;

  void changeBottomNavigationBarItem(index) {
    if (index == 0) {
      emit(AppSuccessGetPostState());
    }
    if (index == 2) {
      emit(AppchangePostScreenState());
      index = 0;
    }
    else {
      crunetindex = index;
      emit(AppchangeBottomNavigationBarItemState());
    }
  }

  //get user
  UserModle? usermodle;

  void getuserdata() {
    emit(AppStateLoginGetUserDate());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      usermodle = UserModle.formjson(value.data()!);
      emit(AppStateSucssesGetCreateUserDate());
    }).catchError((err) {
      print(err.toString());
      emit(AppStateErrorGetCreateUserDate(err.toString()));
    });
  }

  Future<void> UpdateUserData({
    required String name,
    required String phone,
    required String bio,
    String? userimage,
    String? covoerimage,

  }) async
  {
    emit(AppStateUpdateUserDataLoding());
    UserModle modle = UserModle(
      name: name,
      email: usermodle!.email,
      phone: phone,
      password: usermodle!.password,
      bio: bio,
      userimage: userimage ?? usermodle!.userimage,
      covoerimage: covoerimage ?? usermodle!.covoerimage,
      uId: usermodle!.uId,
    );
    await FirebaseFirestore.instance.collection('users')
        .doc(usermodle!.uId)
        .update(modle!.tomap())
        .then((value) {
      getuserdata();
    }).catchError((err) {
      print(err.toString());
      emit(AppUpdateUserDataErrorState());
    });
  }

  final ImagePicker picker = ImagePicker();
  File? profileimage;

  Future<void> getImagePickerData() async {
    final XFile? PickedFile = await picker.pickImage(
        source: ImageSource.gallery);
    if (PickedFile != null) {
      this.profileimage = File(PickedFile.path);
      emit(AppStateLoginProfileimage());
    }
    else {
      print("No image Selectd");
      emit(AppStateErrorProfileimage("خطاء في الصورة"));
    }
  }

  Future uplodeImagePickerData({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(AppStateUplodeProfileimage());
    return FirebaseStorage.instance.ref()
        .child("imageuser/${Uri
        .file(profileimage!.path)
        .pathSegments
        .last}")
        .putFile(this.profileimage!).then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(AppStateUplodeProfileimageSuccessState());
        UpdateUserData(
          name: name,
          phone: phone,
          bio: bio,
          userimage: value,
        );
      }).catchError((err) {
        emit(AppStateUplodeErrorProfileimage(err.toString()));
      });
    }).catchError((err) {
      emit(AppStateUplodeErrorProfileimage(err.toString()));
    });
  }

  final ImagePicker coverimage = ImagePicker();
  File? profilecover;

  Future<void> getCoverImagePickerData() async {
    final XFile? PickedFile = await coverimage.pickImage(
        source: ImageSource.gallery);
    if (PickedFile != null) {
      this.profilecover = File(PickedFile.path);
      emit(AppStateCoverimageSuccessState());
    }
    else {
      print("No image Selectd");
      emit(AppStateErrorCoverimage("خطاء في الصورة"));
    }
  }

  Future uplodeCoverImagePickerData({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(AppStateUplodeCoverimage());
    return FirebaseStorage.instance.ref()
        .child("coverimageuser/${Uri
        .file(profilecover!.path)
        .pathSegments
        .last}")
        .putFile(this.profilecover!).then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(AppStateUplodeCoverimageSuccessState());
        UpdateUserData(
          name: name,
          phone: phone,
          bio: bio,
          covoerimage: value,
        );
      }).catchError((err) {
        emit(AppStateUplodeErrorCoverimage(err.toString()));
      });
    }).catchError((err) {
      emit(AppStateUplodeErrorCoverimage(err.toString()));
    });
  }

  Future Createpost({
    required String posts,
    required String Datatime,
    String? postimage,

  }) async
  {
    emit(AppLodingCreatePostState());
    PostModle modle = PostModle(
        name: usermodle!.name,
        image: usermodle!.userimage,
        posts: posts,
        postimage: postimage ?? '',
        datetime: Datatime,
        uId: usermodle!.uId);
    await FirebaseFirestore.instance.collection('posts')
        .add(modle.tomap())
        .then((value) {
      emit(AppSuccessCreatePostState());
    }).catchError((err) {
      print(err.toString);
      emit(AppeErrorCreatePostState(err.toString()));
    });
  }

  PostModle? post;
  List<PostModle>postmodle = [];

  Future getpost() async
  {
    emit(AppLodingGetPostState());
    return await FirebaseFirestore.instance.collection("posts").orderBy(
        'datetime').snapshots(includeMetadataChanges: true).listen((event) {
      event.docs.forEach((element) {
        getlike();
        postmodle.add(PostModle.formjson(element.data()));
      });
      emit(AppSuccessGetPostState());
    });
  }

  final ImagePicker postimages = ImagePicker();
  File? profilepostimage;

  Future<void> getPostImageData() async {
    final XFile? PickedFile = await postimages.pickImage(
        source: ImageSource.gallery);
    if (PickedFile != null) {
      this.profilepostimage = File(PickedFile.path);
      emit(AppPostimageSuccessState());
    }
    else {
      print("No image Selectd");
      emit(AppPostimageErrorState("خطاء في الصورة"));
    }
  }

  Future uplodePostImageData({
    required String posts,
    required String Datatime,
  }) {
    emit(AppUplodePostimageState());
    return FirebaseStorage.instance.ref()
        .child("postimage/${Uri
        .file(profilepostimage!.path)
        .pathSegments
        .last}")
        .putFile(this.profilepostimage!).then((value) async
    {
      await value.ref.getDownloadURL().then((value) {
        emit(AppUplodePostimageSuccessState());
        Createpost(
          posts: posts,
          Datatime: Datatime,
          postimage: value,
        );
      }).catchError((err) {
        emit(AppPostimageErrorState(err.toString()));
      });
    }).catchError((err) {
      emit(AppPostimageErrorState(err.toString()));
    });
  }

  List<String>? likeid = [];
  List<int>? like = [];

  uplodelike(String postId) {
    FirebaseFirestore.instance.collection('posts')
        .doc(postId)
        .collection("like").doc(usermodle!.uId).set(

        {"postId": true,}
    )
        .then((value) {
      emit(AppUplodelikeSuccessState());
    }).catchError((err) {
      emit(AppUplodeErrorlikeeState(err.toString()));
    });
  }

  void getlike() {
    emit(AppgetlikeState());
    FirebaseFirestore.instance.collection("posts").get().then((value) {
      value.docs.forEach((element) {
        like!.add(value.docs.length);
        likeid!.add(element.id);
      });
      emit(AppSuccessGetPostState());
    }).catchError((err) {
      emit(AppgetErrorlikeeState(err.toString()));
    });
  }
  List<UserModle>alluser=[];
  Future getAlluser()async
  {
    emit(AppStateAllUpdateUserDataLoding());
    if(alluser.length==0)
    {
      await FirebaseFirestore.instance.collection("users").get().then((value) {
        value.docs.forEach((element) {
          if (element.data()['uId'] != usermodle!.uId) {
            alluser.add(UserModle.formjson(element.data()));
          }
        });
        emit(AppStateAllUpdateUserDataSuccessState());
      }).catchError((err) {
        emit(AppUpdateAllUserDataErrorState());
      });
    }
  }
  List<MessageModle> message=[];
  void sendmessage({
    required String message,
    required String datetime,
    required String resaveid,
    
     String? messageimage,
})
  {
    emit(AppUplodeLodingChatemessageState());
    MessageModle modle=MessageModle(

        message: message,
        messageimage: messageimage??'', 
        datetime: datetime,
        sendid: usermodle!.uId,
        resaveid: resaveid
    );
    FirebaseFirestore.instance.collection('users').doc(usermodle!.uId).collection('chats').doc(resaveid).collection('messages').add(modle.tomap()).then((value)
    {
      emit(AppUplodeChatemessageSuccessState());
    }).catchError((err)
    {
      emit(AppUplodeErrorChatemessageState(err.toString()));
    });
    FirebaseFirestore.instance.collection('users').doc(resaveid).collection('chats').doc(usermodle!.uId).collection('messages').add(modle.tomap()).then((value)
    {
      emit(AppUplodeChatemessageSuccessState());
    }).catchError((err)
    {
      emit(AppUplodeErrorChatemessageState(err.toString()));
    });
  }
  MessageModle? m;
void getsendmessage(
  {
    String? resavid,
})
{
  emit(AppGetLodingChatemessageState());

  FirebaseFirestore.instance.collection('users').doc(usermodle!.uId).collection('chats').doc(resavid).collection('messages').orderBy('datetime').snapshots().listen((event)
{
  message=[];
  event.docs.forEach((element)
  {

    message.add(MessageModle.formjson(element.data()));
  });
  emit(AppGeteChatemessageSuccessState());
});
}
  final ImagePicker chatimages = ImagePicker();
  File? profilechatimage;

  Future<void> getChatImageData() async {
    final XFile? PickedFile = await chatimages.pickImage(
        source: ImageSource.gallery);
    if (PickedFile != null) {
      this.profilechatimage = File(PickedFile.path);
      emit(AppUplodeImageChatemessageSuccessState());
    }
    else {
      print("No image Selectd");
      emit(AppUplodeImageErrorChatemessageState("خطاء في الصورة"));
    }
  }

  Future uplodeChatImageData({
    required String message,
    required String datetime,
    required String resaveid,

  }) {
    emit(AppGetLodingImageChatemessageState());
    return FirebaseStorage.instance.ref()
        .child("chatimage/${usermodle!.name}/${Uri
        .file(profilechatimage!.path)
        .pathSegments
        .last}")
        .putFile(this.profilechatimage!).then((value) async
    {
      await value.ref.getDownloadURL().then((value) {
        emit(AppGeteChateImagemessageSuccessState());
        sendmessage(message: message,
            datetime: datetime,
            resaveid: resaveid,
          messageimage: value,
        );
      }).catchError((err) {
        emit(AppGetErrorImageChatemessageState(err.toString()));
      });
    }).catchError((err) {
      emit(AppGetErrorImageChatemessageState(err.toString()));
    });
  }
  void deletimage()
  {
  emit(Appdeletimage());
    profileimage=null;
  }
}
