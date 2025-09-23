// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'element.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Element {

 String get symbol;// 元素記号（H, C, O等）
 String get name;// 元素名（水素、炭素、酸素等）
 int get atomicNumber;// 原子番号
 String? get iconUrl;// アイコン画像URL
 bool get discovered;
/// Create a copy of Element
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElementCopyWith<Element> get copyWith => _$ElementCopyWithImpl<Element>(this as Element, _$identity);

  /// Serializes this Element to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Element&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.atomicNumber, atomicNumber) || other.atomicNumber == atomicNumber)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.discovered, discovered) || other.discovered == discovered));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,name,atomicNumber,iconUrl,discovered);

@override
String toString() {
  return 'Element(symbol: $symbol, name: $name, atomicNumber: $atomicNumber, iconUrl: $iconUrl, discovered: $discovered)';
}


}

/// @nodoc
abstract mixin class $ElementCopyWith<$Res>  {
  factory $ElementCopyWith(Element value, $Res Function(Element) _then) = _$ElementCopyWithImpl;
@useResult
$Res call({
 String symbol, String name, int atomicNumber, String? iconUrl, bool discovered
});




}
/// @nodoc
class _$ElementCopyWithImpl<$Res>
    implements $ElementCopyWith<$Res> {
  _$ElementCopyWithImpl(this._self, this._then);

  final Element _self;
  final $Res Function(Element) _then;

/// Create a copy of Element
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? name = null,Object? atomicNumber = null,Object? iconUrl = freezed,Object? discovered = null,}) {
  return _then(_self.copyWith(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,atomicNumber: null == atomicNumber ? _self.atomicNumber : atomicNumber // ignore: cast_nullable_to_non_nullable
as int,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,discovered: null == discovered ? _self.discovered : discovered // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Element].
extension ElementPatterns on Element {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Element value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Element() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Element value)  $default,){
final _that = this;
switch (_that) {
case _Element():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Element value)?  $default,){
final _that = this;
switch (_that) {
case _Element() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol,  String name,  int atomicNumber,  String? iconUrl,  bool discovered)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Element() when $default != null:
return $default(_that.symbol,_that.name,_that.atomicNumber,_that.iconUrl,_that.discovered);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol,  String name,  int atomicNumber,  String? iconUrl,  bool discovered)  $default,) {final _that = this;
switch (_that) {
case _Element():
return $default(_that.symbol,_that.name,_that.atomicNumber,_that.iconUrl,_that.discovered);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol,  String name,  int atomicNumber,  String? iconUrl,  bool discovered)?  $default,) {final _that = this;
switch (_that) {
case _Element() when $default != null:
return $default(_that.symbol,_that.name,_that.atomicNumber,_that.iconUrl,_that.discovered);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Element implements Element {
  const _Element({required this.symbol, required this.name, required this.atomicNumber, this.iconUrl, this.discovered = false});
  factory _Element.fromJson(Map<String, dynamic> json) => _$ElementFromJson(json);

@override final  String symbol;
// 元素記号（H, C, O等）
@override final  String name;
// 元素名（水素、炭素、酸素等）
@override final  int atomicNumber;
// 原子番号
@override final  String? iconUrl;
// アイコン画像URL
@override@JsonKey() final  bool discovered;

/// Create a copy of Element
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ElementCopyWith<_Element> get copyWith => __$ElementCopyWithImpl<_Element>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ElementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Element&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.atomicNumber, atomicNumber) || other.atomicNumber == atomicNumber)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.discovered, discovered) || other.discovered == discovered));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,name,atomicNumber,iconUrl,discovered);

@override
String toString() {
  return 'Element(symbol: $symbol, name: $name, atomicNumber: $atomicNumber, iconUrl: $iconUrl, discovered: $discovered)';
}


}

