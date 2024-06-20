import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp2/layout/new_app/cubit/states.dart';
import 'package:myapp2/modules/new_app/busniness/busniness_screen.dart';
import 'package:myapp2/modules/new_app/seience/seience_screen.dart';

import 'package:myapp2/modules/new_app/sports/sports_screen.dart';

import 'package:myapp2/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewStates> {
  NewsCubit() : super(NewInitialState());

  static NewsCubit get(context)=> BlocProvider.of(context) ;

int currentIndex = 0 ;


  List<BottomNavigationBarItem> bottomItem =[
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
    // BottomNavigationBarItem(
    //   icon: Icon(
    //     Icons.settings,
    //   ),
    //   label: 'Setting',
    // ),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    SeienceScreen(),
  ];

  void changeBottomNavBar(int index){
    currentIndex = index ;


    emit(NewsBottomNavState()) ;


  }

  List <dynamic> business = [] ;

  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    
    DioHelper.getData(
      url: 'v2/top-headlines',
      query:{
        'country':'eg',
        'category':'business',
        'apiKey':'0cbb448d059b43d1972c19a0dfc8e555',
      }, ).then((value) {
      business = value.data['articles'] ;
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });

  }



  List <dynamic>  sports = [] ;

  void getSports(){
    emit(NewsGetSportsLoadingState());


      DioHelper.getData(
        url: 'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'sports' ,
          'apiKey':'0cbb448d059b43d1972c19a0dfc8e555',
        }, ).then((value) {
        sports = value.data['articles'] ;
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());

      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });




  }




  List <dynamic> science = [] ;

  void getScience(){
    emit(NewsGetScienceLoadingState());


      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '0cbb448d059b43d1972c19a0dfc8e555',
        },).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });


  }



  List <dynamic> search = [] ;

  void getSearch(String value){

    emit(NewsGetSearchLoadingState());
    search= [] ;
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value' ,
        'apiKey': '0cbb448d059b43d1972c19a0dfc8e555',
      },).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });


  }

}