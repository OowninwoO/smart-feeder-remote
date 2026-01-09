enum FeedControlAction {
  feedButton('feed_button'),
  ultrasonic('ultrasonic'),
  intervalTimer('interval_timer');

  const FeedControlAction(this.value);

  final String value;
}
