import 'package:flutter/material.dart';
import 'package:google_maps/provider/users.dart';
import 'package:google_maps/screens/login.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create: (ctx) => Users()
        ),
      ],
      child: MaterialApp(
        home: const Login(),
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
