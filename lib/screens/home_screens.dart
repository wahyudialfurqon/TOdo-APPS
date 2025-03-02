import 'package:flutter/material.dart';
import 'package:todo/models/task_models.dart';
import 'package:todo/theme.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  
  @override
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
            'YourNickname!',
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
                    'Good Afternoon',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                '19:30',
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
                      child: buildCard(taskList[index].title, taskList[index].date),
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
                Navigator.pushNamed(context, '/detailTask');
              },
              child: Opacity(
              opacity: 1.0,
              child: Image.asset(
                'icons/Add.png',
                width: 50,
                height: 50,
              )
            )
            )
          )
        ],
      ),
    );
  }
}
Widget buildCard(String title, String date){
return  SizedBox(
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
  );
}