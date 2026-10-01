import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spare_website/ui/common/app_colors.dart';
import 'package:spare_website/ui/common/ui_helpers.dart';
import 'package:spare_website/ui/widgets/premium_footer.dart';
import 'package:spare_website/ui/widgets/volt_spare_logo.dart';
import 'package:stacked/stacked.dart';

import 'privacy_policy_viewmodel.dart';

class PrivacyPolicyView extends StackedView<PrivacyPolicyViewModel> {
  const PrivacyPolicyView({super.key});

  @override
  PrivacyPolicyViewModel viewModelBuilder(BuildContext context) =>
      PrivacyPolicyViewModel();

  @override
  Widget builder(
    BuildContext context,
    PrivacyPolicyViewModel viewModel,
    Widget? child,
  ) {
    final isDesktop = ResponsiveBreakpoints.isDesktop(context);
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final hPadding = ResponsiveBreakpoints.getHorizontalPadding(context);

    return Title(
      title: 'VoltSpare | Privacy Policy',
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

                    // Main Privacy Content Area
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
                            title: 'Overview & Scope',
                            icon: Icons.shield_outlined,
                            bullets: [
                              'VoltSpare ("VoltSpare", "we", "us", or "our") is committed to safeguarding the privacy and personal data of two-wheeler owners, riders, mechanics, and workshop partners who use our spare parts platform.',
                              'This Privacy Policy transparently explains what data we collect, why we collect it, how it is handled, and your privacy rights under applicable data protection laws, including the Information Technology Act, 2000 and Digital Personal Data Protection guidelines in India.',
                              'By accessing VoltSpare, placing an enquiry, or ordering spare parts, you consent to the data collection and processing practices described herein.',
                            ],
                          ),
                          _buildSection(
                            number: '2',
                            title: 'Account Information We Collect',
                            icon: Icons.account_circle_outlined,
                            bullets: [
                              'Name (Full name or workshop/garage name)',
                              'Mobile phone number (for OTP authentication and communication)',
                              'Email address (for invoice delivery, order confirmations, and notifications)',
                            ],
                            purposeTitle: 'Purpose of Collection:',
                            purposePoints: [
                              'User authentication, profile management, and account security.',
                              'Direct communication regarding vehicle compatibility, order confirmations, and service alerts.',
                              'Issuance and electronic transmission of GST tax invoices.',
                            ],
                          ),
                          _buildSection(
                            number: '3',
                            title: 'Delivery & Shipping Information',
                            icon: Icons.local_shipping_outlined,
                            bullets: [
                              'Recipient / Customer full name',
                              'Recipient mobile contact number',
                              'Detailed physical delivery address (Street, building/shop number, locality, city, landmark, and pin code)',
                            ],
                            purposeTitle: 'Purpose of Collection:',
                            purposePoints: [
                              'Accurate physical routing and last-mile order delivery by our local hub dispatchers or courier partners.',
                              'Delivery status updates and coordination between customer and delivery personnel.',
                              'Order fulfillment and verification of receipt at the designated destination.',
                            ],
                          ),
                          _buildLocationSection(),
                          _buildSection(
                            number: '5',
                            title: 'Order & Transaction Information',
                            icon: Icons.receipt_long_outlined,
                            bullets: [
                              'Spare parts purchased, part numbers, brands, models, and quantities',
                              'Vehicle brand, model, and year submitted for fitment verification',
                              'Product pricing, itemized GST tax amounts, and delivery charges',
                              'Order status milestones (Ordered, Processing, Dispatched, Delivered)',
                              'Official GST invoice records',
                              'Return, replacement, refund, and RMA (Return Merchandise Authorization) history',
                            ],
                            purposeTitle: 'Purpose of Collection:',
                            purposePoints: [
                              'Accurate fulfillment, warranty verification, and compatibility tracking.',
                              'Statutory accounting, tax compliance, and financial record-keeping.',
                              'Streamlined processing of returns, replacements, and manufacturer warranty assistance.',
                            ],
                          ),
                          _buildPaymentSection(),
                          _buildSection(
                            number: '7',
                            title: 'How We Use Your Personal Data',
                            icon: Icons.tune_rounded,
                            bullets: [
                              'Account management and identity verification.',
                              'Processing, fulfilling, and delivering two-wheeler spare parts orders.',
                              'Customer support, vehicle fitment assistance, and enquiry resolution.',
                              'Fulfillment hub serviceability checks and real-time delivery distance calculation.',
                              'Accurate delivery fee computation based on hub radius and address pin code.',
                              'Generating and delivering official GST tax invoices.',
                              'Processing warranty claims, returns, exchanges, and RMA requests.',
                              'Fraud prevention, account security, and safeguarding platform integrity.',
                              'Compliance with legal, regulatory, taxation, and accounting requirements under Indian law.',
                            ],
                          ),
                          _buildSection(
                            number: '8',
                            title: 'Data Sharing & Third-Party Service Providers',
                            icon: Icons.share_outlined,
                            bullets: [
                              'Payment Gateways: RBI-authorized payment aggregators for processing digital payments securely.',
                              'Delivery & Logistics Partners: Local hub riders and courier services strictly for dispatching your packages to the specified delivery address.',
                              'Cloud Infrastructure & Hosting: Secure cloud databases and server hosting providers for reliable site operation.',
                              'Communication Channels: SMS, WhatsApp Business API, and email service providers strictly for transactional alerts, OTPs, and invoices.',
                              'Customer Support Tools: Helpdesk and CRM software to manage customer enquiries efficiently.',
                              'Maps & Geocoding Services: Geocoding APIs to validate delivery pin codes and calculate hub-to-destination road distance.',
                              'Legal & Regulatory Authorities: Disclosed only when strictly required by applicable law, court order, or official government authority.',
                            ],
                            customCallout:
                              'VoltSpare does NOT sell, rent, or trade your personal data to third parties for commercial advertising or unsolicited marketing.',
                          ),
                          _buildSection(
                            number: '9',
                            title: 'Data Retention Policy',
                            icon: Icons.history_rounded,
                            bullets: [
                              'We retain personal information only for as long as reasonably necessary to fulfill the purposes outlined in this policy.',
                              'Active Account Data: Retained for the duration your account remains active with VoltSpare.',
                              'Order & Invoice Records: Retained for the statutory duration required under Indian Goods and Services Tax (GST) laws and commercial accounting standards (typically 7 years).',
                              'Customer Support & RMA Records: Retained for a reasonable timeframe to facilitate repeat warranty claims, fitment history, and dispute resolution.',
                              'When data is no longer required, it is securely deleted or anonymized in accordance with our data disposal procedures.',
                            ],
                          ),
                          _buildSecuritySection(),
                          _buildSection(
                            number: '11',
                            title: 'Your Privacy Rights & Choices',
                            icon: Icons.how_to_reg_outlined,
                            bullets: [
                              'Right to Access: You may request details of personal information stored about you.',
                              'Right to Rectification: You may correct or update inaccurate contact or profile details through your account or by contacting support.',
                              'Right to Erasure: You may request deletion of non-statutory account data, subject to legal and taxation record retention requirements.',
                              'Withdrawal of Consent: You may withdraw consent for optional marketing communications at any time.',
                              'Grievance Redressal: You have the right to lodge a privacy grievance with our designated Grievance Officer.',
                            ],
                          ),
                          _buildSection(
                            number: '12',
                            title: 'Policy Updates & Notifications',
                            icon: Icons.update_rounded,
                            bullets: [
                              'VoltSpare may update this Privacy Policy periodically to reflect enhancements in our services, technology upgrades, or evolving legal frameworks.',
                              'Any revisions will be published on this page with an updated "Last Updated" timestamp.',
                              'We encourage users to periodically review this page to stay informed about how we safeguard their personal data.',
                            ],
                          ),
                          _buildGrievanceCard(viewModel),
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
    PrivacyPolicyViewModel viewModel,
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
                  onPressed: viewModel.navigateToTermsAndConditions,
                  child: Text(
                    'Terms & Conditions',
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
                  'PRIVACY & DATA PROTECTION',
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
                'Privacy Policy',
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
          const Icon(Icons.lock_outline_rounded,
              color: kcPrimaryColor, size: 24),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Our Privacy Commitment',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: kcPrimaryDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'At VoltSpare, we respect your privacy. We collect and process only the necessary information required to verify spare parts compatibility, fulfill orders, calculate delivery logistics, and provide dedicated customer support.',
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

  Widget _buildLocationSection() {
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
                    '4',
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
                  'Location Information & Distance Calculation',
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
          _buildBullet(
              'VoltSpare may process the geographical coordinates (latitude and longitude) and pin code associated with the customer\'s selected delivery address.'),
          verticalSpaceSmall,
          Text(
            'Purpose of Location Processing:',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 13.5,
              fontWeight: FontWeight.w700,
              color: kcTextDark,
            ),
          ),
          const SizedBox(height: 6),
          _buildSubBullet(
              'Calculate road driving distance from the nearest fulfillment hub.'),
          _buildSubBullet(
              'Identify the applicable regional fulfillment hub (e.g. Coimbatore Hub).'),
          _buildSubBullet(
              'Check whether the delivery destination falls within the hub\'s designated service radius.'),
          _buildSubBullet(
              'Determine same-day or standard delivery availability for the requested parts.'),
          _buildSubBullet(
              'Calculate transparent, distance-based delivery charges.'),
          _buildSubBullet(
              'Support smooth navigation and dispatch operations for delivery personnel.'),
          verticalSpaceMedium,
          // Important explicit disclaimer
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFBFDBFE)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.info_rounded,
                    size: 20, color: Color(0xFF1D4ED8)),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'IMPORTANT: VoltSpare does NOT continuously track your device location in the background. Location data is collected and processed solely for address validation, hub distance calculation, and order delivery operations.',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1E40AF),
                      height: 1.45,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentSection() {
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
                    '6',
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
                  'Payment Information & Security Safeguards',
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
          _buildBullet(
              'Online payments on VoltSpare are processed securely through certified, PCI-DSS compliant third-party payment aggregators and banking partners.'),
          _buildBullet(
              'VoltSpare receives only transaction reference IDs, payment status tokens (Success/Failed), payment method type, and timestamp to reconcile your order.'),
          verticalSpaceSmall,
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: kcPrimaryLight,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: kcPrimaryAccent.withValues(alpha: 0.3)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.verified_user_rounded,
                    size: 20, color: kcPrimaryColor),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'SECURITY COMMITMENT: VoltSpare NEVER stores or has access to your Debit/Credit Card PIN, Card CVV/CVC, UPI MPIN, or Net Banking passwords. All sensitive payment authentication occurs directly within the encrypted environment of your banking provider.',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: kcPrimaryDark,
                      height: 1.45,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecuritySection() {
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
                    '10',
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
                  'Data Security Safeguards',
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
          _buildBullet(
              'VoltSpare implements reasonable technical, administrative, and physical security measures designed to protect your personal information against unauthorized access, loss, misuse, alteration, or destruction.'),
          _buildBullet(
              'These safeguards include SSL/TLS encryption for data transmission in transit, database access controls, encrypted data storage, and strict role-based authorization for our operational staff.'),
          _buildBullet(
              'While we adhere to robust industry best practices and security standards, no electronic data transmission over the Internet or digital storage method can guarantee absolute security. We continuously review and upgrade our security defenses.'),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String number,
    required String title,
    required IconData icon,
    required List<String> bullets,
    String? purposeTitle,
    List<String>? purposePoints,
    String? customCallout,
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
          ...bullets.map((b) => _buildBullet(b)),
          if (purposeTitle != null && purposePoints != null) ...[
            verticalSpaceSmall,
            Text(
              purposeTitle,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 13.5,
                fontWeight: FontWeight.w700,
                color: kcTextDark,
              ),
            ),
            const SizedBox(height: 6),
            ...purposePoints.map((p) => _buildSubBullet(p)),
          ],
          if (customCallout != null) ...[
            verticalSpaceSmall,
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: kcSurfaceLight,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: kcBorderLight),
              ),
              child: Row(
                children: [
                  const Icon(Icons.check_circle_outline_rounded,
                      size: 18, color: kcPrimaryColor),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      customCallout,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                        color: kcTextDark,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBullet(String text) {
    return Padding(
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
              text,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 13.5,
                color: kcTextSecondary,
                height: 1.55,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubBullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8, right: 8),
            child: Icon(Icons.arrow_right_rounded,
                size: 14, color: kcPrimaryColor),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 13,
                color: kcTextSecondary,
                height: 1.45,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGrievanceCard(PrivacyPolicyViewModel viewModel) {
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
            'Privacy Grievance & Contact Information',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: kcTextDark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'If you have any questions, concerns, or requests regarding this Privacy Policy or your personal data, please contact our support desk or Grievance Officer:',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 13,
              color: kcTextSecondary,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 14),
          _buildContactInfoRow(Icons.email_outlined, 'Privacy & Support Email',
              'support@voltspare.com / privacy@voltspare.com'),
          const SizedBox(height: 8),
          _buildContactInfoRow(Icons.phone_in_talk_rounded, 'Helpline',
              '+91 98421 24312'),
          const SizedBox(height: 8),
          _buildContactInfoRow(Icons.location_on_outlined, 'Location',
              'Coimbatore, Tamil Nadu - 641004, India'),
          const SizedBox(height: 8),
          _buildContactInfoRow(Icons.person_pin_circle_outlined,
              'Grievance Officer',
              '[Grievance Officer: Designated Support Lead, VoltSpare, Coimbatore, Tamil Nadu - 641004]'),
          const SizedBox(height: 18),
          Wrap(
            spacing: 12,
            runSpacing: 10,
            children: [
              ElevatedButton.icon(
                onPressed: viewModel.navigateToHome,
                icon: const Icon(Icons.send_rounded,
                    size: 15, color: Colors.white),
                label: const Text('Back to VoltSpare Home'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kcPrimaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                ),
              ),
              OutlinedButton.icon(
                onPressed: viewModel.navigateToTermsAndConditions,
                icon: const Icon(Icons.gavel_rounded,
                    size: 15, color: kcPrimaryDark),
                label: const Text('View Terms & Conditions'),
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

  Widget _buildContactInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: kcPrimaryColor),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: GoogleFonts.plusJakartaSans(
                  fontSize: 13, color: kcTextDark),
              children: [
                TextSpan(
                    text: '$label: ',
                    style: const TextStyle(fontWeight: FontWeight.w700)),
                TextSpan(
                    text: value,
                    style: const TextStyle(color: kcTextSecondary)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
