import 'package:flutter/material.dart';
import 'package:spare_website/app/app.locator.dart';
import 'package:spare_website/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final ScrollController scrollController = ScrollController();

  final GlobalKey homeKey = GlobalKey();
  final GlobalKey categoriesKey = GlobalKey();
  final GlobalKey brandsKey = GlobalKey();
  final GlobalKey compatibilityKey = GlobalKey();
  final GlobalKey supportKey = GlobalKey();
  final GlobalKey deliveryKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey whyVoltSpareKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  String? selectedCategoryForEnquiry;
  String? selectedBrandForEnquiry;

  void navigateToTermsAndConditions() {
    _navigationService.navigateToTermsAndConditionsView();
  }

  void navigateToPrivacyPolicy() {
    _navigationService.navigateToPrivacyPolicyView();
  }

  void scrollToSection(String section) {
    if (section == 'terms-and-conditions' || section == 'terms') {
      navigateToTermsAndConditions();
      return;
    }
    if (section == 'privacy-policy' || section == 'privacy') {
      navigateToPrivacyPolicy();
      return;
    }

    GlobalKey? targetKey;
    switch (section) {
      case 'home':
        targetKey = homeKey;
        break;
      case 'categories':
      case 'ev-parts':
      case 'petrol-parts':
        targetKey = categoriesKey;
        break;
      case 'brands':
        targetKey = brandsKey;
        break;
      case 'compatibility':
        targetKey = compatibilityKey;
        break;
      case 'support':
        targetKey = supportKey;
        break;
      case 'delivery':
        targetKey = deliveryKey;
        break;
      case 'about':
        targetKey = aboutKey;
        break;
      case 'why-voltspare':
        targetKey = whyVoltSpareKey;
        break;
      case 'contact':
        targetKey = contactKey;
        break;
    }

    if (targetKey?.currentContext != null) {
      Scrollable.ensureVisible(
        targetKey!.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    } else {
      if (section == 'home') {
        scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
        );
      }
    }
  }

  void handleCategoryEnquiry(String categoryName) {
    selectedCategoryForEnquiry = categoryName;
    notifyListeners();
    scrollToSection('contact');
  }

  void handleBrandSelect(String brandName) {
    selectedBrandForEnquiry = brandName;
    notifyListeners();
    scrollToSection('contact');
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
