import 'package:myapp2/models/shop_app/changeFavoritesModels.dart';
import 'package:myapp2/models/shop_app/login_model.dart';

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

class ShopLoadingGetFavoritesState extends ShopStates{}

class ShopSuccessGetFavoritesState extends ShopStates{}

class ShopErrorGetFavoritesState extends ShopStates{
  final String error ;
  ShopErrorGetFavoritesState(this.error);

}




class ShopLoadingGetProfileState extends ShopStates{}

class ShopSuccessGetProfileState extends ShopStates{
  final ShopLoginModel? loginModel ;

  ShopSuccessGetProfileState(this.loginModel);

}

class ShopErrorGetProfileState extends ShopStates{
  final String error ;
  ShopErrorGetProfileState(this.error);

}



class ShopLoadingUpdateProfileState extends ShopStates{}

class ShopSuccessUpdateProfileState extends ShopStates{
  final ShopLoginModel? loginModel ;

  ShopSuccessUpdateProfileState(this.loginModel);

}

class ShopErrorUpdateProfileState extends ShopStates{
  final String error ;
  ShopErrorUpdateProfileState(this.error);

}