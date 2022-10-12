import 'package:flutter/material.dart';
import 'package:map_navigation/designsystem/colors.dart';
import 'package:map_navigation/designsystem/fonts.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({
    Key? key,
    required this.children,
    required this.continentName,
    required this.percent,
    required this.onContinentClicked,
    this.initiallyExpanded = false,
    this.selectedColor = Colors.white,
    this.onExpansionChanged,
    this.percentage,
  }) : super(key: key);

  final Color selectedColor;
  final String? percentage;
  final String continentName;
  final double percent;
  final void Function(bool isExpanded) onContinentClicked;

  /// Called when the tile expands or collapses.
  ///
  /// When the tile starts expanding, this function is called with the value
  /// true. When the tile starts collapsing, this function is called with
  /// the value false.
  final ValueChanged<bool>? onExpansionChanged;

  /// The widgets that are displayed when the tile expands.
  ///
  /// Typically [ListTile] widgets.
  final List<Widget> children;

  /// Specifies if the list tile is initially expanded (true) or collapsed (false, the default).
  final bool initiallyExpanded;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late CurvedAnimation _easeInAnimation;
  late ColorTween _borderColor;
  late ColorTween _headerColor;
  late ColorTween _iconColor;
  late Animation<double> _iconTurns;

  bool _isExpanded = false;

  Widget _expansionPanelHeader(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              '${widget.percent}%',
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              widget.continentName,
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 8,
                width: 100,
                child: LinearProgressIndicator(
                  backgroundColor: Palette.blue20,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    widget.selectedColor,
                  ),
                  value: widget.percent / 100,
                ),
              ),
            ),
          ),
        ],
      );
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);
    _easeInAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _borderColor = ColorTween();
    _headerColor = ColorTween();
    _iconColor = ColorTween();
    _iconTurns = Tween<double>(begin: 0.5, end: 0.0).animate(_easeInAnimation);

    _isExpanded = (PageStorage.of(context)?.readState(context) ??
        widget.initiallyExpanded) as bool;
    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((value) {
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });

    if (widget.onExpansionChanged != null) {
      widget.onExpansionChanged!(_isExpanded);
    }
    widget.onContinentClicked(_isExpanded);
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    const Color borderSideColor = Palette.blue20;
    final Color? titleColor = _headerColor.evaluate(_easeInAnimation);
    return Container(
      decoration: const BoxDecoration(
          color: Palette.blue10,
          border: Border(
            top: BorderSide(color: borderSideColor),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconTheme.merge(
              data: IconThemeData(color: _iconColor.evaluate(_easeInAnimation)),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Palette.boxShadow,
                        blurRadius: 24,
                        offset: Offset(0, 16))
                  ],
                ),
                child: ListTile(
                  onTap: _handleTap,
                  title: DefaultTextStyle(
                    style: DesignSystemFonts.textStyleH4(color: titleColor),
                    child: _expansionPanelHeader(context),
                  ),
                  trailing: RotationTransition(
                      turns: _iconTurns,
                      child: const Icon(Icons.arrow_drop_up)),
                ),
              )),
          ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              heightFactor: _easeInAnimation.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    _borderColor.end = theme.dividerColor;
    _headerColor
      ..begin = Palette.charcoal100
      ..end = widget.selectedColor;
    _iconColor
      ..begin = theme.unselectedWidgetColor
      ..end = theme.colorScheme.secondary;

    final bool closed = !_isExpanded && _controller.isDismissed;
    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: closed ? null : Column(children: widget.children),
    );
  }
}
