import 'package:flutter/material.dart';

class MassangerScreen extends StatelessWidget
{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('https://www.matthewdevaney.com/wp-content/uploads/2021/08/powerapps-userphoto-featured-1.jpg'),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text('Chats',
            style: TextStyle(
              color: Colors.black,
            ),),
          ],
        ),
        actions: [
          IconButton(
              icon: CircleAvatar(
                radius: 15.0,
                backgroundColor: Colors.blue,
                child: Icon(
            Icons.camera_alt,
                  size: 16.0,
                  color: Colors.white,
          ),
              ),
              onPressed: () {}
          ),
          SizedBox(
            width: 2.0,
          ),
          IconButton(icon: CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.edit,
              size: 16.0,
              color: Colors.white,
            ),
          ),
              onPressed: (){}
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 25.0,
                    ),
                    Text(
                      'Search ',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: [
              //       Container(
              //         width: 60.0,
              //         child: Column(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 9.0,
              //                     backgroundColor: Colors.white,
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 8.0,
              //                     backgroundColor: Colors.green,
              //
              //                   ),
              //                 ),
              //
              //               ],
              //             ),
              //             SizedBox(
              //               height: 6.0,
              //             ),
              //             Text(
              //               'Ali Esam Karam AbdelMohsen',
              //               maxLines: 2,
              //               overflow: TextOverflow.ellipsis,
              //               style: TextStyle(
              //                 fontSize: 15.0,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10.0,
              //       ),
              //       Container(
              //         width: 60.0,
              //         child: Column(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 9.0,
              //                     backgroundColor: Colors.white,
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 8.0,
              //                     backgroundColor: Colors.green,
              //
              //                   ),
              //                 ),
              //
              //               ],
              //             ),
              //             SizedBox(
              //               height: 6.0,
              //             ),
              //             Text(
              //               'Omar Esam Karam AbdelMohsen',
              //               maxLines: 2,
              //               overflow: TextOverflow.ellipsis,
              //               style: TextStyle(
              //                 fontSize: 15.0,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10.0,
              //       ),
              //       Container(
              //         width: 60.0,
              //         child: Column(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 9.0,
              //                     backgroundColor: Colors.white,
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 8.0,
              //                     backgroundColor: Colors.green,
              //
              //                   ),
              //                 ),
              //
              //               ],
              //             ),
              //             SizedBox(
              //               height: 6.0,
              //             ),
              //             Text(
              //               'Alia Esam Karam AbdelMohsen',
              //               maxLines: 2,
              //               overflow: TextOverflow.ellipsis,
              //               style: TextStyle(
              //                 fontSize: 15.0,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10.0,
              //       ),
              //       Container(
              //         width: 60.0,
              //         child: Column(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 9.0,
              //                     backgroundColor: Colors.white,
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 8.0,
              //                     backgroundColor: Colors.green,
              //
              //                   ),
              //                 ),
              //
              //               ],
              //             ),
              //             SizedBox(
              //               height: 6.0,
              //             ),
              //             Text(
              //               'Alia Esam Karam AbdelMohsen',
              //               maxLines: 2,
              //               overflow: TextOverflow.ellipsis,
              //               style: TextStyle(
              //                 fontSize: 15.0,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10.0,
              //       ),
              //       Container(
              //         width: 60.0,
              //         child: Column(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 9.0,
              //                     backgroundColor: Colors.white,
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 8.0,
              //                     backgroundColor: Colors.green,
              //
              //                   ),
              //                 ),
              //
              //               ],
              //             ),
              //             SizedBox(
              //               height: 6.0,
              //             ),
              //             Text(
              //               'Alia Esam Karam AbdelMohsen',
              //               maxLines: 2,
              //               overflow: TextOverflow.ellipsis,
              //               style: TextStyle(
              //                 fontSize: 15.0,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10.0,
              //       ),
              //       Container(
              //         width: 60.0,
              //         child: Column(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 9.0,
              //                     backgroundColor: Colors.white,
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 8.0,
              //                     backgroundColor: Colors.green,
              //
              //                   ),
              //                 ),
              //
              //               ],
              //             ),
              //             SizedBox(
              //               height: 6.0,
              //             ),
              //             Text(
              //               'Alia Esam Karam AbdelMohsen',
              //               maxLines: 2,
              //               overflow: TextOverflow.ellipsis,
              //               style: TextStyle(
              //                 fontSize: 15.0,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10.0,
              //       ),
              //       Container(
              //         width: 60.0,
              //         child: Column(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 9.0,
              //                     backgroundColor: Colors.white,
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 8.0,
              //                     backgroundColor: Colors.green,
              //
              //                   ),
              //                 ),
              //
              //               ],
              //             ),
              //             SizedBox(
              //               height: 6.0,
              //             ),
              //             Text(
              //               'Alia Esam Karam AbdelMohsen',
              //               maxLines: 2,
              //               overflow: TextOverflow.ellipsis,
              //               style: TextStyle(
              //                 fontSize: 15.0,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 30.0,
              // ),
              // Expanded(
              //     child: SingleChildScrollView(
              //       child: Column(
              //         children: [
              //           Row(
              //             children: [
              //               Stack(
              //                 alignment: AlignmentDirectional.bottomEnd,
              //                 children: [
              //                   CircleAvatar(
              //                     radius: 30.0,
              //                   ),
              //                   Padding(
              //                     padding: const EdgeInsetsDirectional.only(
              //                       bottom: 3.0,
              //                       end: 3.0,
              //                     ),
              //                     child: CircleAvatar(
              //                       radius: 9.0,
              //                       backgroundColor: Colors.white,
              //                     ),
              //                   ),
              //                   Padding(
              //                     padding: const EdgeInsetsDirectional.only(
              //                       bottom: 3.0,
              //                       end: 3.0,
              //                     ),
              //                     child: CircleAvatar(
              //                       radius: 8.0,
              //                       backgroundColor: Colors.green,
              //
              //                     ),
              //                   ),
              //
              //                 ],
              //               ),
              //               SizedBox(
              //                 width: 10.0,
              //               ),
              //               Expanded(
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Text('Ali Esam Karam',
              //                       style: TextStyle(
              //                         fontSize: 16.0,
              //                         fontWeight: FontWeight.bold,
              //                       ),
              //                       maxLines: 1,
              //                       overflow: TextOverflow.ellipsis,
              //                     ),
              //                     SizedBox(
              //                       height: 8.0,
              //                     ),
              //                     Row(
              //                       children: [
              //                         Expanded(
              //                           child: Text('hello my name is ali WelCome to Home ',
              //                             maxLines: 2,
              //                             overflow: TextOverflow.ellipsis,),
              //                         ),
              //                         Padding(
              //                           padding: const EdgeInsets.symmetric(
              //                             horizontal: 10.0,
              //                           ),
              //                           child: Container(
              //                             width: 8.0,
              //                             height: 8.0,
              //                             decoration: BoxDecoration(
              //                               color: Colors.blue,
              //                               shape: BoxShape.circle,
              //                             ),
              //                           ),
              //                         ),
              //                         Text('02:30 PM',
              //                           maxLines: 2,
              //                           overflow: TextOverflow.ellipsis,),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //           SizedBox(
              //             height: 10.0,
              //           ),
              // Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 9.0,
              //                     backgroundColor: Colors.white,
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 8.0,
              //                     backgroundColor: Colors.green,
              //
              //                   ),
              //                 ),
              //
              //               ],
              //             ),
              //             SizedBox(
              //               width: 10.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text('Ali Esam Karam',
              //                     style: TextStyle(
              //                       fontSize: 16.0,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 8.0,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text('hello my name is ali WelCome to Home ',
              //                           maxLines: 2,
              //                           overflow: TextOverflow.ellipsis,),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(
              //                           horizontal: 10.0,
              //                         ),
              //                         child: Container(
              //                           width: 8.0,
              //                           height: 8.0,
              //                           decoration: BoxDecoration(
              //                             color: Colors.blue,
              //                             shape: BoxShape.circle,
              //                           ),
              //                         ),
              //                       ),
              //                       Text('02:30 PM',
              //                         maxLines: 2,
              //                         overflow: TextOverflow.ellipsis,),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              // ),
              // SizedBox(
              //           height: 10.0,
              // ),
              // Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 9.0,
              //                     backgroundColor: Colors.white,
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 8.0,
              //                     backgroundColor: Colors.green,
              //
              //                   ),
              //                 ),
              //
              //               ],
              //             ),
              //             SizedBox(
              //               width: 10.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text('Ali Esam Karam',
              //                     style: TextStyle(
              //                       fontSize: 16.0,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 8.0,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text('hello my name is ali WelCome to Home ',
              //                           maxLines: 2,
              //                           overflow: TextOverflow.ellipsis,),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(
              //                           horizontal: 10.0,
              //                         ),
              //                         child: Container(
              //                           width: 8.0,
              //                           height: 8.0,
              //                           decoration: BoxDecoration(
              //                             color: Colors.blue,
              //                             shape: BoxShape.circle,
              //                           ),
              //                         ),
              //                       ),
              //                       Text('02:30 PM',
              //                         maxLines: 2,
              //                         overflow: TextOverflow.ellipsis,),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              // ),
              // SizedBox(
              //           height: 10.0,
              // ),
              // Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 9.0,
              //                     backgroundColor: Colors.white,
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 8.0,
              //                     backgroundColor: Colors.green,
              //
              //                   ),
              //                 ),
              //
              //               ],
              //             ),
              //             SizedBox(
              //               width: 10.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text('Ali Esam Karam',
              //                     style: TextStyle(
              //                       fontSize: 16.0,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 8.0,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text('hello my name is ali WelCome to Home ',
              //                           maxLines: 2,
              //                           overflow: TextOverflow.ellipsis,),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(
              //                           horizontal: 10.0,
              //                         ),
              //                         child: Container(
              //                           width: 8.0,
              //                           height: 8.0,
              //                           decoration: BoxDecoration(
              //                             color: Colors.blue,
              //                             shape: BoxShape.circle,
              //                           ),
              //                         ),
              //                       ),
              //                       Text('02:30 PM',
              //                         maxLines: 2,
              //                         overflow: TextOverflow.ellipsis,),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              // ),
              // SizedBox(
              //           height: 10.0,
              // ),
              // Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 9.0,
              //                     backgroundColor: Colors.white,
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 8.0,
              //                     backgroundColor: Colors.green,
              //
              //                   ),
              //                 ),
              //
              //               ],
              //             ),
              //             SizedBox(
              //               width: 10.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text('Ali Esam Karam',
              //                     style: TextStyle(
              //                       fontSize: 16.0,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 8.0,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text('hello my name is ali WelCome to Home ',
              //                           maxLines: 2,
              //                           overflow: TextOverflow.ellipsis,),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(
              //                           horizontal: 10.0,
              //                         ),
              //                         child: Container(
              //                           width: 8.0,
              //                           height: 8.0,
              //                           decoration: BoxDecoration(
              //                             color: Colors.blue,
              //                             shape: BoxShape.circle,
              //                           ),
              //                         ),
              //                       ),
              //                       Text('02:30 PM',
              //                         maxLines: 2,
              //                         overflow: TextOverflow.ellipsis,),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              // ),
              // SizedBox(
              //           height: 10.0,
              // ),
              // Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 9.0,
              //                     backgroundColor: Colors.white,
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 8.0,
              //                     backgroundColor: Colors.green,
              //
              //                   ),
              //                 ),
              //
              //               ],
              //             ),
              //             SizedBox(
              //               width: 10.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text('Ali Esam Karam',
              //                     style: TextStyle(
              //                       fontSize: 16.0,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 8.0,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text('hello my name is ali WelCome to Home ',
              //                           maxLines: 2,
              //                           overflow: TextOverflow.ellipsis,),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(
              //                           horizontal: 10.0,
              //                         ),
              //                         child: Container(
              //                           width: 8.0,
              //                           height: 8.0,
              //                           decoration: BoxDecoration(
              //                             color: Colors.blue,
              //                             shape: BoxShape.circle,
              //                           ),
              //                         ),
              //                       ),
              //                       Text('02:30 PM',
              //                         maxLines: 2,
              //                         overflow: TextOverflow.ellipsis,),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              // ),
              // SizedBox(
              //           height: 10.0,
              // ),
              // Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 9.0,
              //                     backgroundColor: Colors.white,
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 8.0,
              //                     backgroundColor: Colors.green,
              //
              //                   ),
              //                 ),
              //
              //               ],
              //             ),
              //             SizedBox(
              //               width: 10.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text('Ali Esam Karam',
              //                     style: TextStyle(
              //                       fontSize: 16.0,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 8.0,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text('hello my name is ali WelCome to Home ',
              //                           maxLines: 2,
              //                           overflow: TextOverflow.ellipsis,),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(
              //                           horizontal: 10.0,
              //                         ),
              //                         child: Container(
              //                           width: 8.0,
              //                           height: 8.0,
              //                           decoration: BoxDecoration(
              //                             color: Colors.blue,
              //                             shape: BoxShape.circle,
              //                           ),
              //                         ),
              //                       ),
              //                       Text('02:30 PM',
              //                         maxLines: 2,
              //                         overflow: TextOverflow.ellipsis,),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              // ),
              // SizedBox(
              //           height: 10.0,
              // ),
              // Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 9.0,
              //                     backgroundColor: Colors.white,
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 8.0,
              //                     backgroundColor: Colors.green,
              //
              //                   ),
              //                 ),
              //
              //               ],
              //             ),
              //             SizedBox(
              //               width: 10.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text('Ali Esam Karam',
              //                     style: TextStyle(
              //                       fontSize: 16.0,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 8.0,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text('hello my name is ali WelCome to Home ',
              //                           maxLines: 2,
              //                           overflow: TextOverflow.ellipsis,),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(
              //                           horizontal: 10.0,
              //                         ),
              //                         child: Container(
              //                           width: 8.0,
              //                           height: 8.0,
              //                           decoration: BoxDecoration(
              //                             color: Colors.blue,
              //                             shape: BoxShape.circle,
              //                           ),
              //                         ),
              //                       ),
              //                       Text('02:30 PM',
              //                         maxLines: 2,
              //                         overflow: TextOverflow.ellipsis,),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              // ),
              //         ],
              //       ),
              //     ),
              //   ),
              Container(
                height: 110.0,
                child: ListView.separated(

                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context , index ) => buildStoryItem() ,
                    separatorBuilder: (context ,index) => SizedBox(
                      width: 20.0,
                    ),
                    itemCount: 5),
              ),
              SizedBox(
                height: 40.0,
              ),
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => buildChatItem(),
                  separatorBuilder: (context,index) => SizedBox(
                    height: 10.0,
                  ),
                  itemCount: 10)


            ],
          ),
        ),
      ),
    );
  }

  Widget buildChatItem()=> Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30.0,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 3.0,
              end: 3.0,
            ),
            child: CircleAvatar(
              radius: 9.0,
              backgroundColor: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 3.0,
              end: 3.0,
            ),
            child: CircleAvatar(
              radius: 8.0,
              backgroundColor: Colors.green,

            ),
          ),

        ],
      ),
      SizedBox(
        width: 10.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ali Esam Karam',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Text('hello my name is ali WelCome to Home ',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Text('02:30 PM',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,),
              ],
            ),
          ],
        ),
      ),
    ],
  ) ;
  Widget buildStoryItem()=> Container(
    width: 60.0,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30.0,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 9.0,
                backgroundColor: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 8.0,
                backgroundColor: Colors.green,

              ),
            ),

          ],
        ),
        SizedBox(
          height: 6.0,
        ),
        Text(
          'Ali Esam Karam AbdelMohsen',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
      ],
    ),
  ) ;
}
