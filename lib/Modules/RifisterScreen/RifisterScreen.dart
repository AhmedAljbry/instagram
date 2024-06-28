import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/Layout/Home.dart';
import 'package:instagram/Modules/Login_Screen/LoginScreen.dart';
import 'package:instagram/Modules/RifisterScreen/Cubit/CubitRefister.dart';
import 'package:instagram/Modules/RifisterScreen/Cubit/staterefister.dart';
import 'package:instagram/Share/CachHalper/CachHelper.dart';

import 'package:instagram/Share/companets/companes.dart';
import 'package:instagram/Share/style/Colors/Colors.dart';
import 'package:instagram/Share/style/Icons/icon_broken.dart';

class RifisterScreen extends StatelessWidget {
  var fromkey = GlobalKey<FormState>();
  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var phoncontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubitRifster(),
      child: BlocConsumer<AppCubitRifster, AppStateRifster>(
        listener: (context, state) {
          if (state is AppStateSucssesCreateUserDate) {
            Cach_Halper.save(key: 'uId', value: state.uId).then((value)
                {
                  showtoast(text: "تم انشاء حساب", tosat: ToastStat.Succses);
                  navigatorandfinsh(widget: HomeScreen(), context: context);
                });

          }
          if (state is AppStateErrorCreateUserDate)
          {
            showtoast(text: "No", tosat: ToastStat.Error);
          }
        },
        builder: (context, state) {
          var modle = AppCubitRifster.get(context);

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon:Icon(IconBroken.Arrow___Left_2),
                onPressed:()
                {
                  navigatorto(widget: LoginScreen(),context: context);
                } ,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Form(
                    key: fromkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(
                              'assate/image/On_Barding_Image/log.jpg'),
                          height: 160,
                          width: 160,
                        ),
                        Text("Sign up to see photos and videos", style: Theme
                            .of(context)
                            .textTheme
                            .titleLarge),
                        Text('from your friends.', style: Theme
                            .of(context)
                            .textTheme
                            .titleLarge),
                        SizedBox(height: 20.0,),
                        dafuletTextFormField(
                            controller: namecontroller,
                            text: "input name",
                            prefixIcon: IconBroken.User,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "name is empty";
                              }
                              return null;
                            }),
                        SizedBox(height: 10.0,),
                        dafuletTextFormField(
                            controller: emailcontroller,
                            text: "input email",
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: Icons.email_outlined,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "email is empty";
                              }
                              return null;
                            }),
                        SizedBox(height: 10.0,),
                        dafuletTextFormField(
                            controller: phoncontroller,
                            text: "input phone",
                            prefixIcon: Icons.phone_android_outlined,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "phone is empty";
                              }
                              return null;
                            }),
                        SizedBox(height: 10.0,),
                        dafuletTextFormField(
                            controller: passwordcontroller,
                            text: "input password",
                            obscureText: modle.ispassword,
                            prefixIcon: IconBroken.Lock,
                            suffixIcon: modle.icon,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "password is empty";
                              }
                              return null;
                            },
                            onPressed: () {
                              modle.changeispassword();
                            }
                        ),
                        SizedBox(height: 10.0,),
                        ConditionalBuilder(
                          condition: state is !AppStateLodingCreateUserDate,
                          builder: (context) =>
                              dafuletMaterialButton(
                                function: () {
                                  if (fromkey.currentState!.validate()) {
                                    modle.AppRefinersDate
                                      (
                                      name: namecontroller.text,
                                        email: emailcontroller.text,
                                        phone:  phoncontroller.text,
                                        password: passwordcontroller.text,
                                    );
                                  }
                                },
                                text: "Sign up",
                                color: dafuletcolor,
                              ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
