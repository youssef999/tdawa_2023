
import 'package:bloc/bloc.dart';
import 'package:doctors_app/presentaion/views/admin/admin_view.dart';
import 'package:doctors_app/presentaion/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bloc_obs.dart';




void main() async{
  Bloc.observer = MyBlocObserver();
 // await GetStorage.init();
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
        title: 'Doctors',
        theme: ThemeData(
            primarySwatch: Colors.deepPurple
        ),
        home:AdminView()
       // const SplashView()
    );

  }
}


