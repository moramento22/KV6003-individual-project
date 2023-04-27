import 'dart:io' as io;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'trees.dart';

class TreeSpeciesPage extends StatefulWidget {
  TreeSpeciesPage(
      {super.key,
      required this.treeName,
      required this.photo1,
      required this.photo2,
      required this.photo3,
      required this.index});

  final String treeName;
  final String photo1;
  final String photo2;
  final String photo3;
  final int index;

  @override
  State<TreeSpeciesPage> createState() => _TreeSpeciesPageState();
}

class _TreeSpeciesPageState extends State<TreeSpeciesPage> {
  io.File? image;
  bool fromCamera = false;
  bool donePicture = false;

  late List<Widget> imagesList = [
    ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(widget.photo1,
            height: 380, width: 9999, fit: BoxFit.cover)),
    Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(widget.photo2,
              height: 380, width: 999, fit: BoxFit.cover)),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(widget.photo3,
              height: 380, width: 999, fit: BoxFit.cover)),
    )
  ];

  Future<String> _getModel(String assetPath) async {
    if (io.Platform.isAndroid) {
      return 'flutter_assets/$assetPath';
    }
    final path = '${(await getApplicationSupportDirectory()).path}/$assetPath';
    await io.Directory(dirname(path)).create(recursive: true);
    final file = io.File(path);
    if (!await file.exists()) {
      final byteData = await rootBundle.load(assetPath);
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
    return file.path;
  }

  Future pickImage(BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(
          source: fromCamera ? ImageSource.camera : ImageSource.gallery);
      if (image == null) return;
      final imageTemp = io.File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }

    const path = 'assets/ml/plants_labeler.tflite';
    final modelPath = await _getModel(path);
    final options =
        LocalLabelerOptions(confidenceThreshold: 0.05, modelPath: modelPath);
    final imageLabeler = ImageLabeler(options: options);
    final InputImage inputImage = InputImage.fromFilePath(image!.path);
    final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);

    imagesLoop:
    for (int i = 0; i < labels.length; i++) {
      final labelText = labels[i].label;
      if (labelText.toLowerCase() == trees[widget.index].latinName) {
        trees[widget.index].done = true;
        setState(() {
          donePicture = true;
        });
        if(mounted){
        imagesList.insert(0,
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Material(
              color: Theme.of(context).colorScheme.surfaceVariant,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(image!,
                      height: 380,
                      width: 999,
                      fit: BoxFit.cover
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(trees[widget.index].tidbit, style: GoogleFonts.roboto(
                      fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                      fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight,
                      color: Theme.of(context).colorScheme.onSurface
                    )),
                  )
                ],
              ),
            ),
          )
        );}
        imagesList[1] =  Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(widget.photo1,
                  height: 380, width: 999, fit: BoxFit.cover)),
        );
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Congratulations! You found the tree!")));
        }
        break imagesLoop;
      }
      else if (donePicture == false && i == labels.length-1)
        {
          if(mounted)
            {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("The tree hasn't been recognised. Try again!")));
            }
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            actions: [
              trees[widget.index].done
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Ink(decoration: ShapeDecoration(color: Theme.of(context).colorScheme.primary, shape: const CircleBorder()), child: Icon(Icons.done_rounded, color: Theme.of(context).colorScheme.onPrimary)),
                    )
                  : const SizedBox.shrink()
            ],
            title: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(widget.treeName,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.robotoSerif(
                      fontStyle: FontStyle.italic,
                      fontSize:
                          Theme.of(context).textTheme.headlineLarge?.fontSize,
                      fontWeight: FontWeight.w900)),
            )),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: SingleChildScrollView(
                child: Column(
              children: imagesList,
            )),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
              onPressed: () {
                if (trees[widget.index].done) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("You have already found that tree!")));
                } else {
                  fromCamera = false;
                  pickImage(context);
                }
              },
              child: Icon(
                Icons.photo_library_rounded,
                color: Theme.of(context).colorScheme.onTertiaryContainer,
              ),
            ),
            const SizedBox(width: 16),
            FloatingActionButton.large(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              onPressed: () {
                if (trees[widget.index].done) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("You have already found that tree!")));
                } else {
                  fromCamera = true;
                  pickImage(context);
                }
              },
              child: Icon(
                Icons.photo_camera_rounded,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            )
          ],
        ));
  }
}
