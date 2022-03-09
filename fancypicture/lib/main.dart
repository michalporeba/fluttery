import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photofilters/photofilters.dart';
import 'package:image/image.dart' as imageLib;


void main() {
  runApp(CameraFilterApp());
}

class CameraFilterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Picker Demo',
      home: CameraFilterPage(title: 'Camera and Photo Filter Example'),
    );
  }
}

class CameraFilterPage extends StatefulWidget {
  CameraFilterPage({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  _CameraFilterPageState createState() => _CameraFilterPageState();
}

class _CameraFilterPageState extends State<CameraFilterPage> {
  //TODO: this is used by the Photofilters app when you call their Navigator push method
  String? fileName;
  //TODO: this is the imageFile that is created when you use the Camera/ImagePicker to take a picture and the same is passed to the PhotoFilters app
  File? imageFile;
  //TODO: Instead of too many filters clogging up the page, you can pass this 3 filters to the Photofilters API
  List<Filter> filters = [
    CremaFilter(),
    HefeFilter(),
    MoonFilter(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              child: imageFile == null
                  ? Center(
                child: Text('No image selected.'),
              )
                  : Image.file(imageFile!),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _onCameraButtonPressed();
            },
            heroTag: 'image0', //make sure the hero tags are different
            //for different widgets otherwise it will give an error while
            //rebuilding the tree
            tooltip: 'Pick Image from camera',
            child: const Icon(Icons.camera_alt),
          ),
          FloatingActionButton(
            onPressed: () {
              _onFilterButtonPressed(context);
            },
            heroTag: 'image1',
            tooltip: 'Apply Filter to the Image',
            child: new Icon(Icons.filter),
          ),
        ],
      ),
    );
  }

  //TODO: complete this method to call the ImagePicker/Camera and get the picture taken
  _onCameraButtonPressed() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      fileName = image?.name;
      imageFile = image == null ? null : File(image.path);
    });
  }

  //TODO: complete this method to call the PhotoFilters API with the filters created above and get the updated filtered image back
  _onFilterButtonPressed(BuildContext context) async {
    if (imageFile == null) {
      return;
    }

    var image = imageLib.decodeImage(await imageFile!.readAsBytes());
    image = imageLib.copyResize(image!, width: 600);

    Map imagefile = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhotoFilterSelector(
          title: const Text('Photo Filter Example'),
          filters: filters,
          image: image!,
          filename: fileName!,
          loader: const Center(child: CircularProgressIndicator()),
          fit: BoxFit.contain
        )
      )
    );

    if (imagefile != null && imagefile.containsKey('image_filtered')) {
      setState(() {
        imageFile = imagefile['image_filtered'];
      });
    }
  }
}

