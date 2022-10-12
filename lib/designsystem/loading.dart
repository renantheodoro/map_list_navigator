import 'package:flutter/material.dart';
import 'package:map_navigation/designsystem/colors.dart';

class DesignSystemDnaLoader extends StatelessWidget {
  const DesignSystemDnaLoader({
    Key? key,
    this.isVisible = true,
    this.backgroundColor = Palette.white50,
  }) : super(key: key);
  final bool isVisible;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return isVisible
        ? Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              color: backgroundColor,
              child: const Center(
                  child: CircularProgressIndicator(
                color: Palette.pink100,
              )),
            ),
          )
        : const SizedBox();
  }
}
