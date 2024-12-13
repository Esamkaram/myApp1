abstract  class  SocialStates {}

class SocialInitialState extends SocialStates {}
class SocialGetUserLoadingState extends SocialStates {}
class SocialGetUserSuccessState extends SocialStates {}
class SocialGetUserErrorState extends SocialStates {
  final String error ;
  SocialGetUserErrorState(this.error);
}


class SocialChangeBottomNavStates extends SocialStates{}

class SocialNewPostStates extends SocialStates{}

class SocialProfileImagePickedSuccessStates extends SocialStates{}
class SocialProfileImagePickedErrorStates extends SocialStates{}

class SocialCoverImagePickedSuccessStates extends SocialStates{}
class SocialCoverImagePickedErrorStates extends SocialStates{}


class SocialUploadProfileImageSuccessStates extends SocialStates{}
class SocialUploadProfileImageErrorStates extends SocialStates{}

class SocialUploadCoverImageSuccessStates extends SocialStates{}
class SocialUploadCoverImageErrorStates extends SocialStates{}

class SocialLoadingUserUpdateStates extends SocialStates{}
class SocialUserUpdateErrorStates extends SocialStates{}

//create post
class SocialCreatePostLoadingStates extends SocialStates{}
class SocialCreatePostSuccessStates extends SocialStates{}
class SocialCreatePostErrorStates extends SocialStates{}

class SocialPostImagePickedSuccessStates extends SocialStates{}
class SocialPostImagePickedErrorStates extends SocialStates{}
class SocialRemovePostImageStates extends SocialStates{}

// Get All Posts
class SocialGetPostsLoadingState extends SocialStates {}
class SocialGetPostsSuccessState extends SocialStates {}
class SocialGetPostsErrorState extends SocialStates {
  final String error ;
  SocialGetPostsErrorState(this.error);
}

//Like posts

class SocialLikePostsSuccessState extends SocialStates {}
class SocialLikePostsErrorState extends SocialStates {
  final String error ;
  SocialLikePostsErrorState(this.error);
}
