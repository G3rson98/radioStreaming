import 'package:flutter/material.dart';

import '../widgets/menu_bar.dart';

class HomePage extends StatelessWidget {
  final Widget child;
  const HomePage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            child,
            const Align(
                alignment: Alignment.bottomCenter,
                child: MenuBottomBar()
            )
          ],
        ),
      ),
    );
  }
}
