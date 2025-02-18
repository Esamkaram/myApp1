
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp2/shared/components/components.dart';
import 'package:myapp2/shared/components/constants.dart';
import 'package:myapp2/shared/cubit/cubit.dart';
import 'package:myapp2/shared/cubit/states.dart';

class newTacks extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
      listener: (context , state){},
      builder: (context, state){
        var tasks = AppCubit.get(context).newTasks;
        return buildConditional(
            tasks : tasks ,
        ) ;
        },

    );

  }
}
