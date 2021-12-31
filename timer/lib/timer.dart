import 'dart:async';
import './timermodel.dart';
import 'package:intl/intl.dart';

class CountDownTimer {
    final NumberFormat formatter = NumberFormat('00');
    bool _isActive = false;
    Duration _time = const Duration(seconds: 0);
    Duration _fullTime = const Duration(seconds: 1);
    static const _work = 30;

    String returnTime(Duration t)
        => formatter.format(t.inMinutes)
            + ':'
            + formatter.format(t.inSeconds - (t.inMinutes * 60));

    void startWork({duration = _work}) {
        _time = Duration(minutes: duration, seconds: 1);
        _fullTime = Duration(minutes: duration, seconds: 0);
        _isActive = true;
    }

    void stopWork() => _isActive = false;

    void restartWork() => _isActive = (_time.inSeconds > 0);

    void shortBreak() => startWork(duration: 5);

    void longBreak() => startWork(duration: 20);

    Stream<TimerModel> stream() async* {
        yield* Stream.periodic(const Duration(seconds: 1), (int a) {
            if (_isActive) {
                _time = _time - const Duration(seconds: 1);
                if (_time.inSeconds <= 0) {
                    _isActive = false;
                }
            }

            String time = returnTime(_time);
            double radius = _time.inSeconds / _fullTime.inSeconds;
            return TimerModel(time, radius);
        });
    }
}