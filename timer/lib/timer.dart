import 'dart:async';
import './timermodel.dart';

class CountDownTimer {
    double _radius = 1;
    bool _isActive = true;
    Duration _time = Duration(seconds: 1);
    Duration _fullTime = Duration(seconds: 1);
    int work = 30;

    String returnTime(Duration t) {
        String minutes = (t.inMinutes<10) ? '0' : '' + t.inMinutes.toString();
        int numSeconds = t.inSeconds - (t.inMinutes * 60);
        String seconds = (numSeconds < 10) ? '0' : '' + numSeconds.toString();

        return minutes + ':' + seconds;
    }

    void startWork() {
        _radius = 1;
        _time = Duration(minutes: work, seconds: 0);
        _fullTime = Duration(minutes: work, seconds: 0);
    }

    Stream<TimerModel> stream() async* {
        yield* Stream.periodic(Duration(seconds: 1), (int a) {
            String time;
            if (this._isActive) {
                _time = _time - Duration(seconds: 1);
                _radius = _time.inSeconds / _fullTime.inSeconds;
                if (_time.inSeconds <= 0) {
                    _isActive = false;
                }
            }
            time = returnTime(_time);
            return TimerModel(time, _radius);
        });
    }
}