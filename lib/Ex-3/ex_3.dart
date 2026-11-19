import 'package:flutter/material.dart';

List<String> images = [
  "lib/Ex-3/assets/bird.jpg",
  "lib/Ex-3/assets/bird2.jpg",
  "lib/Ex-3/assets/insect.jpg",
  "lib/Ex-3/assets/girl.jpg",
  "lib/Ex-3/assets/man.jpg",
];

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, // hide the DEBUG banner on top right
      home: ImageViewer(),
    ));

class ImageViewer extends StatefulWidget {
  const ImageViewer({super.key});

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  int currentIndex = 0;

  void onPrevious() {
    setState(() {
      if (currentIndex == 0) {
        currentIndex = images.length - 1;
      } else {
        currentIndex = currentIndex - 1;
      }
    });
  }

  void onNext() {
    setState(() {
      if (currentIndex == images.length - 1) {
        currentIndex = 0;
      } else {
        currentIndex = currentIndex + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: onPrevious,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: onNext,
            ),
          ),
        ],
      ),
      body: Image.asset(images[currentIndex]),
    );
  }
}
