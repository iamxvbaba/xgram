import 'package:event_bus/event_bus.dart';
class DrawEvent {
  final EventBus eventBus;
  const DrawEvent(this.eventBus);
}