// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mqtt_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MqttLog {

 String get id; DateTime get receivedAt; String get deviceId; String get topic; String? get payload;
/// Create a copy of MqttLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MqttLogCopyWith<MqttLog> get copyWith => _$MqttLogCopyWithImpl<MqttLog>(this as MqttLog, _$identity);

  /// Serializes this MqttLog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MqttLog&&(identical(other.id, id) || other.id == id)&&(identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.payload, payload) || other.payload == payload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,receivedAt,deviceId,topic,payload);

@override
String toString() {
  return 'MqttLog(id: $id, receivedAt: $receivedAt, deviceId: $deviceId, topic: $topic, payload: $payload)';
}


}

/// @nodoc
abstract mixin class $MqttLogCopyWith<$Res>  {
  factory $MqttLogCopyWith(MqttLog value, $Res Function(MqttLog) _then) = _$MqttLogCopyWithImpl;
@useResult
$Res call({
 String id, DateTime receivedAt, String deviceId, String topic, String? payload
});




}
/// @nodoc
class _$MqttLogCopyWithImpl<$Res>
    implements $MqttLogCopyWith<$Res> {
  _$MqttLogCopyWithImpl(this._self, this._then);

  final MqttLog _self;
  final $Res Function(MqttLog) _then;

/// Create a copy of MqttLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? receivedAt = null,Object? deviceId = null,Object? topic = null,Object? payload = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,receivedAt: null == receivedAt ? _self.receivedAt : receivedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,payload: freezed == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MqttLog].
extension MqttLogPatterns on MqttLog {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MqttLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MqttLog() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MqttLog value)  $default,){
final _that = this;
switch (_that) {
case _MqttLog():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MqttLog value)?  $default,){
final _that = this;
switch (_that) {
case _MqttLog() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime receivedAt,  String deviceId,  String topic,  String? payload)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MqttLog() when $default != null:
return $default(_that.id,_that.receivedAt,_that.deviceId,_that.topic,_that.payload);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime receivedAt,  String deviceId,  String topic,  String? payload)  $default,) {final _that = this;
switch (_that) {
case _MqttLog():
return $default(_that.id,_that.receivedAt,_that.deviceId,_that.topic,_that.payload);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime receivedAt,  String deviceId,  String topic,  String? payload)?  $default,) {final _that = this;
switch (_that) {
case _MqttLog() when $default != null:
return $default(_that.id,_that.receivedAt,_that.deviceId,_that.topic,_that.payload);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MqttLog implements MqttLog {
  const _MqttLog({required this.id, required this.receivedAt, required this.deviceId, required this.topic, required this.payload});
  factory _MqttLog.fromJson(Map<String, dynamic> json) => _$MqttLogFromJson(json);

@override final  String id;
@override final  DateTime receivedAt;
@override final  String deviceId;
@override final  String topic;
@override final  String? payload;

/// Create a copy of MqttLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MqttLogCopyWith<_MqttLog> get copyWith => __$MqttLogCopyWithImpl<_MqttLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MqttLogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MqttLog&&(identical(other.id, id) || other.id == id)&&(identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.payload, payload) || other.payload == payload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,receivedAt,deviceId,topic,payload);

@override
String toString() {
  return 'MqttLog(id: $id, receivedAt: $receivedAt, deviceId: $deviceId, topic: $topic, payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$MqttLogCopyWith<$Res> implements $MqttLogCopyWith<$Res> {
  factory _$MqttLogCopyWith(_MqttLog value, $Res Function(_MqttLog) _then) = __$MqttLogCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime receivedAt, String deviceId, String topic, String? payload
});




}
/// @nodoc
class __$MqttLogCopyWithImpl<$Res>
    implements _$MqttLogCopyWith<$Res> {
  __$MqttLogCopyWithImpl(this._self, this._then);

  final _MqttLog _self;
  final $Res Function(_MqttLog) _then;

/// Create a copy of MqttLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? receivedAt = null,Object? deviceId = null,Object? topic = null,Object? payload = freezed,}) {
  return _then(_MqttLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,receivedAt: null == receivedAt ? _self.receivedAt : receivedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,payload: freezed == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
