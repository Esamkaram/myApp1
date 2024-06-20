import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp2/layout/new_app/cubit/cubit.dart';
import 'package:myapp2/layout/new_app/cubit/states.dart';
import 'package:myapp2/modules/new_app/search/srearsh_screen.dart';

import 'package:myapp2/shared/components/components.dart';
import 'package:myapp2/shared/cubit/cubit.dart';


class NewsLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewStates>(
      listener: (context,state){},
      builder: (context, state)
      {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
            ),
            actions: [
              IconButton(icon: Icon(
                Icons.search
              ), onPressed: (){
                navigateTo(context, SearchScreen(),) ;
              },),
              SizedBox(
                width: 20.0,
              ),
              IconButton(icon: Icon(
                  Icons.brightness_4_outlined
              ), onPressed: (){
                AppCubit.get(context).changeAppMode();
              },),
            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: (){
          //
          //   },
          //   child: Icon(
          //     Icons.add,
          //   ),
          // ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNavBar(index);
            },
            items: cubit.bottomItem,
          ),
        );
      },
    );
  }
}
