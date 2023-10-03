import 'package:flutter/material.dart';
import 'dart:async'; //solve the timer error

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500; //25min = 1500s
  int totalSeconds = twentyFiveMinutes;
  bool isRunning = false;
  int pomodoros = 0;

  ///late은 당장 초기화하지 않겠다는 것인데, 사용 직전에는 반드시 초기화를 하겠다는 의미도 있음.
  late Timer timer;
  void onTick(Timer timer) {
    if (totalSeconds > 0) {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    } else {
      setState(() {
        pomodoros = pomodoros + 1;
        totalSeconds = twentyFiveMinutes;
        isRunning = false;
      });

      ///timer.cancel을 해주어야 timer가 다시 작동하지 않고 다음 명령을 기다리면서 멈춤
      timer.cancel();
    }
  }

  void onStartPressed() {
    ///명시한 기간동안 주기적으로 지정한 함수를 실행하는 위젯
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed() {
    setState(() {
      totalSeconds = twentyFiveMinutes;
      pomodoros = 0;
      isRunning = false;
    });
    timer.cancel();
  }

  String secondsToMinutes(int seconds) {
    ///Duration은 초를 받아서 분을 리턴해줌
    ///duration은 00:25:00.000000 이런식으로 표시되므로 앞뒤를 잘라서 분:초만 보여주도록 삽질
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    //scaffold는 material design(google식 design)의 layout
    return Scaffold(
      //get background color from main
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //flexible is a relative ratio(flex:1) size. not absolute. no need 10px ..
          ///flexible은 상대적 사이즈이므로 사이즈가 아닌 비율(flex)을 입력한다.
          Flexible(
            flex: 2,
            child: Container(
              ///alignment는 container의 위치를 설정
              alignment: Alignment.bottomCenter,
              child: Text(
                secondsToMinutes(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Center(
              child: IconButton(
                iconSize: 120,
                color: Theme.of(context).cardColor,

                ///처음에 isRunning이 false이기 때문에 onStartPressed 실행
                ///onStartpressed가 실행되면 isRunning이 true로 되기 때문에 pause icon으로 바뀜
                ///다시 버튼을 누르면 isRunning이 true였기 때문에 onPausePressed가 실행
                onPressed: isRunning ? onPausePressed : onStartPressed,
                icon: Icon(
                  isRunning
                      ? Icons.pause_circle_outline
                      : Icons.play_circle_outlined,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Row(
              children: [
                //row를 화면 끝까지 펼치게 하는 widget
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,

                      ///모서리 둥글게 보정
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '$pomodoros',
                          style: TextStyle(
                              fontSize: 60,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color,
                              fontWeight: FontWeight.w600),
                        ),
                        IconButton(
                            iconSize: 60,
                            color: Theme.of(context).colorScheme.background,
                            onPressed: onResetPressed,
                            icon: const Icon(Icons.restore_outlined)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
