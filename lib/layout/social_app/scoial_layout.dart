import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp2/layout/social_app/cubit/cubit.dart';
import 'package:myapp2/layout/social_app/cubit/states.dart';
import 'package:myapp2/modules/social_app/new_post/newpost_screen.dart';
import 'package:myapp2/shared/components/components.dart';

class ScoialLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context , state){
        if(state is SocialNewPostStates)
          {
            navigateTo(context, NewPostScreen());
          }
      },
      builder: (context , state){
        var cubit = SocialCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex],
              ),
              actions: [
                IconButton(onPressed: (){}, icon: Icon(Icons.notifications_on) ,) ,
                IconButton(onPressed: (){}, icon: Icon(Icons.search) ,) ,
              ],
            ),
          body: cubit.screen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                label: 'Home',

              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                label: 'Chats',

              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Post',

              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.man),
                label: 'Users' ,

              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                label: 'Settings',

              ),
            ],
          ) ,
        );
      },
    );
  }

//   ConditionalBuilder(
//             condition: SocialCubit.get(context).model != null,
//             builder:(context) {
//               var model = SocialCubit.get(context).model ;
//                return Column(
//                 children: [
//                   // if(!FirebaseAuth.instance.currentUser!.emailVerified)
//                   // Container(
//                   //   color: Colors.amber.withOpacity(.6),
//                   //   child: Padding(
//                   //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                   //     child: Row(
//                   //       children: [
//                   //         Icon(Icons.info_outline,),
//                   //         SizedBox(width: 10.0,),
//                   //         Expanded(child: Text('please varify y our email ...',)),
//                   //         SizedBox(width: 10.0,),
//                   //         defaultTextButton(
//                   //             function: (){
//                   //               FirebaseAuth.instance.currentUser!
//                   //                   .sendEmailVerification()
//                   //               .then((value){
//                   //                 showToast(message: 'check your Email ', state: ToastStates.SUCCESS) ;
//                   //               })
//                   //               .catchError((error){
//                   //               });
//                   //             },
//                   //             text: 'send ' ) ,
//                   //
//                   //       ],
//                   //     ),
//                   //   ),
//                   // )
//                 ],
//               );
//             },
//             fallback: (context) => Center(child: CircularProgressIndicator()),
//           )
}
