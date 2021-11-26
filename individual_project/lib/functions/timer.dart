import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerCountUp {
   static int? timer;
   static  StopWatchTimer stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countUp,
       onChangeRawSecond: (value) {
         print('onChangeRawSecond $value');
         timer=value;
       }
   );

  static void startTimer(){
    stopWatchTimer.onExecute.add(StopWatchExecute.start);

  }
 static  void stopTimer(){
    stopWatchTimer.onExecute.add(StopWatchExecute.stop);
    stopWatchTimer.onExecute.add(StopWatchExecute.reset);
 }

 static int? getTimerTime(){
    return timer;
 }

        }


class TimerCountDown{
  static StopWatchTimer stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    onChangeRawSecond: (value){
      print(value);
    }
  );

  static void startTimer(DateTime time){

  }

}
