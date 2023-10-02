import 'package:flutter/material.dart';
import 'dart:async'; //solve the timer error

int TOTAL_TIME = 10; //1500s = 25min

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSeconds = TOTAL_TIME;
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
        totalSeconds = TOTAL_TIME;
        isRunning = false;
      });
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
            flex: 1,
            child: Container(
              ///alignment는 container의 위치를 설정
              alignment: Alignment.bottomCenter,
              child: Text(
                '$totalSeconds',
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
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
            flex: 1,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
