import 'package:flutter/material.dart';

class Animationpractice extends StatefulWidget {
  const Animationpractice({super.key});

  @override
  State<Animationpractice> createState() => _AnimationpracticeState();
}

class _AnimationpracticeState extends State<Animationpractice> {
  bool _first = true;
  double _fontsize = 50;
  Color _color = Colors.amber;
  double top = 20;
  double left = 20;
  double width = 50, height = 50;
  double scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Container(
        //   child: AnimatedDefaultTextStyle(
        //       child: Center(child: Text('BWP')),
        //       curve: Curves.easeInCubic,
        //       style: TextStyle(
        //           fontSize: _fontsize,
        //           fontWeight: FontWeight.bold,
        //           color: _color),
        //       duration: const Duration(seconds: 1)),
        // ),
        // Stack(
        //   alignment: AlignmentDirectional.topCenter,
        //   children: [
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.blue,
        //     ),
        //     AnimatedPositioned(
        //         top: top,
        //         left: left,
        //         curve: Curves.bounceOut,
        //         child: Text('Abdul'),
        //         duration: const Duration(seconds: 1)),
        //     AnimatedPositioned(
        //         top: top,
        //         left: left,
        //         curve: Curves.easeInCirc,
        //         child: Text('Waheed'),
        //         duration: const Duration(seconds: 1)),
        //     AnimatedPositioned(
        //         top: top,
        //         left: left,
        //         curve: Curves.easeInOutQuint,
        //         child: Text('Bwp'),
        //         duration: const Duration(seconds: 1))
        //   ],
        // ),
        AnimatedScale(
          scale: scale,
          duration: const Duration(seconds: 1),
          child: Container(
            width: 50,
            height: 50,
            color: Colors.pink,
          ),
        ),
        Center(
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  scale = scale == 1.0 ? 3.0 : 1.0;
                });
              },
              child: Text('scaleanim')),
        ) //   ),
        // ),
        // ElevatedButton(
        //     onPressed: () {
        //       setState(() {
        //         if (width == 50 && height == 50) {
        //           width = 100;
        //           height = 100;
        //         } else {
        //           width = 50;
        //           height = 50;
        //         }
        //       });
        //     },
        //     child: Text('Anisize')),

        // ElevatedButton(
        //     onPressed: () {
        //       setState(() {
        //         if (left == 20 && top == 20) {
        //           left = 100;
        //           top = 100;
        //         } else {
        //           left = 20;
        //           top = 20;
        //         }
        //       });
        //     },
        //     child: Text("Positioned")),
        // ElevatedButton(
        //     onPressed: () {
        //       setState(() {
        //         _fontsize = _first ? 90 : 60;
        //         _color = _first ? Colors.amber : Colors.blue;
        //         _first = !_first;
        //       });
        //     },
        //     child: Text('Abdul'))
      ],
    ));
  }
}
