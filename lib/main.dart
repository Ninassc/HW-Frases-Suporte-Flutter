import 'package:appfrases/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(builder: (context) => MyApp(), enabled: false));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frases HW',
      theme: ThemeData(
        fontFamily: 'Poppins',
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,

        dividerColor: Colors.transparent,

        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(fontFamily: 'Poppins', fontSize: 64),
        ),

        expansionTileTheme: ExpansionTileThemeData(
          collapsedIconColor: Colors.white,
          iconColor: Colors.white,
          shape: Border(),
          collapsedShape: Border(),

          textColor: Colors.white,
          collapsedTextColor: Colors.white,
        ),
        
        listTileTheme: ListTileThemeData(
          textColor: Colors.white,
        ),

        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Color(0x55028FCF),
          selectionHandleColor: Color(0xFF028FCF),
          cursorColor: Color(0xFF028FCF),
        ),
      ),
      home: HomePage(),
    );
  }
}
