import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:spare_website/app/app.locator.dart';
import 'package:spare_website/app/app.router.dart';
import 'package:spare_website/ui/views/terms_and_conditions/terms_and_conditions_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() {
  TermsAndConditionsViewModel getModel() => TermsAndConditionsViewModel();

  group('TermsAndConditionsViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    test('navigateToHome navigates to home view', () {
      final navigationService = getAndRegisterNavigationService();
      final model = getModel();
      model.navigateToHome();
      verify(navigationService.navigateToHomeView());
    });

    test('navigateToPrivacyPolicy navigates to privacy policy view', () {
      final navigationService = getAndRegisterNavigationService();
      final model = getModel();
      model.navigateToPrivacyPolicy();
      verify(navigationService.navigateToPrivacyPolicyView());
    });
  });
}
