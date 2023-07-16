import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:tflite/tflite.dart';
import 'check_result.dart';

class Checkup extends StatefulWidget {
  @override
  _CheckupState createState() => _CheckupState();
}

class _CheckupState extends State<Checkup> {
  final _formKey = GlobalKey<FormState>();
  File? _file;
  XFile? _myimage;
  final _picker = ImagePicker();
  List<dynamic>? _result;

  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: "assets/hema.tflite",
      labels: "assets/hema.txt",
    );
  }

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future<void> modelOutput(final XFile image) async {
    final List<dynamic>? result = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 3,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _result = result;
    });
    print("results: $_result");

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CheckResult(result: _result),
      ),
    );
  }

  void pickGalleryImage() async {
    _myimage = await _picker.pickImage(source: ImageSource.gallery);
    if (_myimage == null) return;
    setState(() {
      _file = File(_myimage!.path);
    });

    print("image: $_myimage");
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_file != null) {
        modelOutput(_myimage!);
      } else {
        // Handle the case when no image is selected
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 300, sigmaY: 500.0),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/checkup.jpeg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: Color(0xff205072),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 180,
                        ),
                        Container(
                          height: 200,
                          width: 400,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Please insert your X-Ray file:",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: 'Upload your X-Ray file',
                                          suffixIcon: IconButton(
                                            icon: Icon(Icons.attach_file),
                                            onPressed: pickGalleryImage,
                                          ),
                                        ),
                                        readOnly: true,
                                        controller: _file != null
                                            ? TextEditingController(
                                          text: path.basename(
                                              _file!.path),
                                        )
                                            : null,
                                        validator: (value) {
                                          if (_file == null) {
                                            return 'Please select a file.';
                                          }
                                          return null;
                                        },
                                      ),
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
                  SizedBox(
                    height: 150,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue,
                          ),
                          child: MaterialButton(
                            onPressed: _submitForm,
                            height: 50.0,
                            child: Text(
                              "Confirm",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
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
