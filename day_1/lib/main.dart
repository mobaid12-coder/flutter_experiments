import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Light Switch Demo'),
          backgroundColor: Colors.amber,
        ),
        body: LightSwitchDemo(),
      ),
    );
  }
}

class LightSwitchDemo extends StatefulWidget {
  const LightSwitchDemo({super.key});

  @override
  State<LightSwitchDemo> createState() => _LightSwitchDemoState();
}

class _LightSwitchDemoState extends State<LightSwitchDemo> {
  bool _isSwitchOn = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: _isSwitchOn ? Colors.blueAccent : Colors.cyanAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Switch(
            value: _isSwitchOn,
            onChanged: (bool newValue) {
              setState(() {
                _isSwitchOn = newValue;
              });
            },
          ),
          SizedBox(height: 20,),
          Text(
            _isSwitchOn ? 'Light is On' : 'Light is Off',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: _isSwitchOn ? Colors.black : Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
