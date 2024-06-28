import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/Layout/Cubit/Cubit.dart';
import 'package:instagram/Layout/Cubit/state.dart';
import 'package:instagram/Module/Post_Modle/postmodle.dart';
import 'package:instagram/Share/companets/companes.dart';
import 'package:instagram/Share/style/Icons/icon_broken.dart';

class FeedsScreen extends StatelessWidget {
var scofeldkey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppHomeCubit, AppHomeState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    return Builder(

     builder: (context) {
       return ConditionalBuilder(
           condition: AppHomeCubit.get(context).postmodle.length>0&&AppHomeCubit.get(context).like!.length!=null,
           builder: (context) => Padding(

               padding: const EdgeInsets.all(8.0),
               child: SingleChildScrollView(
                 physics: BouncingScrollPhysics(),
                 child: Column(

                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Card(
                       child: Stack(
                         alignment: AlignmentDirectional.bottomEnd,
                         children: [
                           Image(
                             image:
                             NetworkImage(AppHomeCubit
                                 .get(context)
                                 .usermodle!
                                 .userimage),
                             fit: BoxFit.cover,
                             height: 200,
                             width: double.infinity,
                           ),
                           Text(AppHomeCubit
                               .get(context)
                               .usermodle!
                               .name, style: Theme
                               .of(context)
                               .textTheme
                               .titleLarge!
                               .copyWith(
                               color: Colors.white
                           )),
                         ],
                       ),
                       elevation: 10.0,
                       shadowColor: Colors.grey,
                     ),
                     SizedBox(height: 10.0,),

                     ListView.separated(
                         shrinkWrap: true,
                         physics: NeverScrollableScrollPhysics(),
                         itemBuilder: (context, index) =>
                             buildpost(context, AppHomeCubit
                                 .get(context)
                                 .postmodle[index],index),
                         separatorBuilder: (context, index) =>
                             SizedBox(height: 10.0),
                         itemCount: AppHomeCubit
                             .get(context)
                             .postmodle
                             .length
                     ),
                   ],),
               )
           ),
           fallback: (context) => Center(child: CircularProgressIndicator()),);
     }
     );
  },
);
  }
}
Widget buildpost(context,PostModle modle,index)=>Card(
  elevation: 10.0,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(modle.image),
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
                        Text(modle.name,style: Theme.of(context).textTheme.titleMedium,),
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
            IconButton(onPressed: ()
            {

            }, icon: Icon(Icons.more_horiz)),
          ],
        ),
        Divider(color: Colors.grey),
        if(modle.postimage!='')
               Image(image: NetworkImage(modle.postimage)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(modle.posts),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            child: Wrap(
              children: [
                Container(
                    margin: EdgeInsets.zero,
                    height: 15.0,
                    width: 75.0,
                    child:InkWell(
                      child: Text('#SoftWare',style:Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w600,
                      ),),
                      onTap: ()
                      {

                      },
                    )
                ),
                Container(
                    margin: EdgeInsets.zero,
                    height: 15.0,
                    width: 75.0,
                    child:InkWell(
                      child: Text('#Flutter',style:Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w600,
                      ),),
                      onTap: () {},
                    )
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    child: Icon(IconBroken.Heart,color: Colors.red,size: 10),
                    onTap: ()
                    {
                      AppHomeCubit.get(context).uplodelike(AppHomeCubit.get(context).likeid![index]);
                    },
                  ),
                  SizedBox(width: 2,),
                  Text("${AppHomeCubit.get(context).like![index]}",style: TextStyle(fontSize: 9)),
                ],
              ),
            ),

            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Icon(IconBroken.Chat,color: Colors.yellow,size: 10),
                    onTap: () {

                    }
                  ),
                  SizedBox(width: 2,),
                  Text("100K",style: TextStyle(fontSize: 9)),
                ],
              ),
            ),
          ],
        ),
        Divider(color: Colors.grey),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0,),
              child: CircleAvatar(
                backgroundImage: NetworkImage(modle.image),
                radius: 20,
              ),
            ),
            Expanded(flex: 8,child: Text("write a commment...",style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontSize: 14,
            ),)),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    child: Icon(IconBroken.Heart,color: Colors.red,size: 10),
                    onTap: () {},
                  ),
                  SizedBox(width: 2,),
                  Text("100K",style: TextStyle(fontSize: 9)),
                  SizedBox(height: 10.0,),
                ],
              ),
            ),
          ],
        ),

      ],
    ),
  ),
);
