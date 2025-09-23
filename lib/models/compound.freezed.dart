// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compound.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Compound {

 String get cid;// PubChem CID
 String get name;// 化合物名
 String get formula;// 分子式
 List<String> get elements;// 含まれる元素記号
 String get description;
/// Create a copy of Compound
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompoundCopyWith<Compound> get copyWith => _$CompoundCopyWithImpl<Compound>(this as Compound, _$identity);

  /// Serializes this Compound to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Compound&&(identical(other.cid, cid) || other.cid == cid)&&(identical(other.name, name) || other.name == name)&&(identical(other.formula, formula) || other.formula == formula)&&const DeepCollectionEquality().equals(other.elements, elements)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cid,name,formula,const DeepCollectionEquality().hash(elements),description);

@override
String toString() {
  return 'Compound(cid: $cid, name: $name, formula: $formula, elements: $elements, description: $description)';
}


}

/// @nodoc
abstract mixin class $CompoundCopyWith<$Res>  {
  factory $CompoundCopyWith(Compound value, $Res Function(Compound) _then) = _$CompoundCopyWithImpl;
@useResult
$Res call({
 String cid, String name, String formula, List<String> elements, String description
});




}
/// @nodoc
class _$CompoundCopyWithImpl<$Res>
    implements $CompoundCopyWith<$Res> {
  _$CompoundCopyWithImpl(this._self, this._then);

  final Compound _self;
  final $Res Function(Compound) _then;

/// Create a copy of Compound
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cid = null,Object? name = null,Object? formula = null,Object? elements = null,Object? description = null,}) {
  return _then(_self.copyWith(
cid: null == cid ? _self.cid : cid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,formula: null == formula ? _self.formula : formula // ignore: cast_nullable_to_non_nullable
as String,elements: null == elements ? _self.elements : elements // ignore: cast_nullable_to_non_nullable
as List<String>,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Compound].
extension CompoundPatterns on Compound {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Compound value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Compound() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Compound value)  $default,){
final _that = this;
switch (_that) {
case _Compound():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Compound value)?  $default,){
final _that = this;
switch (_that) {
case _Compound() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String cid,  String name,  String formula,  List<String> elements,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Compound() when $default != null:
return $default(_that.cid,_that.name,_that.formula,_that.elements,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String cid,  String name,  String formula,  List<String> elements,  String description)  $default,) {final _that = this;
switch (_that) {
case _Compound():
return $default(_that.cid,_that.name,_that.formula,_that.elements,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String cid,  String name,  String formula,  List<String> elements,  String description)?  $default,) {final _that = this;
switch (_that) {
case _Compound() when $default != null:
return $default(_that.cid,_that.name,_that.formula,_that.elements,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Compound implements Compound {
  const _Compound({required this.cid, required this.name, required this.formula, required final  List<String> elements, required this.description}): _elements = elements;
  factory _Compound.fromJson(Map<String, dynamic> json) => _$CompoundFromJson(json);

@override final  String cid;
// PubChem CID
@override final  String name;
// 化合物名
@override final  String formula;
// 分子式
 final  List<String> _elements;
// 分子式
@override List<String> get elements {
  if (_elements is EqualUnmodifiableListView) return _elements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_elements);
}

// 含まれる元素記号
@override final  String description;

/// Create a copy of Compound
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompoundCopyWith<_Compound> get copyWith => __$CompoundCopyWithImpl<_Compound>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompoundToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Compound&&(identical(other.cid, cid) || other.cid == cid)&&(identical(other.name, name) || other.name == name)&&(identical(other.formula, formula) || other.formula == formula)&&const DeepCollectionEquality().equals(other._elements, _elements)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cid,name,formula,const DeepCollectionEquality().hash(_elements),description);

@override
String toString() {
  return 'Compound(cid: $cid, name: $name, formula: $formula, elements: $elements, description: $description)';
}


}

/// @nodoc
abstract mixin class _$CompoundCopyWith<$Res> implements $CompoundCopyWith<$Res> {
  factory _$CompoundCopyWith(_Compound value, $Res Function(_Compound) _then) = __$CompoundCopyWithImpl;
@override @useResult
$Res call({
 String cid, String name, String formula, List<String> elements, String description
});




}
/// @nodoc
class __$CompoundCopyWithImpl<$Res>
    implements _$CompoundCopyWith<$Res> {
  __$CompoundCopyWithImpl(this._self, this._then);

  final _Compound _self;
  final $Res Function(_Compound) _then;

/// Create a copy of Compound
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cid = null,Object? name = null,Object? formula = null,Object? elements = null,Object? description = null,}) {
  return _then(_Compound(
cid: null == cid ? _self.cid : cid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,formula: null == formula ? _self.formula : formula // ignore: cast_nullable_to_non_nullable
as String,elements: null == elements ? _self._elements : elements // ignore: cast_nullable_to_non_nullable
as List<String>,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
