// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encyclopedia_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EncyclopediaService)
const encyclopediaServiceProvider = EncyclopediaServiceProvider._();

final class EncyclopediaServiceProvider
    extends $AsyncNotifierProvider<EncyclopediaService, List<Element>> {
  const EncyclopediaServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'encyclopediaServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$encyclopediaServiceHash();

  @$internal
  @override
  EncyclopediaService create() => EncyclopediaService();
}

String _$encyclopediaServiceHash() =>
    r'bb3e00fd71388b1a4ffb202cbe09c7328c2cddb7';

abstract class _$EncyclopediaService extends $AsyncNotifier<List<Element>> {
  FutureOr<List<Element>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Element>>, List<Element>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Element>>, List<Element>>,
              AsyncValue<List<Element>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
