import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Map<int, Color> color = {
    50: Color.fromRGBO(20, 47, 78, .1),
    100: Color.fromRGBO(20, 47, 78, .2),
    200: Color.fromRGBO(20, 47, 78, .3),
    300: Color.fromRGBO(20, 47, 78, .4),
    400: Color.fromRGBO(20, 47, 78, .5),
    500: Color.fromRGBO(20, 47, 78, .6),
    600: Color.fromRGBO(20, 47, 78, .7),
    700: Color.fromRGBO(20, 47, 78, .8),
    800: Color.fromRGBO(20, 47, 78, .9),
    900: Color.fromRGBO(20, 47, 78, 1),
  };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MaterialColor colorCustom = MaterialColor(0xFF142F4E, color);
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
          primarySwatch: colorCustom,
          accentColor: Colors.indigoAccent,
          fontFamily: "Montserrat",
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black))),
      home: MyHomePage(title: 'Weather Checker App'),
      // home: WelcomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;

  late String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Checker App"),
      ),
      body: Center(
        child: ModalProgressHUD(
          inAsyncCall: showProgress,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "SignUp Page",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {},
                decoration: InputDecoration(
                    hintText: "Enter your Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)))),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {},
                decoration: InputDecoration(
                    hintText: "Enter your Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)))),
              ),
              SizedBox(
                height: 20.0,
              ),
              Material(
                elevation: 5,
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(32.0),
                child: MaterialButton(
                  onPressed: () async {
                    setState(() {
                      showProgress = true;
                    });
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyLoginPage()),
                        );
                        setState(() {
                          showProgress = false;
                        });
                      }
                    } catch (e) {}
                  },
                  minWidth: 200.0,
                  height: 45.0,
                  child: Text(
                    "Register",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyLoginPage()),
                  );
                },
                child: Text(
                  "Already Registred? Login Now",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w900),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
