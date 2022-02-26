import 'package:flutter/material.dart';

class Utils {
  static GlobalKey<NavigatorState> mainListNav = GlobalKey();
  static GlobalKey<NavigatorState> mainAppNav = GlobalKey();
  static const Color mainColor = Color(0xFFFF0F7E);
  static const Color mainDark = Color(0xFF980346);
  static const String donutLogoWhiteNoText =
      'https://romanejaquez.github.io/flutter-codelab4/assets/donut_shop_logowhite_notext.png';
  static const String donutLogoWhiteText =
      'https://romanejaquez.github.io/flutter-codelab4/assets/donut_shop_text_reversed.png';
  static const String donutLogoRedText =
      'https://romanejaquez.github.io/flutter-codelab4/assets/donut_shop_text.png';
  static const String donutTitleFavorites =
      'https://romanejaquez.github.io/flutter-codelab4/assets/donut_favorites_title.png';
  static const String donutTitleMyDonuts =
      'https://romanejaquez.github.io/flutter-codelab4/assets/donut_mydonuts_title.png';
  static const String donutPromo1 =
      'https://romanejaquez.github.io/flutter-codelab4/assets/donut_promo1.png';
  static const String donutPromo2 =
      'https://romanejaquez.github.io/flutter-codelab4/assets/donut_promo2.png';
  static const String donutPromo3 =
      'https://romanejaquez.github.io/flutter-codelab4/assets/donut_promo3.png';
}

class DonutBottomBarSelectionService extends ChangeNotifier {
  String? tabSelection = "main";

  void setTabSelection(String selection) {
    Utils.mainListNav.currentState!.pushReplacementNamed("/" + selection);
    tabSelection = selection;
    notifyListeners();
  }
}

class DonutPage {
  String? imgUrl;
  String? logoImgUrl;
  DonutPage({this.imgUrl, this.logoImgUrl});
}

class DonutFilterBarItem {
  String? id;
  String? label;
  DonutFilterBarItem({
    this.id,
    this.label,
  });
}

class DonutService extends ChangeNotifier {
  List<DonutFilterBarItem> filterBarItems = [
    DonutFilterBarItem(id: "classic", label: "Classic"),
    DonutFilterBarItem(id: "sprinkled", label: "Sprinkled"),
    DonutFilterBarItem(id: "stuffed", label: "Stuffed")
  ];

  String? selectDonutType;

  DonutService() {
    selectDonutType = filterBarItems.first.id;
  }

  void filteredDonutsByType(String type) {
    selectDonutType = type;
    notifyListeners();
  }
}
