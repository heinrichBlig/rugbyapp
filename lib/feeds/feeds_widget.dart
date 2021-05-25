import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/icon_only_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../gallary/gallary_widget.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedsWidget extends StatefulWidget {
  FeedsWidget({Key key}) : super(key: key);

  @override
  _FeedsWidgetState createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment(0, 0),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 100, 10, 0),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 264,
                            height: 42,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: textController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Search Player or Team',
                                        labelStyle:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                        ),
                                        hintText: '[Some hint text...]',
                                        hintStyle:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.search,
                                    color: Color(0xFFB0AEAE),
                                    size: 24,
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GallaryWidget(),
                                ),
                              );
                            },
                            child: IconOnlyButtonWidget(
                              icon: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                              backgroundColor: Color(0xFF49DF8B),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
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
                )
              ],
            ),
            Expanded(
              child: StreamBuilder<List<PostsRecord>>(
                stream: queryPostsRecord(
                  queryBuilder: (postsRecord) =>
                      postsRecord.orderBy('set_time', descending: true),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  List<PostsRecord> listViewPostsRecordList = snapshot.data;
                  // Customize what your widget looks like with no query results.
                  if (snapshot.data.isEmpty) {
                    // return Container();
                    // For now, we'll just include some dummy data.
                    listViewPostsRecordList = createDummyPostsRecord(count: 4);
                  }
                  return Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewPostsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewPostsRecord =
                            listViewPostsRecordList[listViewIndex];
                        return Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.white,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.network(
                                listViewPostsRecord.imgUrl,
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                fit: BoxFit.cover,
                              ),
                              StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(
                                    listViewPostsRecord.user),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                  final rowUsersRecord = snapshot.data;
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 200,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          color: Color(0xE6E6E6E6),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(2, 0, 0, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              final user =
                                                  listViewPostsRecord.user;

                                              final squadsRecordData =
                                                  createSquadsRecordData(
                                                user: user,
                                              );

                                              await SquadsRecord.collection
                                                  .doc()
                                                  .set(squadsRecordData);
                                              await Navigator
                                                  .pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      NavBarPage(
                                                          initialPage: 'squad'),
                                                ),
                                                (r) => false,
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  '@',
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                                Text(
                                                  rowUsersRecord.nickName,
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 10, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            final postsRecordData = {
                                              'likes': FieldValue.increment(1),
                                            };

                                            await listViewPostsRecord.reference
                                                .update(postsRecordData);
                                          },
                                          child: Container(
                                            width: 118,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                  icon: Icon(
                                                    Icons.favorite_border,
                                                    color: Color(0xFF49DF8B),
                                                    size: 30,
                                                  ),
                                                  iconSize: 30,
                                                ),
                                                Text(
                                                  listViewPostsRecord.likes
                                                      .toString(),
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xFF49DF8B),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                },
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
