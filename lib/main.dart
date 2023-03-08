import 'package:flutter/material.dart';
import 'package:flutter_implicit_animation/practice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Animationpractice(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double opacity = 0;
  Color color = Colors.amber;
  final EdgeInsetsGeometry edgeInsetsGeometry1 = const EdgeInsets.all(8.0);
  final EdgeInsetsGeometry edgeInsetsGeometry2 = const EdgeInsets.all(58);
  late EdgeInsetsGeometry padding;
  BoxShape boxShape = BoxShape.rectangle;
  double height = 100, width = 100;
  double turn = 0;
  CrossFadeState crossFadeState = CrossFadeState.showFirst;
  Alignment alignment = Alignment.center;

  void _incrementCounter() {
    setState(() {
      if (opacity == 0) {
        opacity = 1;
        color = Colors.red;
        width = 200;
        height = 200;
        turn = 1;
        CrossFadeState.showSecond;
        alignment = Alignment.centerLeft;
        // boxShape = BoxShape.circle;
      } else {
        opacity = 0;
        color = Colors.pink;
        // boxShape = BoxShape.rectangle;
        width = 100;
        height = 100;
        turn = 0;
        CrossFadeState.showFirst;
        alignment = Alignment.center;
      }
    });
    if (padding.hashCode == edgeInsetsGeometry1.hashCode) {
      padding = edgeInsetsGeometry2;
    } else {
      padding = edgeInsetsGeometry1;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    padding = edgeInsetsGeometry1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: opacity,
              child: const Text(
                'You have pushed the button this many times:',
              ),
            ),
            AnimatedContainer(
              decoration: BoxDecoration(color: color, shape: boxShape),
              width: width,
              height: height,
              curve: Curves.decelerate,
              duration: const Duration(seconds: 1),
              child: AnimatedPadding(
                  duration: const Duration(seconds: 1),
                  padding: padding,
                  child: Text('CAS')),
            ),
            AnimatedRotation(
              turns: turn,
              duration: const Duration(seconds: 1),
              child: Text('Abdul'),
              //CURVES HAVE MORE METHOD TO APPLY CURVES.SOMETHING
              curve: Curves.easeInCirc,
            ),
            AnimatedCrossFade(
                firstChild: IconButton(
                    onPressed: () {
                      setState(() {
                        crossFadeState = CrossFadeState.showSecond;
                      });
                    },
                    icon: Icon(Icons.send)),
                secondChild: Icon(Icons.emoji_emotions),
                crossFadeState: crossFadeState,
                duration: const Duration(seconds: 1)),

            //ALSO USE IN CONTAINER INSTEAD OF PADDING MOVE WIDGET FROM ONE PLACE TO ANOTHER PLACE
            AnimatedAlign(
              alignment: alignment,
              duration: const Duration(seconds: 1),
              child: Text('Pakistan'),
            ),

            ElevatedButton(onPressed: _incrementCounter, child: Text('Abdul')),
          ],
        ),
      ),
    );
  }
}
