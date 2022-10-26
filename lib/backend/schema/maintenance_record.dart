import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'maintenance_record.g.dart';

abstract class MaintenanceRecord
    implements Built<MaintenanceRecord, MaintenanceRecordBuilder> {
  static Serializer<MaintenanceRecord> get serializer =>
      _$maintenanceRecordSerializer;

  String? get issue;

  String? get status;

  String? get email;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  String? get room;

  String? get building;

  String? get notes;

  int? get rating;

  bool? get isDone;

  String? get category;

  String? get assigned;

  BuildingsStruct get residency;

  StatusStruct get myStatus;

  DocumentReference? get userRec;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MaintenanceRecordBuilder builder) => builder
    ..issue = ''
    ..status = ''
    ..email = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..displayName = ''
    ..room = ''
    ..building = ''
    ..notes = ''
    ..rating = 0
    ..isDone = false
    ..category = ''
    ..assigned = ''
    ..residency = BuildingsStructBuilder()
    ..myStatus = StatusStructBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('maintenance');

  static Stream<MaintenanceRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MaintenanceRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static MaintenanceRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      MaintenanceRecord(
        (c) => c
          ..issue = snapshot.data['issue']
          ..status = snapshot.data['status']
          ..email = snapshot.data['email']
          ..photoUrl = snapshot.data['photo_url']
          ..uid = snapshot.data['uid']
          ..createdTime = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['created_time']))
          ..phoneNumber = snapshot.data['phone_number']
          ..displayName = snapshot.data['display_name']
          ..room = snapshot.data['room']
          ..building = snapshot.data['building']
          ..notes = snapshot.data['notes']
          ..rating = snapshot.data['rating']?.round()
          ..isDone = snapshot.data['isDone']
          ..category = snapshot.data['category']
          ..assigned = snapshot.data['assigned']
          ..residency = snapshot.data['residency']
          ..myStatus = snapshot.data['myStatus']
          ..userRec = safeGet(() => toRef(snapshot.data['userRec']))
          ..ffRef = MaintenanceRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<MaintenanceRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'maintenance',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  MaintenanceRecord._();
  factory MaintenanceRecord([void Function(MaintenanceRecordBuilder) updates]) =
      _$MaintenanceRecord;

  static MaintenanceRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMaintenanceRecordData({
  String? issue,
  String? status,
  String? email,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? displayName,
  String? room,
  String? building,
  String? notes,
  int? rating,
  bool? isDone,
  String? category,
  String? assigned,
  BuildingsStruct? residency,
  StatusStruct? myStatus,
  DocumentReference? userRec,
}) {
  final firestoreData = serializers.toFirestore(
    MaintenanceRecord.serializer,
    MaintenanceRecord(
      (m) => m
        ..issue = issue
        ..status = status
        ..email = email
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..displayName = displayName
        ..room = room
        ..building = building
        ..notes = notes
        ..rating = rating
        ..isDone = isDone
        ..category = category
        ..assigned = assigned
        ..residency = BuildingsStructBuilder()
        ..myStatus = StatusStructBuilder()
        ..userRec = userRec,
    ),
  );

  // Handle nested data for "residency" field.
  addBuildingsStructData(firestoreData, residency, 'residency');

  // Handle nested data for "myStatus" field.
  addStatusStructData(firestoreData, myStatus, 'myStatus');

  return firestoreData;
}
