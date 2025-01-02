import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class DevicePermissionServices extends GetxService {
  Future<void> handlePermission(
    Permission permission, {
    required VoidCallback onDenied,
    required VoidCallback onGranted,
    required VoidCallback onPermanentlyDenied,
    VoidCallback? onRestricted,
    VoidCallback? onLimited,
    VoidCallback? onProvisional,
  }) async {
    final status = await permission.request();

    switch (status) {
      case PermissionStatus.denied:
        onDenied();
        break;
      case PermissionStatus.granted:
        onGranted();
        break;
      case PermissionStatus.permanentlyDenied:
        onPermanentlyDenied();
        break;
      case PermissionStatus.restricted:
        onRestricted?.call();
        break;
      case PermissionStatus.limited:
        onLimited?.call();
        break;
      case PermissionStatus.provisional:
        onProvisional?.call();
        break;
    }
  }

  // Generalized method for checking permission
  Future<bool> checkPermission(Permission permission) async {
    final status = await permission.status;
    return status.isGranted;
  }

  // Open app settings
  Future<bool> openAppSettings() async {
    return openAppSettings();
  }

  // Specific permission requests with callbacks
  Future<void> requestCameraPermission({
    required VoidCallback onDenied,
    required VoidCallback onGranted,
    required VoidCallback onPermanentlyDenied,
    VoidCallback? onRestricted,
    VoidCallback? onLimited,
    VoidCallback? onProvisional,
  }) async {
    await handlePermission(
      Permission.camera,
      onDenied: onDenied,
      onGranted: onGranted,
      onPermanentlyDenied: onPermanentlyDenied,
      onRestricted: onRestricted,
      onLimited: onLimited,
      onProvisional: onProvisional,
    );
  }

  Future<void> requestLocationPermission({
    required VoidCallback onDenied,
    required VoidCallback onGranted,
    required VoidCallback onPermanentlyDenied,
    VoidCallback? onRestricted,
    VoidCallback? onLimited,
    VoidCallback? onProvisional,
  }) async {
    await handlePermission(
      Permission.location,
      onDenied: onDenied,
      onGranted: onGranted,
      onPermanentlyDenied: onPermanentlyDenied,
      onRestricted: onRestricted,
      onLimited: onLimited,
      onProvisional: onProvisional,
    );
  }

  Future<void> requestStoragePermission({
    required VoidCallback onDenied,
    required VoidCallback onGranted,
    required VoidCallback onPermanentlyDenied,
    VoidCallback? onRestricted,
    VoidCallback? onLimited,
    VoidCallback? onProvisional,
  }) async {
    await handlePermission(
      Permission.storage,
      onDenied: onDenied,
      onGranted: onGranted,
      onPermanentlyDenied: onPermanentlyDenied,
      onRestricted: onRestricted,
      onLimited: onLimited,
      onProvisional: onProvisional,
    );
  }

  Future<void> requestMicrophonePermission({
    required VoidCallback onDenied,
    required VoidCallback onGranted,
    required VoidCallback onPermanentlyDenied,
    VoidCallback? onRestricted,
    VoidCallback? onLimited,
    VoidCallback? onProvisional,
  }) async {
    await handlePermission(
      Permission.microphone,
      onDenied: onDenied,
      onGranted: onGranted,
      onPermanentlyDenied: onPermanentlyDenied,
      onRestricted: onRestricted,
      onLimited: onLimited,
      onProvisional: onProvisional,
    );
  }

  Future<void> requestPhonePermission({
    required VoidCallback onDenied,
    required VoidCallback onGranted,
    required VoidCallback onPermanentlyDenied,
    VoidCallback? onRestricted,
    VoidCallback? onLimited,
    VoidCallback? onProvisional,
  }) async {
    await handlePermission(
      Permission.phone,
      onDenied: onDenied,
      onGranted: onGranted,
      onPermanentlyDenied: onPermanentlyDenied,
      onRestricted: onRestricted,
      onLimited: onLimited,
      onProvisional: onProvisional,
    );
  }
}
