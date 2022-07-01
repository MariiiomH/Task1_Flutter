import 'package:flutter/material.dart';
import 'package:task_1/models/on_boarding_model.dart';


class OnBoardingBuildModules extends StatelessWidget {
  const OnBoardingBuildModules({Key? key, required this.model}) : super(key: key);
  final OnBoarding model;
  @override
  Widget build(BuildContext context) {
    return  Column(
      
      children: [
        Image.asset(model.image),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: Text(
            model.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              fontFamily: 'ICT',
              fontWeight: FontWeight.bold

            ),
          ),
        ),
        const SizedBox(
          height: 3.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: Text(
            model.text,
            textAlign: TextAlign.center,
            style:  TextStyle(
              fontSize: 14.0,
              fontFamily: 'ICT',
              fontWeight: FontWeight.w500,
              color: Colors.grey[500]
            ),
          ),
        ),


      ],
    );
  }
}
