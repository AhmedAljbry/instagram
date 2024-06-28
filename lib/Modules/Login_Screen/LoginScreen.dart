import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/Layout/Home.dart';
import 'package:instagram/Modules/Login_Screen/CubitLogin/Cubit_Login.dart';
import 'package:instagram/Modules/Login_Screen/CubitLogin/stateLogin.dart';

import 'package:instagram/Modules/RifisterScreen/RifisterScreen.dart';
import 'package:instagram/Share/CachHalper/CachHelper.dart';
import 'package:instagram/Share/companets/companes.dart';
import 'package:instagram/Share/style/Colors/Colors.dart';
import 'package:instagram/Share/style/Icons/icon_broken.dart';

class LoginScreen extends StatelessWidget {
  var formkey=GlobalKey<FormState>();
  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubitLogin(),
      child: BlocConsumer<AppCubitLogin, AppLoginState>(
        listener: (context, state) {
         if(state is AppStateSucssesGoogleUserDate)
           {
             Cach_Halper.save(key: 'uId', value:state.uId ).then((value)
             {
              showtoast(text: "تم تسجيل دخول", tosat: ToastStat.Succses);
              navigatorandfinsh(context: context,widget: HomeScreen());
             });
           }
         if(state is AppStateSucssesLoginUserDate)
         {
           Cach_Halper.save(key: 'uId', value:state.uId ).then((value)
           {
             showtoast(text: "تم تسجيل دخول", tosat: ToastStat.Succses);
             navigatorandfinsh(context: context,widget: HomeScreen());
           });
         }
        },
        builder: (context, state) {
          var modle=AppCubitLogin.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Form(
                    key: formkey,
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
                            controller: emailcontroller,
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
                            onPressed: ()
                            {
                              modle.changeispassword();
                            }
                        ),
                        SizedBox(height: 20,),
                        ConditionalBuilder(
                          condition: state is! AppStateLodingLoginuserDate,
                          builder: (context) =>
                              dafuletMaterialButton(
                                function: () {
                                  if (formkey.currentState!.validate()) {
                                    modle.AppLoginUserDate(email: emailcontroller.text, password:passwordcontroller.text);
                                  }
                                },
                                text: "Sign in",
                                color: dafuletcolor,
                              ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(height: 20,),
                        dafuletTextButton(text: "Forgot password ?", onPressed: (){}),
                        SizedBox(height: 40,),
                        Row(
                          children: [
                           Expanded(
                             child: Container(
                               decoration: BoxDecoration(
                                color: Colors.blueAccent.withOpacity(0.4),
                                 borderRadius: BorderRadiusDirectional.circular(10),
                               ),
                               child: MaterialButton(child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Image(image: AssetImage("assate/image/On_Barding_Image/fac.png"),
                                     width: 20.0,
                                   ),
                                   SizedBox(width: 10.0,),
                                   Text("Log in Facebook",style: TextStyle(color: Colors.white)),
                                 ],
                               ),
                                 onPressed: ()
                                 {
                                 },),
                             ),
                           ),
                            SizedBox(width: 10,),
                            ConditionalBuilder(
                                condition: state is !AppStateLodingGoogleLoginuserDate ,
                                builder: (context) =>  Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.4),
                                      borderRadius: BorderRadiusDirectional.circular(10),
                                    ),
                                    child: MaterialButton(child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image(image: AssetImage("assate/image/On_Barding_Image/go1.png"),
                                          width: 20.0,
                                        ),
                                        SizedBox(width: 10.0,),
                                        Text("Log in Google",style: TextStyle(color: Colors.white)),
                                      ],
                                    ),
                                      onPressed: ()
                                      {
                                        modle.signInWithGoogle();
                                      },),
                                  ),
                                ),
                                fallback:(context) => Center(child: CircularProgressIndicator(),))

                          ],
                        ),
                        SizedBox(height: 20,),
                        Card(

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                              children:
                              [
                                Text("Don't have an account?"),
                                dafuletTextButton(text:"Sign up" ,onPressed:()
                                {
                                  navigatorto(context: context,widget: RifisterScreen());
                                }),
                              ]
                          ),
                        )
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
