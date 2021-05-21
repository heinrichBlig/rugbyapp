import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class IconOnlyButtonWidget extends StatefulWidget {
  IconOnlyButtonWidget({
    Key key,
    this.icon,
    this.backgroundColor,
  }) : super(key: key);

  final Widget icon;
  final Color backgroundColor;

  @override
  _IconOnlyButtonWidgetState createState() => _IconOnlyButtonWidgetState();
}

class _IconOnlyButtonWidgetState extends State<IconOnlyButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 67,
      height: 42,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: widget.icon,
    );
  }
}
