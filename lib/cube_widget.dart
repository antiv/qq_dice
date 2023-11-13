import 'dart:math';
import 'package:cubixd/cubixd.dart';
import 'package:vector_math/vector_math_64.dart' show Vector2;
import 'package:flutter/material.dart';

class CubeWidget extends StatefulWidget {
  const CubeWidget({super.key});

  @override
  State<CubeWidget> createState() => _CubeWidgetState();
}

class _CubeWidgetState extends State<CubeWidget> with TickerProviderStateMixin {
  late Animation _animation;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  );

  @override
  void initState() {
    _animation = Tween<double>(begin: 1, end: 10).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  double get _value {
    final double random = Random().nextDouble() * 8;
    if (_animation.value == 1.0) {
      return 1.0;
    }
    return random;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CubixD(
          size: 200.0,
          delta: Vector2((pi / 4) * _value, (pi / 4) * _value),
          onSelected: (SelectedSide opt, Vector2 delta) {
            // print('On selected callback:\n\topt = ${opt}\n\tdelta = ${delta}');
          },
          top: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/dice1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          bottom: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/dice6.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          left: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/dice3.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          right: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/dice4.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          front: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/dice5.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          back: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/dice2.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // ),
        const SizedBox(height: 60.0),
        ElevatedButton(
          onPressed: () {
            _controller.reset();
            _controller.forward();
          },
          child: const Text('QQ ME!'),
        ),
      ],
    );
  }
}
