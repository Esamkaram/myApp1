import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class bmiResultScreen extends StatelessWidget
{

final int result ;
final bool isMale ;
final int age ;

bmiResultScreen({
  required  this.result,
  required   this.age ,
  required  this.isMale,

});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
            },
          icon: Icon(
            Icons.keyboard_arrow_left,
          ),
        ),
        title: Text(
          'Bmi Result ',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Gnder ${isMale ? 'Male' : 'Female'}',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 25.0,
            ),
            ),
            Text('Result : $result',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25.0,
              ),
            ),
            Text('Age : $age',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25.0,
              ),
            ),
          ],
        ),
      ) ,
    );
  }
}
