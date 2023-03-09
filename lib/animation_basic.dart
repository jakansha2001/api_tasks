import 'package:flutter/material.dart';

class BasicAnimation extends StatefulWidget {
  const BasicAnimation({super.key});

  @override
  State<BasicAnimation> createState() => _BasicAnimationState();
}

class _BasicAnimationState extends State<BasicAnimation> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations'),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              isClicked = !isClicked;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(seconds: 5),
            color: isClicked ? Colors.amber : Colors.blueGrey,
            height: isClicked ? 500 : 100,
            width: isClicked ? 500 : 100,
          ),

          // child: Container(
          //   color: Colors.amber,
          //   height: isClicked ? 500 : 100,
          //   width: isClicked ? 500 : 100,
          // ),
        ),
      ),
    );
  }
}
