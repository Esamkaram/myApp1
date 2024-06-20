import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
        backgroundColor: Colors.teal ,
       leading:Icon(
         Icons.menu,
       ),
       title: Text(
         'My First App',
       ),
       actions: [
         IconButton(icon: Icon(
             Icons.search
         ),
             onPressed: (){
           print('search function priess');
             }
         ),
         IconButton(icon: Icon(
             Icons.notification_important
         ),
             onPressed: (){
           print('Notofication Press ');
             }),
         IconButton(
           icon:Icon(
             Icons.ac_unit
           ),
           onPressed: (){
             print('object Ac Uint');
           },
         ),
       ],
     ) ,
     body:Column(
       children: [
         Image.network('https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg'),
       ],
     ),
     // SingleChildScrollView(
     //   child: Container(
     //     width: double.infinity,
     //     child: Column(
     //       crossAxisAlignment: CrossAxisAlignment.start,
     //       children: [
     //         Text('data module 1',
     //         style: TextStyle(
     //           color: Colors.white,
     //           fontSize: 30.0,
     //           backgroundColor: Colors.amber
     //         ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.green
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.blue
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.black
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.yellowAccent
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.cyanAccent
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.amber
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.green
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.blue
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.black
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.yellowAccent
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.cyanAccent
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.amber
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.green
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.blue
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.black
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.yellowAccent
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.cyanAccent
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.amber
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.green
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.blue
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.black
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.yellowAccent
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.cyanAccent
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.amber
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.green
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.blue
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.black
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.yellowAccent
     //           ),
     //         ),
     //         Text('data module 1',
     //           style: TextStyle(
     //               color: Colors.white,
     //               fontSize: 30.0,
     //               backgroundColor: Colors.cyanAccent
     //           ),
     //         ),
     //
     //       ],
     //     ),
     //   ),
     // )


     // Row(
     //  children: [
     //    Expanded(
     //      child: Container(
     //        color: Colors.green,
     //        child: Text('Text One',
     //        style: TextStyle(
     //          backgroundColor: Colors.green,
     //          color: Colors.white ,
     //          fontSize: 20.0
     //
     //        ),
     //        ),
     //      ),
     //    ),
     //    Expanded(
     //      child: Container(
     //        color: Colors.red,
     //        child: Text('Text One',
     //          style: TextStyle(
     //              backgroundColor: Colors.red,
     //              color: Colors.white ,
     //              fontSize: 20.0
     //
     //          ),
     //        ),
     //      ),
     //    ),
     //    Expanded(
     //      child: Container(
     //        color: Colors.blue,
     //        child: Text('Text One',
     //          style: TextStyle(
     //              backgroundColor: Colors.blue,
     //              color: Colors.white ,
     //              fontSize: 20.0
     //
     //          ),
     //        ),
     //      ),
     //    ),
     //    Expanded(
     //      child: Container(
     //        color: Colors.amber,
     //        child: Text('Text One',
     //          style: TextStyle(
     //              backgroundColor: Colors.amber,
     //              color: Colors.white ,
     //              fontSize: 20.0
     //
     //          ),
     //        ),
     //      ),
     //    ),
     //  ],
     //
     //
     // )

     // Container(
     //   color: Colors.yellowAccent,
     //   width: double.infinity,
     //   child: Column(
     //     mainAxisAlignment: MainAxisAlignment.center,
     //     crossAxisAlignment: CrossAxisAlignment.center,
     //     children: [
     //       Container(
     //         color: Colors.red,
     //         child: Text(
     //           'WelCome To MyApp',
     //           style: TextStyle(
     //             fontSize: 30.0,
     //             color: Colors.white,
     //
     //           ),
     //         ),
     //       ),
     //       // Container(
     //       //
     //       //   color: Colors.green,
     //       //   child: Text(
     //       //     'WelCome To MyApp',
     //       //     style: TextStyle(
     //       //       fontSize: 30.0,
     //       //       color: Colors.white,
     //       //       backgroundColor: Colors.green,
     //       //     ),
     //       //   ),
     //       // ),
     //       // Container(
     //       //
     //       //   color: Colors.teal,
     //       //   child: Text(
     //       //     'WelCome To MyApp',
     //       //     style: TextStyle(
     //       //       fontSize: 30.0,
     //       //       color: Colors.white,
     //       //       backgroundColor: Colors.teal,
     //       //     ),
     //       //   ),
     //       // ),
     //       // Container(
     //       //
     //       //   color: Colors.amber,
     //       //   child: Text(
     //       //     'WelCome To MyApp',
     //       //     style: TextStyle(
     //       //       fontSize: 30.0,
     //       //       color: Colors.white,
     //       //       backgroundColor: Colors.amber,
     //       //     ),
     //       //   ),
     //       // ),
     //     ],
     //   ),
     // ),
   );
  }
  
  
  
  
}