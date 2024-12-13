
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp2/modules/new_app/webview/webview_screen.dart';

import 'package:myapp2/shared/cubit/cubit.dart';

import '../../layout/shop_app/cubit/cubit.dart';
import '../../models/shop_app/favorites_model.dart';
import '../../styles/colors.dart';

 Widget defaultButton({
  double? width = double.infinity ,
  Color? background = Colors.blue,
  required Function function ,
  required String text ,
  bool? isUpper = true ,
})=>
    Container(
    width: width ,
    height: 40.0,
    child: MaterialButton(
      onPressed: (){
        function();
      },
      child: Text(
          isUpper! ?  text.toUpperCase() : text ,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0,),
      color: background ,
    ) ,
);

Widget defaultTextFilad({
 required TextEditingController? controller,
 required TextInputType? type ,
 required String? label ,
  Function? onSubmit ,
   Function? onChinged ,
  Function? onTap ,
  bool? isPassword = false ,
  bool? isClickable = true ,
 required Function validate ,
  IconData? preFix,
  IconData? suffix ,
  Function? iconSuffixPressed ,


})=>TextFormField(
controller: controller,
keyboardType: type ,
obscureText: isPassword!,
onFieldSubmitted: (s){
  onSubmit!(s);
} ,
onChanged: (s){
  onChinged!(s);
},
onTap: (){
  onTap!();
},
enabled: isClickable!,
decoration: InputDecoration(
labelText: label ,
prefixIcon: Icon(
preFix,
),
suffixIcon: suffix != null ?  IconButton(
onPressed: (){iconSuffixPressed!();} ,
  icon:   Icon(
      suffix ,
  ),
): null ,
border: OutlineInputBorder(),
),
validator: (s){
  validate(s);
},
);

Widget defaultAppBar({
  required BuildContext context ,
  String? title ,
  List<Widget>? actions,
}) => AppBar(
  leading: IconButton(
    onPressed: (){
      Navigator.pop(context);
    },
    icon: Icon(Icons.arrow_back_ios_new),
  ),
  title: Text(title! , ) ,
  actions: actions!,
);


Widget defaultTextButton({
  required Function function ,
  required String  text,
}) => TextButton(
  onPressed:function()
  ,
  child: Text(text.toUpperCase(),),
) ;

Widget buildTaskItem(Map model , context )=> Dismissible(
  key: Key(model['id'].toString()),
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 40.0,
          child: Text('${model['TIME']}',
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${model['TITLE']}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 9.0,
              ),
              Text('${model['DATE']}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        IconButton(icon:
            Icon(
              Icons.check_box,
              color: Colors.green,
            ),
            onPressed: () {
          AppCubit.get(context).updateDate(status: 'T', id: model['id'],) ;
            } , ),
        SizedBox(
          width: 20.0,
        ),
        IconButton(icon:
        Icon(
            Icons.archive ,
          color: Colors.black26,
        ),
            onPressed:() {
            AppCubit.get(context).updateDate(status: 'R', id: model['id'],) ;
            }),
  
      ],
    ),
  ),
  onDismissed: (direction){
    AppCubit.get(context).deleteDate(id: model['id'],);

  },
);

Widget buildConditional({
  required List<Map> tasks
})=> ConditionalBuilder(
  condition: tasks.length > 0  ,
  builder: (context)=>ListView.separated(
      itemBuilder: (context , index) => buildTaskItem(
          tasks[index] , context
      )
      , separatorBuilder: (context, index) => Padding(
    padding: const EdgeInsetsDirectional.only(
      start: 20.0,
    ),
    child: Container(
      width:double.infinity ,
      height: 1.0,
      color: Colors.grey[300],
    ),
  ),
      itemCount: tasks.length
  ),
  fallback: (context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.menu,
          size: 100.0,
          color: Colors.grey[300],

        ),
        Text(
          'No Tasks data',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.grey[300],
          ),
        ),
      ],
    ),
  ) ,
) ;

Widget buildArticleItem(article , context) => InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']));
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0,),
            image: DecorationImage(
              image: NetworkImage('https://images.pexels.com/photos/6044824/pexels-photo-6044824.jpeg',),
              fit: BoxFit.cover,

            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(
                    color: Colors.grey[400],

                  ),
                ),
              ],
            ),
          ),
        ),
      ],

    ),
  ),
);


Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width:double.infinity ,
    height: 1.0,
    color: Colors.grey[300],
  ),
) ;


Widget aricaleBuilder(list , context) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) => ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context,index) => buildArticleItem(list[index], context),
      separatorBuilder: (context,index) => myDivider() ,
      itemCount: list.length),
  fallback: (context) => Center(child: CircularProgressIndicator()),
);


void navigateTo(context , widget ) => Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => widget ,
  ),
);

void navigateAndFinish(context, widget) =>
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget ,
    ), (route){
      return false;
    });

void showToast({
  required String message ,
  required ToastStates state ,

})=> Fluttertoast.showToast(
  msg: message ,
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.BOTTOM,
  timeInSecForIosWeb: 5,
  backgroundColor: chooseToastColor(state),
  textColor: Colors.white,
  fontSize: 16.0,
) ;

enum ToastStates {SUCCESS,ERROR,WARNING}
Color chooseToastColor(ToastStates state){
  Color color ;
  switch(state){
    case ToastStates.SUCCESS:
      color = Colors.green;
    break;
    case ToastStates.ERROR:
      color = Colors.redAccent;
      break;
    case ToastStates.WARNING:
      color = Colors.deepOrange ;
      break;
  }
  return color ;
}


Widget buildFavItem( model , context , {bool isOldPrice = true,}) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    height: 120.0,
    child: Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
              image: NetworkImage(model!.image!),
              width: 120.0,
              height: 120.0 ,

            ),
            if(model.discount != '0.0' && isOldPrice)
              Container(
                color: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text('DISCOUNT',
                  style: TextStyle(
                    fontSize:8.0,
                    color: Colors.white,
                  ),),
              ),
          ],
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name! ,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.0,
                  height: 1.3,

                ),

              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    model.price!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: defaultColors ,

                    ),

                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  if(model.discount != '0.0' && isOldPrice )
                    Text(
                      model.oldPrice!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ) ,
                  Spacer(),
                  IconButton(
                    onPressed: (){
                      ShopCubit.get(context).changeFavorites(model!.id!) ;
                    }, icon:
                  CircleAvatar(
                    radius: 15.0,
                    backgroundColor:
                    ShopCubit.get(context).favorites[model!.id]!
                        ? defaultColors
                        : Colors.grey ,
                    child: Icon(
                      Icons.favorite_border,size: 14.0 ,
                      color: Colors.white,
                    ) ,
                  ),)
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);
