import 'package:flutter/material.dart';

class ThemeModel extends InheritedModel<String> {
  final Color color;
  final double fontSize;

  const ThemeModel({
    required this.color,
    required this.fontSize,
    required Widget child,
  }) : super(child: child);

  static ThemeModel? of(BuildContext context, String aspect) {
    return InheritedModel.inheritFrom<ThemeModel>(context, aspect: aspect);
  }

  @override
  bool updateShouldNotify(ThemeModel oldWidget) {
    return color != oldWidget.color || fontSize != oldWidget.fontSize;
  }

  @override
  bool updateShouldNotifyDependent(ThemeModel oldWidget, Set<String> aspects) {
    if (aspects.contains("color") && color != oldWidget.color) return true;
    if (aspects.contains("fontSize") && fontSize != oldWidget.fontSize) return true;
    return false;
  }
}

class ThemePage extends StatefulWidget {
  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  Color color = Colors.blue;
  double fontSize = 16;

  @override
  Widget build(BuildContext context) {
    return ThemeModel(
      color: color,
      fontSize: fontSize,
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Builder(
                builder: (context) {
                  final model = ThemeModel.of(context, "color");
                  return Text("Color text", style: TextStyle(color: model?.color));
                },
              ),
              SizedBox(
                height: 10,
              ),
              Builder(
                builder: (context) {
                  final model = ThemeModel.of(context, "fontSize");
                  return Text("Font size text", style: TextStyle(fontSize: model?.fontSize));
                },
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    color = color == Colors.blue ? Colors.red : Colors.blue;
                  });
                },
                child: const Text("Change Color"),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    fontSize = fontSize == 16 ? 24 : 16;
                  });
                },
                child: const Text("Change Font Size"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
