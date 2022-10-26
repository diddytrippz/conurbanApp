// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StatusStruct> _$statusStructSerializer =
    new _$StatusStructSerializer();

class _$StatusStructSerializer implements StructuredSerializer<StatusStruct> {
  @override
  final Iterable<Type> types = const [StatusStruct, _$StatusStruct];
  @override
  final String wireName = 'StatusStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, StatusStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.submitted;
    if (value != null) {
      result
        ..add('submitted')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pending;
    if (value != null) {
      result
        ..add('pending')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.completed;
    if (value != null) {
      result
        ..add('completed')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  StatusStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StatusStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'submitted':
          result.submitted = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'pending':
          result.pending = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'completed':
          result.completed = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$StatusStruct extends StatusStruct {
  @override
  final int? submitted;
  @override
  final int? pending;
  @override
  final int? completed;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$StatusStruct([void Function(StatusStructBuilder)? updates]) =>
      (new StatusStructBuilder()..update(updates))._build();

  _$StatusStruct._(
      {this.submitted,
      this.pending,
      this.completed,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'StatusStruct', 'firestoreUtilData');
  }

  @override
  StatusStruct rebuild(void Function(StatusStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StatusStructBuilder toBuilder() => new StatusStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StatusStruct &&
        submitted == other.submitted &&
        pending == other.pending &&
        completed == other.completed &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, submitted.hashCode), pending.hashCode),
            completed.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StatusStruct')
          ..add('submitted', submitted)
          ..add('pending', pending)
          ..add('completed', completed)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class StatusStructBuilder
    implements Builder<StatusStruct, StatusStructBuilder> {
  _$StatusStruct? _$v;

  int? _submitted;
  int? get submitted => _$this._submitted;
  set submitted(int? submitted) => _$this._submitted = submitted;

  int? _pending;
  int? get pending => _$this._pending;
  set pending(int? pending) => _$this._pending = pending;

  int? _completed;
  int? get completed => _$this._completed;
  set completed(int? completed) => _$this._completed = completed;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  StatusStructBuilder() {
    StatusStruct._initializeBuilder(this);
  }

  StatusStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _submitted = $v.submitted;
      _pending = $v.pending;
      _completed = $v.completed;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StatusStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StatusStruct;
  }

  @override
  void update(void Function(StatusStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StatusStruct build() => _build();

  _$StatusStruct _build() {
    final _$result = _$v ??
        new _$StatusStruct._(
            submitted: submitted,
            pending: pending,
            completed: completed,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'StatusStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
