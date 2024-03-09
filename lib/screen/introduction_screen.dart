import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'PET HOUSE CLINIC',
      body: 'โดยทางคลินิกจะมีระบบสมุดบัญชี และ ระบบจองคิวออนไลน์',
      footer: Column(
        children: [
          SizedBox(
            height: 45,
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 8,
              ),
              onPressed: () {},
              child: const Text('lets go'),
            ),
          ),
        ],
      ),
      image: Image.asset('assets/image/pet.jpg'),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    PageViewModel(
      title: 'Are you bored with wasting time on queue?',
      body:
          'ระบบนี้จะช่วยให้คุณจองล่วงหน้าทำให้ไม่มีใครต้องเสียเวลารอคิวหลายนาทีเพื่อแค่พบหมอเพื่อแค่ดูอาการสัตว์เลี้ยง',
      footer: Column(
        children: [
          SizedBox(
            height: 45,
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 8,
              ),
              onPressed: () {},
              child: const Text('next'),
            ),
          ),
        ],
      ),
      image: Image.asset('assets/image/queue.png'),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    PageViewModel(
      title: 'create your pet collection',
      body:
          'สำหรับใครที่มีสัตว์เลี้ยงหลายตัวสามารถทำเป็นหน้ารวมสัตว์เลี้ยงของคุณได้',
      footer: Column(
        children: [
          SizedBox(
            height: 45,
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 8,
              ),
              onPressed: () {},
              child: const Text('next'),
            ),
          ),
        ],
      ),
      image: Image.asset('assets/image/pethub.jpg'),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PET HOUSE'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 218, 165, 122),
      ),
      body: IntroductionScreen(
        globalBackgroundColor: Color.fromARGB(255, 255, 237, 223),
        pages: pages,
        showSkipButton: true,
        skip: const Text('skip'),
        showDoneButton: true,
        done: const Text('Done'),
        showNextButton: true,
        next: Icon(
          Icons.arrow_forward,
          size: 25,
        ),
        onDone: () => onDone(context),
        curve: Curves.bounceOut,
        dotsDecorator: DotsDecorator(
          size: Size(15, 15),
          color: Color.fromARGB(255, 255, 255, 255),
          activeColor: Color.fromARGB(255, 255, 175, 121),
          activeSize: Size.square(20),
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }
}
