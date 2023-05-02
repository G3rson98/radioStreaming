import 'package:flutter/material.dart';

class MenuTitle extends StatelessWidget {

  final String text;

  const MenuTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(text,style: Theme.of(context).textTheme.titleMedium),
    ));
  }
}
