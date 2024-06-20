import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp2/modules/todo_app/archivetacks/archivetTacks.dart';
import 'package:myapp2/modules/todo_app/donetacks/doneTacks.dart';
import 'package:myapp2/modules/todo_app/newtacks/newTacks.dart';

import 'package:myapp2/shared/cubit/states.dart';
import 'package:myapp2/shared/network/local/cach_helper.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());


  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0 ;
  List<Widget> screens = [
    newTacks(),
    doneTacks(),
    archivetTacks(),
  ] ;
  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  late Database database ;

  List<Map> newTasks = [] ;
  List<Map> doneTasks = [] ;
  List<Map> archivedTasks = [] ;


  bool isBottomSheetShow = false;
  IconData fabIcon = Icons.edit ;


  void changeIndex(int index){
    currentIndex = index ;
    emit(AppChangeBottomNavBarState());
  }


  Future<String> getName() async
  {
    return 'Ali Esam';
  }

  void createDatabase()  {
     openDatabase(
        'todo.db',
        version:1,
        onCreate: (database , version )
        {
          print('database is created');
          database.execute('create table tasks (id INTEGER PRIMARY KEY , TITLE TEXT , DATE TEXT ,TIME TEXT , STATUS TEXT )').then((value)
          {
            print('table created');

          }).catchError((error){
            print('Error When Createing Table ${error.toString()}' );

          });
        },
        onOpen: (database)
        {
          getDataFromDatabase(database) ;
          print('database is open');
        }
    ).then((value){
       database = value ;
       emit(AppCreateDatabaseState());
     });
  }

   void  insertDatabase({
    required title ,
    required date ,
    required time ,
  }) async
  {
     await database.transaction((txn)
    {
      txn.rawInsert(
        'INSERT INTO tasks(title,date,time,status) VALUES ("$title","$date","$time","Y")',
      ).then((value) {
        print('$value inserted successfuly');
        emit(AppInsertDatabaseState());
        getDataFromDatabase(database) ;

      }).catchError((error){
        print('error into insert ${error.toString()}');
      });
      return  throw Exception('FooException');
    });

  }

  void getDataFromDatabase(database)
  {
    newTasks =[] ;
    doneTasks =[] ;
    archivedTasks =[];

    emit(AppGetDatabaseLoadingState());

    database.rawQuery('select * from tasks').then((value)
    {


      value.forEach((element)
      {
        if(element['STATUS']=='Y')
          newTasks.add(element);
        else if (element['STATUS']=='T')
          doneTasks.add(element);
        else archivedTasks.add(element);

      });
      
      
      emit(AppGetDatabaseState());
    });

  }

  void updateDate({
    required String status ,
    required int id ,

}) async
  {
   database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id ],
   ).then((value){
     getDataFromDatabase(database) ;
     emit(AppUpdateDatabaseLoadingState()) ;

   } );

  }


  void deleteDate({
    required int id ,

  }) async
  {
    database.rawDelete(
      'DELETE FROM tasks  WHERE id = ?',
      [ id ],
    ).then((value){
      getDataFromDatabase(database) ;
      emit(AppDeleteDatabaseLoadingState()) ;

    } );

  }

  void changeBottonSheetState({
    required bool isShow ,
    required IconData icon ,
}){
    isBottomSheetShow = isShow ;
    fabIcon = icon ;

    emit(AppChangeBottomSheetState());

  }

bool isDark = false ;

  void changeAppMode({
    bool? fromShared
  }){
    if(fromShared != null)
    {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark ;
      CacheHelper.putDate(key: 'isDark', value: isDark).then((value) {
      emit(AppChangeModeState());
    }) ;
  }


  }

}