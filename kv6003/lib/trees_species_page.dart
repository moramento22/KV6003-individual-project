import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class TreeSpeciesPage extends StatefulWidget {
  TreeSpeciesPage({super.key, required this.treeName, required this.photo1, required this.photo2, required this.photo3});

  final String treeName;
  final String photo1;
  final String photo2;
  final String photo3;

  final ScrollController _scrollController = ScrollController();

  @override
  State<TreeSpeciesPage> createState() => _TreeSpeciesPageState();
}

class _TreeSpeciesPageState extends State<TreeSpeciesPage> {

  File? image;
  bool fromCamera = false;

  Future<String> _getModel(String assetPath) async {
    if(Platform.isAndroid) {
      return 'flutter_assets/$assetPath)';
    }
    final path = '${(await getApplicationSupportDirectory()).path}/$assetPath';
    await Directory(dirname(path)).create(recursive: true);
    final file = File(path);
    if(!await file.exists())
      {
        final byteData = await rootBundle.load(assetPath);
        await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
      }
    return file.path;
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: fromCamera ? ImageSource.camera : ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    }
    on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }

    final modelPath = await _getModel('assets/plants_labeler.tflite');
    final options = LocalLabelerOptions(confidenceThreshold: 0.1, modelPath: modelPath);
    final imageLabeler = ImageLabeler(options: options);
    final InputImage inputImage = InputImage.fromFilePath(image!.path);
    final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);

    for(ImageLabel label in labels)
      {
        final String text = label.label;
        print(text);
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(widget.treeName,
                textAlign: TextAlign.left,
                style: GoogleFonts.robotoSerif(
                    fontStyle: FontStyle.italic,
                    fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
                    fontWeight: FontWeight.w900
                )
            ),
          )
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: SingleChildScrollView(
              controller: widget._scrollController,
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                          widget.photo1,
                          height: 380,
                          width: 9999,
                          fit: BoxFit.cover)
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                            widget.photo2,
                            height: 380,
                            width: 999,
                            fit: BoxFit.cover)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                            widget.photo3,
                            height: 380,
                            width: 999,
                            fit: BoxFit.cover)
                    ),
                  ),
                ],
              )
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
            onPressed: () {
              fromCamera = false;
              pickImage();
            },
            child: Icon(Icons.photo_library_rounded, color: Theme.of(context).colorScheme.onTertiaryContainer,),
          ),
          const SizedBox(width: 16),
          FloatingActionButton.large(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            onPressed: (){
              fromCamera = true;
              pickImage();
            },
            child: Icon(Icons.photo_camera_rounded, color: Theme.of(context).colorScheme.onPrimaryContainer,),
          )
        ],
      )
    );
  }
}