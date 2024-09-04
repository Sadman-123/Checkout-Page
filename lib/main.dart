import 'package:get/get.dart';
import 'package:jox/screens/mybag.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(Main());
}
class Main extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}