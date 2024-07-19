import 'package:flutter/material.dart';
import 'package:tablah/core/constants/constants.dart';
import 'package:tablah/src/communication/presentation/views/pages/communication_page.dart';
import 'package:sizer/sizer.dart';

class TABlah extends StatelessWidget {
  const TABlah({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
        title: APP_NAME,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CommunicationPage()
      );
      }
      
    );
  }
}