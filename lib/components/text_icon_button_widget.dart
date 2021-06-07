import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextIconButtonWidget extends StatefulWidget {
  TextIconButtonWidget({
    Key key,
    this.text,
    this.icon,
    this.backgroundColor,
  }) : super(key: key);

  final String text;
  final Widget icon;
  final Color backgroundColor;

  @override
  _TextIconButtonWidgetState createState() => _TextIconButtonWidgetState();
}

class _TextIconButtonWidgetState extends State<TextIconButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0.8, -0.72),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Container(
          width: 75,
          height: 26,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: widget.icon,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: Text(
                  widget.text,
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
