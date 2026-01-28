enum ActivityState {
  idle('대기'),
  feeding('급식 중'),
  unknown('-');

  const ActivityState(this.label);

  final String label;

  static ActivityState parse(String? v) {
    switch (v) {
      case 'idle':
        return ActivityState.idle;
      case 'feeding':
        return ActivityState.feeding;
      default:
        return ActivityState.unknown;
    }
  }
}
