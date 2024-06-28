import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/Layout/Cubit/Cubit.dart';
import 'package:instagram/Layout/Cubit/state.dart';
import 'package:instagram/Module/User_Modle/User_Modle.dart';
import 'package:instagram/Modules/ChatScreen/MessageScreen/Message.dart';

class ChatScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppHomeCubit, AppHomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return FutureBuilder(
      future: AppHomeCubit.get(context).getAlluser(),
      builder: (context, snapshot)
      {
        return ConditionalBuilder(
            condition: AppHomeCubit.get(context).alluser.length>0,
            builder: (context) => ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    userBulider(context, AppHomeCubit
                        .get(context)
                        .alluser[index]),
                separatorBuilder: (context, index) => SizedBox(height: 20.0),
                itemCount: AppHomeCubit
                    .get(context)
                    .alluser
                    .length
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),);
      }
    );
  },
);
  }
Widget userBulider(context,UserModle modle)=> InkWell(
  onTap: () {
    Navigator.push(context, MaterialPageRoute(builder:(context) => Message(modle:modle)));
  },
  child:   Row(

    mainAxisAlignment: MainAxisAlignment.start,

    crossAxisAlignment: CrossAxisAlignment.start,

    children: [



      Container(



        child: CircleAvatar(

          backgroundImage: NetworkImage(modle.userimage),

          radius: 30,

        ),

      ),

      SizedBox(width: 10.0,),

      Padding(

        padding: const EdgeInsets.symmetric(vertical: 10.0),

        child: Container(child: Text(modle.name,style: Theme.of(context).textTheme.titleMedium,)),

      ),

    ],

  ),
);
}

