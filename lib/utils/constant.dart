class StaticText {
  final String appName = 'ArkaTracker';
}

class LocalImages {
  final String arkademiLogo = 'assets/images/arkademi_logo.png';
}

class LocalLotties {
  final String emptyAnimation = 'assets/lotties/empty_animation.json';
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
}

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
