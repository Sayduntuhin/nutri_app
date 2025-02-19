import 'package:flutter/material.dart';
import 'package:camera/camera.dart'; // Import camera package
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  CameraController? _controller;
  List<CameraDescription>? cameras;
  bool _isCameraInitialized = false;
  String? imagePath;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    if (cameras!.isNotEmpty) {
      _controller = CameraController(cameras![0], ResolutionPreset.high);
      await _controller!.initialize();
      if (mounted) {
        setState(() {
          _isCameraInitialized = true;
        });
      }
    }
  }
  Future<void> _captureImage() async {
    if (!_controller!.value.isInitialized) return;

    try {
      final XFile file = await _controller!.takePicture();
      if (mounted) {
        context.push("/scanResult", extra: {"imagePath": file.path}); // ✅ Navigate with GoRouter
      }
    } catch (e) {
      print("Error capturing image: $e");
    }
  }
  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _isCameraInitialized
              ? CameraPreview(_controller!)
              : Center(child: CircularProgressIndicator()),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: FloatingActionButton(
                onPressed: _captureImage,
                backgroundColor: Colors.white12,
                elevation: 12,
                child: Icon(Icons.camera_alt, size: 30, color: Colors.black),
              ),
            ),
          ),
          Positioned(
            bottom: 120,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.fastfood),
                  label: Text("Scan Food"),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.qr_code_scanner),
                  label: Text("Scan Barcode"),
                ),

              ],
            ),
          ),
          //pick image
          Positioned(
            left: 0,
            bottom: 10,
            child: IconButton(onPressed: () {

            }, icon: Icon(Icons.photo,color: Colors.white,)),
          ),

          //close camera
          Positioned(
            right: 5,
            bottom: 10,
            child: CircleAvatar(
              backgroundColor: Colors.white38,
              child: IconButton(onPressed: () {
              }, icon: Icon(Icons.close,color: Colors.white,)),
            ),
          )
        ],
      ),
    );
  }

  // Custom bottom button widget
  Widget _buildBottomButton(String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 30.sp),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 12.sp),
        ),
      ],
    );
  }
}

// Custom painter for the scanner frame
class ScannerFramePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white.withOpacity(0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Drawing the scanner frame
    double width = size.width * 0.8;
    double height = size.height * 0.4;
    double top = (size.height - height) / 2;
    double left = (size.width - width) / 2;

    // Draw the rectangle frame
    canvas.drawRect(Rect.fromLTWH(left, top, width, height), paint);

    // Draw the corner lines
    paint.strokeWidth = 4;

    // Top-left corner
    canvas.drawLine(Offset(left, top), Offset(left + 30, top), paint);
    canvas.drawLine(Offset(left, top), Offset(left, top + 30), paint);

    // Top-right corner
    canvas.drawLine(Offset(left + width, top), Offset(left + width - 30, top), paint);
    canvas.drawLine(Offset(left + width, top), Offset(left + width, top + 30), paint);

    // Bottom-left corner
    canvas.drawLine(Offset(left, top + height), Offset(left + 30, top + height), paint);
    canvas.drawLine(Offset(left, top + height), Offset(left, top + height - 30), paint);

    // Bottom-right corner
    canvas.drawLine(Offset(left + width, top + height), Offset(left + width - 30, top + height), paint);
    canvas.drawLine(Offset(left + width, top + height), Offset(left + width, top + height - 30), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
