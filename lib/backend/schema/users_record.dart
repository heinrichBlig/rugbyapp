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
  int get age;

  @nullable
  @BuiltValueField(wireName: 'profile_like')
  int get profileLike;

  @nullable
  @BuiltValueField(wireName: 'nick_name')
  String get nickName;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..idNumber = 0
    ..position = ''
    ..height = 0
    ..weight = 0
    ..teamName = ''
    ..validPlayer = false
    ..squadLogo = ''
    ..bio = ''
    ..age = 0
    ..profileLike = 0
    ..nickName = ''
    ..phoneNumber = '';

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
  int idNumber,
  String position,
  int height,
  int weight,
  String teamName,
  bool validPlayer,
  String squadLogo,
  String bio,
  int age,
  int profileLike,
  String nickName,
  String phoneNumber,
}) =>
    serializers.serializeWith(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..idNumber = idNumber
          ..position = position
          ..height = height
          ..weight = weight
          ..teamName = teamName
          ..validPlayer = validPlayer
          ..squadLogo = squadLogo
          ..bio = bio
          ..age = age
          ..profileLike = profileLike
          ..nickName = nickName
          ..phoneNumber = phoneNumber));

UsersRecord get dummyUsersRecord {
  final builder = UsersRecordBuilder()
    ..email = dummyString
    ..displayName = dummyString
    ..photoUrl = dummyImagePath
    ..uid = dummyString
    ..createdTime = dummyTimestamp
    ..idNumber = dummyInteger
    ..position = dummyString
    ..height = dummyInteger
    ..weight = dummyInteger
    ..teamName = dummyString
    ..validPlayer = dummyBoolean
    ..squadLogo = dummyImagePath
    ..bio = dummyString
    ..age = dummyInteger
    ..profileLike = dummyInteger
    ..nickName = dummyString
    ..phoneNumber = dummyString;
  return builder.build();
}

List<UsersRecord> createDummyUsersRecord({int count}) =>
    List.generate(count, (_) => dummyUsersRecord);
