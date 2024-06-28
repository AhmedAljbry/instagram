import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/Layout/Cubit/Cubit.dart';
import 'package:instagram/Layout/Cubit/state.dart';
import 'package:instagram/Modules/PostScreen/Post.dart';
import 'package:instagram/Share/companets/companes.dart';
import 'package:instagram/Share/style/Icons/icon_broken.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppHomeCubit, AppHomeState>(
      listener: (context, state) {
       if(state is AppchangePostScreenState)
         {
           navigatorto(context: context, widget: PostScreen());
         }
      },
      builder: (context, state)
      {
        var modle=AppHomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
              title: Text("${modle.title[modle.crunetindex]}",style: Theme.of(context).textTheme.titleLarge),
              actions: [
              IconButton(icon: Icon(IconBroken.Notification),onPressed: (){},),
                IconButton(icon: Icon(IconBroken.Search),onPressed: (){},),
              ],
          ),
          body:modle.screen[modle.crunetindex],
          bottomNavigationBar: BottomNavigationBar(
            items:modle.itme,
            onTap: (value) {
              modle.changeBottomNavigationBarItem(value);
            },
            currentIndex:modle.crunetindex,
          ),

        );
      },
    );
  }
}
