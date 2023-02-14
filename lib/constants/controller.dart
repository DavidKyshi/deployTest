// import 'package:kyshi_operations_dashboard/helper/screen_export.dart';

// MenuController menuController = MenuController.instance;
// NavigationController navigationController = NavigationController.instance;

import 'package:flutter/material.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/screens/offers_management/offers_management.dart';

import '../screens/offers_management/create_an_offer_screen.dart';
import '../screens/payout_transaction/payout_transaction.dart';

class PAGES {
  static const int dashbaord = 0;
  static const int profile = 1;
  static const int home = 2;
  static const int createAnOfferScreen = 3;
  static const int payOutTransaction = 4;
}

class PAGE {
  final int index;
  final String title;
  final Widget page;
  final String? icon;
  final double? width;
  final double? height;
  final showInSideBar;
  PAGE(
      {required this.index,
      required this.title,
      required this.page,
      this.width,
      this.height,
      this.icon,
      this.showInSideBar = true});
}

class _State {
  int currentPage = 0;
  PageController pageController = PageController();
  List<PAGE> pages = [
    PAGE(
        index: PAGES.dashbaord,
        title: "User accounts",
        page: const UserAccountScreen(),
        icon: userAccountIcon,
        width: 24,
        height: 24),
    PAGE(
        index: PAGES.profile,
        title: "Offer Management",
        page: OffersManagementScreen(),
        icon: offerManagementIcon,
        width: 20,
        height: 20),
    PAGE(
        index: PAGES.home,
        title: "Page 4",
        page: const UserAccountTab(),
        showInSideBar: false),
    PAGE(
        index: PAGES.createAnOfferScreen,
        title: "page5",
        page: CreateAnOfferScreen(),
        showInSideBar: false),
    PAGE(
        index: PAGES.payOutTransaction,
        title: "Payout Transactions",
        page: const PayOutTransactionScreen(),
        icon: payOutTransactionIcon,
        width: 24,
        height: 24),
  ];
}

class PageViewProvider extends _State with ChangeNotifier {
  onPageChange(int page) {
    currentPage = page;
    notifyListeners();
  }

  void gotoPage(int page) {
    pageController.jumpToPage(page);
    notifyListeners();
  }
}
