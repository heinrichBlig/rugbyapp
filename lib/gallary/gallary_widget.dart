import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/icon_only_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GallaryWidget extends StatefulWidget {
  GallaryWidget({Key key}) : super(key: key);

  @override
  _GallaryWidgetState createState() => _GallaryWidgetState();
}

class _GallaryWidgetState extends State<GallaryWidget> {
  String uploadedFileUrl1;
  String uploadedFileUrl2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(118),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.primaryColor,
          iconTheme: IconThemeData(color: Colors.white),
          automaticallyImplyLeading: true,
          flexibleSpace: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Image.asset(
              'assets/images/RUGB.APP-01.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          actions: [],
          elevation: 4,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: StreamBuilder<List<PostsRecord>>(
                stream: queryPostsRecord(
                  queryBuilder: (postsRecord) => postsRecord.where('user',
                      isEqualTo: currentUserReference),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  List<PostsRecord> gridViewPostsRecordList = snapshot.data;
                  // Customize what your widget looks like with no query results.
                  if (snapshot.data.isEmpty) {
                    // return Container();
                    // For now, we'll just include some dummy data.
                    gridViewPostsRecordList = createDummyPostsRecord(count: 4);
                  }
                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: gridViewPostsRecordList.length,
                    itemBuilder: (context, gridViewIndex) {
                      final gridViewPostsRecord =
                          gridViewPostsRecordList[gridViewIndex];
                      return CachedNetworkImage(
                        imageUrl: gridViewPostsRecord.imgUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      final selectedMedia = await selectMedia(
                        maxWidth: 300.00,
                        maxHeight: 250.00,
                      );
                      if (selectedMedia != null &&
                          validateFileFormat(
                              selectedMedia.storagePath, context)) {
                        showUploadMessage(context, 'Uploading file...',
                            showLoading: true);
                        final downloadUrl = await uploadData(
                            selectedMedia.storagePath, selectedMedia.bytes);
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        if (downloadUrl != null) {
                          setState(() => uploadedFileUrl1 = downloadUrl);
                          showUploadMessage(context, 'Success!');
                        } else {
                          showUploadMessage(context, 'Failed to upload media');
                        }
                      }
                      final imgUrl = uploadedFileUrl1;
                      final setTime = getCurrentTimestamp;
                      final user = currentUserReference;

                      final postsRecordData = createPostsRecordData(
                        imgUrl: imgUrl,
                        setTime: setTime,
                        user: user,
                      );

                      await PostsRecord.collection.doc().set(postsRecordData);
                    },
                    child: IconOnlyButtonWidget(
                      icon: Icon(
                        Icons.upload_file,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      final selectedMedia = await selectMedia(
                        maxWidth: 300.00,
                        maxHeight: 250.00,
                      );
                      if (selectedMedia != null &&
                          validateFileFormat(
                              selectedMedia.storagePath, context)) {
                        showUploadMessage(context, 'Uploading file...',
                            showLoading: true);
                        final downloadUrl = await uploadData(
                            selectedMedia.storagePath, selectedMedia.bytes);
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        if (downloadUrl != null) {
                          setState(() => uploadedFileUrl2 = downloadUrl);
                          showUploadMessage(context, 'Success!');
                        } else {
                          showUploadMessage(context, 'Failed to upload media');
                        }
                      }
                      final imgUrl = uploadedFileUrl2;
                      final setTime = getCurrentTimestamp;
                      final user = currentUserReference;

                      final postsRecordData = createPostsRecordData(
                        imgUrl: imgUrl,
                        setTime: setTime,
                        user: user,
                      );

                      await PostsRecord.collection.doc().set(postsRecordData);
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
            )
          ],
        ),
      ),
    );
  }
}