/// @nodoc
abstract mixin class _$ElementCopyWith<$Res> implements $ElementCopyWith<$Res> {
  factory _$ElementCopyWith(_Element value, $Res Function(_Element) _then) = __$ElementCopyWithImpl;
@override @useResult
$Res call({
 String symbol, String name, int atomicNumber, String? iconUrl, bool discovered
});




}
/// @nodoc
class __$ElementCopyWithImpl<$Res>
    implements _$ElementCopyWith<$Res> {
  __$ElementCopyWithImpl(this._self, this._then);

  final _Element _self;
  final $Res Function(_Element) _then;

/// Create a copy of Element
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? name = null,Object? atomicNumber = null,Object? iconUrl = freezed,Object? discovered = null,}) {
  return _then(_Element(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,atomicNumber: null == atomicNumber ? _self.atomicNumber : atomicNumber // ignore: cast_nullable_to_non_nullable
as int,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,discovered: null == discovered ? _self.discovered : discovered // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$UserElementProgress {

 String get userId;// ユーザーID（Firebase Auth UID）
 String get elementSymbol;// 元素記号
 bool get isDiscovered;// 発見済みフラグ
 DateTime? get discoveredAt;// 発見日時
 int get viewCount;
/// Create a copy of UserElementProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserElementProgressCopyWith<UserElementProgress> get copyWith => _$UserElementProgressCopyWithImpl<UserElementProgress>(this as UserElementProgress, _$identity);

  /// Serializes this UserElementProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserElementProgress&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.elementSymbol, elementSymbol) || other.elementSymbol == elementSymbol)&&(identical(other.isDiscovered, isDiscovered) || other.isDiscovered == isDiscovered)&&(identical(other.discoveredAt, discoveredAt) || other.discoveredAt == discoveredAt)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,elementSymbol,isDiscovered,discoveredAt,viewCount);

@override
String toString() {
  return 'UserElementProgress(userId: $userId, elementSymbol: $elementSymbol, isDiscovered: $isDiscovered, discoveredAt: $discoveredAt, viewCount: $viewCount)';
}


}

/// @nodoc
abstract mixin class $UserElementProgressCopyWith<$Res>  {
  factory $UserElementProgressCopyWith(UserElementProgress value, $Res Function(UserElementProgress) _then) = _$UserElementProgressCopyWithImpl;
@useResult
$Res call({
 String userId, String elementSymbol, bool isDiscovered, DateTime? discoveredAt, int viewCount
});




}
/// @nodoc
class _$UserElementProgressCopyWithImpl<$Res>
    implements $UserElementProgressCopyWith<$Res> {
  _$UserElementProgressCopyWithImpl(this._self, this._then);

  final UserElementProgress _self;
  final $Res Function(UserElementProgress) _then;

/// Create a copy of UserElementProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? elementSymbol = null,Object? isDiscovered = null,Object? discoveredAt = freezed,Object? viewCount = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,elementSymbol: null == elementSymbol ? _self.elementSymbol : elementSymbol // ignore: cast_nullable_to_non_nullable
as String,isDiscovered: null == isDiscovered ? _self.isDiscovered : isDiscovered // ignore: cast_nullable_to_non_nullable
as bool,discoveredAt: freezed == discoveredAt ? _self.discoveredAt : discoveredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserElementProgress].
extension UserElementProgressPatterns on UserElementProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserElementProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserElementProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserElementProgress value)  $default,){
final _that = this;
switch (_that) {
case _UserElementProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserElementProgress value)?  $default,){
final _that = this;
switch (_that) {
case _UserElementProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String elementSymbol,  bool isDiscovered,  DateTime? discoveredAt,  int viewCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserElementProgress() when $default != null:
return $default(_that.userId,_that.elementSymbol,_that.isDiscovered,_that.discoveredAt,_that.viewCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String elementSymbol,  bool isDiscovered,  DateTime? discoveredAt,  int viewCount)  $default,) {final _that = this;
switch (_that) {
case _UserElementProgress():
return $default(_that.userId,_that.elementSymbol,_that.isDiscovered,_that.discoveredAt,_that.viewCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String elementSymbol,  bool isDiscovered,  DateTime? discoveredAt,  int viewCount)?  $default,) {final _that = this;
switch (_that) {
case _UserElementProgress() when $default != null:
return $default(_that.userId,_that.elementSymbol,_that.isDiscovered,_that.discoveredAt,_that.viewCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserElementProgress implements UserElementProgress {
  const _UserElementProgress({required this.userId, required this.elementSymbol, required this.isDiscovered, this.discoveredAt, this.viewCount = 0});
  factory _UserElementProgress.fromJson(Map<String, dynamic> json) => _$UserElementProgressFromJson(json);

@override final  String userId;
// ユーザーID（Firebase Auth UID）
@override final  String elementSymbol;
// 元素記号
@override final  bool isDiscovered;
// 発見済みフラグ
@override final  DateTime? discoveredAt;
// 発見日時
@override@JsonKey() final  int viewCount;

/// Create a copy of UserElementProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserElementProgressCopyWith<_UserElementProgress> get copyWith => __$UserElementProgressCopyWithImpl<_UserElementProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserElementProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserElementProgress&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.elementSymbol, elementSymbol) || other.elementSymbol == elementSymbol)&&(identical(other.isDiscovered, isDiscovered) || other.isDiscovered == isDiscovered)&&(identical(other.discoveredAt, discoveredAt) || other.discoveredAt == discoveredAt)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,elementSymbol,isDiscovered,discoveredAt,viewCount);

@override
String toString() {
  return 'UserElementProgress(userId: $userId, elementSymbol: $elementSymbol, isDiscovered: $isDiscovered, discoveredAt: $discoveredAt, viewCount: $viewCount)';
}


}

/// @nodoc
abstract mixin class _$UserElementProgressCopyWith<$Res> implements $UserElementProgressCopyWith<$Res> {
  factory _$UserElementProgressCopyWith(_UserElementProgress value, $Res Function(_UserElementProgress) _then) = __$UserElementProgressCopyWithImpl;
@override @useResult
$Res call({
 String userId, String elementSymbol, bool isDiscovered, DateTime? discoveredAt, int viewCount
});




}
/// @nodoc
class __$UserElementProgressCopyWithImpl<$Res>
    implements _$UserElementProgressCopyWith<$Res> {
  __$UserElementProgressCopyWithImpl(this._self, this._then);

  final _UserElementProgress _self;
  final $Res Function(_UserElementProgress) _then;

/// Create a copy of UserElementProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? elementSymbol = null,Object? isDiscovered = null,Object? discoveredAt = freezed,Object? viewCount = null,}) {
  return _then(_UserElementProgress(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,elementSymbol: null == elementSymbol ? _self.elementSymbol : elementSymbol // ignore: cast_nullable_to_non_nullable
as String,isDiscovered: null == isDiscovered ? _self.isDiscovered : isDiscovered // ignore: cast_nullable_to_non_nullable
as bool,discoveredAt: freezed == discoveredAt ? _self.discoveredAt : discoveredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
