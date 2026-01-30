// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mqtt_log_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MqttLogPage {

 DateTime? get cursorAt; String? get cursorId; bool get hasMore; List<MqttLog> get items;
/// Create a copy of MqttLogPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MqttLogPageCopyWith<MqttLogPage> get copyWith => _$MqttLogPageCopyWithImpl<MqttLogPage>(this as MqttLogPage, _$identity);

  /// Serializes this MqttLogPage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MqttLogPage&&(identical(other.cursorAt, cursorAt) || other.cursorAt == cursorAt)&&(identical(other.cursorId, cursorId) || other.cursorId == cursorId)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cursorAt,cursorId,hasMore,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'MqttLogPage(cursorAt: $cursorAt, cursorId: $cursorId, hasMore: $hasMore, items: $items)';
}


}

/// @nodoc
abstract mixin class $MqttLogPageCopyWith<$Res>  {
  factory $MqttLogPageCopyWith(MqttLogPage value, $Res Function(MqttLogPage) _then) = _$MqttLogPageCopyWithImpl;
@useResult
$Res call({
 DateTime? cursorAt, String? cursorId, bool hasMore, List<MqttLog> items
});




}
/// @nodoc
class _$MqttLogPageCopyWithImpl<$Res>
    implements $MqttLogPageCopyWith<$Res> {
  _$MqttLogPageCopyWithImpl(this._self, this._then);

  final MqttLogPage _self;
  final $Res Function(MqttLogPage) _then;

/// Create a copy of MqttLogPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cursorAt = freezed,Object? cursorId = freezed,Object? hasMore = null,Object? items = null,}) {
  return _then(_self.copyWith(
cursorAt: freezed == cursorAt ? _self.cursorAt : cursorAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cursorId: freezed == cursorId ? _self.cursorId : cursorId // ignore: cast_nullable_to_non_nullable
as String?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<MqttLog>,
  ));
}

}


/// Adds pattern-matching-related methods to [MqttLogPage].
extension MqttLogPagePatterns on MqttLogPage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MqttLogPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MqttLogPage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MqttLogPage value)  $default,){
final _that = this;
switch (_that) {
case _MqttLogPage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MqttLogPage value)?  $default,){
final _that = this;
switch (_that) {
case _MqttLogPage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? cursorAt,  String? cursorId,  bool hasMore,  List<MqttLog> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MqttLogPage() when $default != null:
return $default(_that.cursorAt,_that.cursorId,_that.hasMore,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? cursorAt,  String? cursorId,  bool hasMore,  List<MqttLog> items)  $default,) {final _that = this;
switch (_that) {
case _MqttLogPage():
return $default(_that.cursorAt,_that.cursorId,_that.hasMore,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? cursorAt,  String? cursorId,  bool hasMore,  List<MqttLog> items)?  $default,) {final _that = this;
switch (_that) {
case _MqttLogPage() when $default != null:
return $default(_that.cursorAt,_that.cursorId,_that.hasMore,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MqttLogPage implements MqttLogPage {
  const _MqttLogPage({required this.cursorAt, required this.cursorId, required this.hasMore, required final  List<MqttLog> items}): _items = items;
  factory _MqttLogPage.fromJson(Map<String, dynamic> json) => _$MqttLogPageFromJson(json);

@override final  DateTime? cursorAt;
@override final  String? cursorId;
@override final  bool hasMore;
 final  List<MqttLog> _items;
@override List<MqttLog> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of MqttLogPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MqttLogPageCopyWith<_MqttLogPage> get copyWith => __$MqttLogPageCopyWithImpl<_MqttLogPage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MqttLogPageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MqttLogPage&&(identical(other.cursorAt, cursorAt) || other.cursorAt == cursorAt)&&(identical(other.cursorId, cursorId) || other.cursorId == cursorId)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cursorAt,cursorId,hasMore,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'MqttLogPage(cursorAt: $cursorAt, cursorId: $cursorId, hasMore: $hasMore, items: $items)';
}


}

/// @nodoc
abstract mixin class _$MqttLogPageCopyWith<$Res> implements $MqttLogPageCopyWith<$Res> {
  factory _$MqttLogPageCopyWith(_MqttLogPage value, $Res Function(_MqttLogPage) _then) = __$MqttLogPageCopyWithImpl;
@override @useResult
$Res call({
 DateTime? cursorAt, String? cursorId, bool hasMore, List<MqttLog> items
});




}
/// @nodoc
class __$MqttLogPageCopyWithImpl<$Res>
    implements _$MqttLogPageCopyWith<$Res> {
  __$MqttLogPageCopyWithImpl(this._self, this._then);

  final _MqttLogPage _self;
  final $Res Function(_MqttLogPage) _then;

/// Create a copy of MqttLogPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cursorAt = freezed,Object? cursorId = freezed,Object? hasMore = null,Object? items = null,}) {
  return _then(_MqttLogPage(
cursorAt: freezed == cursorAt ? _self.cursorAt : cursorAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cursorId: freezed == cursorId ? _self.cursorId : cursorId // ignore: cast_nullable_to_non_nullable
as String?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<MqttLog>,
  ));
}


}

// dart format on
