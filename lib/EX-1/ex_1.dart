import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableButton(),
              SelectableButton(),
              SelectableButton(),
              SelectableButton(),
            ],
          ),
        ),
      ),
    ));

class SelectableButton extends StatefulWidget {
  const SelectableButton({super.key});

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;

  String get textLabel => isSelected ? "Selected" : "Not selected";

  Color get textColor => isSelected ? Colors.white : Colors.black;

  Color get backgroundColor => isSelected ? Colors.blue[500]! : Colors.blue[50]!;

  void onPressed() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
          ),
          child: Center(
            child: Text(
              textLabel,
              style: TextStyle(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
