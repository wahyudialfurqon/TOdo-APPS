import 'package:flutter/material.dart';
import 'package:todo/theme.dart';

class CreateScreens extends StatefulWidget {
  const CreateScreens({super.key});

  @override
  State<CreateScreens> createState() => _CreateScreensState();
}

class _CreateScreensState extends State<CreateScreens> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();
  bool _isEmpty = true; //Mengecek Apakah Teks Kosong


  @override
  void initState(){
    super.initState();
    _controllerTitle.addListener((){
      setState((){
        _isEmpty = _controllerTitle.text.isEmpty;
      });
    });
    _controllerDescription.addListener((){
      setState((){
        _isEmpty = _controllerDescription.text.isEmpty;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgAllScreens,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Column(
          children: [
            Text(
              'Create Task',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              )
            ),
          ],
        ),
      centerTitle: true,
      ),
      backgroundColor: AppColors.bgAllScreens,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 30),
                Image.asset(
                  'images/onboard2.png',
                  width: 171,
                  height: 170,
                ),
                const SizedBox(height: 50),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Title',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                  SizedBox(
                      width: 350,
                      height: 40,
                      child: TextField(
                        controller: _controllerTitle,
                           onEditingComplete: (){
                            FocusScope.of(context).unfocus(); //Menutup Keyboard 
                            setState((){});
                          },
                          onSubmitted: (value){
                            FocusScope.of(context).unfocus(); //menutup Keyboard setelah selesai
                            setState((){});
                          },
                        decoration: InputDecoration(
                          labelText: _isEmpty ? 'input your title here!' : null,
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
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 350,
                      height: 100,
                      child: TextField(
                        controller: _controllerDescription,
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                          onEditingComplete: (){
                            FocusScope.of(context).unfocus(); //Menutup Keyboard 
                            setState((){});
                          },
                          onSubmitted: (value){
                            FocusScope.of(context).unfocus(); //menutup Keyboard setelah selesai
                            setState((){});
                          },
                        decoration: InputDecoration(
                          labelText: _isEmpty ? 'Description your Task' : null,
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    const SizedBox(height: 50),
                     SizedBox(
                      width: 350,
                      child: ElevatedButton(
                        onPressed: (){
                          //Logic Disini
                        }, 
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.allButtton,
                          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )
                        ),
                        child: const Text(
                          'Create Task',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          )
                        ),
                      ),
                    )
              ]
            ),
          ),
      ),
    );
  }
}