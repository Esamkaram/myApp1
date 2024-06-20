
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp2/layout/new_app/cubit/cubit.dart';
import 'package:myapp2/layout/new_app/cubit/states.dart';
import 'package:myapp2/shared/components/components.dart';

class SeienceScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var list = NewsCubit.get(context).science;
    return  BlocConsumer<NewsCubit , NewStates>(
      listener: (context, state){},
      builder: (context , state){
        return aricaleBuilder(list , context);
      },
    );
  }
}
