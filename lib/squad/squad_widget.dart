import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/text_icon_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../profile_edit/profile_edit_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SquadWidget extends StatefulWidget {
  SquadWidget({Key key}) : super(key: key);

  @override
  _SquadWidgetState createState() => _SquadWidgetState();
}

class _SquadWidgetState extends State<SquadWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: Alignment(0, 0),
              child: Padding(
                padding: EdgeInsets.fromLTRB(1, 9, 0, 0),
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
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Image.asset(
                      'assets/images/RUGB.APP-01.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  StreamBuilder<UsersRecord>(
                                    stream: UsersRecord.getDocument(
                                        currentUserReference),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      }
                                      final cardUsersRecord = snapshot.data;
                                      return Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 20, 20, 30),
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: Color(0xFF262B35),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.57,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFEEEEEE),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        StreamBuilder<
                                                            List<UsersRecord>>(
                                                          stream:
                                                              queryUsersRecord(
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                  child:
                                                                      CircularProgressIndicator());
                                                            }
                                                            List<UsersRecord>
                                                                imageUsersRecordList =
                                                                snapshot.data;
                                                            // Customize what your widget looks like with no query results.
                                                            if (snapshot
                                                                .data.isEmpty) {
                                                              // return Container();
                                                              // For now, we'll just include some dummy data.
                                                              imageUsersRecordList =
                                                                  createDummyUsersRecord(
                                                                      count: 1);
                                                            }
                                                            final imageUsersRecord =
                                                                imageUsersRecordList
                                                                    .first;
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          10,
                                                                          10,
                                                                          10,
                                                                          0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          24),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          24),
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  imageUsersRecord
                                                                      .photoUrl,
                                                                  width: double
                                                                      .infinity,
                                                                  height: 204,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                        Align(
                                                          alignment:
                                                              Alignment(0, 0),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              await Navigator
                                                                  .pushAndRemoveUntil(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          ProfileEditWidget(),
                                                                ),
                                                                (r) => false,
                                                              );
                                                            },
                                                            child:
                                                                TextIconButtonWidget(
                                                              text: 'Edit',
                                                              icon: Icon(
                                                                Icons.settings,
                                                              ),
                                                              backgroundColor:
                                                                  Color(
                                                                      0xE6E6E6E6),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 5, 10, 10),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 45,
                                                                height: 45,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  cardUsersRecord
                                                                      .squadLogo,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets
                                                                        .fromLTRB(
                                                                            3,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      cardUsersRecord
                                                                          .displayName,
                                                                      style: FlutterFlowTheme
                                                                          .subtitle1
                                                                          .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsets.fromLTRB(
                                                                            3,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          '@',
                                                                          style: FlutterFlowTheme
                                                                              .bodyText1
                                                                              .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        cardUsersRecord
                                                                            .nickName,
                                                                        style: FlutterFlowTheme
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                        ),
                                                                      )
                                                                    ],
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(0, 0,
                                                                    20, 0),
                                                            child: Container(
                                                              width: 123,
                                                              height: 42,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xE6E6E6E6),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets
                                                                        .fromLTRB(
                                                                            0,
                                                                            0,
                                                                            3,
                                                                            0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .favorite_rounded,
                                                                      color: Colors
                                                                          .black,
                                                                      size: 24,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    cardUsersRecord
                                                                        .profileLike
                                                                        .toString(),
                                                                    style: FlutterFlowTheme
                                                                        .bodyText1
                                                                        .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                'Age',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme
                                                                    .bodyText1
                                                                    .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                cardUsersRecord
                                                                    .age
                                                                    .toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme
                                                                    .bodyText1
                                                                    .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF49DF8B),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                'Position',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme
                                                                    .bodyText1
                                                                    .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                cardUsersRecord
                                                                    .position,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme
                                                                    .bodyText1
                                                                    .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF49DF8B),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                'Height',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme
                                                                    .bodyText1
                                                                    .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  cardUsersRecord
                                                                      .height
                                                                      .toString(),
                                                                  style: FlutterFlowTheme
                                                                      .bodyText1
                                                                      .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Color(
                                                                        0xFF49DF8B),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          2,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    'cm',
                                                                    style: FlutterFlowTheme
                                                                        .bodyText1
                                                                        .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Color(
                                                                          0xFF49DF8B),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                'Weight',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme
                                                                    .bodyText1
                                                                    .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  cardUsersRecord
                                                                      .weight
                                                                      .toString(),
                                                                  style: FlutterFlowTheme
                                                                      .bodyText1
                                                                      .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Color(
                                                                        0xFF49DF8B),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          2,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    'kg',
                                                                    style: FlutterFlowTheme
                                                                        .bodyText1
                                                                        .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Color(
                                                                          0xFF49DF8B),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 0, 0, 5),
                                                      child: Text(
                                                        'Biography',
                                                        style: FlutterFlowTheme
                                                            .subtitle1
                                                            .override(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 1, 0, 0),
                                                      child: Text(
                                                        cardUsersRecord.bio,
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 0, 10, 5),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Player Content',
                                                          style:
                                                              FlutterFlowTheme
                                                                  .subtitle1
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: Colors.white,
                                                            fontSize: 13,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            5, 0, 10, 5),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  10, 0, 10, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              FFButtonWidget(
                                                                onPressed: () {
                                                                  print(
                                                                      'Button pressed ...');
                                                                },
                                                                text: 'Feed',
                                                                icon: Icon(
                                                                  Icons
                                                                      .videocam_outlined,
                                                                  size: 15,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 124,
                                                                  height: 40,
                                                                  color: Color(
                                                                      0x00262B35),
                                                                  textStyle: FlutterFlowTheme
                                                                      .subtitle2
                                                                      .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme
                                                                        .secondaryColor,
                                                                  ),
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme
                                                                        .secondaryColor,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      12,
                                                                ),
                                                              ),
                                                              FFButtonWidget(
                                                                onPressed: () {
                                                                  print(
                                                                      'Button pressed ...');
                                                                },
                                                                text: 'Upskill',
                                                                icon: Icon(
                                                                  Icons
                                                                      .videocam_outlined,
                                                                  size: 15,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 124,
                                                                  height: 40,
                                                                  color: Color(
                                                                      0x00262B35),
                                                                  textStyle: FlutterFlowTheme
                                                                      .subtitle2
                                                                      .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Color(
                                                                        0xFF151515),
                                                                  ),
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      12,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.swipe,
                                        color: Colors.black,
                                        size: 24,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
