import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'metrics_record.g.dart';

abstract class MetricsRecord
    implements Built<MetricsRecord, MetricsRecordBuilder> {
  static Serializer<MetricsRecord> get serializer => _$metricsRecordSerializer;

  StatusStruct get myStatus;

  BuildingsStruct get residencies;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MetricsRecordBuilder builder) => builder
    ..myStatus = StatusStructBuilder()
    ..residencies = BuildingsStructBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('metrics');

  static Stream<MetricsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MetricsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MetricsRecord._();
  factory MetricsRecord([void Function(MetricsRecordBuilder) updates]) =
      _$MetricsRecord;

  static MetricsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMetricsRecordData({
  StatusStruct? myStatus,
  BuildingsStruct? residencies,
}) {
  final firestoreData = serializers.toFirestore(
    MetricsRecord.serializer,
    MetricsRecord(
      (m) => m
        ..myStatus = StatusStructBuilder()
        ..residencies = BuildingsStructBuilder(),
    ),
  );

  // Handle nested data for "myStatus" field.
  addStatusStructData(firestoreData, myStatus, 'myStatus');

  // Handle nested data for "residencies" field.
  addBuildingsStructData(firestoreData, residencies, 'residencies');

  return firestoreData;
}
