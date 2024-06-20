
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:myapp2/shared/components/components.dart';
import 'package:myapp2/shared/cubit/cubit.dart';
import 'package:myapp2/shared/cubit/states.dart';


class HomeLayout extends StatelessWidget
 {

   var scaffoldKey = GlobalKey<ScaffoldState>();
   var formKey = GlobalKey<FormState>();
   var titleController = TextEditingController();
   var dateController = TextEditingController();
   var timeController = TextEditingController();


  // @override
  // void initState() {
  //   super.initState();
  //   createDatabase() ;
  //
  // }


  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit ,AppStates>(
        listener: (BuildContext context, state) {
          if (state is AppInsertDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, state) {

          AppCubit cubit = AppCubit.get(context);


          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentIndex],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              elevation: 25.0,
              onPressed: ()
              {
                if (cubit.isBottomSheetShow)
                {
                  if (formKey.currentState!.validate())
                  {
                    cubit.insertDatabase(
                      title: titleController.text,
                      time: timeController.text ,
                      date: dateController.text,
                    );
                  }
                  } else{
                  scaffoldKey.currentState!.showBottomSheet(
                        (context) =>
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(20.0,),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                defaultTextFilad(
                                  controller: titleController,
                                  type: TextInputType.text,
                                  label: 'Task Title',
                                  validate: (String value)
                                  {
                                    if (value.isEmpty)
                                    {
                                      return 'title must not be Empty';
                                    }
                                    return null ;
                                  },
                                  preFix: Icons.title,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                defaultTextFilad(
                                  controller: timeController,
                                  type: TextInputType.datetime,

                                  label: 'Task time',
                                  onTap: (){
                                    showTimePicker(context: context,
                                        initialTime: TimeOfDay.now()
                                    ).then((value){
                                      timeController.text = value!.format(context).toString() ;


                                    }).catchError(
                                            (error){
                                          print('error in showtime ${error.toString()}');
                                        }
                                    );
                                  },
                                  validate: (String value)
                                  {
                                    if (value.isEmpty)
                                    {
                                      return 'time must not be Empty';
                                    }
                                    return null ;
                                  },
                                  preFix: Icons.watch_later_outlined,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                defaultTextFilad(
                                  controller: dateController,
                                  type: TextInputType.datetime,

                                  label: 'Task time',
                                  onTap: (){
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2024-06-30'),

                                    ).then((value){
                                      dateController.text = DateFormat().add_yMMMd().format(value!) ;
                                    }).catchError(
                                            (error){
                                          print('error in showdate ${error.toString()}');
                                        }
                                    );
                                  },
                                  validate: (String value)
                                  {
                                    if (value.isEmpty)
                                    {
                                      return 'date must not be Empty';
                                    }
                                    return null ;
                                  },
                                  preFix: Icons.calendar_today,
                                ),

                              ],
                            ),
                          ),

                        ),
                  ).closed.then((value)
                  {
                    cubit.changeBottonSheetState(isShow: false, icon: Icons.edit) ;

                  });
                  cubit.changeBottonSheetState(isShow: true, icon: Icons.add) ;

                }
              },
              child:  Icon(
                cubit.fabIcon,
              ) ,
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeIndex(index);
              },
              items:
              [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: cubit.titles[0],
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle_outline,
                  ),
                  label: cubit.titles[1],
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                  label: cubit.titles[2],
                ),
              ],
            ),
            body: ConditionalBuilder(
              condition: state is! AppGetDatabaseLoadingState ,
              builder: (context)=> cubit.screens[cubit.currentIndex],
              fallback: (context)=>Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }





}
