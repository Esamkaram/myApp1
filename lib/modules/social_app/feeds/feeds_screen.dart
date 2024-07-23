import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp2/layout/social_app/cubit/cubit.dart';
import 'package:myapp2/layout/social_app/cubit/states.dart';
import 'package:myapp2/models/social_app/post_model.dart';
import 'package:myapp2/styles/colors.dart';

class FeedsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
        listener: (context , state){} ,
        builder: (context , state){
          return ConditionalBuilder(
            condition: SocialCubit.get(context).posts.length > 0 ,
            builder: (context){
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer ,
                      elevation: 5.0,
                      margin: EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          Image(
                            image: NetworkImage(
                              'https://img.freepik.com/free-vector/gradient-hajj-background_23-2149430058.jpg?t=st=1720447060~exp=1720450660~hmac=29c221fb80e4a6357dac255725021da28eadc84a82a28f973cd02b96f4a92e25&w=996',
                            ),
                            fit: BoxFit.cover,
                            height: 200.0,
                            width: double.infinity,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('communicate with friends ',
                              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                  color: Colors.black
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder:(context , index) => buildPostItem(SocialCubit.get(context).posts[index], context , index ) ,
                      separatorBuilder: (context, index) => SizedBox(height: 8.0,),
                      itemCount: SocialCubit.get(context).posts.length ,

                    ),
                    SizedBox(
                      height: 10.0 ,
                    ),
                  ],
                ),
              ) ;
            },
            fallback:(context) => Center(child: CircularProgressIndicator()),
          );
        },);
  }

  Widget buildPostItem(PostModel model , context , index ) => Card(
    clipBehavior: Clip.antiAliasWithSaveLayer ,
    elevation: 5.0,
    margin: EdgeInsets.symmetric(
      horizontal: 8.0,
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                  '${model.image}',),
              ),
              SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('${model.name}',
                          style: TextStyle(
                            height: 1.4,
                          ),),
                        SizedBox(
                          width: 5.0,
                        ),
                        Icon(Icons.check_circle,
                          color: defaultColors,
                          size: 16.0,
                        ),
                      ],
                    ),
                    Text('${model.dateTime}',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        height: 1.4 ,
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              IconButton(onPressed: (){},
                  icon: Icon(Icons.more_horiz,
                    size: 16.0,
                  )
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          Text('${model.text}',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(
          //       bottom: 10.0,
          //       top: 5.0
          //   ),
          //   child: Container(
          //     width: double.infinity,
          //     child: Wrap(
          //       children: [
          //         Padding(
          //           padding: const EdgeInsetsDirectional.only(
          //               end: 6.0
          //           ),
          //           child: Container(
          //             child: MaterialButton(onPressed: (){},
          //               height: 25.0,
          //               padding: EdgeInsets.zero,
          //               minWidth: 1.0,
          //               child: Text('#software',
          //                 style: TextStyle(
          //                   color: defaultColors,
          //
          //                 ),
          //               ),
          //             ),
          //             height: 25.0,
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsetsDirectional.only(
          //               end: 6.0
          //           ),
          //           child: Container(
          //             child: MaterialButton(onPressed: (){},
          //               height: 25.0,
          //               padding: EdgeInsets.zero,
          //               minWidth: 1.0,
          //               child: Text('#flutter',
          //                 style: TextStyle(
          //                   color: defaultColors,
          //
          //                 ),
          //               ),
          //             ),
          //             height: 25.0,
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsetsDirectional.only(
          //               end: 6.0
          //           ),
          //           child: Container(
          //             child: MaterialButton(onPressed: (){},
          //               height: 25.0,
          //               padding: EdgeInsets.zero,
          //               minWidth: 1.0,
          //               child: Text('#software',
          //                 style: TextStyle(
          //                   color: defaultColors,
          //
          //                 ),
          //               ),
          //             ),
          //             height: 25.0,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          if(model.postImage != '')
          Padding(
            padding: const EdgeInsetsDirectional.only(
              top: 15.0 ,
            ),
            child: Container(
              height: 160.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    '${model.postImage}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.heart_broken ,
                            size: 16.0,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '${SocialCubit.get(context).likes[index]}',
                            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                color: Colors.black
                            ) ,
                          ),
                        ],
                      ),
                    ),
                    onTap: (){},
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.comment ,
                            size: 16.0,
                            color: Colors.yellow[800],
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '0 comments',
                            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                color: Colors.black
                            ) ,
                          ),

                        ],
                      ),
                    ),
                    onTap: (){},
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18.0,
                        backgroundImage: NetworkImage(
                          '${SocialCubit.get(context).userModel!.image}',),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text('write a comment ... ',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  onTap: (){},
                ),

              ),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.heart_broken ,
                      size: 16.0,
                      color: Colors.yellow[800],
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'like',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.black
                      ) ,
                    ),

                  ],
                ),
                onTap: (){
                  SocialCubit.get(context).likePost(SocialCubit.get(context).postsId[index]);
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
