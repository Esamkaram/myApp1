import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp2/models/shop_app/favorites_model.dart';
import 'package:myapp2/models/shop_app/favorites_model.dart';
import '../../../layout/shop_app/cubit/cubit.dart';
import '../../../layout/shop_app/cubit/states.dart';

import '../../../shared/components/components.dart';
import '../../../styles/colors.dart';

class FavoritsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context , state){
        return ConditionalBuilder(
          condition: state is! ShopLoadingGetFavoritesState,
          builder:(context) =>  ListView.separated(
              itemBuilder: (context, index) =>  buildFavItem(ShopCubit.get(context).FavoritesMode!.data!.data![index].product , context) ,
              separatorBuilder: (context, index) => myDivider(),
              itemCount: ShopCubit.get(context).FavoritesMode!.data!.data!.length),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }



}
