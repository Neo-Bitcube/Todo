import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeNotifier extends Notifier<TimeOfDay>{
  @override
  TimeOfDay build(){
    return TimeOfDay.now();
  }

  void updateTime(TimeOfDay newTime){
    state = newTime;
  }
}

final timeProvider = NotifierProvider<TimeNotifier, TimeOfDay>(TimeNotifier.new);