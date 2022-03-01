// ignore_for_file: avoid_function_literals_in_foreach_calls

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
  static List<DonutModel> donuts = [
    DonutModel(
        imgUrl:
            'https://romanejaquez.github.io/flutter-codelab4/assets/donutclassic/donut_classic1.png',
        name: 'Strawberry Sprinkled Glazed',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce blandit, tellus condimentum cursus gravida, lorem augue venenatis elit, sit amet bibendum quam neque id sapien.',
        price: 1.99,
        type: 'classic'),
    DonutModel(
      imgUrl:
          'https://romanejaquez.github.io/flutter-codelab4/assets/donutclassic/donut_classic2.png',
      name: 'Chocolate Glazed Doughnut',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce blandit, tellus condimentum cursus gravida, lorem augue venenatis elit, sit amet bibendum quam neque id sapien.',
      price: 2.99,
      type: 'classic',
    ),
    DonutModel(
        imgUrl:
            'https://romanejaquez.github.io/flutter-codelab4/assets/donutclassic/donut_classic3.png',
        name: 'Chocolate Dipped Doughnut',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce blandit, tellus condimentum cursus gravida, lorem augue venenatis elit, sit amet bibendum quam neque id sapien.',
        price: 2.99,
        type: 'classic'),
    DonutModel(
        imgUrl:
            'https://romanejaquez.github.io/flutter-codelab4/assets/donutclassic/donut_classic4.png',
        name: 'Cinamon Glazed Glazed',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce blandit, tellus condimentum cursus gravida, lorem augue venenatis elit, sit amet bibendum quam neque id sapien.',
        price: 2.99,
        type: 'classic'),
    DonutModel(
        imgUrl:
            'https://romanejaquez.github.io/flutter-codelab4/assets/donutclassic/donut_classic5.png',
        name: 'Sugar Glazed Doughnut',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce blandit, tellus condimentum cursus gravida, lorem augue venenatis elit, sit amet bibendum quam neque id sapien.',
        price: 1.99,
        type: 'classic'),
    DonutModel(
        imgUrl:
            'https://romanejaquez.github.io/flutter-codelab4/assets/donutsprinkled/donut_sprinkled1.png',
        name: 'Halloween Chocolate Glazed',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce blandit, tellus condimentum cursus gravida, lorem augue venenatis elit, sit amet bibendum quam neque id sapien.',
        price: 2.99,
        type: 'sprinkled'),
    DonutModel(
        imgUrl:
            'https://romanejaquez.github.io/flutter-codelab4/assets/donutsprinkled/donut_sprinkled2.png',
        name: 'Party Sprinkled Cream',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce blandit, tellus condimentum cursus gravida, lorem augue venenatis elit, sit amet bibendum quam neque id sapien.',
        price: 1.99,
        type: 'sprinkled'),
    DonutModel(
        imgUrl:
            'https://romanejaquez.github.io/flutter-codelab4/assets/donutsprinkled/donut_sprinkled3.png',
        name: 'Chocolate Glazed Sprinkled',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce blandit, tellus condimentum cursus gravida, lorem augue venenatis elit, sit amet bibendum quam neque id sapien.',
        price: 1.99,
        type: 'sprinkled'),
    DonutModel(
        imgUrl:
            'https://romanejaquez.github.io/flutter-codelab4/assets/donutsprinkled/donut_sprinkled4.png',
        name: 'Strawbery Glazed Sprinkled',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce blandit, tellus condimentum cursus gravida, lorem augue venenatis elit, sit amet bibendum quam neque id sapien.',
        price: 2.99,
        type: 'sprinkled'),
    DonutModel(
        imgUrl:
            'https://romanejaquez.github.io/flutter-codelab4/assets/donutsprinkled/donut_sprinkled5.png',
        name: 'Reese\'s Sprinkled',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce blandit, tellus condimentum cursus gravida, lorem augue venenatis elit, sit amet bibendum quam neque id sapien.',
        price: 3.99,
        type: 'sprinkled'),
    DonutModel(
        imgUrl:
            'https://romanejaquez.github.io/flutter-codelab4/assets/donutstuffed/donut_stuffed1.png',
        name: 'Brownie Cream Doughnut',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce blandit, tellus condimentum cursus gravida, lorem augue venenatis elit, sit amet bibendum quam neque id sapien.',
        price: 1.99,
        type: 'stuffed'),
    DonutModel(
        imgUrl:
            'https://romanejaquez.github.io/flutter-codelab4/assets/donutstuffed/donut_stuffed2.png',
        name: 'Jelly Stuffed Doughnut',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce blandit, tellus condimentum cursus gravida, lorem augue venenatis elit, sit amet bibendum quam neque id sapien.',
        price: 2.99,
        type: 'stuffed'),
    DonutModel(
        imgUrl:
            'https://romanejaquez.github.io/flutter-codelab4/assets/donutstuffed/donut_stuffed3.png',
        name: 'Caramel Stuffed Doughnut',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce blandit, tellus condimentum cursus gravida, lorem augue venenatis elit, sit amet bibendum quam neque id sapien.',
        price: 2.59,
        type: 'stuffed'),
    DonutModel(
        imgUrl:
            'https://romanejaquez.github.io/flutter-codelab4/assets/donutstuffed/donut_stuffed4.png',
        name: 'Maple Stuffed Doughnut',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce blandit, tellus condimentum cursus gravida, lorem augue venenatis elit, sit amet bibendum quam neque id sapien.',
        price: 1.99,
        type: 'stuffed'),
    DonutModel(
        imgUrl:
            'https://romanejaquez.github.io/flutter-codelab4/assets/donutstuffed/donut_stuffed5.png',
        name: 'Glazed Jelly Stuffed Doughnut',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce blandit, tellus condimentum cursus gravida, lorem augue venenatis elit, sit amet bibendum quam neque id sapien.',
        price: 1.59,
        type: 'stuffed')
  ];
}

