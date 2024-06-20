
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:myapp2/layout/new_app/cubit/cubit.dart';
import 'package:myapp2/layout/shop_app/shop_layout.dart';
import 'package:myapp2/modules/shop_app/login/shop_login.dart';

import 'package:myapp2/modules/shop_app/on_bording/onbording_screen.dart';
import 'package:myapp2/shared/bloc_observer.dart';
import 'package:myapp2/shared/cubit/cubit.dart';
import 'package:myapp2/shared/cubit/states.dart';
import 'package:myapp2/shared/network/local/cach_helper.dart';
import 'package:myapp2/shared/network/remote/dio_helper.dart';
import 'package:myapp2/styles/themes.dart';




void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init() ;
  await  CacheHelper.init();

  bool? isDark = CacheHelper.getDate(key: 'isDark');
  Widget widget ;
  bool? inBoarding = CacheHelper.getDate(key: 'inBoarding');
  String? token = CacheHelper.getDate(key: 'token');

  print(token);
  print(inBoarding);

  if (inBoarding != null)
    {
      if(token != null) widget = ShopLayout();
      else widget = ShopLogin();

    }else{
    widget = onBoridingScreen();
  }



  // MyApp(isDark!)
  runApp(MyApp(
    isDark: isDark,
  ));

}

class MyApp extends StatelessWidget
{

    bool? isDark  ;
    Widget? startWidget ;

  // this.isDark
  MyApp({
    this.isDark ,
    this.startWidget ,
  }) ;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>  NewsCubit()..getBusiness()..getSports()..getScience(),),
        BlocProvider(create: (BuildContext context ) => AppCubit()..changeAppMode(
          fromShared: isDark,
        ), ),
      ],
      child: BlocConsumer<AppCubit , AppStates>(
        listener: (context , state){},
        builder: (context , state ){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightThemes,
            darkTheme: darkThemes,
            themeMode: ThemeMode.light,
            home: startWidget ,
              // AppCubit.get(context).isDark ? ThemeMode.dark :

          );
        },
      ),
    );
  }
  
}

