import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> 
{
  List<CameraDescription> cameras = [];
  CameraController? cameraController;

  @override
  void initState() 
  {
    super.initState();
    _setupCameraController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
    );
  }

  Widget _buildUI()
  {
    if(cameraController == null || cameraController?.value.isInitialized == false)
    {
      return const Center(
        child: CircularProgressIndicator(),
        );
    }

    return SafeArea(
      child: SizedBox.expand(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.5,
              child: CameraPreview(cameraController!)
              ),
            IconButton(
              onPressed: () {},
               icon: Icon(Icons.camera_outlined, color:Colors.red),
                iconSize: 100,
               )
          ],
          )
      )
    );
    
  }

  Future<void> _setupCameraController() async
  {
    List<CameraDescription> cameras = await availableCameras();

    if(cameras.isNotEmpty)
    {
      setState(()
      {
        cameras = cameras;
        cameraController = CameraController(
          cameras.first,
          // Set the desired resolution preset  
          ResolutionPreset.high,

        );
      });
      cameraController?.initialize().then((_)
      {
        setState(()
        {

        });
      });
    }
  }
}