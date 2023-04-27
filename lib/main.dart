
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/views/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'bloc_obs.dart';


 void main() async{
  Bloc.observer = MyBlocObserver();
  await GetStorage.init();
  HttpOverrides.global = MyHttpOverrides();
 await Firebase.initializeApp();
  runApp(const MyApp());
}

 class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
        textDirection: TextDirection.rtl,
        debugShowCheckedModeBanner: false,
        title: 'Tadawy',
        theme: ThemeData(
            primarySwatch: Colors.blue
        ),
        home:
        const SplashView()
    );

  }
}

 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
