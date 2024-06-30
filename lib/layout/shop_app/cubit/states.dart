import 'package:myapp2/models/shop_app/changeFavoritesModels.dart';

abstract class ShopStates{}

class ShopInitialState extends ShopStates{}

class ShopChangeBottomNavState extends ShopStates{}


class ShopLoadingHomeDataState extends ShopStates{}

class ShopSuccessHomeDataState extends ShopStates{}

class ShopErrorHomeDataState extends ShopStates{
  final String error ;
  ShopErrorHomeDataState(this.error);

}


class ShopSuccessCATEGORIESDataState extends ShopStates{}

class ShopErrorCATEGORIESDataState extends ShopStates{
  final String error ;
  ShopErrorCATEGORIESDataState(this.error);

}


class ShopChangeFAVORITESDataState extends ShopStates{}

class ShopSuccessChangeFAVORITESDataState extends ShopStates{
  final  ChangeFavoritesModel model ;

  ShopSuccessChangeFAVORITESDataState(this.model);

}

class ShopErrorChangeFAVORITESDataState extends ShopStates{
  final String error ;
  ShopErrorChangeFAVORITESDataState(this.error);

}