import 'package:flutter/material.dart';

class NovalabLoadingWidget extends StatelessWidget {
  const NovalabLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator.adaptive();
  }
}
