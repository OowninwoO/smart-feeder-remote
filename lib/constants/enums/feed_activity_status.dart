enum FeedActivityStatus {
  idle('대기'),
  feeding('급식 중'),
  unknown('-');

  const FeedActivityStatus(this.label);

  final String label;

  static FeedActivityStatus parse(String? v) {
    switch (v) {
      case 'idle':
        return FeedActivityStatus.idle;
      case 'feeding':
        return FeedActivityStatus.feeding;
      default:
        return FeedActivityStatus.unknown;
    }
  }
}
