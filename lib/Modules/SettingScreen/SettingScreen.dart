import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/Layout/Cubit/Cubit.dart';
import 'package:instagram/Layout/Cubit/state.dart';
import 'package:instagram/Modules/SettingScreen/EditprofileScreen/EditprofileScreen.dart';
import 'package:instagram/Share/companets/companes.dart';
import 'package:instagram/Share/style/Icons/icon_broken.dart';

class SettingScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocConsumer<AppHomeCubit, AppHomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
   var modle=AppHomeCubit.get(context);
    return ConditionalBuilder(
        condition: state is !AppStateLoginGetUserDate,
        builder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 290,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Container(

                      child: Image(
                        image:
                        NetworkImage(modle.usermodle!.covoerimage),
                        width:double.infinity,
                        height: 200,
                        fit:BoxFit.cover,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 75,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(modle.usermodle!.userimage),
                    radius: 70,
                  ),
                ],
              ),

            ),
            Text(modle.usermodle!.name,style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            )),
            Text("Wriet you Bost",style: Theme.of(context).textTheme.bodySmall,),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("100",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )),
                      Text("Posts",style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 20,
                      ),),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("100",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )),
                      Text("Posts",style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 20,
                      ),),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("100",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )),
                      Text("Posts",style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 20,
                      ),),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("100",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )),
                      Text("Posts",style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 20,
                      ),),
                    ],
                  ),
                ),


              ],
            ),
            SizedBox(height: 20.0,),
            Row(
              children: [
                Expanded(child: OutlinedButton(onPressed: (){}, child:Text("Add photos") )),
                OutlinedButton(onPressed: ()
                {
                  navigatorto(context: context, widget: EditprofileScreen());
                }, child: Icon(IconBroken.Edit)),
              ],
            )
          ],
        ),
        fallback:(context) => Center(child: CircularProgressIndicator()),
    );
  },
),
    );
  }
}
