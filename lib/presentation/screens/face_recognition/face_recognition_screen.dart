import 'package:arkatrack/presentation/screens/face_recognition/controller/face_recognition_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaceRecognitionScreen extends GetView<FaceRecognitionController> {
  const FaceRecognitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Face Recognition Screen'),
      ),
    );
  }
}
