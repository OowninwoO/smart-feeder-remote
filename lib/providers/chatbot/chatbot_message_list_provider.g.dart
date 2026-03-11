// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatbot_message_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChatbotMessageListProvider)
const chatbotMessageListProviderProvider =
    ChatbotMessageListProviderProvider._();

final class ChatbotMessageListProviderProvider
    extends $NotifierProvider<ChatbotMessageListProvider, List<ChatMessage>> {
  const ChatbotMessageListProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatbotMessageListProviderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatbotMessageListProviderHash();

  @$internal
  @override
  ChatbotMessageListProvider create() => ChatbotMessageListProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ChatMessage> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ChatMessage>>(value),
    );
  }
}

String _$chatbotMessageListProviderHash() =>
    r'299cf7dd87301b1521182519be1ad207e0023a71';

abstract class _$ChatbotMessageListProvider
    extends $Notifier<List<ChatMessage>> {
  List<ChatMessage> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<ChatMessage>, List<ChatMessage>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<ChatMessage>, List<ChatMessage>>,
              List<ChatMessage>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
