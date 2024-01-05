import 'package:flutter/material.dart';
import 'package:reading/core/utils/assets.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.center,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFFFFFFF), Color(0xFFFAF8F7)],
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: screenHeight * 0.001,
          ),
          SizedBox(height: 450, child: Image.asset(AssetsData.illustration)),
          Container(
            height: screenHeight * 0.25,
            decoration: const BoxDecoration(
              color: Color(0xff311c00),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Discover New Worlds',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Dive into captivating stories and explore endless adventures.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        // Action when the button is pressed
                      },
                      child: const Text('Start Reading'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        textStyle: const TextStyle(color: Color(0xff311c00)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
