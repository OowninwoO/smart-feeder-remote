// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mqtt_log_page_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MqttLogPageProvider)
const mqttLogPageProviderProvider = MqttLogPageProviderProvider._();

final class MqttLogPageProviderProvider
    extends $NotifierProvider<MqttLogPageProvider, MqttLogPage?> {
  const MqttLogPageProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mqttLogPageProviderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mqttLogPageProviderHash();

  @$internal
  @override
  MqttLogPageProvider create() => MqttLogPageProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MqttLogPage? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MqttLogPage?>(value),
    );
  }
}

String _$mqttLogPageProviderHash() =>
    r'fc867bcf02d203b6c12b449ff66dac6352b25d83';

abstract class _$MqttLogPageProvider extends $Notifier<MqttLogPage?> {
  MqttLogPage? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<MqttLogPage?, MqttLogPage?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MqttLogPage?, MqttLogPage?>,
              MqttLogPage?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