class DonutBottomBarSelectionService extends ChangeNotifier {

  String? tabSelection = 'main';

  void setTabSelection(String selection) {
    Utils.mainListNav.currentState!.pushReplacementNamed('/' + selection);
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
    DonutFilterBarItem(id: 'classic', label: 'Classic'),
    DonutFilterBarItem(id: 'sprinkled', label: 'Sprinkled'),
    DonutFilterBarItem(id: 'stuffed', label: 'Stuffed'),
  ];

  String? selectedDonutType;
  List<DonutModel> filteredDonuts = [];


  late DonutModel selectedDonut;

  DonutModel getSelecteDonut() {
    return selectedDonut;
  }

  void onDonutSelected(DonutModel donut) {
    selectedDonut = donut;
    Utils.mainAppNav.currentState!.pushNamed('/details');
  }

  DonutService() {
    selectedDonutType = filterBarItems.first.id;
    filteredDonutsByType(selectedDonutType!);
  }

  void filteredDonutsByType(String type) {
    selectedDonutType = type;
    filteredDonuts = Utils.donuts.where(
      (d) => d.type == selectedDonutType).toList();

    notifyListeners();
  }
}

class DonutModel {
  String? imgUrl;
  String? name;
  String? description;
  double? price;
  String? type;
  DonutModel({
    this.imgUrl,
    this.name,
    this.description,
    this.price,
    this.type,
  });
}

class DonutShoppingCartService extends ChangeNotifier {

  List<DonutModel> cartDonuts = [];

  void addToCart(DonutModel donut) {
    cartDonuts.add(donut);
    notifyListeners();
  }

  void removeFromCart(DonutModel donut) {
    cartDonuts.removeWhere((d) => d.name == donut.name);
    notifyListeners();
  }

  void clearCart() {
    cartDonuts.clear();
    notifyListeners();
  }

  double getTotal() {
    double cartTotal = 0.0;
    cartDonuts.forEach((element) {
      cartTotal += element.price!;
    });

    return cartTotal;
  }

  bool isDonutInCart(DonutModel donut) {
    return cartDonuts.any((d) => d.name == donut.name);
  }
}
