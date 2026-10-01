import 'package:flutter/material.dart';
import 'package:spare_website/app/app.locator.dart';
import 'package:spare_website/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TermsAndConditionsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final ScrollController scrollController = ScrollController();

  void navigateToHome() {
    _navigationService.navigateToHomeView();
  }

  void navigateToPrivacyPolicy() {
    _navigationService.navigateToPrivacyPolicyView();
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
