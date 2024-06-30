import 'package:myapp2/shared/components/components.dart';

import '../../modules/shop_app/login/shop_login.dart';
import '../network/local/cach_helper.dart';

void signOut(context)
{
  CacheHelper.removeDate(key: 'token',).then((value) {
    if (value) {
      navigateAndFinish(context, ShopLogin(),);
    }
  });
}

void printFullText(String text){
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String? token = '' ;