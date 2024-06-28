import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/BlocObserver.dart';
import 'package:instagram/Layout/Cubit/Cubit.dart';
import 'package:instagram/Layout/Home.dart';
import 'package:instagram/Module/User_Modle/User_Modle.dart';
import 'package:instagram/Modules/Login_Screen/LoginScreen.dart';
import 'package:instagram/Modules/RifisterScreen/Cubit/CubitRefister.dart';
import 'package:instagram/Modules/RifisterScreen/RifisterScreen.dart';
import 'package:instagram/Modules/on_Bording/On_Bording.dart';
import 'package:instagram/Share/CachHalper/CachHelper.dart';
import 'package:instagram/Share/companets/content.dart';
import 'package:instagram/Share/style/Colors/Colors.dart';
//options: DefaultFirebaseOptions.currentPlatform)
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
 await Cach_Halper.init();
  Bloc.observer = MyBlocObserver();
 bool? onBording= Cach_Halper.getdata(key:"onBording");
 uId=Cach_Halper.getdata(key: 'uId');
 Widget widget;
 if(onBording!=null)
   {
     if(uId!=null)
     {
        widget=HomeScreen();
     }
     else
     {
         widget=LoginScreen();
     }
   }
 else
   {
     widget=On_Bording();
   }

  runApp(MyApp(wigetstate: widget,));
}

class MyApp extends StatelessWidget {
  Widget wigetstate;
   MyApp({required this.wigetstate});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AppHomeCubit()..getuserdata()..getpost(),
  child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Sans',
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0.0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.purple.withOpacity(0.3),
              systemNavigationBarColor: Colors.purple.withOpacity(0.3),
              systemNavigationBarDividerColor: Colors.purple.withOpacity(0.3),
            ),
            iconTheme: IconThemeData(
              color: Colors.black,
            )
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor:dafuletcolor.withOpacity(0.7),
            elevation: 0.0,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            elevation: 10.0,
            backgroundColor: Colors.grey[300],
            selectedItemColor: dafuletcolor,
            selectedIconTheme: IconThemeData(
              color: dafuletcolor,
            ),
            selectedLabelStyle: TextStyle(
              color:dafuletcolor,
            ),
            unselectedIconTheme: IconThemeData(
              color: Colors.grey,
            ),
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: TextStyle(
              color:Colors.grey,
            ),
            showSelectedLabels: true,
            showUnselectedLabels: true,

          )

        ),
        home: wigetstate,
      ),
);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
