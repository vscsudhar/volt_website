import 'package:flutter/material.dart';
import 'package:spare_website/ui/common/app_colors.dart';
import 'package:spare_website/ui/common/ui_helpers.dart';
import 'package:spare_website/ui/widgets/about_section.dart';
import 'package:spare_website/ui/widgets/brands_section.dart';
import 'package:spare_website/ui/widgets/categories_section.dart';
import 'package:spare_website/ui/widgets/contact_section.dart';
import 'package:spare_website/ui/widgets/delivery_section.dart';
import 'package:spare_website/ui/widgets/hero_section.dart';
import 'package:spare_website/ui/widgets/mobile_drawer.dart';
import 'package:spare_website/ui/widgets/premium_footer.dart';
import 'package:spare_website/ui/widgets/premium_header.dart';
import 'package:spare_website/ui/widgets/service_highlights_section.dart';
import 'package:spare_website/ui/widgets/social_section.dart';
import 'package:spare_website/ui/widgets/support_section.dart';
import 'package:spare_website/ui/widgets/vehicle_compatibility_section.dart';
import 'package:spare_website/ui/widgets/why_choose_section.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);

    return Scaffold(
      backgroundColor: kcBackgroundColor,
      drawer:
          isMobile ? MobileDrawer(onNavigate: viewModel.scrollToSection) : null,
      body: Column(
        children: [
          // Sticky Top Header
          PremiumHeader(onNavigate: viewModel.scrollToSection),

          // Scrollable Page Body
          Expanded(
            child: SingleChildScrollView(
              controller: viewModel.scrollController,
              child: Column(
                children: [
                  // 1. Hero Section
                  Container(
                    key: viewModel.homeKey,
                    child: HeroSection(
                      onExploreParts: () =>
                          viewModel.scrollToSection('categories'),
                      onContactSupport: () =>
                          viewModel.scrollToSection('support'),
                    ),
                  ),

                  // 2. Key Service Highlights (Immediately below hero)
                  ServiceHighlightsSection(
                    onSupportTap: () => viewModel.scrollToSection('support'),
                    onDeliveryTap: () => viewModel.scrollToSection('delivery'),
                  ),

                  // 3. Spare Parts Categories (EV + Petrol categories)
                  Container(
                    key: viewModel.categoriesKey,
                    child: CategoriesSection(
                      onCategoryEnquire: viewModel.handleCategoryEnquiry,
                    ),
                  ),

                  // 4. Vehicle Brands (Popular EV & Petrol brands)
                  Container(
                    key: viewModel.brandsKey,
                    child: BrandsSection(
                      onBrandSelect: viewModel.handleBrandSelect,
                    ),
                  ),

                  // 5. Vehicle Compatibility & Sourcing
                  Container(
                    key: viewModel.compatibilityKey,
                    child: VehicleCompatibilitySection(
                      onAskPart: () => viewModel.scrollToSection('contact'),
                    ),
                  ),

                  // 6. 24/6 Support Section
                  Container(
                    key: viewModel.supportKey,
                    child: SupportSection(
                      onContactSupport: () =>
                          viewModel.scrollToSection('contact'),
                    ),
                  ),

                  // 7. Same-Day Delivery Section (Order Before 3 PM)
                  Container(
                    key: viewModel.deliveryKey,
                    child: const DeliverySection(),
                  ),

                  // 8. About VoltSpare (Built for Every Two-Wheeler Ride)
                  Container(
                    key: viewModel.aboutKey,
                    child: const AboutSection(),
                  ),

                  // 9. Why VoltSpare (6 Feature Cards)
                  Container(
                    key: viewModel.whyVoltSpareKey,
                    child: const WhyChooseSection(),
                  ),

                  // 10. Social Media Community Section
                  const SocialSection(),

                  // 11. Find the Right Spare Part (Contact & Enquiry Form)
                  Container(
                    key: viewModel.contactKey,
                    child: ContactSection(
                      initialCategory: viewModel.selectedCategoryForEnquiry,
                      initialBrand: viewModel.selectedBrandForEnquiry,
                      onNavigate: viewModel.scrollToSection,
                    ),
                  ),

                  // 12. Premium Dark Footer
                  PremiumFooter(onNavigate: viewModel.scrollToSection),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
