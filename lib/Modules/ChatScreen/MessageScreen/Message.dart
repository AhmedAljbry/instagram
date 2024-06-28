import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/Layout/Cubit/Cubit.dart';
import 'package:instagram/Layout/Cubit/state.dart';
import 'package:instagram/Module/Chatmessage/ChatmessageModle.dart';
import 'package:instagram/Module/Chatmessage/chatimage.dart';
import 'package:instagram/Module/User_Modle/User_Modle.dart';
import 'package:instagram/Share/companets/companes.dart';
import 'package:instagram/Share/style/Icons/icon_broken.dart';

class Message extends StatelessWidget {
   File? profileimage;
   final UserModle modle;
    MessageModle? messagemodle;
   var send=TextEditingController();

   Message({required this.modle});
  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          AppHomeCubit.get(context).getsendmessage(resavid: modle.uId);
          return BlocConsumer<AppHomeCubit, AppHomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {

    return Scaffold(
          backgroundColor: Colors.grey[70],
          appBar: AppBar(
            titleSpacing: 0,
            elevation: 10.0,
            leading: IconButton(icon: Icon(IconBroken.Arrow___Left_2), onPressed: () {
              Navigator.pop(context);
            },),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(

                  child: CircleAvatar(
                   backgroundImage: NetworkImage(modle.userimage),
                    backgroundColor: Colors.red,
                    radius: 25,
                  ),
                ),
                SizedBox(width: 10.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(child: Text(modle.name,style: Theme.of(context).textTheme.titleMedium,)),
                ),
              ],
            ),
            actions: [
            ],
            ),
          body:Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
          /*      _buildRecevierMessage(),
                _buildSenderMessage(),*/

                Expanded(
                  child: ConditionalBuilder(
                      condition: AppHomeCubit.get(context).message.length>0,
                      builder:(context) => ListView.separated(
                          shrinkWrap:true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder:(context, index) {
                            MessageModle modle=AppHomeCubit.get(context).message[index];
                            if(AppHomeCubit.get(context).usermodle!.uId==modle.sendid)
                            {
                              return _buildSenderMessageimage(context:context,modle: modle,state: state );
                            }
                            else
                            {
                              return _buildRecevierMessageimage(modle, context,state);
                            }
                          }, separatorBuilder: (context, index) => SizedBox(height: 20),
                          itemCount:AppHomeCubit.get(context).message.length),
                      fallback: (context) => Center(child: CircularProgressIndicator(),)),
                ),
                Container(
                  height: 45.0,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 15.0,
                    ),
                    child: Row(
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
                                AppHomeCubit.get(context).sendmessage(
                                    message: send.text,
                                    datetime: DateTime.now().toString(),
                                    resaveid: modle!.uId);
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
                        Container(
                          height: 45.0,
                          color: Colors.blueAccent.withOpacity(0.6),
                          child: MaterialButton(
                            onPressed: ()
                            {
                              AppHomeCubit.get(context).getChatImageData();
                              navigatorto(context: context, widget:imagechat(
                                  image:AppHomeCubit.get(context).profilechatimage!) );
                            },
                            minWidth: 1.0,
                            child: Icon(
                              IconBroken.Image,
                              size: 16.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),



    );


          }
);
        }
      );

  }

   Align _buildSenderMessage(MessageModle modle,context) {
     return Align(
       alignment: AlignmentDirectional.centerStart,
       child: Container(
         decoration: BoxDecoration(
           color: Colors.blueAccent.withOpacity(0.2),
           borderRadius: BorderRadiusDirectional.only(
             bottomEnd: Radius.circular(10.0),
             topEnd: Radius.circular(10.0),
             topStart: Radius.circular(10.0),
           ),
         ),
         padding: const EdgeInsets.symmetric(
           vertical: 5.0,
           horizontal: 10.0,
         ),
         child: Image(
           width: 300,
           image: NetworkImage(modle.messageimage),
         ),
       ),
     );
   }
   Align _buildRecevierMessage(MessageModle modle,context) {
     return Align(
       alignment: AlignmentDirectional.centerEnd,
       child: Container(

         decoration: BoxDecoration(
           color: Colors.grey[300],
           borderRadius: BorderRadiusDirectional.only(
             bottomStart: Radius.circular(10.0),
             topEnd: Radius.circular(10.0),
             topStart: Radius.circular(10.0),
           ),
         ),
         padding: const EdgeInsets.symmetric(
           vertical: 5.0,
           horizontal: 10.0,
         ),
         child: Text(modle.message),
       ),
     );
   }
   Align _buildSenderMessageimage({MessageModle? modle, context,state}) {
     return Align(
       alignment: AlignmentDirectional.centerStart,
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Container(
             decoration: BoxDecoration(
               color: Colors.blueAccent.withOpacity(0.2),
               borderRadius: BorderRadiusDirectional.only(
                 bottomEnd: Radius.circular(10.0),
                 topEnd: Radius.circular(10.0),
                 topStart: Radius.circular(10.0),
               ),
             ),
             padding: const EdgeInsets.symmetric(
               vertical: 5.0,
               horizontal: 10.0,
             ),
             child: Text(modle!.message),
           ),
         if(modle.messageimage!='')
              Container(
               decoration: BoxDecoration(
                 color: Colors.blueAccent.withOpacity(0.2),
                 borderRadius: BorderRadiusDirectional.only(
                   bottomEnd: Radius.circular(10.0),
                   topEnd: Radius.circular(10.0),
                   topStart: Radius.circular(10.0),
                 ),
               ),
               padding: const EdgeInsets.symmetric(
                 vertical: 5.0,
                 horizontal: 10.0,
               ),
               child: Image(
                 width: 300,
                 image: NetworkImage(modle.messageimage)
               ),
             ),
         ],
       ),
     );
   }
  Align _buildRecevierMessageimage(MessageModle modle,context,state) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(

            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadiusDirectional.only(
                bottomStart: Radius.circular(10.0),
                topEnd: Radius.circular(10.0),
                topStart: Radius.circular(10.0),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 10.0,
            ),
            child: Text(modle.message),
          ),
          if(modle.messageimage!='')
              Container(

            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadiusDirectional.only(
                bottomStart: Radius.circular(10.0),
                topEnd: Radius.circular(10.0),
                topStart: Radius.circular(10.0),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 10.0,
            ),
            child: Image(
              width: 300,
              image: NetworkImage(modle.messageimage),
            ),
          ),
        ],
      ),
    );
  }

}

