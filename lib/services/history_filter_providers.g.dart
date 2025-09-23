// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_filter_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HistoryFilter)
const historyFilterProvider = HistoryFilterProvider._();

final class HistoryFilterProvider
    extends $NotifierProvider<HistoryFilter, HistoryFilterType> {
  const HistoryFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'historyFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$historyFilterHash();

  @$internal
  @override
  HistoryFilter create() => HistoryFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HistoryFilterType value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HistoryFilterType>(value),
    );
  }
}

String _$historyFilterHash() => r'9f7cc76b8aaab90bc0fd92ae8153bbd7059bdec0';

abstract class _$HistoryFilter extends $Notifier<HistoryFilterType> {
  HistoryFilterType build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<HistoryFilterType, HistoryFilterType>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<HistoryFilterType, HistoryFilterType>,
              HistoryFilterType,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(filteredHistories)
const filteredHistoriesProvider = FilteredHistoriesProvider._();

final class FilteredHistoriesProvider
    extends
        $FunctionalProvider<
          List<HistoryItem>,
          List<HistoryItem>,
          List<HistoryItem>
        >
    with $Provider<List<HistoryItem>> {
  const FilteredHistoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredHistoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredHistoriesHash();

  @$internal
  @override
  $ProviderElement<List<HistoryItem>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<HistoryItem> create(Ref ref) {
    return filteredHistories(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<HistoryItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<HistoryItem>>(value),
    );
  }
}

String _$filteredHistoriesHash() => r'c5bb661d3c3ae1a7953faf78eb70cda8f1826f07';

@ProviderFor(groupedHistories)
const groupedHistoriesProvider = GroupedHistoriesProvider._();

final class GroupedHistoriesProvider
    extends
        $FunctionalProvider<
          Map<String, List<HistoryItem>>,
          Map<String, List<HistoryItem>>,
          Map<String, List<HistoryItem>>
        >
    with $Provider<Map<String, List<HistoryItem>>> {
  const GroupedHistoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'groupedHistoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$groupedHistoriesHash();

  @$internal
  @override
  $ProviderElement<Map<String, List<HistoryItem>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<String, List<HistoryItem>> create(Ref ref) {
    return groupedHistories(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, List<HistoryItem>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, List<HistoryItem>>>(
        value,
      ),
    );
  }
}

String _$groupedHistoriesHash() => r'5111df00b1578231dfd252f9a34799ed0b19f715';
