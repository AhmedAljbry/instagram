import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/Layout/Cubit/Cubit.dart';
import 'package:instagram/Layout/Cubit/state.dart';
import 'package:instagram/Module/User_Modle/User_Modle.dart';
import 'package:instagram/Share/style/Icons/icon_broken.dart';

class imagechat extends StatelessWidget {
  File image;
  var send=TextEditingController();
  UserModle? modle;
  imagechat({required this.image,});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppHomeCubit, AppHomeState>(
      listener: (context, state) {


      },
      builder: (context, state) {

        return  Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: ()
                  {
                   AppHomeCubit.get(context).getChatImageData();
                  },
                  icon: Icon(IconBroken.Image)),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              ConditionalBuilder(
                  condition:state is !AppGetLodingImageChatemessageState ,
                  builder: (context) => Center(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadiusDirectional.circular(20.0),
                      ),
                      child: Image(image:
                      FileImage(AppHomeCubit.get(context).profilechatimage!) as ImageProvider<Object>,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  fallback: (context) => CircularProgressIndicator(),),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onFieldSubmitted:(value) {

                      },
                      controller: send,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'type your message here ...',


                        hintStyle: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  Container(
                    height: 45.0,
                    color: Colors.blueAccent.withOpacity(0.6),
                    child: MaterialButton(
                      onPressed: ()
                      {
                          AppHomeCubit.get(context).uplodeChatImageData(
                              message: send.text,
                              datetime: DateTime.now().toString(),
                              resaveid: AppHomeCubit.get(context).usermodle!.uId,
                          );
                        send.text='';

                      },
                      minWidth: 1.0,
                      child: Icon(
                        IconBroken.Send,
                        size: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
