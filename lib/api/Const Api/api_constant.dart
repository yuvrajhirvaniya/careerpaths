class ApiConstant {
  static const String baseurl = 'https://bbc0-202-131-110-12.ngrok-free.app/web/api/';
  //login api
  static const String loginurl = '${baseurl}login.php';
  //sign-up api
  static const String signupUrl = '${baseurl}sign_up.php';
  //otp verfication for the sign-up
  static const String verificationUrl = '${baseurl}otp_verify.php';
  //send email api for the forgot password
  static const String emailForgot = '${baseurl}forget_password.php';
  //send otp api for the forgot password
  static const String forgotOtp = '${baseurl}reset_otp.php';
  //send new password api for the forgot password
  static const String forgotPassword = '${baseurl}forget_password.php';
  //for the update profile data
  static const String profileUpdate = '${baseurl}update.php';

  //for the show insititute home data
  static const String instituteData = '${baseurl}institutes.php';
  //for the showing institutes gallery
  static const String galleryData = '${baseurl}gallery.php?id=';
  //for the showing courses and it's fee structure
  static const String courseData = '${baseurl}course.php?id=';
  //for the showing faculty data
  static const String facultyData = "${baseurl}faculty.php?id=";
  //for the showing the student review
  static const String viewReviewUrl = "${baseurl}review.php?instituteId=";
  //for the give review
  static const String giveReviewUrl = "${baseurl}insert_review.php";
  //for the showing cutoffs of institute
  static const String viewMeritData = "${baseurl}merit.php?id=";

  //user profile base url
  static const String profileUrl = "https://bbc0-202-131-110-12.ngrok-free.app/web/students_profile/";
  //for the home page and institute page photo base url
  static const String frontPhoto = "https://bbc0-202-131-110-12.ngrok-free.app/web/institute_profile/";
  //for the institute gallery base url link
  static const String galleryUrl = "https://bbc0-202-131-110-12.ngrok-free.app/web/gallery/";
  // for the view review user photo base urlx
  static const String reviewPhotoUrl = "https://bbc0-202-131-110-12.ngrok-free.app/web/students_profile/";
  //for the institute facultu profile photo show
  static const String facultyPhotoUrl =
      "https://bbc0-202-131-110-12.ngrok-free.app/web/faculty/";
  //for the intrestedField photo show base url
  static const String intrestedFieldsPhoto =
      "https://bbc0-202-131-110-12.ngrok-free.app/web/intrested_field/";

  //for the give the interestedFileds
  static const String giveQuiz =
      'https://bbc0-202-131-110-12.ngrok-free.app/web/quiz/index.php';
  //for the getIntrestedFieldList
  static const String getIntrestedFieldList = '${baseurl}intrestedField.php';
}
