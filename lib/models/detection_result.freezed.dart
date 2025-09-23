// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detection_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DetectionResult {

 String get objectName; List<Compound> get molecules;
/// Create a copy of DetectionResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetectionResultCopyWith<DetectionResult> get copyWith => _$DetectionResultCopyWithImpl<DetectionResult>(this as DetectionResult, _$identity);

  /// Serializes this DetectionResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetectionResult&&(identical(other.objectName, objectName) || other.objectName == objectName)&&const DeepCollectionEquality().equals(other.molecules, molecules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,objectName,const DeepCollectionEquality().hash(molecules));

@override
String toString() {
  return 'DetectionResult(objectName: $objectName, molecules: $molecules)';
}


}

/// @nodoc
abstract mixin class $DetectionResultCopyWith<$Res>  {
  factory $DetectionResultCopyWith(DetectionResult value, $Res Function(DetectionResult) _then) = _$DetectionResultCopyWithImpl;
@useResult
$Res call({
 String objectName, List<Compound> molecules
});




}
/// @nodoc
class _$DetectionResultCopyWithImpl<$Res>
    implements $DetectionResultCopyWith<$Res> {
  _$DetectionResultCopyWithImpl(this._self, this._then);

  final DetectionResult _self;
  final $Res Function(DetectionResult) _then;

/// Create a copy of DetectionResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? objectName = null,Object? molecules = null,}) {
  return _then(_self.copyWith(
objectName: null == objectName ? _self.objectName : objectName // ignore: cast_nullable_to_non_nullable
as String,molecules: null == molecules ? _self.molecules : molecules // ignore: cast_nullable_to_non_nullable
as List<Compound>,
  ));
}

}


/// Adds pattern-matching-related methods to [DetectionResult].
extension DetectionResultPatterns on DetectionResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetectionResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetectionResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetectionResult value)  $default,){
final _that = this;
switch (_that) {
case _DetectionResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetectionResult value)?  $default,){
final _that = this;
switch (_that) {
case _DetectionResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String objectName,  List<Compound> molecules)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetectionResult() when $default != null:
return $default(_that.objectName,_that.molecules);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String objectName,  List<Compound> molecules)  $default,) {final _that = this;
switch (_that) {
case _DetectionResult():
return $default(_that.objectName,_that.molecules);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String objectName,  List<Compound> molecules)?  $default,) {final _that = this;
switch (_that) {
case _DetectionResult() when $default != null:
return $default(_that.objectName,_that.molecules);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetectionResult implements DetectionResult {
  const _DetectionResult({required this.objectName, required final  List<Compound> molecules}): _molecules = molecules;
  factory _DetectionResult.fromJson(Map<String, dynamic> json) => _$DetectionResultFromJson(json);

@override final  String objectName;
 final  List<Compound> _molecules;
@override List<Compound> get molecules {
  if (_molecules is EqualUnmodifiableListView) return _molecules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_molecules);
}


/// Create a copy of DetectionResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetectionResultCopyWith<_DetectionResult> get copyWith => __$DetectionResultCopyWithImpl<_DetectionResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetectionResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetectionResult&&(identical(other.objectName, objectName) || other.objectName == objectName)&&const DeepCollectionEquality().equals(other._molecules, _molecules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,objectName,const DeepCollectionEquality().hash(_molecules));

@override
String toString() {
  return 'DetectionResult(objectName: $objectName, molecules: $molecules)';
}


}

/// @nodoc
abstract mixin class _$DetectionResultCopyWith<$Res> implements $DetectionResultCopyWith<$Res> {
  factory _$DetectionResultCopyWith(_DetectionResult value, $Res Function(_DetectionResult) _then) = __$DetectionResultCopyWithImpl;
@override @useResult
$Res call({
 String objectName, List<Compound> molecules
});




}
/// @nodoc
class __$DetectionResultCopyWithImpl<$Res>
    implements _$DetectionResultCopyWith<$Res> {
  __$DetectionResultCopyWithImpl(this._self, this._then);

  final _DetectionResult _self;
  final $Res Function(_DetectionResult) _then;

/// Create a copy of DetectionResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? objectName = null,Object? molecules = null,}) {
  return _then(_DetectionResult(
objectName: null == objectName ? _self.objectName : objectName // ignore: cast_nullable_to_non_nullable
as String,molecules: null == molecules ? _self._molecules : molecules // ignore: cast_nullable_to_non_nullable
as List<Compound>,
  ));
}


}

// dart format on
