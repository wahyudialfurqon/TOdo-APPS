import 'package:flutter/material.dart';
import 'package:todo/theme.dart';

class CreateNameScreens extends StatefulWidget {
  const CreateNameScreens({super.key});

  @override
  State<CreateNameScreens> createState() => _CreateNameScreensState();
}

class _CreateNameScreensState extends State<CreateNameScreens> {
  final TextEditingController _controller = TextEditingController();
  bool _isEmpty = true; //Mengecek Apakah Teks Kosong

  @override
  void initState(){
    super.initState();
    _controller.addListener((){
      setState((){
        _isEmpty = _controller.text.isEmpty;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgAllScreens,
      body: SafeArea( //Safe Area berfungsi agar UI tidak menutupi Status Bar
        child: SingleChildScrollView( //Ketika muncul keyboard maka column dapat di scroll
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Wellcome Back!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Let’s help you meet your tasks',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Colors.black
                    )
                  ),
                  const SizedBox(height: 50),
                  Image.asset(
                    'images/onboard2.png',
                    width: 171,
                    height: 170,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 310,
                    height: 40,
                    child: TextField(
                      controller: _controller,
                         onEditingComplete: (){
                          FocusScope.of(context).unfocus(); //Menutup Keyboard 
                          setState((){});
                        },
                        onSubmitted: (value){
                          FocusScope.of(context).unfocus(); //menutup Keyboard setelah selesai
                          setState((){});
                        },
                      decoration: InputDecoration(
                        labelText: _isEmpty ? 'Create Your Nickname!' : null,
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: const Color.fromARGB(255, 201, 201, 201), width: 1.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: const Color.fromARGB(255, 201, 201, 201), width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black54, width: 2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 310,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, '/home');
                      }, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.allButtton,
                        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )
                      ),
                      child: const Text(
                        'Lets Go!',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        )
                      ),
                    ),
                  )
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}