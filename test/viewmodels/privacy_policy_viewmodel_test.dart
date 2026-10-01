import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:spare_website/app/app.locator.dart';
import 'package:spare_website/app/app.router.dart';
import 'package:spare_website/ui/views/privacy_policy/privacy_policy_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() {
  PrivacyPolicyViewModel getModel() => PrivacyPolicyViewModel();

  group('PrivacyPolicyViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    test('navigateToHome navigates to home view', () {
      final navigationService = getAndRegisterNavigationService();
      final model = getModel();
      model.navigateToHome();
      verify(navigationService.navigateToHomeView());
    });

    test('navigateToTermsAndConditions navigates to terms view', () {
      final navigationService = getAndRegisterNavigationService();
      final model = getModel();
      model.navigateToTermsAndConditions();
      verify(navigationService.navigateToTermsAndConditionsView());
    });
  });
}
