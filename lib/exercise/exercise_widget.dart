import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseWidget extends StatefulWidget {
  ExerciseWidget({Key key}) : super(key: key);

  @override
  _ExerciseWidgetState createState() => _ExerciseWidgetState();
}

class _ExerciseWidgetState extends State<ExerciseWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: StreamBuilder<List<ExerciseRecord>>(
          stream: queryExerciseRecord(
            singleRecord: true,
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            List<ExerciseRecord> columnExerciseRecordList = snapshot.data;
            // Customize what your widget looks like with no query results.
            if (snapshot.data.isEmpty) {
              // return Container();
              // For now, we'll just include some dummy data.
              columnExerciseRecordList = createDummyExerciseRecord(count: 1);
            }
            final columnExerciseRecord = columnExerciseRecordList.first;
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: Alignment(0, 0),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 9, 0, 0),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFF262B35),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: FlutterFlowTheme.secondaryColor,
                                size: 24,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 20, 20, 20),
                              child: Image.asset(
                                'assets/images/RUGB.APP-01.png',
                                width: 250,
                                height: 180,
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Exercise Set ',
                                    style: FlutterFlowTheme.title2.override(
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  Text(
                                    columnExerciseRecord.set.toString(),
                                    style: FlutterFlowTheme.title2.override(
                                      fontFamily: 'Poppins',
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    columnExerciseRecord.reps.toString(),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  Text(
                                    'reps ',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  Text(
                                    ' - rest ',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  Text(
                                    columnExerciseRecord.rest.toString(),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  Text(
                                    'sec',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                columnExerciseRecord.set.toString(),
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Text(
                                '/',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Text(
                                '10',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: FlutterFlowVideoPlayer(
                        path: columnExerciseRecord.videoUrl,
                        videoType: VideoType.network,
                        width: double.infinity,
                        autoPlay: false,
                        looping: false,
                        showControls: true,
                        allowFullScreen: true,
                        allowPlaybackSpeedMenu: true,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Previous',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: Color(0xFFB0AEAE),
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Next',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: FlutterFlowTheme.secondaryColor,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
