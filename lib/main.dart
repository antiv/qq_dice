
import 'package:flutter/material.dart';
import 'package:qq_dice/cube_widget.dart';


void main() {
  return runApp(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: CubeWidget(),
          ),
        ),
      )
  );
}
