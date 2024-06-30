import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp2/layout/shop_app/cubit/cubit.dart';
import 'package:myapp2/layout/shop_app/cubit/states.dart';
import 'package:myapp2/modules/shop_app/login/shop_login.dart';
import 'package:myapp2/shared/components/components.dart';
import 'package:myapp2/shared/network/local/cach_helper.dart';

import '../../modules/shop_app/search/search_screen.dart';

class ShopLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
        listener: (context,state){},
        builder: (context,state) {
          var cubit = ShopCubit.get(context);
        return   Scaffold(
            appBar: AppBar(
              title: Text('HOME',),
              actions: [
                IconButton(onPressed: (){
                  navigateTo(context, SearchScreen(),);
                },
                           icon: Icon(
                             Icons.search
                           ),),
              ],
            ),
            body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              cubit.ChangeBottom(index);
            },
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.apps),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
          );
        },

    );
  }
}
