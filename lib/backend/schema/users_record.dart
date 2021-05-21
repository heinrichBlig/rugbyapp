import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  Timestamp get createdTime;

  @nullable
  String get nickName;

  @nullable
  int get likes;

  @nullable
  int get idNumber;

  @nullable
  String get position;

  @nullable
  int get height;

  @nullable
  int get weight;

  @nullable
  String get teamName;

  @nullable
  bool get validPlayer;

  @nullable
  @BuiltValueField(wireName: 'squad_logo')
  String get squadLogo;

  @nullable
  String get bio;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..nickName = ''
    ..likes = 0
    ..idNumber = 0
    ..position = ''
    ..height = 0
    ..weight = 0
    ..teamName = ''
    ..validPlayer = false
    ..squadLogo = ''
    ..bio = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;
}

Map<String, dynamic> createUsersRecordData({
  String email,
  String displayName,
  String photoUrl,
  String uid,
  Timestamp createdTime,
  String nickName,
  int likes,
  int idNumber,
  String position,
  int height,
  int weight,
  String teamName,
  bool validPlayer,
  String squadLogo,
  String bio,
}) =>
    serializers.serializeWith(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..nickName = nickName
          ..likes = likes
          ..idNumber = idNumber
          ..position = position
          ..height = height
          ..weight = weight
          ..teamName = teamName
          ..validPlayer = validPlayer
          ..squadLogo = squadLogo
          ..bio = bio));

UsersRecord get dummyUsersRecord {
  final builder = UsersRecordBuilder()
    ..email = dummyString
    ..displayName = dummyString
    ..photoUrl = dummyImagePath
    ..uid = dummyString
    ..createdTime = dummyTimestamp
    ..nickName = dummyString
    ..likes = dummyInteger
    ..idNumber = dummyInteger
    ..position = dummyString
    ..height = dummyInteger
    ..weight = dummyInteger
    ..teamName = dummyString
    ..validPlayer = dummyBoolean
    ..squadLogo = dummyImagePath
    ..bio = dummyString;
  return builder.build();
}

List<UsersRecord> createDummyUsersRecord({int count}) =>
    List.generate(count, (_) => dummyUsersRecord);
