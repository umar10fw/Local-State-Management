import 'package:flutter/material.dart';

class DashboardModel extends InheritedModel<String> {
  final int cpuUsage;
  final int memoryUsage;

  const DashboardModel({
    required this.cpuUsage,
    required this.memoryUsage,
    required Widget child,
  }) : super(child: child);

  static DashboardModel? of(BuildContext context, String aspect) {
    return InheritedModel.inheritFrom<DashboardModel>(context, aspect: aspect);
  }

  @override
  bool updateShouldNotify(DashboardModel oldWidget) {
    return cpuUsage != oldWidget.cpuUsage || memoryUsage != oldWidget.memoryUsage;
  }

  @override
  bool updateShouldNotifyDependent(DashboardModel oldWidget, Set<String> aspects) {
    if (aspects.contains("cpu") && cpuUsage != oldWidget.cpuUsage) return true;
    if (aspects.contains("memory") && memoryUsage != oldWidget.memoryUsage) return true;
    return false;
  }
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int cpu = 30;
  int memory = 40;

  @override
  Widget build(BuildContext context) {
    return DashboardModel(
      cpuUsage: cpu,
      memoryUsage: memory,
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Builder(
                builder: (context) {
                  final model = DashboardModel.of(context, "cpu");
                  return Text("CPU Usage: ${model?.cpuUsage}%", style: const TextStyle(fontSize: 20));
                },
              ),
              SizedBox(
                height: 10,
              ),
              Builder(
                builder: (context) {
                  final model = DashboardModel.of(context, "memory");
                  return Text("Memory Usage: ${model?.memoryUsage}%", style: const TextStyle(fontSize: 20));
                },
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    cpu = (cpu + 10) % 100;
                  });
                },
                child: const Text("Update CPU"),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    memory = (memory + 15) % 100;
                  });
                },
                child: const Text("Update Memory"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
