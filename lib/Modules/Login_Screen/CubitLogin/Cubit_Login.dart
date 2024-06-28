import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/Module/User_Modle/User_Modle.dart';
import 'package:instagram/Modules/Login_Screen/CubitLogin/stateLogin.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AppCubitLogin extends Cubit<AppLoginState>
{
  AppCubitLogin():super(AppLoginInitlState());
  static AppCubitLogin get(context)=>BlocProvider.of(context);

  Future AppLoginUserDate({
    required String email,
    required String password,
  })async
  {
    emit(AppStateLodingLoginuserDate());
  return await FirebaseAuth.instance.signInWithEmailAndPassword(email:email, password: password)
        .then((value){
      emit(AppStateSucssesLoginUserDate(value.user!.uid));

    }).catchError((err)
    {
      print(err.toString());
      emit(AppStateErrorLoginUserDate(err.toString()));
    });
  }


  Future signInWithGoogle() async {
    emit(AppStateLodingGoogleLoginuserDate());
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
   final a=await FirebaseAuth.instance.signInWithCredential(credential).then((value)
    {
      createusergoogle(
          name: value.user!.displayName.toString(),
          email: value.user!.email.toString(),
          phone: value.user!.phoneNumber.toString(),
          userimage:value.user!.photoURL.toString(),
          password: value.user!.refreshToken.toString(),
          uId: value.user!.uid.toString(),
      );
      emit(AppStateSucssesGoogleUserDate(value.user!.uid));
    }).catchError((err)
      {
        emit(AppStateErrorGoogleUserDate(err.toString()));
      }
    );
   return  a;
  }
  Future<void> createusergoogle({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String userimage,
    required String uId,

  })async
  {
  UserModle  modle=UserModle(
        name:name,
        email: email,
        phone:phone,
        password:password,
        covoerimage: "https://img.freepik.com/premium-photo/abstract-white-futuristic-background-with-fractal-horizon_476363-3587.jpg?w=2000",
        userimage: userimage,
        bio: "Whate is bio",
        uId: uId,
    );
    await FirebaseFirestore.instance.collection("users").doc(uId).set(modle!.tomap()).then((value)
    {
      emit(AppStateSucssesGoogleUserDate(uId));
    }).catchError((err)
    {
      print(err.toString());
      emit(AppStateErrorGoogleUserDate(err.toString()));
    });
  }
  late bool ispassword=true;
  late IconData icon=Icons.visibility_outlined;
  void changeispassword()
  {
    ispassword= !ispassword;
    icon=ispassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(AppStateChangeVisbilet());
  }


}

