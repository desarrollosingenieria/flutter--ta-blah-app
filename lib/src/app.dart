import 'package:flutter/material.dart';
import 'package:techabla/src/views/pages/homePage/home_page.dart';

class TecHabla extends StatelessWidget {
  const TecHabla({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TecHabla',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
