import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/Module/User_Modle/User_Modle.dart';
import 'package:instagram/Modules/RifisterScreen/Cubit/staterefister.dart';




class AppCubitRifster extends Cubit<AppStateRifster>
{
  AppCubitRifster():super(AppStateInitlRifester());
 static AppCubitRifster get(context)=>BlocProvider.of(context);
  UserModle? modle;
  Future AppRefinersDate({
    required String name,
    required String email,
    required String phone,
    required String password,
})async
  {
    emit(AppStateLodingCreateUserDate());
   return await FirebaseAuth.instance.createUserWithEmailAndPassword(email:email, password: password)
        .then((value){

      createuser(name: name,email: email,password: password,phone: phone,uId: value.user!.uid);
      emit(AppStateSucssesCreateUserDate(value.user!.uid));
    }).catchError(( err)
    {
      print(err.toString());
      emit(AppStateErrorCreateUserDate(err.toString()));
    });
  }
  Future<void> createuser({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String uId,
})async
  {
    modle= UserModle(
      name: name,
      email: email,
      phone: phone,
      password: password,
      covoerimage: "https://img.freepik.com/premium-photo/abstract-white-futuristic-background-with-fractal-horizon_476363-3587.jpg?w=2000",
      userimage: 'https://spadanmoshaver.ir/wp-content/uploads/2017/02/765-default-avatar.png',
      bio: 'What is bio',
      uId: uId,
    );
   await FirebaseFirestore.instance.collection("users").doc(uId).set(modle!.tomap()).then((value)
    {
      emit(AppStateSucssesCreateUserDate1(uId));
    }).catchError((err)
    {
      print(err.toString());
      emit(AppStateErrorCreateUserDate1(err.toString()));
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