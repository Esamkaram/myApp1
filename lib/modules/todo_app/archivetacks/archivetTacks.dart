import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp2/shared/components/components.dart';
import 'package:myapp2/shared/cubit/cubit.dart';
import 'package:myapp2/shared/cubit/states.dart';

class archivetTacks extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
      listener: (context , state){},
      builder: (context, state){
        var tasks = AppCubit.get(context).archivedTasks;
        return buildConditional(
          tasks : tasks ,
        ) ;
      },

    );

  }
}
