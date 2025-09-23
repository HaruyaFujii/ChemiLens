// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HistoryService)
const historyServiceProvider = HistoryServiceProvider._();

final class HistoryServiceProvider
    extends $AsyncNotifierProvider<HistoryService, List<HistoryItem>> {
  const HistoryServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'historyServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$historyServiceHash();

  @$internal
  @override
  HistoryService create() => HistoryService();
}

String _$historyServiceHash() => r'990cc5e86dd0d0cd691cd2c6dc9b897de2f70c8b';

abstract class _$HistoryService extends $AsyncNotifier<List<HistoryItem>> {
  FutureOr<List<HistoryItem>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<HistoryItem>>, List<HistoryItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<HistoryItem>>, List<HistoryItem>>,
              AsyncValue<List<HistoryItem>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
