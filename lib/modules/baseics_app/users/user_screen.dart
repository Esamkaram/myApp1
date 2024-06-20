import 'package:flutter/material.dart';
import 'package:myapp2/models/user/user_model.dart';




class userScreen extends StatelessWidget
{

List<UserModel> users =[
  UserModel(
    id: 1 ,
    name: 'Ali Esam Karam',
    phone: '0123000210120',
  ),
  UserModel(
    id: 2 ,
    name: 'Omar Esam Karam',
    phone: '010000210120',
  ),
  UserModel(
    id: 3 ,
    name: 'Alia Esam Karam',
    phone: '01100210120',
  ),
  UserModel(
    id: 4 ,
    name: 'mohamed Esam Karam',
    phone: '01300210120',
  ),
  UserModel(
    id: 5 ,
    name: 'khalid Esam Karam',
    phone: '0121000210120',
  ),
  UserModel(
    id: 6 ,
    name: 'sara Esam Karam',
    phone: '0123000210120',
  ),
  UserModel(
    id: 7 ,
    name: 'shimaa Esam Karam',
    phone: '0123000210120',
  ),
  UserModel(
    id: 8 ,
    name: 'tota Esam Karam',
    phone: '0123000210120',
  ),
  UserModel(
    id: 6 ,
    name: 'sara Esam Karam',
    phone: '0123000210120',
  ),
  UserModel(
    id: 7 ,
    name: 'shimaa Esam Karam',
    phone: '0123000210120',
  ),
  UserModel(
    id: 8 ,
    name: 'tota Esam Karam',
    phone: '0123000210120',
  ),
];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
        ),
      ),
      body:ListView.separated(
          itemBuilder: (context,index) => buildUserItem(users[index]),
          separatorBuilder: (context,index) => Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          itemCount: users.length),


    );
  }
Widget buildUserItem(UserModel user)=> Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children:
    [
      CircleAvatar(
        radius: 30.0,
        child: Text('${user.id}',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        width: 10.0,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          Text('${user.name}',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('${user.phone}',
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )
    ],
  ),
);

}
