import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:melanoma/screens/chat.dart';

Future<http.Response> predict(File imageFile) async {
  var request = http.MultipartRequest(
    'POST',
    Uri.parse("https://asia-south1-melanoma-388416.cloudfunctions.net/predict"),
  );
  request.files.add(await http.MultipartFile.fromPath('file', imageFile.path));
  var response = await request.send();
  return await http.Response.fromStream(response);
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? _image;
  String _result = '';
  String _label = '';
  String _solution = '';
  final ImagePicker _picker = ImagePicker();

  Future<void> _getImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        _getImageResult(File(pickedFile.path));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ERROR'),
        ),
      );
    }
  }

  Future<void> _getImageResult(File imageFile) async {
    setState(
      () {
        _image = imageFile;
        _result = '';
        _label = 'Predicting...';
        _solution = '...';
      },
    );

    final response = await predict(imageFile);
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      setState(
        () {
          _result = responseJson['pred'] ?? 'Failed to predict';
          _solution = responseJson['prec'] ?? 'Failed to predict';
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ERROR'),
        ),
      );
      setState(
        () {
          _image = null;
          _result = '';
          _label = 'Failed to predict';
          _solution = '';
        },
      );
    }
  }

  void _clearOutput() {
    setState(
      () {
        _image = null;
        _result = '';
        _label = '';
        _solution = '';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
      if (_result == "Melanoma Detected") {
        // Redirect to another screen if _result is "melanoma" with a delay
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatApp()),
          );
        });
      }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DETECTOR",
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.brown[400],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (_image == null)
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    height: 300,
                    width: 300,
                    child: Center(
                      child: Image(image: AssetImage('assets/images/predict.jpg')),
                    ),
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: SizedBox(
                    height: 300,
                    width: 300,
                    child: Image.file(
                      _image!,
                      height: 250,
                      width: 250,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => _getImage(ImageSource.camera),
                      child: Ink(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt_rounded),
                            SizedBox(width: 10),
                            Text(
                              'Take a Photo',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => _getImage(ImageSource.gallery),
                      child: Ink(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.photo_library_rounded),
                            SizedBox(width: 10),
                            Text(
                              'Gallery',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 20),
                      child: InkWell(
                        onTap: _clearOutput,
                        child: Ink(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.brown[400],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.refresh,
                                  size: 24,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Refresh',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Text(
                _result,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 40,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  _solution,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 20,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }
}
