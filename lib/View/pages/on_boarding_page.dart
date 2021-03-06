import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../pages/login_page.dart';
import '../pages/register_page.dart';
import '../reusable_components/widgets/text_button_module.dart';
import '../../models/on_boarding_model.dart';
import '../reusable_components/constance/color.dart';
import '../reusable_components/widgets/my_button.dart';
import '../reusable_components/widgets/on_boarding_modules.dart';
class OnBoardingPage extends StatefulWidget {
  static String id='OnBoardingPag';
  const OnBoardingPage({Key? key}) : super(key: key);
  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}
class _OnBoardingPageState extends State<OnBoardingPage> {
  var onBoardingPageController = PageController();
  List<OnBoarding> pageBoarding = [
    OnBoarding(
        image: 'assets/image/p1.png',
        title: 'Get food delivery to your doorstep asap',
        text:'we have young and professional delivery team that will bring your food as soon as possible to your doorstep'),
    OnBoarding(
        image: 'assets/image/p2.png',
        title: 'Buy Any Food from your favorite restaurant',
        text:'we are constantly adding your favorite restaurant throughout the territory and around your area carefully selected '),
    OnBoarding(
        image: 'assets/image/p3.png',
        title: 'Arrives in 30 Minutes',
        text:'Get food delivery to your doorstep'),
  ];
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context).textTheme;
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(height/100),
          
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      height: height/20,
                      decoration: BoxDecoration(
                        color: AppColor.appBarColor,
                        borderRadius: BorderRadius.circular(height/32),
                      ),
                      child: ButtonOfText(
                          text: 'skip',
                          color: Colors.black, onClick: () {
                        Navigator.pushNamed(context, LoginPage.id);

                      })),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text(
                    '7',
                    style: theme.bodyText2?.copyWith(
                      color: AppColor.iconColor1,
                      fontSize: height/30,
                      fontWeight: FontWeight.bold,
                        fontFamily: 'ICT'

                    ),
                  ),
                  Text(
                    'Krave',
                    style: theme.bodyText2?.copyWith(
                        color: AppColor.tealColor,
                        fontSize: height/35,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ICT'

                    ),
                  ),
                ],
              ),
               SizedBox(
                height: height/65,
              ),
              Expanded(
                flex: 2,
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: onBoardingPageController,
                  onPageChanged: (int index) {
                    if (index == pageBoarding.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  itemBuilder: (context, index) => OnBoardingBuildModules(
                    model: pageBoarding[index],
                  ),
                  itemCount: pageBoarding.length,
                ),
              ),
               SizedBox(
                height: height/80,
              ),
              SmoothPageIndicator(
                controller: onBoardingPageController,
                count: pageBoarding.length,
                effect: CustomizableEffect(
                  activeDotDecoration: DotDecoration(
                    width: width/20,
                    height: height/89,
                    color: AppColor.iconColor1,
                    borderRadius: BorderRadius.circular(height/266),
                  ),
                  dotDecoration: DotDecoration(
                    width: width/20,
                    height: height/88,
                    color: AppColor.textColor,
                    borderRadius: BorderRadius.circular(height/266),
                  ),
                  spacing: width/79,
                ),
              ),
               SizedBox(
                height: height/26,
              ),
              MyButton(onClick: (){
                Navigator.pushNamed(context, LoginPage.id);
              },
                  height: height/15,
                  width: double.infinity,
                  buttonColor: AppColor.tealColor,
                  radius: height/100,
                  text: 'Get started',
                  textColor: AppColor.buttonBackgroundColor),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account ?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'ICT'

                    ),
                  ),
                  ButtonOfText(
                      text: 'Sign Up',
                      color: Colors.teal, 
                      onClick: () {
                    Navigator.pushNamed(context, RegisterPage.id);
                  })
                ],
              ),
               SizedBox(
                height: height/53,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
