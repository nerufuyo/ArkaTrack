import 'package:arkatrack/common/routes/route.dart';
import 'package:arkatrack/presentation/screens/face_recognition/controller/face_recognition_controller.dart';
import 'package:arkatrack/presentation/widgets/app_min_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class FaceRecognitionScreen extends GetView<FaceRecognitionController> {
  const FaceRecognitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppMinimalisHeaderWidget(
          title: 'Attendance',
          onBack: () => GoRouter.of(globalKey.currentContext!)
              .goNamed(ScreenName.dashboard),
        ),
      ),
      body: const Center(
        child: Text('Face Recognition Screen'),
      ),
    );
  }
}
