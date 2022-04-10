import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker(this.imageFn);
  final void Function(File pickedImage) imageFn;
  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImage;
  @override
  void initState() {
    _pickedImage = _pickedImage;
    super.initState();
  }

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    widget.imageFn(pickedImageFile);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 60,
          backgroundColor: Color(0xffdadada),
          backgroundImage: _pickedImage != null
              ? FileImage(
                  _pickedImage!,
                )
              : null,
        ),
        const SizedBox(
          height: 10,
        ),
        FlatButton.icon(
          color: Theme.of(context).accentColor,
          onPressed: _pickImage,
          icon: const Icon(
            Icons.image,
          ),
          label: const Text('Add image'),
        ),
      ],
    );
  }
}
