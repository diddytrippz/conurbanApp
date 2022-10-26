// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metrics_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MetricsRecord> _$metricsRecordSerializer =
    new _$MetricsRecordSerializer();

class _$MetricsRecordSerializer implements StructuredSerializer<MetricsRecord> {
  @override
  final Iterable<Type> types = const [MetricsRecord, _$MetricsRecord];
  @override
  final String wireName = 'MetricsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MetricsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'myStatus',
      serializers.serialize(object.myStatus,
          specifiedType: const FullType(StatusStruct)),
      'residencies',
      serializers.serialize(object.residencies,
          specifiedType: const FullType(BuildingsStruct)),
    ];
    Object? value;
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  MetricsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MetricsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'myStatus':
          result.myStatus.replace(serializers.deserialize(value,
              specifiedType: const FullType(StatusStruct))! as StatusStruct);
          break;
        case 'residencies':
          result.residencies.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuildingsStruct))!
              as BuildingsStruct);
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$MetricsRecord extends MetricsRecord {
  @override
  final StatusStruct myStatus;
  @override
  final BuildingsStruct residencies;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MetricsRecord([void Function(MetricsRecordBuilder)? updates]) =>
      (new MetricsRecordBuilder()..update(updates))._build();

  _$MetricsRecord._(
      {required this.myStatus, required this.residencies, this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        myStatus, r'MetricsRecord', 'myStatus');
    BuiltValueNullFieldError.checkNotNull(
        residencies, r'MetricsRecord', 'residencies');
  }

  @override
  MetricsRecord rebuild(void Function(MetricsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MetricsRecordBuilder toBuilder() => new MetricsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MetricsRecord &&
        myStatus == other.myStatus &&
        residencies == other.residencies &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, myStatus.hashCode), residencies.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MetricsRecord')
          ..add('myStatus', myStatus)
          ..add('residencies', residencies)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MetricsRecordBuilder
    implements Builder<MetricsRecord, MetricsRecordBuilder> {
  _$MetricsRecord? _$v;

  StatusStructBuilder? _myStatus;
  StatusStructBuilder get myStatus =>
      _$this._myStatus ??= new StatusStructBuilder();
  set myStatus(StatusStructBuilder? myStatus) => _$this._myStatus = myStatus;

  BuildingsStructBuilder? _residencies;
  BuildingsStructBuilder get residencies =>
      _$this._residencies ??= new BuildingsStructBuilder();
  set residencies(BuildingsStructBuilder? residencies) =>
      _$this._residencies = residencies;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MetricsRecordBuilder() {
    MetricsRecord._initializeBuilder(this);
  }

  MetricsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _myStatus = $v.myStatus.toBuilder();
      _residencies = $v.residencies.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MetricsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MetricsRecord;
  }

  @override
  void update(void Function(MetricsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MetricsRecord build() => _build();

  _$MetricsRecord _build() {
    _$MetricsRecord _$result;
    try {
      _$result = _$v ??
          new _$MetricsRecord._(
              myStatus: myStatus.build(),
              residencies: residencies.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'myStatus';
        myStatus.build();
        _$failedField = 'residencies';
        residencies.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MetricsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
