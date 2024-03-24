# Base64 Image Picker

The "base64_image_picker" Flutter package allows users to select images from both the device's camera and gallery. With this package, users can choose a single image, which is then automatically converted into base64 format. This base64-encoded image can be easily sent to an API by accessing it from the list's first index. This streamlined process simplifies image selection and integration with APIs, making it convenient for developers to incorporate image functionality into their Flutter applications.


## Features

Feature-rich Image Picker: The package provides a user-friendly interface for selecting images, offering options to choose from both the device's gallery and camera.

Dialog Integration: Utilizes a dialog to prompt the user to select an image source, ensuring a seamless and intuitive user experience.

Gallery and Camera Options: Users can effortlessly select images either from their device's existing gallery or by capturing a new photo using the device's camera.

Automatic Base64 Conversion: The selected image is automatically converted into base64 format behind the scenes, eliminating the need for manual conversion by the developer.

Modern Design: The package employs modern design principles, ensuring an aesthetically pleasing and intuitive user interface.

No External Dependencies: It avoids the involvement of external packages like imagepicker, maintaining a lightweight and efficient solution.

Overall, "base64_image_picker" simplifies the process of selecting, converting, and integrating images into Flutter applications, enhancing both developer productivity and user satisfaction.

## Example

<p>
<img src="https://github.com/priyanshutaru/base64_image_picker/blob/master/asset/base64_image_picker.gif?raw=true" alt="An animated image of the Base64 Image Picker" height="400"/>
</p>


## Gettting Started 

To use this pacakge use base64_image_picker as dependency in your pubsec.yml file of your flutter project.


## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
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
          ],
        ),
      ),
    );
  }
}


```

## Additional information

Contributing: We welcome contributions! Feel free to open issues or submit pull requests.


Issue Tracking: If you encounter any issues, please file them on the GitHub repository.


Community Support: Join our community on github for discussions and assistance.

**Show some ❤️ and star the repo to support the project**