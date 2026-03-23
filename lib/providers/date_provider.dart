import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateNotifier extends Notifier<DateTime>{
  @override
  DateTime build(){
    return DateTime.now();
  }

  void updateDate(DateTime newDate){
    state = newDate;
  }
}
final dateProvider = NotifierProvider<DateNotifier, DateTime>(DateNotifier.new);