// import 'package:kyshi_operations_dashboard/helper/screen_export.dart';

// MenuController menuController = MenuController.instance;
// NavigationController navigationController = NavigationController.instance;

import 'package:flutter/material.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/screens/offers_management/offers_management.dart';
import 'package:kyshi_operations_dashboard/screens/wallet_management/all_wallets.dart';
import 'package:kyshi_operations_dashboard/screens/wallet_management/wallet_management_tab.dart';

import '../screens/authentication/welcome_back.dart';
import '../screens/offers_management/create_an_offer_screen.dart';
import '../screens/over_view_page/over_view.dart';
import '../screens/payout_transaction/payout_transaction.dart';
import '../widgets/create_an_offer_screen_widget.dart';

class PAGES {
  static const int dashbaord = 0;
  static const int profile = 1;
  static const int home = 2;
  static const int createAnOfferScreen = 3;
  static const int payOutTransaction = 4;
  static const int welcomeScreen = 5;
  static const int walletManagement = 6;
  static const int overView = 7;
  static const int testing = 8;
}

class PAGE {
  int index = 0;
  final String title;
  final Widget page;
  final String? icon;
  final String? inactiveIcon;
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
      this.inactiveIcon,
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
        inactiveIcon: inactiveUserAccount,
        width: 28,
        height: 28),
    PAGE(
        index: PAGES.profile,
        title: "Offer Management",
        page: OffersManagementScreen(),
        inactiveIcon: inactiveOfferManagement,
        icon: offerManagementIcon,
        width: 24,
        height: 24),
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
      inactiveIcon: inactivePayoutTransaction,
      width: 24,
      height: 24,
      //showInSideBar: false
    ),
    PAGE(
        index: PAGES.welcomeScreen,
        title: "page7",
        page: const WelcomeBack(
          goOtpScreen: false,
        ),
        showInSideBar: false),
    PAGE(
      index: PAGES.walletManagement,
      title: "Wallet Management",
      page: const WalletTab(),
      icon: walletManagementIcon,
      inactiveIcon: inactiveWalletTransaction,
      width: 24,
      height: 24,
      //showInSideBar: false
    ),
    PAGE(
      index: PAGES.overView,
      title: "Overview",
      page: const OverViewScreen(),
      icon: overViewIcon,
      inactiveIcon: inactiveOverview,
      width: 28,
      height: 28,
    ),
    PAGE(index: PAGES.testing, title: 'test', page: FruitSearch(), showInSideBar: false)
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
