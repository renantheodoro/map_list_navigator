import 'package:flutter/material.dart';
import 'package:map_navigation/designsystem/colors.dart';

class DesignSystemAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  DesignSystemAppBar({Key? key, this.actions}) : super(key: key);

  final Widget title = Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Text(
        'Mapa App',
        style: TextStyle(color: Palette.charcoal100),
      ),
      SizedBox(
        width: 6.0,
      ),
      Icon(
        Icons.map_outlined,
        color: Palette.pink100,
      ),
    ],
  );
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      elevation: 0.0,
      centerTitle: true,
      backgroundColor: Palette.white,
      iconTheme: const IconThemeData(
        color: Palette.charcoal100,
      ),
      title: title,
      actions: actions,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          color: Palette.blue20,
          padding: const EdgeInsets.only(bottom: 1.0),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
