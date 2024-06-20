import 'package:flutter/material.dart';
import 'package:myapp2/modules/shop_app/login/shop_login.dart';
import 'package:myapp2/shared/components/components.dart';
import 'package:myapp2/shared/network/local/cach_helper.dart';
import 'package:myapp2/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class BoardingModel {
  final String? image ;
  final String? title ;
  final String? body ;

  BoardingModel({
    required this.image,
    required this.title ,
    required this.body ,
});

}

class onBoridingScreen extends StatefulWidget
{
  @override
  State<onBoridingScreen> createState() => _onBoridingScreenState();
}

class _onBoridingScreenState extends State<onBoridingScreen> {
List<BoardingModel> boarding =[
  BoardingModel(image: 'assets/images/onbor01.png',
      title: 'On Board 1 title',
      body: 'On Board 1 body'),
  BoardingModel(image: 'assets/images/Two2.png',
      title: 'On Board 2 title',
      body: 'On Board 2 body'),
  BoardingModel(image: 'assets/images/Contact3.png',
      title: 'On Board 3 title',
      body: 'On Board 3 body'),
];

var boardController = PageController() ;

bool isLast = false ;

void submit(){
  CacheHelper.saveData(key: 'inBoarding', value: true,).then((value){
    if(value){
      navigateAndFinish(context, ShopLogin());
    }
  });
  

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
            setState(() {
              submit();
            });
          }, child: Text(
            'SKIP',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: defaultColors,
            ),
          ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int  index) {
                  if (index == boarding.length -1 )
                  {
                    setState(() {
                      isLast = true ;
                    });

                  }else{
                    setState(() {
                      isLast = false ;
                    });
                  }
                },
                itemBuilder:(context, index) =>buildBoardingItem(boarding[index]) ,
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children:
              [
                SmoothPageIndicator(
                    controller: boardController,
                    count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: defaultColors,
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 5,
                    expansionFactor: 4 ,
                  ),
                ),
                Spacer(),
                FloatingActionButton(onPressed: ()
                {
                  if(isLast){
                    submit() ;
                  }else {
                      boardController.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                child: Icon(
                  Icons.arrow_forward_ios
                ),),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image: AssetImage('${model.image}'),
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
      Text(
        '${model.title}',
        style: TextStyle(
          fontSize: 24.0,

        ),
      ),
      SizedBox(
        height: 30.0,
      ),
      Text(
        '${model.body}',
        style: TextStyle(
          fontSize: 16.0,

        ),
      ),
      SizedBox(
        height: 30.0,
      ),
    ],
  ) ;
}
