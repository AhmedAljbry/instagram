
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:instagram/Share/style/Colors/Colors.dart';
import 'package:instagram/Share/style/Icons/icon_broken.dart';

Widget dafuletTextFormField({
  required TextEditingController controller,
  TextInputType? keyboardType,
   bool obscureText=false,
  required String text,
  required IconData prefixIcon,
   IconData? suffixIcon,
  Function? onFieldSubmitted,
  Function? onChanged,
  required Function validator,
  onPressed,

})=>TextFormField(
  controller:controller,
  keyboardType: keyboardType,
  obscureText:obscureText,
  decoration: InputDecoration(
    label: Text(text),
    prefixIcon: Icon(prefixIcon),
    suffixIcon:IconButton(icon:Icon(suffixIcon),onPressed:onPressed,) ,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: dafuletcolor,style: BorderStyle.solid,),
      borderRadius: BorderRadius.circular(20.0),
    ),
  ),
  onFieldSubmitted:onFieldSubmitted as void Function(String)?,
  onChanged:onChanged as void Function(String)?,
  validator:validator as  String? Function(String?)?,
);
Widget dafuletMaterialButton(
{
  required String text,
 required  function,
  Color color=Colors.blueAccent,
})=>  Container(
  decoration: BoxDecoration(
    color: color,
    borderRadius: BorderRadiusDirectional.circular(20.0),
  ),
  width: double.infinity,
  child: MaterialButton(
    child:Text(text,style: TextStyle(color: Colors.white)),
    onPressed: function,
  ),
);
Widget dafuletTextButton({
  required String text,
  required onPressed
})=>TextButton(onPressed:onPressed, child:Text(text));
Future navigatorto({
  required  context,
  required Widget widget
})=>Navigator.push(context,MaterialPageRoute(builder: (context) =>widget,));
Future navigatorandfinsh({
  required  context,
  required Widget widget
})=>Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) =>widget,),(route) => false,);
Future showtoast({
  required String text,
  required ToastStat tosat,
})=>Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: colortoset(tosat),
    textColor: Colors.white,
    fontSize: 16.0
);
enum ToastStat{Succses,Error,Warning}
Color colortoset(ToastStat tosat)
{
  Color color;
  switch (tosat)
  {

    case ToastStat.Succses:
      color=Colors.green;
      break;
    case ToastStat.Error:
     color=Colors.red;
      break;
    case ToastStat.Warning:
     color=Colors.yellowAccent;
      break;
  }
  return color;
}
AppBar dafuletAppBar({
  context,
  required String title,
  List<Widget>? actions})=>AppBar(
  title: Text(title,style: TextStyle(color: Colors.black),),
  leading: IconButton(
    icon: Icon(IconBroken.Arrow___Left_2),
    onPressed: ()
    {
      Navigator.pop(context);
    },
  ),
  actions: actions,
);