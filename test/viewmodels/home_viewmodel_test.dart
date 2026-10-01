import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spare_website/app/app.locator.dart';
import 'package:spare_website/services/parts_catalog_service.dart';
import 'package:spare_website/ui/views/home/home_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() {
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
  });

  HomeViewModel getModel() => HomeViewModel();

  group('HomeViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    test('Initializes with category data and brand data available', () {
      final model = getModel();
      expect(PartsCatalogService.evCategories.length, 13);
      expect(PartsCatalogService.petrolCategories.length, 13);
      expect(PartsCatalogService.evBrands.length, 5);
      expect(PartsCatalogService.petrolBrands.length, 6);
      expect(model.selectedCategoryForEnquiry, isNull);
    });

    test('handleCategoryEnquiry sets selected category', () {
      final model = getModel();
      model.handleCategoryEnquiry('Brake Pads');
      expect(model.selectedCategoryForEnquiry, 'Brake Pads');
    });

    test('handleBrandSelect sets selected brand', () {
      final model = getModel();
      model.handleBrandSelect('Ola Scooter');
      expect(model.selectedBrandForEnquiry, 'Ola Scooter');
    });
  });
}
