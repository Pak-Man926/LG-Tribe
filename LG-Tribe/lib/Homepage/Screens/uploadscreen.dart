import 'dart:math';
import "dart:io";

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:gal/gal.dart';
import "package:permission_handler/permission_handler.dart";
import "package:get/get.dart";
import "package:image_picker/image_picker.dart";

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen>
    with WidgetsBindingObserver {
  List<CameraDescription> cameras = [];
  CameraController? cameraController;
  int selectedCameraIdx = 0;
  File? _image;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);

    if (cameraController == null ||
        cameraController?.value.isInitialized == false) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _setupCameraController();
    }
  }

  @override
  void initState() {
    super.initState();
    _setupCameraController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildUI());
  }

  Widget _buildUI() {
    if (cameraController == null ||
        cameraController?.value.isInitialized == false) {
      return const Center(child: CircularProgressIndicator());
    }

    return SafeArea(
      child: SizedBox.expand(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 1,
              child: AspectRatio(
                aspectRatio: cameraController!.value.aspectRatio,
                child: CameraPreview(cameraController!)),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    XFile picture = await cameraController!.takePicture();
                    Gal.putImage(picture.path);
                  },
                  icon: Icon(Icons.camera_outlined, color: Color(0xFFA50034)),
                  iconSize: 100,
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: () async {
                    if (cameras.length < 2) return; // No camera to switch to

                    selectedCameraIdx =
                        (selectedCameraIdx + 1) % cameras.length;

                    await cameraController?.dispose();
                    await _setupCameraController(); // Reinitialize with new camera
                  },
                  icon: Icon(
                    Icons.switch_camera_outlined,
                    color: Color(0xFFA50034),
                  ),
                  iconSize: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _setupCameraController() async {
    List<CameraDescription> cameras = await availableCameras();

    if (cameras.isNotEmpty) {
      setState(() {
        this.cameras = cameras;
        cameraController = CameraController(
          cameras[selectedCameraIdx],
          ResolutionPreset.low,
        );
      });
      cameraController
          ?.initialize()
          .then((_) {
            if (!mounted) {
              return;
            }
            setState(() {});
          })
          .catchError((Object e) {
            print(e);
          });
        cameraController!.setZoomLevel(1.0);
    }
  }

  Future<void> _pickImageFromGallery() async
  {
    var status = await Permission.photos.request();
    if (!status.isGranted)
    {
      Get.snackbar(
        "Permission Denied",
        "Please allow gallery access to upload images.",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      //maxWidth: 800,
      //maxHeight: 800,
    );

    if(pickedFile != null)
    {
      setState((){
        _image = File(pickedFile.path);
      });
    }
    else
    {
      Get.snackbar(
        "Error",
        "No image selected.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
