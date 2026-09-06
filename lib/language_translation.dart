import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

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
  String? fromLanguage;
  String? toLanguage;

  String translatedText = "";

  TextEditingController textController = TextEditingController();
  TextEditingController languageController = TextEditingController();

  void translate(String src, String dest, String input) async {
    GoogleTranslator translator = GoogleTranslator();
    var translation = await translator.translate(input, from: src, to: dest);
    setState(() {
      translatedText = translation.text;
    });

    if (src == '--' || dest == '--') {
      setState(() {
        translatedText = 'Fail to translate';
      });
    }
  }

  String getLanguageCode(String language) {
    if (language == "English") {
      return "en";
    } else if (language == "Hindi") {
      return "hi";
    } else if (language == "Marathi") {
      return "mr";
    } else if (language == "Gujarati") {
      return "gu";
    } else if (language == "Punjabi") {
      return "pa";
    } else if (language == "Bengali") {
      return "bn";
    } else if (language == "Tamil") {
      return "ta";
    } else if (language == "Telugu") {
      return "te";
    } else if (language == "Kannada") {
      return "kn";
    } else if (language == "Malayalam") {
      return "ml";
    } else if (language == "Urdu") {
      return "ur";
    } else if (language == "Sanskrit") {
      return "sa";
    } else if (language == "French") {
      return "fr";
    } else if (language == "Spanish") {
      return "es";
    } else if (language == "German") {
      return "de";
    } else if (language == "Italian") {
      return "it";
    } else if (language == "Portuguese") {
      return "pt";
    } else if (language == "Russian") {
      return "ru";
    } else if (language == "Chinese") {
      return "zh-cn";
    } else if (language == "Japanese") {
      return "ja";
    } else if (language == "Korean") {
      return "ko";
    } else if (language == "Arabic") {
      return "ar";
    } else if (language == "Turkish") {
      return "tr";
    } else if (language == "Dutch") {
      return "nl";
    } else if (language == "Thai") {
      return "th";
    } else if (language == "Vietnamese") {
      return "vi";
    }

    return "en"; // Default language
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff10223d),
      appBar: AppBar(
        title: Text(
          'Language Translator',
          style: TextStyle(color: Colors.white),
        ),
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
                  const SizedBox(width: 20),

                  DropdownButton<String>(
                    dropdownColor: const Color(0xff2b3c5a),
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    iconEnabledColor: Colors.white,
                    hint: const Text(
                      "From",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: fromLanguage,
                    items: languages.map((language) {
                      return DropdownMenuItem<String>(
                        value: language,
                        child: Text(
                          language,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        fromLanguage = value;
                      });
                    },
                  ),
                  SizedBox(width: 20),
                  Icon(
                    Icons.arrow_right_alt_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(width: 20),

                  DropdownButton<String>(
                    dropdownColor: const Color(0xff2b3c5a),
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    iconEnabledColor: Colors.white,
                    hint: const Text(
                      "To",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: toLanguage,
                    items: languages.map((language) {
                      return DropdownMenuItem<String>(
                        value: language,
                        child: Text(
                          language,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        toLanguage = value;
                      });
                    },
                  ),
                  SizedBox(width: 40),
                ],
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: textController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: "Enter Text",
                    hintStyle: TextStyle(color: Colors.white70),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff2b3c5a),
                  ),
                  onPressed: () {
                    if (fromLanguage != null &&
                        toLanguage != null &&
                        textController.text.isNotEmpty) {
                      translate(
                        getLanguageCode(fromLanguage!),
                        getLanguageCode(toLanguage!),
                        textController.text,
                      );
                    }
                  },
                  child: const Text(
                    'Translate',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "\n$translatedText",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
