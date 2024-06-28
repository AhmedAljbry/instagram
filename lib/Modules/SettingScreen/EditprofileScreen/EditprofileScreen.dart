import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/Layout/Cubit/Cubit.dart';
import 'package:instagram/Layout/Cubit/state.dart';
import 'package:instagram/Share/companets/companes.dart';
import 'package:instagram/Share/style/Icons/icon_broken.dart';

class EditprofileScreen extends StatelessWidget {

  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var biocontroller = TextEditingController();
  var formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppHomeCubit, AppHomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var usermodle=AppHomeCubit.get(context);
        File? userimage=AppHomeCubit.get(context).profileimage;
        File? coverimage=AppHomeCubit.get(context).profilecover;
        namecontroller.text=usermodle.usermodle!.name;
        phonecontroller.text=usermodle.usermodle!.phone;
        biocontroller.text=usermodle.usermodle!.bio;
        return Scaffold(
          appBar: dafuletAppBar(context: context,title:'Edit Pro File' , actions: [
            IconButton(onPressed: ()
            {
              if(formkey.currentState!.validate())
                {
                  AppHomeCubit.get(context).UpdateUserData(
                      name: namecontroller.text,
                      phone: phonecontroller.text,
                      bio: biocontroller.text);
                }
            }, icon: Icon(IconBroken.Edit)),
          ]),
          body: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  if(state is AppStateUpdateUserDataLoding)
                      LinearProgressIndicator(),
                      SizedBox(height: 20,),
                  Container(
                    height: 290,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(

                                child: Image(
                                  image:coverimage==null?NetworkImage(usermodle.usermodle!.covoerimage):FileImage(coverimage) as ImageProvider<Object>,
                                  width: double.infinity,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              InkWell(
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadiusDirectional.circular(
                                        20),
                                  ),
                                  child: Icon(IconBroken.Edit, color: Colors.white,
                                      size: 20),
                                ),
                                onTap: ()
                                {
                                  AppHomeCubit.get(context).getCoverImagePickerData();
                                },
                              ),
                            ],
                          ),
                        ),

                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 75,
                        ),
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            CircleAvatar(
                              backgroundImage:userimage==null?NetworkImage(usermodle.usermodle!.userimage) :  FileImage(userimage!) as ImageProvider<Object>,
                              radius: 70,
                            ),
                            InkWell(
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadiusDirectional.circular(
                                      20),
                                ),
                                child: Icon(
                                    IconBroken.Edit, color: Colors.white, size: 20),
                              ),
                              onTap: ()
                              {
                                AppHomeCubit.get(context).getImagePickerData();
                              },
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  if(userimage!=null||coverimage!=null)
                    Row(
                      children: [
                        if(userimage!=null)
                          ConditionalBuilder(
                              condition: state is !AppStateUplodeProfileimage,
                              builder:(context) => Expanded(
                                child: dafuletMaterialButton(text: "uplode Image", function:()
                                {
                                  AppHomeCubit.get(context).uplodeImagePickerData
                                    (name: namecontroller.text,
                                    phone: phonecontroller.text,
                                    bio: biocontroller.text,
                                  );
                                }),
                              ),
                              fallback:(context) => Center(child: CircularProgressIndicator(),)),

                        if(coverimage!=null)
                          ConditionalBuilder(
                              condition: state is !AppStateUplodeCoverimage,
                              builder:(context) => Expanded(
                               child: dafuletMaterialButton(text: "uplode Cover", function:()
                                {
                                  AppHomeCubit.get(context).uplodeCoverImagePickerData
                                    (name: namecontroller.text,
                                    phone: phonecontroller.text,
                                    bio: biocontroller.text,
                                  );
                                }),
                              ),
                              fallback:(context) => Center(child: CircularProgressIndicator(),))

                      ],
                    ),
                  dafuletTextFormField(
                      controller: namecontroller,
                      text: 'inter name',
                      prefixIcon: IconBroken.User,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "inter name";
                        }
                        return null;
                      }
                  ),
                  dafuletTextFormField(
                      controller: phonecontroller,
                      text: 'inter Phone',
                      prefixIcon: IconBroken.User,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "inter Phone";
                        }
                        return null;
                      }
                  ),
                  dafuletTextFormField(
                      controller: biocontroller,
                      text: 'inter bio',
                      prefixIcon: IconBroken.User,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "inter bio";
                        }
                        return null;
                      }
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
