class StaticText {
  final String appName = 'ArkaTracker';
}

class LocalImages {
  final String arkademiLogo = 'assets/images/arkademi_logo.png';
}

class LocalLotties {
  final String emptyAnimation = 'assets/lotties/empty_animation.json';
  final String nextGenAnimation = 'assets/lotties/nextgen_animation.json';
  final String attendanceMadeEasyAnimation =
      'assets/lotties/attendance_easy_animation.json';
  final String efficientAttendanceAnimation =
      'assets/lotties/efficient_attendance_animation.json';
}

class LocalIcons {
  final String employeeIcon = 'assets/icons/employee_icon.png';
  final String employeeIconActive = 'assets/icons/employee_selected_icon.png';
  final String homeIcon = 'assets/icons/home_icon.png';
  final String homeIconActive = 'assets/icons/home_selected_icon.png';
  final String inboxIcon = 'assets/icons/inbox_icon.png';
  final String inboxIconActive = 'assets/icons/inbox_selected_icon.png';
  final String userIcon = 'assets/icons/user_icon.png';
  final String userIconActive = 'assets/icons/user_selected_icon.png';
  final String requestIcon = 'assets/icons/request_icon.png';
  final String requestIconActive = 'assets/icons/request_selected_icon.png';
  final String backIcon = 'assets/icons/arrow_left_icon.png';
  final String nextIcon = 'assets/icons/arrow_right_icon.png';
  final String eyeIcon = 'assets/icons/eye_icon.png';
  final String eyeHideIcon = 'assets/icons/eye_hide_icon.png';
  final String googleIcon = 'assets/icons/google_icon.png';
  final String appleIcon = 'assets/icons/apple_icon.png';
}

List introductionItems = [
  {
    "title": "Efficient Attendance Management",
    "subtitle": "Streamline Your Attendance Process",
    "description":
        "Welcome to our state-of-the-art attendance application designed to simplify and automate your attendance tracking. Whether you're managing a small team or a large organization, our app provides a user-friendly interface, real-time updates, and comprehensive reporting tools to ensure accurate and efficient attendance management. Say goodbye to manual tracking and hello to seamless operations.",
    "lotties": LocalLotties().efficientAttendanceAnimation
  },
  {
    "title": "Attendance Made Easy",
    "subtitle": "Track, Manage, and Report with Ease",
    "description":
        "Discover a smarter way to handle attendance with our intuitive application. From clocking in and out to generating detailed attendance reports, our app covers all your needs. With features like automatic notifications, leave management, and data analytics, you can stay on top of attendance without any hassle. Experience the convenience of digital attendance today.",
    "lotties": LocalLotties().attendanceMadeEasyAnimation
  },
  {
    "title": "Next-Gen Attendance System",
    "subtitle": "Accuracy, Efficiency, and Insight",
    "description":
        "Introducing the next generation of attendance tracking. Our application offers advanced features such as biometric integration, geo-fencing, and customizable attendance policies to meet the unique requirements of your organization. Gain valuable insights with our analytical tools and ensure compliance with ease. Upgrade your attendance management and drive productivity with our innovative solution.",
    "lotties": LocalLotties().nextGenAnimation
  }
];

List bottomNavigationItems = [
  {
    'icon': LocalIcons().homeIcon,
    'iconActive': LocalIcons().homeIconActive,
    'label': 'Home',
  },
  {
    'icon': LocalIcons().employeeIcon,
    'iconActive': LocalIcons().employeeIconActive,
    'label': 'Employee',
  },
  {
    'icon': LocalIcons().requestIcon,
    'iconActive': LocalIcons().requestIconActive,
    'label': 'Request',
  },
  {
    'icon': LocalIcons().inboxIcon,
    'iconActive': LocalIcons().inboxIconActive,
    'label': 'Inbox',
  },
  {
    'icon': LocalIcons().userIcon,
    'iconActive': LocalIcons().userIconActive,
    'label': 'User',
  },
];

List loginSocialItems = [
  {
    'icon': LocalIcons().googleIcon,
    'label': 'Google',
  },
  {
    'icon': LocalIcons().appleIcon,
    'label': 'Apple',
  },
];
