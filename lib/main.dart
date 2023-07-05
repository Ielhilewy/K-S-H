
import 'package:flutter/material.dart';
import 'Screens/LOGIN/forget passward.dart';
import 'Screens/update_email.dart';
import 'firebase_options.dart';
import 'Screens/HOME/home.dart';
import 'Screens/LOGIN/login.dart';
import 'package:firebase_core/firebase_core.dart';
void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(myapp());
}
class myapp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen ()  ,
    );
  }
}

