import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp2/modules/counter_app/counter/cubit/cubit.dart';
import 'package:myapp2/modules/counter_app/counter/cubit/states.dart';




class counterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    // var s = BlocProvider.of(context);

    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit , CounterStates>(
        listener: (context , state){
          if (state is CounterPlusState) {
            // print('plus state ${state.counter}');
          }

          if (state is CounterMinusState) {
            // print('minus state ${state.counter}');
          }
        },
        builder: (context , state){
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Counter Screen',
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: (){
                          CounterCubit.get(context).minus();
                        },
                        child:
                        Text(
                          'MINUS',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                    ),
                    Text('${CounterCubit.get(context).counter}',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        CounterCubit.get(context).plus();
                      },
                      child: Text('PLUS',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}


