import 'package:flutter/material.dart';

class LanguageTranslationPage extends StatefulWidget {
  const LanguageTranslationPage({super.key});

  @override
  State<LanguageTranslationPage> createState() =>
      _LanguageTranslationPageState();
}

class _LanguageTranslationPageState extends State<LanguageTranslationPage> {
  List<String> languages = [
    "English",
    "Hindi",
    "Marathi",
    "Gujarati",
    "Punjabi",
    "Bengali",
    "Tamil",
    "Telugu",
    "Kannada",
    "Malayalam",
    "Urdu",
    "Sanskrit",
    "French",
    "Spanish",
    "German",
    "Italian",
    "Portuguese",
    "Russian",
    "Chinese",
    "Japanese",
    "Korean",
    "Arabic",
    "Turkish",
    "Dutch",
    "Thai",
    "Vietnamese",
  ];
  String? selectedLanguage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language TRanslator'),
        centerTitle: true,
        backgroundColor: Color(0xff10223d),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),

                  DropdownButton<String>(
                    hint: const Text("Select Language"),
                    value: selectedLanguage,
                    items: languages.map((language) {
                      return DropdownMenuItem<String>(
                        value: language,
                        child: Text(language),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedLanguage = value;
                      });
                    },
                  ),

                  const SizedBox(height: 20),

                  TextField(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
