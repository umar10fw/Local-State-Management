import 'package:flutter/cupertino.dart';

class MediaqueryState extends StatelessWidget {
  const MediaqueryState({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;

    return Text(
      "Width: ${size.width}\nHeight: ${size.height}\nOrientation: $orientation",
      style: TextStyle(
        fontSize: 18,
      ),
      textAlign: TextAlign.center,
    );
  }
}
