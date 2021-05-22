import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'squads_record.g.dart';

abstract class SquadsRecord
    implements Built<SquadsRecord, SquadsRecordBuilder> {
  static Serializer<SquadsRecord> get serializer => _$squadsRecordSerializer;

  @nullable
  DocumentReference get user;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SquadsRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('squads');

  static Stream<SquadsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SquadsRecord._();
  factory SquadsRecord([void Function(SquadsRecordBuilder) updates]) =
      _$SquadsRecord;
}

Map<String, dynamic> createSquadsRecordData({
  DocumentReference user,
}) =>
    serializers.serializeWith(
        SquadsRecord.serializer, SquadsRecord((s) => s..user = user));

SquadsRecord get dummySquadsRecord {
  final builder = SquadsRecordBuilder();
  return builder.build();
}

List<SquadsRecord> createDummySquadsRecord({int count}) =>
    List.generate(count, (_) => dummySquadsRecord);
