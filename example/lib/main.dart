import 'package:base64_image_picker/base64_image_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Priyanshu Kumar ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Base64ImagePickerExample(),
    );
  }
}


class Base64ImagePickerExample extends StatefulWidget {
  const Base64ImagePickerExample({super.key});

  @override
  State<Base64ImagePickerExample> createState() => _Base64ImagePickerExampleState();
}

class _Base64ImagePickerExampleState extends State<Base64ImagePickerExample> {

  String nameOfImage = "Base64 Image Picker";
  List<String> base64ImageList = [];
  int imageQuality = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SafeArea(
              child: Container(),
            ),
            Base64ImagePicker(
              nameOfImage: nameOfImage,
              base64ImageList: base64ImageList,
              imageQuality: imageQuality,
            ),
            SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_pin,
                    size: 40,
                    color: Colors.black.withOpacity(0.7),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Priyanshu Kumar',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      Text(
                        'Flutter Developer',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
