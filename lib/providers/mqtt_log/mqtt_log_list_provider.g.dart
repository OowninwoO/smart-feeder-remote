// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mqtt_log_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MqttLogListProvider)
const mqttLogListProviderProvider = MqttLogListProviderProvider._();

final class MqttLogListProviderProvider
    extends $NotifierProvider<MqttLogListProvider, List<MqttLog>> {
  const MqttLogListProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mqttLogListProviderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mqttLogListProviderHash();

  @$internal
  @override
  MqttLogListProvider create() => MqttLogListProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<MqttLog> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<MqttLog>>(value),
    );
  }
}

String _$mqttLogListProviderHash() =>
    r'c998fbc79567e4e31ed1f7c5fbf82425f91e093c';

abstract class _$MqttLogListProvider extends $Notifier<List<MqttLog>> {
  List<MqttLog> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<MqttLog>, List<MqttLog>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<MqttLog>, List<MqttLog>>,
              List<MqttLog>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
