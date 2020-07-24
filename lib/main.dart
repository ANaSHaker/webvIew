
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_splash/flutter_splash.dart';
import 'package:launch_review/launch_review.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splassh(),
    );
  }
}

class splassh extends StatefulWidget {
  @override
  _splasshState createState() => _splasshState();
}

class _splasshState extends State<splassh> {
  @override
  Widget build(BuildContext context) {
    return  Splash(
      seconds: 3,
      navigateAfterSeconds:MyHomePage() ,
      image: Image.asset("assets/logo.png"),
      photoSize: 100,
      loaderColor: Colors.black,
      loadingText: Text("Covid 19-self test",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState(){

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      /* floatingActionButton: Container(
          height: 150,
          width: 70,
          child: FloatingActionButton(

            onPressed: (){
              setState(() {
                MyPlaceholderWidget('https://www.youtube.com/channel/UCwabSoObZ0xUDoeJOtp5vBA/videos');
              });
            },
            child: Text("Home",textAlign: TextAlign.center,),

            backgroundColor: Colors.grey.shade900,
            elevation: 10,

          ),
        ),*/
      appBar: AppBar(
        title: Text("Covid 19-self test"),
        centerTitle: true,
        backgroundColor: Colors.grey.shade900,
        elevation: 10,
        actions: [
          IconButton(
              color: Colors.white,
              icon: Icon(Icons.share),
              onPressed:() {

                Share.share(
                    "Hey! Check out this app on Playstore. Movienator is a Movie and TV Shows Database app. If you love the app please review the app on playstore and share it with your friends. https://play.google.com/store/apps/details?id=com.example.moviegriller");
              }),],



      ),

      body:     MyPlaceholderWidget('https://app.infinityforms.work/app/form?id=5&b=0'),



    );
  }
}



class MyPlaceholderWidget extends StatelessWidget {

  var url = 'https://app.infinityforms.work/app/form?id=5&b=0'  ;
  final key = UniqueKey();

  MyPlaceholderWidget(String url){
    this.url = url ;
  }

  @override
  Widget build(BuildContext context) {

    return WebView(
        key: key,
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: url,
        onWebViewCreated: (WebViewController webViewController){
        });


  }



}