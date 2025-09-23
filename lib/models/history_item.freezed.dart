// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryItem {

 String get id;// 履歴ID（Firestore document ID）
 String get userId;// ユーザーID（Firebase Auth UID）
 String get imageUrl;// Firebase Storageの画像URL
 String get objectName;// 推測された物体名称
 List<Compound> get compounds;// 検出された化合物（3-5個）
 List<String> get cids;// APIから返された全化合物のCID
 bool get isFavorite;// お気に入りフラグ
 DateTime get createdAt;
/// Create a copy of HistoryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryItemCopyWith<HistoryItem> get copyWith => _$HistoryItemCopyWithImpl<HistoryItem>(this as HistoryItem, _$identity);

  /// Serializes this HistoryItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.objectName, objectName) || other.objectName == objectName)&&const DeepCollectionEquality().equals(other.compounds, compounds)&&const DeepCollectionEquality().equals(other.cids, cids)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,imageUrl,objectName,const DeepCollectionEquality().hash(compounds),const DeepCollectionEquality().hash(cids),isFavorite,createdAt);

@override
String toString() {
  return 'HistoryItem(id: $id, userId: $userId, imageUrl: $imageUrl, objectName: $objectName, compounds: $compounds, cids: $cids, isFavorite: $isFavorite, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $HistoryItemCopyWith<$Res>  {
  factory $HistoryItemCopyWith(HistoryItem value, $Res Function(HistoryItem) _then) = _$HistoryItemCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String imageUrl, String objectName, List<Compound> compounds, List<String> cids, bool isFavorite, DateTime createdAt
});




}
/// @nodoc
class _$HistoryItemCopyWithImpl<$Res>
    implements $HistoryItemCopyWith<$Res> {
  _$HistoryItemCopyWithImpl(this._self, this._then);

  final HistoryItem _self;
  final $Res Function(HistoryItem) _then;

/// Create a copy of HistoryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? imageUrl = null,Object? objectName = null,Object? compounds = null,Object? cids = null,Object? isFavorite = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,objectName: null == objectName ? _self.objectName : objectName // ignore: cast_nullable_to_non_nullable
as String,compounds: null == compounds ? _self.compounds : compounds // ignore: cast_nullable_to_non_nullable
as List<Compound>,cids: null == cids ? _self.cids : cids // ignore: cast_nullable_to_non_nullable
as List<String>,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryItem].
extension HistoryItemPatterns on HistoryItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryItem value)  $default,){
final _that = this;
switch (_that) {
case _HistoryItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryItem value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String imageUrl,  String objectName,  List<Compound> compounds,  List<String> cids,  bool isFavorite,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryItem() when $default != null:
return $default(_that.id,_that.userId,_that.imageUrl,_that.objectName,_that.compounds,_that.cids,_that.isFavorite,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String imageUrl,  String objectName,  List<Compound> compounds,  List<String> cids,  bool isFavorite,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _HistoryItem():
return $default(_that.id,_that.userId,_that.imageUrl,_that.objectName,_that.compounds,_that.cids,_that.isFavorite,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String imageUrl,  String objectName,  List<Compound> compounds,  List<String> cids,  bool isFavorite,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _HistoryItem() when $default != null:
return $default(_that.id,_that.userId,_that.imageUrl,_that.objectName,_that.compounds,_that.cids,_that.isFavorite,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryItem implements HistoryItem {
  const _HistoryItem({required this.id, required this.userId, required this.imageUrl, required this.objectName, required final  List<Compound> compounds, required final  List<String> cids, this.isFavorite = false, required this.createdAt}): _compounds = compounds,_cids = cids;
  factory _HistoryItem.fromJson(Map<String, dynamic> json) => _$HistoryItemFromJson(json);

@override final  String id;
// 履歴ID（Firestore document ID）
@override final  String userId;
// ユーザーID（Firebase Auth UID）
@override final  String imageUrl;
// Firebase Storageの画像URL
@override final  String objectName;
// 推測された物体名称
 final  List<Compound> _compounds;
// 推測された物体名称
@override List<Compound> get compounds {
  if (_compounds is EqualUnmodifiableListView) return _compounds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_compounds);
}

// 検出された化合物（3-5個）
 final  List<String> _cids;
// 検出された化合物（3-5個）
@override List<String> get cids {
  if (_cids is EqualUnmodifiableListView) return _cids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cids);
}

// APIから返された全化合物のCID
@override@JsonKey() final  bool isFavorite;
// お気に入りフラグ
@override final  DateTime createdAt;

/// Create a copy of HistoryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryItemCopyWith<_HistoryItem> get copyWith => __$HistoryItemCopyWithImpl<_HistoryItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.objectName, objectName) || other.objectName == objectName)&&const DeepCollectionEquality().equals(other._compounds, _compounds)&&const DeepCollectionEquality().equals(other._cids, _cids)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,imageUrl,objectName,const DeepCollectionEquality().hash(_compounds),const DeepCollectionEquality().hash(_cids),isFavorite,createdAt);

@override
String toString() {
  return 'HistoryItem(id: $id, userId: $userId, imageUrl: $imageUrl, objectName: $objectName, compounds: $compounds, cids: $cids, isFavorite: $isFavorite, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$HistoryItemCopyWith<$Res> implements $HistoryItemCopyWith<$Res> {
  factory _$HistoryItemCopyWith(_HistoryItem value, $Res Function(_HistoryItem) _then) = __$HistoryItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String imageUrl, String objectName, List<Compound> compounds, List<String> cids, bool isFavorite, DateTime createdAt
});




}
/// @nodoc
class __$HistoryItemCopyWithImpl<$Res>
    implements _$HistoryItemCopyWith<$Res> {
  __$HistoryItemCopyWithImpl(this._self, this._then);

  final _HistoryItem _self;
  final $Res Function(_HistoryItem) _then;

/// Create a copy of HistoryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? imageUrl = null,Object? objectName = null,Object? compounds = null,Object? cids = null,Object? isFavorite = null,Object? createdAt = null,}) {
  return _then(_HistoryItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,objectName: null == objectName ? _self.objectName : objectName // ignore: cast_nullable_to_non_nullable
as String,compounds: null == compounds ? _self._compounds : compounds // ignore: cast_nullable_to_non_nullable
as List<Compound>,cids: null == cids ? _self._cids : cids // ignore: cast_nullable_to_non_nullable
as List<String>,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
