import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/Layout/Cubit/Cubit.dart';
import 'package:instagram/Layout/Cubit/state.dart';
import 'package:instagram/Share/companets/companes.dart';
import 'package:instagram/Share/style/Icons/icon_broken.dart';

class PostScreen extends StatelessWidget {
var post=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppHomeCubit, AppHomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var modle=AppHomeCubit.get(context);
    File? postimage=AppHomeCubit.get(context).profilepostimage;
    return Scaffold(

      appBar: dafuletAppBar(
        context: context,
          title: "New Post",
          actions: [
        dafuletTextButton(
            text: "POST",
          onPressed: ()
          {
            if(AppHomeCubit.get(context).postimages==null)
              {
               AppHomeCubit.get(context).uplodePostImageData(posts: post.text, Datatime: DateTime.now().toString());
              }
            else
              {
               AppHomeCubit.get(context).Createpost(posts: post.text, Datatime: DateTime.now().toString());
              }

          }
        )]),
      body: Column(
        children: [
          if(state is AppLodingCreatePostState)
            LinearProgressIndicator(),
          Row(
            children: [
              CircleAvatar(
                backgroundImage:NetworkImage( modle.usermodle!.userimage,),
                radius: 30,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(modle.usermodle!.name,style: Theme.of(context).textTheme.titleMedium,),
                          SizedBox(width: 4,),
                          Container(
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadiusDirectional.circular(20),
                              ),
                              child: Icon(Icons.check,color: Colors.white,size: 13,)
                          ),
                        ],
                      ),
                      Text("${DateTime.now()}",style: TextStyle(color: Colors.grey[400],fontSize: 10),)
                    ],
                  ),
                ),
              ),

            ],
          ),
          if(postimage!=null)
              Image(
            image:postimage==null?NetworkImage(modle.post!.postimage):FileImage(postimage) as ImageProvider<Object>,
          ),
          Expanded(child: TextFormField
            (
            controller: post,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: "New post",
              border: InputBorder.none,
            ),
          )),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(IconBroken.Camera),
        onPressed: ()
        {
          AppHomeCubit.get(context).getPostImageData();
        },
      ),
    );
  },
);
  }
}
