import 'package:event_bus/event_bus.dart';
class MessageEvent {
  final EventBus eventBus;
  const MessageEvent(this.eventBus);
}