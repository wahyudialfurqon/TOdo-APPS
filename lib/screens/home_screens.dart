import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/models/task_models.dart';
import 'package:todo/theme.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  String _nickName = 'User123';
  String _curentTime = '';
  String _greeting = '';

  Timer? _timer;
  
  @override
  void initState(){
    super.initState();
    _updateTime();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) => _updateTime());

    super.initState();
    _loadNickName();
  }

  void _updateTime(){
    final now = DateTime.now();
    setState((){
      _curentTime = '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';
      _greeting = _getGreeting(now.hour);
    });
  }

  String _getGreeting(int hour){
      if (hour < 12) {
      return "Good Morning";
    } else if (hour < 18) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  Future<void> _loadNickName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedNickName = prefs.getString('User123');

    if(savedNickName != null && savedNickName.isNotEmpty){
      setState((){
        _nickName = savedNickName;
      });
    }
  }

  @override
  void dispose(){
    _timer?.cancel();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: AppColors.allButtton,
      toolbarHeight: 229,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipOval(
            child: Image.asset(
              'images/Profile.jpg',
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 30),
          Text(
            _nickName,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )
          )
        ],
      ),
      centerTitle: true,
      ),
      backgroundColor: AppColors.bgAllScreens,
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Text(
                    _greeting,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                _curentTime,
                style: TextStyle(
                  fontFamily: 'DS-DIGI',
                  fontSize: 60,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Tasks List',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: buildCard(context, taskList[index].title, taskList[index].date),
                    );
                  }
                )
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
               onTap: () {
                Navigator.pushNamed(context, '/createTask');
              },
              child: Image.asset(
                'icons/Add.png',
                width: 50,
                height: 50,
              )
            )
            )
        ],
      ),
    );
  }
}
Widget buildCard(BuildContext context, String title, String date){
return  SizedBox(
    child: GestureDetector(
     onTap: () {
        Navigator.pushNamed(context, '/detailTask');
      },
      child: Card(
        color: AppColors.bgSplashScreen,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                    const SizedBox(height: 1),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 12,
                      )
                    )
                  ],
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: ClipRRect(
                child: Image.asset(
                  'images/Profile.jpg',
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover
                )
              ),
            ),
          ],
        )
      ),
    ),
  );
}