// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DeviceListProvider)
const deviceListProviderProvider = DeviceListProviderProvider._();

final class DeviceListProviderProvider
    extends $NotifierProvider<DeviceListProvider, List<Device>> {
  const DeviceListProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceListProviderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceListProviderHash();

  @$internal
  @override
  DeviceListProvider create() => DeviceListProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Device> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Device>>(value),
    );
  }
}

String _$deviceListProviderHash() =>
    r'ff58c2d05f5f2b031edc171c0ab29b01ae61ae7c';

abstract class _$DeviceListProvider extends $Notifier<List<Device>> {
  List<Device> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Device>, List<Device>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Device>, List<Device>>,
              List<Device>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
