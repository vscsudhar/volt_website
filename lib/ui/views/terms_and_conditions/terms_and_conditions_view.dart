import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spare_website/ui/common/app_colors.dart';
import 'package:spare_website/ui/common/ui_helpers.dart';
import 'package:spare_website/ui/widgets/premium_footer.dart';
import 'package:spare_website/ui/widgets/volt_spare_logo.dart';
import 'package:stacked/stacked.dart';

import 'terms_and_conditions_viewmodel.dart';

class TermsAndConditionsView extends StackedView<TermsAndConditionsViewModel> {
  const TermsAndConditionsView({super.key});

  @override
  TermsAndConditionsViewModel viewModelBuilder(BuildContext context) =>
      TermsAndConditionsViewModel();

  @override
  Widget builder(
    BuildContext context,
    TermsAndConditionsViewModel viewModel,
    Widget? child,
  ) {
    final isDesktop = ResponsiveBreakpoints.isDesktop(context);
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final hPadding = ResponsiveBreakpoints.getHorizontalPadding(context);

    return Title(
      title: 'VoltSpare | Terms & Conditions',
      color: kcPrimaryColor,
      child: Scaffold(
        backgroundColor: kcBackgroundColor,
        body: Column(
          children: [
            // Top Navigation Bar
            _buildTopNavBar(context, viewModel, isDesktop, hPadding),

            // Page Content
            Expanded(
              child: SingleChildScrollView(
                controller: viewModel.scrollController,
                child: Column(
                  children: [
                    // Hero Banner
                    _buildHeroBanner(context, isMobile, hPadding),

                    // Main Terms Content Area
                    Container(
                      constraints: const BoxConstraints(maxWidth: 1040),
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 16 : 24,
                        vertical: 36,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildIntroductionCard(),
                          verticalSpaceLarge,
                          _buildSection(
                            number: '1',
                            title: 'About VoltSpare',
                            icon: Icons.info_outline_rounded,
                            content: [
                              'VoltSpare ("VoltSpare", "we", "us", or "our") operates a specialized digital spare parts platform dedicated to electric vehicles (EV) and petrol-powered two-wheelers.',
                              'Our platform facilitates catalog discovery, compatibility checks, vehicle-specific spare parts identification, and local hub delivery services for individual riders, vehicle owners, garages, workshops, and independent mechanics in Tamil Nadu and across India.',
                              'By accessing or using our website, services, and order placement interfaces, you agree to be bound by these Terms & Conditions. If you do not agree to these terms, please do not use our platform.',
                            ],
                          ),
                          _buildSection(
                            number: '2',
                            title: 'Account Registration & Security',
                            icon: Icons.person_outline_rounded,
                            content: [
                              'To access certain services, place orders, or request Return Merchandise Authorization (RMA), you may be required to provide your name, valid mobile phone number, email address, and delivery location details.',
                              'You agree to provide accurate, current, and complete information during registration and checkout.',
                              'You are solely responsible for maintaining the confidentiality of any authentication credentials, OTPs, or login details and for all activities that occur under your account.',
                              'VoltSpare reserves the right to suspend or terminate accounts that contain false, misleading, or fraudulent contact details.',
                            ],
                          ),
                          _buildSection(
                            number: '3',
                            title: 'Product Information & Specifications',
                            icon: Icons.inventory_2_outlined,
                            content: [
                              'VoltSpare lists genuine OEM (Original Equipment Manufacturer), OES (Original Equipment Supplier), and certified aftermarket replacement spare parts for electric scooters, electric motorcycles, and petrol two-wheelers.',
                              'We strive to display accurate technical specifications, part dimensions, compatibility ratings, and visual representations. However, actual packaging, color shades, or manufacturer branding revisions may occasionally vary slightly from catalog photos.',
                              'All product descriptions and specifications are provided for informational and identification purposes.',
                            ],
                          ),
                          _buildSection(
                            number: '4',
                            title: 'Vehicle Compatibility & Fitment Guidance',
                            icon: Icons.two_wheeler_rounded,
                            content: [
                              'VoltSpare provides brand, model, and year-specific compatibility guidance for popular EV brands (including Ola Electric, Ather Energy, TVS iQube, Bajaj Chetak, Hero Electric, Ampere, Revolt) and Petrol brands (including Honda, Hero MotoCorp, Bajaj Auto, TVS, Yamaha, Royal Enfield, Suzuki).',
                              'While our catalog compatibility engine assists in identifying the correct part numbers, vehicle owners and mechanics are advised to cross-verify the existing part specifications, mounting points, connector configurations, or chassis number prior to unsealing and installation.',
                              'VoltSpare specialists are available via customer support to help verify part numbers before dispatch.',
                            ],
                          ),
                          _buildSection(
                            number: '5',
                            title: 'Product Availability & Sourcing',
                            icon: Icons.storefront_outlined,
                            content: [
                              'Product availability is subject to stock levels at our local fulfillment hubs and partner distributor networks.',
                              'While we maintain real-time inventory synchronization, unexpected stock variations or supplier delays may occur.',
                              'If an ordered item becomes unavailable or undergoes backorder delay, VoltSpare will notify the customer promptly and offer an alternate compatible brand/part or a prompt 100% refund for the unavailable item.',
                            ],
                          ),
                          _buildSection(
                            number: '6',
                            title: 'Pricing, Invoicing & Taxes',
                            icon: Icons.receipt_long_outlined,
                            content: [
                              'All prices listed on VoltSpare are in Indian Rupees (INR ₹) and are inclusive of applicable Goods and Services Tax (GST) unless explicitly specified otherwise.',
                              'A valid GST invoice detailing product value, HSN/SAC codes, CGST/SGST/IGST breakdown, and delivery charges will be issued with every completed order.',
                              'VoltSpare reserves the right to revise prices at any time due to manufacturer cost changes, raw material variations, or taxation updates without prior notice. Confirmed orders placed prior to a price change will be honored at the confirmed order value.',
                            ],
                          ),
                          _buildSection(
                            number: '7',
                            title: 'Orders & Order Acceptance',
                            icon: Icons.shopping_bag_outlined,
                            content: [
                              'Placing an order constitutes an offer to purchase the specified spare parts.',
                              'Order acceptance and contract formation occur when VoltSpare sends an order confirmation via SMS, WhatsApp, or email, or when the order status changes to "Confirmed / Processing".',
                              'VoltSpare reserves the right to cancel or refuse any order due to pricing errors, unserviceable delivery locations, stock inaccuracies, or suspected fraudulent activity.',
                              'Customers may request order cancellation prior to dispatch through customer support.',
                            ],
                          ),
                          _buildSection(
                            number: '8',
                            title: 'Payment & Secure Processing',
                            icon: Icons.payment_rounded,
                            content: [
                              'VoltSpare supports secure digital payments through authorized, RBI-compliant payment aggregator gateways (including UPI, Debit Cards, Credit Cards, Net Banking, and authorized digital wallets).',
                              'VoltSpare does NOT store sensitive payment credentials such as Debit/Credit Card PINs, CVVs, UPI MPINs, or Net Banking passwords.',
                              'In the event of payment deduction without order confirmation due to banking network latency, the deducted amount is automatically refunded by the respective banking gateway within standard banking settlement timeframes (typically 3 to 7 working days).',
                            ],
                          ),
                          _buildSection(
                            number: '9',
                            title: 'Delivery & Shipping Timelines',
                            icon: Icons.local_shipping_outlined,
                            content: [
                              'VoltSpare offers same-day local delivery for serviceable pin codes on eligible in-stock items ordered before the designated cutoff time (3:00 PM IST on working days).',
                              'Standard delivery timelines for other regional locations typically range from 1 to 4 business days depending on distance and logistics connectivity.',
                              'Delivery estimates are provided in good faith; however, delays caused by extreme weather, vehicle breakdowns, road blockages, public holidays, or unforeseen force majeure events may occasionally affect delivery schedules.',
                            ],
                          ),
                          _buildSection(
                            number: '10',
                            title: 'Hub Service Radius & Dispatch Zones',
                            icon: Icons.radar_rounded,
                            content: [
                              'VoltSpare operates dedicated regional fulfillment hubs (including our central hub in Coimbatore, Tamil Nadu).',
                              'Each fulfillment hub maintains a defined geographical service radius (e.g. 0–15 km, 15–30 km, 30–50 km zones) to ensure rapid dispatch and optimal spare parts turnaround.',
                              'Serviceability and applicable delivery charges are calculated dynamically based on the customer\'s verified delivery pin code and distance from the dispatching hub.',
                            ],
                          ),
                          _buildSection(
                            number: '11',
                            title: 'Location & Distance Calculation Policy',
                            icon: Icons.pin_drop_outlined,
                            content: [
                              'VoltSpare processes geographical coordinate data (latitude and longitude) and address pin codes provided during checkout solely for determining the nearest fulfillment hub, calculating driving distance, estimating accurate delivery charges, and dispatch routing.',
                              'VoltSpare does NOT perform continuous background GPS tracking of users or monitor device location outside the specific address verification and order delivery workflow.',
                            ],
                          ),
                          _buildSection(
                            number: '12',
                            title: 'Returns Policy',
                            icon: Icons.assignment_return_outlined,
                            content: [
                              'Customers may request a return within the designated return window (up to 7 calendar days from delivery) for eligible unused spare parts.',
                              'To qualify for a return: (a) the item must be unused, uninstalled, free from grease or tool marks; (b) in its original manufacturer packaging with all intact tags, barcode labels, and seals; and (c) accompanied by the original invoice.',
                              'Non-returnable items include: electrical components (such as controllers, sensors, DC-DC converters, wiring harnesses) once unsealed or plugged in; liquid consumables (fork oil, brake fluid, lubricants) once opened; and custom-ordered assemblies.',
                            ],
                          ),
                          _buildSection(
                            number: '13',
                            title: 'Refunds & Processing Timelines',
                            icon: Icons.account_balance_wallet_outlined,
                            content: [
                              'Once returned parts are received at our fulfillment center and undergo quality inspection and fitment verification, the refund decision will be communicated within 2 working days.',
                              'Approved refunds are credited back to the original source payment method (UPI, card, or bank account) within 5 to 7 business days, in compliance with standard banking clearance rules.',
                              'Delivery charges are non-refundable unless the return is due to an error caused by VoltSpare (such as wrong part shipped or manufacturing defect).',
                            ],
                          ),
                          _buildSection(
                            number: '14',
                            title: 'Exchange & Replacement',
                            icon: Icons.swap_horiz_rounded,
                            content: [
                              'If you receive an incorrect part or an item damaged in transit, you may request a free replacement within 48 hours of delivery.',
                              'Customers are requested to inspect the delivery package at the time of receipt and report any transit damage with clear unboxing photographs/videos.',
                              'Replacements are dispatched promptly upon verification of the reported issue.',
                            ],
                          ),
                          _buildSection(
                            number: '15',
                            title: 'RMA (Return Merchandise Authorization) Process',
                            icon: Icons.verified_user_outlined,
                            content: [
                              'All product returns, warranty evaluations, and exchanges must follow the standard VoltSpare RMA workflow.',
                              'Step 1: Raise an RMA ticket via customer support (email support@voltspare.com or phone +91 98421 24312) providing your Order ID, part number, and reason for return with photos.',
                              'Step 2: Our technical team validates the request and issues an official RMA Reference Number along with pickup instructions.',
                              'Step 3: Hand over the packaged item with the RMA Number clearly marked on the outer box.',
                              'Items returned without a valid approved RMA reference cannot be processed.',
                            ],
                          ),
                          _buildSection(
                            number: '16',
                            title: 'Product Warranty & Manufacturer Coverage',
                            icon: Icons.verified_outlined,
                            content: [
                              'Warranty terms, coverage periods, and conditions for spare parts are governed strictly by the respective OEM / aftermarket manufacturer\'s warranty policy.',
                              'VoltSpare acts as a facilitator to assist customers with valid manufacturer warranty claims and technical evaluations.',
                              'Warranty does NOT cover: normal wear and tear (e.g. brake pads, clutch plates, drive belts, tyres); damage caused by incorrect DIY installation, electrical short-circuits, unauthorized vehicle modifications, accidents, water submersion, or misuse.',
                            ],
                          ),
                          _buildSection(
                            number: '17',
                            title: 'Customer Responsibilities',
                            icon: Icons.handshake_outlined,
                            content: [
                              'Customers are responsible for ensuring professional installation of spare parts by certified two-wheeler mechanics or EV technicians.',
                              'Customers must verify part fitment, thread sizes, electrical ratings, and connector pinouts prior to permanent installation.',
                              'Customers must provide accurate contact numbers and delivery instructions to enable smooth last-mile delivery.',
                            ],
                          ),
                          _buildSection(
                            number: '18',
                            title: 'Prohibited Use & Platform Integrity',
                            icon: Icons.block_flipped,
                            content: [
                              'Users agree not to: (a) use automated scrapers, spiders, or robots to extract catalog data, part numbers, or pricing without written consent; (b) place fraudulent, speculative, or false orders; (c) attempt unauthorized access to server infrastructure; (d) introduce malicious software, viruses, or disruptive scripts.',
                              'Violations may lead to immediate account termination and legal action under the Information Technology Act, 2000 and applicable criminal laws.',
                            ],
                          ),
                          _buildSection(
                            number: '19',
                            title: 'Intellectual Property Rights',
                            icon: Icons.copyright_rounded,
                            content: [
                              'The VoltSpare name, logo, website design, UI layout, custom code, graphics, and proprietary database compilation are the intellectual property of VoltSpare.',
                              'Vehicle brand names, trademarks, model designations, and OEM part reference numbers mentioned on the website are the property of their respective owners and are used strictly for vehicle identification and parts compatibility purposes.',
                            ],
                          ),
                          _buildSection(
                            number: '20',
                            title: 'Third-Party Services & Integrations',
                            icon: Icons.hub_outlined,
                            content: [
                              'VoltSpare integrates with trusted third-party service providers for payment processing, SMS notifications, map geocoding, and third-party logistics.',
                              'While we work with verified industry partners, VoltSpare is not responsible for external downtime or service interruptions caused by third-party bank gateways or telecommunication networks.',
                            ],
                          ),
                          _buildSection(
                            number: '21',
                            title: 'Service Availability & Maintenance',
                            icon: Icons.cloud_done_outlined,
                            content: [
                              'VoltSpare aims to provide 24/7 online catalog browsing and order placement capability.',
                              'Periodic scheduled maintenance, server upgrades, or unexpected technical outages may occur. We make reasonable efforts to minimize disruptions and restore normal operations swiftly.',
                            ],
                          ),
                          _buildSection(
                            number: '22',
                            title: 'Consumer Rights & Statutory Protections',
                            icon: Icons.gavel_rounded,
                            content: [
                              'Nothing in these Terms & Conditions restricts or limits statutory rights available to consumers under the Consumer Protection Act, 2019 (India) and the Consumer Protection (E-Commerce) Rules, 2020.',
                              'In case of any discrepancy between these terms and statutory consumer rights, mandatory legal provisions shall prevail.',
                            ],
                          ),
                          _buildSection(
                            number: '23',
                            title: 'Customer Support & Grievance Redressal',
                            icon: Icons.support_agent_rounded,
                            content: [
                              'VoltSpare is dedicated to swift and friendly customer assistance.',
                              'Support Email: support@voltspare.com',
                              'Customer Support Helpline: +91 98421 24312',
                              'Operating Hours: Monday – Saturday (8:30 AM to 8:30 PM IST)',
                              'Grievance Officer: [Grievance Officer: Designated Support Lead, VoltSpare, Coimbatore, Tamil Nadu - 641004]',
                              'Grievance complaints will be acknowledged within 48 hours and addressed within 15 working days.',
                            ],
                          ),
                          _buildSection(
                            number: '24',
                            title: 'Modifications & Changes to Terms',
                            icon: Icons.update_rounded,
                            content: [
                              'VoltSpare reserves the right to update, modify, or replace any part of these Terms & Conditions to reflect changes in our service operations, commercial practices, or legal requirements.',
                              'Updated versions will be published on this page with a revised "Last Updated" date.',
                              'Your continued use of the VoltSpare website following any changes signifies your acceptance of the revised Terms & Conditions.',
                            ],
                          ),
                          _buildSection(
                            number: '25',
                            title: 'Governing Law & Dispute Jurisdiction',
                            icon: Icons.balance_rounded,
                            content: [
                              'These Terms & Conditions and any dispute or claim arising out of or in connection with them shall be governed by and construed in accordance with the laws of India.',
                              'Any legal disputes, proceedings, or arbitration arising from orders or use of VoltSpare services shall be subject to the exclusive jurisdiction of the competent courts in Coimbatore, Tamil Nadu, India.',
                            ],
                          ),
                          verticalSpaceLarge,
                          _buildFooterCallout(viewModel),
                        ],
                      ),
                    ),

                    // Website Footer
                    PremiumFooter(
                      onNavigate: (section) {
                        viewModel.navigateToHome();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopNavBar(
    BuildContext context,
    TermsAndConditionsViewModel viewModel,
    bool isDesktop,
    double hPadding,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border:
            const Border(bottom: BorderSide(color: kcBorderLight, width: 1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 12),
          child: Row(
            children: [
              InkWell(
                onTap: viewModel.navigateToHome,
                borderRadius: BorderRadius.circular(8),
                child: const VoltSpareLogo(height: 40),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: viewModel.navigateToHome,
                icon: const Icon(Icons.arrow_back_rounded,
                    size: 16, color: kcPrimaryDark),
                label: Text(
                  'Back to Home',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: kcPrimaryDark,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: kcPrimaryLight,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              if (isDesktop) ...[
                const SizedBox(width: 12),
                TextButton(
                  onPressed: viewModel.navigateToPrivacyPolicy,
                  child: Text(
                    'Privacy Policy',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: kcTextSecondary,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroBanner(
      BuildContext context, bool isMobile, double hPadding) {
    return Container(
      width: double.infinity,
      color: kcDarkSlate,
      padding: EdgeInsets.symmetric(
        horizontal: hPadding,
        vertical: isMobile ? 32 : 48,
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1040),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Badge
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: kcPrimaryDark,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                      color: kcPrimaryAccent.withValues(alpha: 0.3)),
                ),
                child: Text(
                  'LEGAL & POLICIES',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: kcPrimaryElectric,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Terms & Conditions',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: isMobile ? 26 : 38,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'VoltSpare – EV & Petrol Two-Wheeler Spare Parts Platform',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: isMobile ? 13 : 15,
                  color: const Color(0xFF94A3B8),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.schedule_rounded,
                      size: 15, color: kcPrimaryElectric),
                  const SizedBox(width: 6),
                  Text(
                    'Last Updated: October 2026',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12,
                      color: const Color(0xFFCBD5E1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIntroductionCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kcPrimaryLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kcPrimaryAccent.withValues(alpha: 0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.shield_outlined, color: kcPrimaryColor, size: 24),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Agreement Overview',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: kcPrimaryDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Please read these terms carefully before browsing our catalog or ordering spare parts. These terms explain your rights, order processing, warranty facilitation, returns, and safety obligations.',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13,
                    color: kcTextDark,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String number,
    required String title,
    required IconData icon,
    required List<String> content,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kcBorderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: kcPrimaryLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    number,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: kcPrimaryDark,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: kcTextDark,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ...content.map(
            (paragraph) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8, right: 10),
                    child: Icon(Icons.circle, size: 6, color: kcPrimaryColor),
                  ),
                  Expanded(
                    child: Text(
                      paragraph,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 13.5,
                        color: kcTextSecondary,
                        height: 1.55,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterCallout(TermsAndConditionsViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: kcSurfaceLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kcBorderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Questions About Our Terms?',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: kcTextDark,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Our support team in Coimbatore is here to help you with vehicle fitment checks, RMA tickets, or order clarifications.',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 13,
              color: kcTextSecondary,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 10,
            children: [
              ElevatedButton.icon(
                onPressed: viewModel.navigateToHome,
                icon: const Icon(Icons.send_rounded,
                    size: 15, color: Colors.white),
                label: const Text('Contact Support / Enquire'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kcPrimaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                ),
              ),
              OutlinedButton.icon(
                onPressed: viewModel.navigateToPrivacyPolicy,
                icon: const Icon(Icons.privacy_tip_outlined,
                    size: 15, color: kcPrimaryDark),
                label: const Text('View Privacy Policy'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: kcPrimaryDark,
                  side: const BorderSide(color: kcPrimaryColor),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
