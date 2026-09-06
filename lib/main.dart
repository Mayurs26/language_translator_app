import 'package:flutter/material.dart';
import 'package:lang_translator_app/language_translation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language TRanslator App',
      debugShowCheckedModeBanner: false,
      home: LanguageTranslationPage(),
    );
  }
}
