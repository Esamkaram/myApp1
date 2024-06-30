import 'package:flutter/material.dart';

import '../../../styles/colors.dart';

class FavoritsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return buildFavItem() ;
  }



  Widget buildFavItem() => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      height: 120.0,
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage('https://student.valuxapps.com/storage/uploads/banners/1689106848R4Nxl.photo_2023-07-11_23-08-19.png'),
                width: 120.0,
                height: 120.0 ,
                fit: BoxFit.cover,
              ),
              if(1 != '0.0' )
                Container(
                  color: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text('DISCOUNT',
                    style: TextStyle(
                      fontSize:8.0,
                      color: Colors.white,
                    ),),
                ),
            ],
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'product',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.0,
                    height: 1.3,

                  ),

                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      '12',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: defaultColors ,

                      ),

                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    if(1 != '0.0' )
                      Text(
                        '12',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ) ,
                    Spacer(),
                    IconButton(
                      onPressed: (){}, icon:
                    CircleAvatar(
                      radius: 15.0,
                      backgroundColor:  Colors.grey ,
                      child: Icon(
                        Icons.favorite_border,size: 14.0 ,
                        color: Colors.white,
                      ) ,
                    ),)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
