library base64_image_picker;

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Base64ImagePicker extends StatefulWidget {
  final String nameOfImage;
  final List<String> base64ImageList;
  final int imageQuality;

  const Base64ImagePicker(
      {Key? key,
      required this.nameOfImage,
      required this.base64ImageList,
      required this.imageQuality})
      : super(key: key);

  @override
  State<Base64ImagePicker> createState() => _Base64ImagePickerState();
}

class _Base64ImagePickerState extends State<Base64ImagePicker> {
  List<String> base64ImageList = [];
  late ImagePicker base64ImagePickerPriyanshu;
  File? base64ImagePriyanshuImagePath;

  @override
  void initState() {
    super.initState();
    base64ImagePickerPriyanshu = ImagePicker();
  }

  void base64SelectedImage(String imagePath) {
    final File imageFile = File(imagePath);
    final List<int> imageBytes = imageFile.readAsBytesSync();
    final String base64Image = base64Encode(imageBytes);
    setState(() {
      widget.base64ImageList.clear();
      widget.base64ImageList.add(base64Image);
    });
  }

  Future<void> base64ShowImage(ImageSource source) async {
    final XFile? pickedImage = await base64ImagePickerPriyanshu.pickImage(
      source: source,
      imageQuality: widget.imageQuality,
    );
    if (pickedImage != null) {
      setState(() {
        base64ImagePriyanshuImagePath = File(pickedImage.path);
        base64SelectedImage(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: [
          SafeArea(
            child: Container(),
          ),
          GestureDetector(
            onTap: () {
              _showCameraGalleryDialog(context, base64ShowImage);
            },
            child: Container(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 1,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                    color: Colors.black, style: BorderStyle.solid, width: 0.5),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  widget.base64ImageList.isNotEmpty
                      ? Image.file(
                          base64ImagePriyanshuImagePath!,
                          width: 100,
                          height: 100,
                        )
                      : const Icon(
                          Icons.camera_alt_outlined,
                          size: 50,
                          color: Colors.grey,
                        ),
                  const SizedBox(
                    width: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.nameOfImage,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                          ),
                        ),
                        const TextSpan(
                          text: '*',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showCameraGalleryDialog(
      BuildContext context, Function(ImageSource) onTapCallback) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Image Source"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Camera"),
                onTap: () {
                  onTapCallback(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text("Gallery"),
                onTap: () {
                  onTapCallback(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

