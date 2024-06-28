import 'package:flutter/material.dart';
import 'package:instagram/Layout/Home.dart';
import 'package:instagram/Modules/Login_Screen/LoginScreen.dart';
import 'package:instagram/Share/CachHalper/CachHelper.dart';
import 'package:instagram/Share/companets/companes.dart';
import 'package:instagram/Share/style/Colors/Colors.dart';
import 'package:instagram/Share/style/Icons/icon_broken.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class On_Bording extends StatefulWidget {

  @override
  State<On_Bording> createState() => _On_BordingState();
}


class _On_BordingState extends State<On_Bording> {
  @override
  var pagepontroller=PageController();
  List<PageClass>page=[
    PageClass(image: "assate/image/On_Barding_Image/onb1.jpg", title: "Hello, welcome to Instagram", body:"Meet new friends" ),
    PageClass(image: "assate/image/On_Barding_Image/onb2.png", title: "Share your diary with your friends", body:"Share your joys and joys with us" ),
    PageClass(image: "assate/image/On_Barding_Image/onb3.jpg", title: "Counter programmer Ahmed Al-Jabri", body:"Counter programmer Ahmed Al-Jabri" ),

  ];
  int crentindex=0;
  bool na=false;
void submit()
{
  Cach_Halper.save(key: 'onBording', value: na).then((value)
  {
    navigatorandfinsh(context: context,widget: LoginScreen());
  }).catchError((err){
    print(err.toString());
  });

}
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          dafuletTextButton(text: "SKIP", onPressed: ()
          {
            navigatorandfinsh(context: context, widget: LoginScreen());
          })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              child: PageView.builder(
                controller: pagepontroller,
                itemBuilder:(context, index) =>buildpage(page[index]),
                itemCount: page.length,
                onPageChanged: (value) {
                 if(value==page.length-1)
                   {

                     setState(() {
                       na=true;
                     });
                   }
                 else
                   {
                    setState(() {
                      na=false;
                    });
                   }
                },
              ),
            ),


              Row(
                children: [
                  SmoothPageIndicator(
                    controller: pagepontroller,
                    count: page.length,
                    axisDirection: Axis.horizontal,
                    effect:  SlideEffect(
                        spacing:  8.0,
                        radius:  4.0,
                        dotWidth:  24.0,
                        dotHeight:  5.0,
                        paintStyle:  PaintingStyle.stroke,
                        strokeWidth:  1.5,
                        dotColor:  Colors.grey,
                        activeDotColor:  Colors.indigo
                    ),
                  ),
                  Spacer(),
                  FloatingActionButton(onPressed: ()
                  {
                    if(na)
                      {
                        submit();
                      }
                    else {
                      pagepontroller.nextPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.linear);
                    }
                  },child: Icon(IconBroken.Arrow___Right_2,),),
                ],
              ),
            ],
          ),
      ),
    );
  }
  Widget buildpage (PageClass modle)=>Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
  Image(
  image: AssetImage(modle.image),
  width: 500,
  height: 500,
  ),
  Text(modle.title,style: TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.w700,
  )),
  SizedBox(height: 17.0,),
  Text(modle.body,style: TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w500,

  )),
  ]
  );
}
class PageClass
{
  late String image;
  late String title;
  late String body;
  PageClass({
    required this.image,
    required this.title,
    required this.body,
});
}
