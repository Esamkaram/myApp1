import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp2/layout/new_app/cubit/cubit.dart';
import 'package:myapp2/layout/new_app/cubit/states.dart';
import 'package:myapp2/shared/components/components.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewStates>(
      listener: (context , state){},
      builder: (context, state){
         var list = NewsCubit.get(context).search;
        return  Scaffold(
          appBar: AppBar(
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextFilad(
                  controller: searchController,
                  type: TextInputType.text,
                  label: 'Search',
                  onChinged: (value){
                    NewsCubit.get(context).getSearch(value);
                  },
                  validate: (String value){
                    if(value.isEmpty){
                      return 'search must not br empty ';
                    }
                  },
                  preFix: Icons.search ,
                ),
              ),
              Expanded(
                child: aricaleBuilder(list, context),
              ),
            ],
          ),
        );
      },
    );
  }
}
