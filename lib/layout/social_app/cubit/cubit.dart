import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp2/layout/social_app/cubit/states.dart';
import 'package:myapp2/models/social_app/post_model.dart';
import 'package:myapp2/models/social_app/soial_user_model.dart';
import 'package:myapp2/modules/social_app/chats/chat_screen.dart';
import 'package:myapp2/modules/social_app/feeds/feeds_screen.dart';
import 'package:myapp2/modules/social_app/new_post/newpost_screen.dart';
import 'package:myapp2/modules/social_app/settings/setting_screen.dart';
import 'package:myapp2/modules/social_app/users/userscreen.dart';
import 'package:myapp2/shared/components/constants.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SocialCubit extends Cubit<SocialStates>
{
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);


  SocialUserModel? userModel ;

  void getUserData()
  {
    emit(SocialGetUserLoadingState());

    FirebaseFirestore.instance.collection('users')
        .doc(uId)
        .get()
        .then((value) {
      // print(value.data());
      userModel = SocialUserModel.formJson(value.data()!);
      emit(SocialGetUserSuccessState());
    })
        .catchError((error) {
          emit(SocialGetUserErrorState(error.toString()));
    });

  }

  int currentIndex = 0 ;

  List<Widget> screen = [
    FeedsScreen() ,
    ChatScreen() ,
    NewPostScreen(),
    Userscreen(),
    SettingScreen(),
  ] ;

  List<String> titles = [
    'Home',
    'Chats',
    'Post',
    'Users',
    'Setting',
  ];

  void changeBottomNav(int index )
  {

    if(index == 2)
      emit(SocialNewPostStates());
    else{
      currentIndex = index ;
      emit(SocialChangeBottomNavStates());
    }


  }

  File? profileimage ;
  var picker = ImagePicker() ;


  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(
      source:ImageSource.gallery,) ;
    if (pickedFile != null)
    {
      profileimage = File(pickedFile.path);
      emit(SocialProfileImagePickedSuccessStates());
    }else{
      print('No image selected');
      emit(SocialProfileImagePickedErrorStates());
    }
  }


  File? coverimage ;



  Future<void> getCoverImage() async {
    final pickedFile = await picker.pickImage(
      source:ImageSource.gallery,) ;
    if (pickedFile != null)
    {
      coverimage = File(pickedFile.path);
      emit(SocialCoverImagePickedSuccessStates());
    }else{
      print('No image selected');
      emit(SocialCoverImagePickedErrorStates());
    }
  }



  void upLoadProfileImage({
    required String name ,
    required String phone ,
    required String bio ,
  })
  {
    emit(SocialLoadingUserUpdateStates());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileimage!.path).pathSegments.last}')
        .putFile(profileimage!)
        .then((value){
          value.ref
              .getDownloadURL()
              .then((value){
                // emit(SocialUploadProfileImageSuccessStates());
            print(value);
                updateUsers(name: name , phone: phone , bio: bio,profile: value);
      })
              .catchError((error){
                emit(SocialUploadProfileImageErrorStates());
          });
    })
        .catchError((error){
      emit(SocialUploadProfileImageErrorStates());
    });
  }



  void upLoadCoverImage({
    required String name ,
    required String phone ,
    required String bio ,
})
  {
    emit(SocialLoadingUserUpdateStates());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverimage!.path).pathSegments.last}')
        .putFile(coverimage!)
        .then((value){
      value.ref
          .getDownloadURL()
          .then((value){
        // emit(SocialUploadCoverImageSuccessStates());

        print(value);
        updateUsers(name: name , phone: phone , bio: bio,cover: value);
      })
          .catchError((error){
        emit(SocialUploadCoverImageErrorStates());
      });
    })
        .catchError((error){
      emit(SocialUploadCoverImageErrorStates());
    });
  }

  void updateUsers({
    required String name ,
    required String phone ,
    required String bio ,
    String? cover ,
    String? profile  ,

})

  {
    SocialUserModel model = SocialUserModel(
        name: name ,
        phone: phone,
        bio: bio,
        email: userModel!.email,
        uId: userModel!.uId,
        image:profile??userModel!.image,
        cover: cover??userModel!.cover,
        isEmailVerified: false ,
      ) ;

      FirebaseFirestore.instance
          .collection('users')
          .doc(userModel!.uId)
          .update(model.toMap())
          .then((value){
        getUserData();
      }).catchError((error){
        emit(SocialUserUpdateErrorStates());
      });


  }



  File? postImage ;



  Future<void> getPostImage() async {
    final pickedFile = await picker.pickImage(
      source:ImageSource.gallery,) ;
    if (pickedFile != null)
    {
      postImage = File(pickedFile.path);
      emit(SocialPostImagePickedSuccessStates());
    }else{
      print('No image selected');
      emit(SocialPostImagePickedErrorStates());
    }
  }


  void removePostImage(){
    postImage = null ;
    emit(SocialRemovePostImageStates());
  }

  void uploadPostImage({

    required String dateTime ,
    required String text ,
  })
  {
    emit(SocialCreatePostLoadingStates());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value){
      value.ref
          .getDownloadURL()
          .then((value){
        // emit(SocialUploadCoverImageSuccessStates());
        print(value);
        createPost(
          dateTime: dateTime,
          text: text,
          postImage: value,
        );
      })
          .catchError((error){
        emit(SocialCreatePostErrorStates());
      });
    })
        .catchError((error){
      emit(SocialCreatePostErrorStates());
    });
  }


  void createPost({
    required String dateTime ,
    required String text ,
    String? postImage ,

  })

  {
    emit(SocialCreatePostLoadingStates());
    PostModel model = PostModel(
      name: userModel!.name ,
      uId: userModel!.uId,
      image:userModel!.image,
      dateTime: dateTime,
      text: text ,
      postImage: postImage??''
    ) ;

    FirebaseFirestore.instance
        .collection('posts')
        .add(model.toMap())
        .then((value)
    {
          emit(SocialCreatePostSuccessStates());
    }).catchError((error){
      emit(SocialCreatePostErrorStates());
    });


  }

  List<PostModel> posts = [] ;
  List<String> postsId = [] ;
  List<int> likes = [] ;

  void getPosts()
  {
    FirebaseFirestore.instance
        .collection('posts')
        .get()
        .then((value){
          value.docs.forEach((element){
            element.reference
            .collection('likes')
            .get()
            .then((value){
              likes.add(value.docs.length);
              postsId.add(element.id);
              posts.add(PostModel.formJson(element.data()));
            })
            .catchError((error){});

          });
          emit(SocialGetPostsSuccessState());
    })
        .catchError((error){
          emit(SocialGetPostsErrorState(error.toString()));
    });
  }
  void likePost(String postId){
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(userModel!.uId)
        .set({
      'like':true,
    })
        .then((value){

          emit(SocialLikePostsSuccessState());
    })
        .catchError((error){
          emit(SocialLikePostsErrorState(error.toString()));
    });
  }

}