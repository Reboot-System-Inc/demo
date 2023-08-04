// ignore_for_file: constant_identifier_names

class APIRoute {
  static const String DUMMY_PERSON = 'https://i.pravatar.cc/300';
  static const String WEB_URL = "";

  static const String BASE_URL = "https://senaiyah-api.b2gsoft.xyz/";
  // static const String BASE_URL = "https://api.senaiyah.com/";
  // static const String BASE_URL_LOCAL = "http://192.168.68.118:3697/";
  static const String API_V1 = "api/v1/";

  static const String SIGNUP = "${API_V1}customer/registration";
  static const String LIGNIN_SEND_OTP = "${API_V1}customer/phone/login";
  static const String LIGNIN_CHECK_OTP = "${API_V1}customer/phone/otp-check";
  static const String PROFILE_VIEW = "${API_V1}customer/profile/view";
  static const String PROFILE_UPDATE = "${API_V1}customer/profile/update";
  static const String IMAGE_UPLOAD = "${API_V1}admin/image/upload";

  static const String DEVICE_TOKEN = "${API_V1}customer/device-token/set-up";

  //<<----------------AutoCare------------------>>

  static const String HOME = "${API_V1}home-page/view";

  //'<<----------------Car Service------------------>>

  static const String CAR_SERVICE = "${API_V1}car/service/find-value";
  static const String SERVICE_PROBLEM_ALL =
      "${API_V1}car/admin/service/problem/all";

  static const String SUBMIT_PROBLEMS =
      "${API_V1}car/user/service/problem/amount/vendor/view";

  static const String BOOK_VENDOR_PROBLEMS =
      "${API_V1}car/user/problem/package-others/submit";

  static const String VENDOR_VIEWS = "${API_V1}vendor/views";

  //'<<----------------Car Service------------------>>

  static const String MESSAGE_LIST = "${API_V1}socket/message/list";
  static const String MESSAGE_SEND = "${API_V1}socket/message/send";
  static const String MESSAGE_VIEW = "${API_V1}socket/message/view/";

  //'<<----------------Notification------------------>>

  static const String NOTIFICATION =
      "${API_V1}car/vendor/submitted/others-problem/user/un-accepted/list/view";
  static const String ACCEPTED_OTHER_PROBLEM =
      "${API_V1}car/vendor/submitted/others-problem/amount-time/user/accept";
  static const String ON_GOING_PACKAGE =
      "${API_V1}car/user/submitted/problem/vendor-accepted/list/view-by/user";
  static const String COMPLETED_PACKAGE =
      "${API_V1}car/user/completed/all-problem/list";
  static const String SUBMIT_REVIEW =
      "${API_V1}car/service/rating-review/create";

  //'<<----------------Profile------------------>>
  static const String CAR_SERVICE_VIEW_ALL =
      "${API_V1}car/customer/service/all";
  static const String CAR_SERVICE_ADD = "${API_V1}car/customer/service/create";
  static const String CAR_SERVICE_UPDATE =
      "${API_V1}car/customer/service/update";

  //'<<----------------Car Parts------------------>>
  static const String CAR_PARTS_LIST = "${API_V1}car-parts/car-wise/part/view/";
  static const String CAR_PARTS_BIT = "${API_V1}car-parts/order/by-customer";

  //'<<----------------Order------------------>>
  static const String BIDDING_CREATE =
      "${API_V1}car-parts/biding/create/by-customer";
  static const String MY_BIDS = "${API_V1}car-parts/biding/by-customer";
  static const String ORDER_CREATE =
      "${API_V1}car-parts/order/by-customer/create";
}
