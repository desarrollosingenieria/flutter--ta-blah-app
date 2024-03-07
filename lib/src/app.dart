import 'package:flutter/material.dart';
import 'package:tablah/src/views/pages/homePage/home_page.dart';

class TABlah extends StatelessWidget {
  const TABlah({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TA Blah',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
