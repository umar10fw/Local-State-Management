import 'package:flutter/material.dart';

class SliderExample extends StatelessWidget {
  const SliderExample({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<double> volume = ValueNotifier(0.5);

    return Scaffold(
      body: Center(
        child: ValueListenableBuilder<double>(
          valueListenable: volume,
          builder: (context, value, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Volume: ${(value * 100).toInt()}%"),
                Slider(
                  value: value,
                  onChanged: (newVal) => volume.value = newVal,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
