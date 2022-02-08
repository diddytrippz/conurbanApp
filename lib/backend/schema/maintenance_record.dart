import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'maintenance_record.g.dart';

abstract class MaintenanceRecord
    implements Built<MaintenanceRecord, MaintenanceRecordBuilder> {
  static Serializer<MaintenanceRecord> get serializer =>
      _$maintenanceRecordSerializer;

  @nullable
  String get issue;

  @nullable
  String get status;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  String get room;

  @nullable
  String get building;

  @nullable
  String get notes;

  @nullable
  int get rating;

  @nullable
  bool get isDone;

  @nullable
  String get category;

  @nullable
  String get assigned;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

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
    ..assigned = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('maintenance');

  static Stream<MaintenanceRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<MaintenanceRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

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
          ..rating = snapshot.data['rating']
          ..isDone = snapshot.data['isDone']
          ..category = snapshot.data['category']
          ..assigned = snapshot.data['assigned']
          ..reference = MaintenanceRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<MaintenanceRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
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
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMaintenanceRecordData({
  String issue,
  String status,
  String email,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
  String displayName,
  String room,
  String building,
  String notes,
  int rating,
  bool isDone,
  String category,
  String assigned,
}) =>
    serializers.toFirestore(
        MaintenanceRecord.serializer,
        MaintenanceRecord((m) => m
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
          ..assigned = assigned));
