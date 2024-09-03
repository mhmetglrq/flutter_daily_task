import 'package:flutter/material.dart';

import '../views/home/home.dart';

mixin HomeMixin on State<Home> {
  bool isDrawerOpened = false;

  double initialPosition = 0.0;

  void handleDragUpdate(DragUpdateDetails details) {
    setState(() {
      initialPosition -= details.delta.dx;
      // Burada sınırları kontrol edebilirsiniz.
      if (initialPosition < 0) {
        initialPosition = 0;
      } else if (initialPosition > MediaQuery.of(context).size.width * 0.6) {
        initialPosition = MediaQuery.of(context).size.width * 0.6;
      }
    });
  }

  void handleDragEnd(DragEndDetails details) {
    setState(() {
      // Belli bir mesafeyi geçtikten sonra tam olarak açılmasını veya kapanmasını sağlayabilirsiniz.
      if (initialPosition < MediaQuery.of(context).size.width * 0.3) {
        isDrawerOpened = true;
        initialPosition = 0;
      } else {
        isDrawerOpened = false;
        initialPosition = MediaQuery.of(context).size.width * 0.6;
      }
    });
  }

  void handleDrawerTap() {
    setState(() {
      isDrawerOpened = !isDrawerOpened;
      if (isDrawerOpened) {
        initialPosition = MediaQuery.of(context).size.width * 0.6;
      } else {
        initialPosition = 0;
      }
    });
  }

  void handleBodyTap() {
    if (isDrawerOpened) {
      setState(() {
        isDrawerOpened = !isDrawerOpened;
        if (!isDrawerOpened) {
          initialPosition = 0;
        }
      });
    }
  }
}
