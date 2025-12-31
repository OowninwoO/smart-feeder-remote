// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'primary_device_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PrimaryDeviceProvider)
const primaryDeviceProviderProvider = PrimaryDeviceProviderProvider._();

final class PrimaryDeviceProviderProvider
    extends $NotifierProvider<PrimaryDeviceProvider, Device?> {
  const PrimaryDeviceProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'primaryDeviceProviderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$primaryDeviceProviderHash();

  @$internal
  @override
  PrimaryDeviceProvider create() => PrimaryDeviceProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Device? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Device?>(value),
    );
  }
}

String _$primaryDeviceProviderHash() =>
    r'06cd03eb7c74f42cc537ae820f53f2697b0852a7';

abstract class _$PrimaryDeviceProvider extends $Notifier<Device?> {
  Device? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Device?, Device?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Device?, Device?>,
              Device?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
