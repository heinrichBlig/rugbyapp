import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedAndUpskillButtonWidget extends StatefulWidget {
  FeedAndUpskillButtonWidget({
    Key key,
    this.text,
    this.icon,
    this.color,
  }) : super(key: key);

  final String text;
  final Widget icon;
  final Color color;

  @override
  _FeedAndUpskillButtonWidgetState createState() =>
      _FeedAndUpskillButtonWidgetState();
}

class _FeedAndUpskillButtonWidgetState
    extends State<FeedAndUpskillButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0.8, -0.72),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Container(
          width: 140,
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
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
