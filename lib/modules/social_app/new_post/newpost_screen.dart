import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp2/layout/social_app/cubit/cubit.dart';
import 'package:myapp2/layout/social_app/cubit/states.dart';




class NewPostScreen extends StatelessWidget {

var textControllerVal = TextEditingController() ;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            title: Text('Create Post' , ) ,
            actions: [
          TextButton(onPressed: () {
            var now = DateTime.now();

            if (SocialCubit
                .get(context)
                .postImage == null) {
              SocialCubit.get(context).createPost(
                  dateTime: now.toString(), text: textControllerVal.text);
            } else{
              SocialCubit.get(context).uploadPostImage(dateTime: now.toString(), text: textControllerVal.text);
            }
          }
        , child: Text('POST',
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'Jannah' ,
            ),
            ),),

            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children:
              [
                if(state is SocialCreatePostLoadingStates)
                LinearProgressIndicator(),
                if(state is SocialCreatePostLoadingStates)
                SizedBox(height: 20.0 ,),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage(
                        '${SocialCubit.get(context).userModel!.image}',),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: Text('${SocialCubit.get(context).userModel!.name}',
                        style: TextStyle(
                          height: 1.4,
                        ),),
                    ),
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: textControllerVal ,
                    decoration: InputDecoration(
                        hintText: 'what is on your mind,',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                if (SocialCubit.get(context).postImage != null)
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      height: 140.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0 , ),
                        image: DecorationImage(
                          image:  FileImage(SocialCubit.get(context).postImage!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 20.0,
                      child: IconButton(
                        onPressed: (){
                          SocialCubit.get(context).removePostImage() ;
                        },
                        icon: Icon(
                          Icons.close,
                          size: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: (){
                            SocialCubit.get(context).getPostImage();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.image,),
                              Text('Add Photo',),
                            ],
                          ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: (){},
                          child:
                              Text('# tags',),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}
