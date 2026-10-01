import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spare_website/ui/common/app_colors.dart';
import 'package:spare_website/ui/common/ui_helpers.dart';

import 'package:spare_website/app/app.locator.dart';
import 'package:spare_website/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class ContactSection extends StatefulWidget {
  final String? initialCategory;
  final String? initialBrand;
  final Function(String section)? onNavigate;

  const ContactSection({
    super.key,
    this.initialCategory,
    this.initialBrand,
    this.onNavigate,
  });

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _brandController = TextEditingController();
  final _modelController = TextEditingController();
  final _partController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialCategory != null) {
      _partController.text = widget.initialCategory!;
    }
    if (widget.initialBrand != null) {
      _brandController.text = widget.initialBrand!;
    }
  }

  @override
  void didUpdateWidget(covariant ContactSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialCategory != null &&
        widget.initialCategory != oldWidget.initialCategory) {
      _partController.text = widget.initialCategory!;
    }
    if (widget.initialBrand != null &&
        widget.initialBrand != oldWidget.initialBrand) {
      _brandController.text = widget.initialBrand!;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    _brandController.dispose();
    _modelController.dispose();
    _partController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: const EdgeInsets.all(32),
            constraints: const BoxConstraints(maxWidth: 460),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kcPrimaryLight,
                  ),
                  child: const Icon(
                    Icons.check_circle_rounded,
                    color: kcPrimaryColor,
                    size: 48,
                  ),
                ),
                verticalSpaceMedium,
                Text(
                  'Enquiry Sent Successfully!',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: kcTextDark,
                  ),
                ),
                verticalSpaceSmall,
                Text(
                  'Thank you, ${_nameController.text.isEmpty ? 'Valued Customer' : _nameController.text}. Our spare parts specialist in Coimbatore will check stock availability for your ${_brandController.text} ${_modelController.text} and contact you at ${_mobileController.text}.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13,
                    color: kcTextSecondary,
                    height: 1.4,
                  ),
                ),
                verticalSpaceLarge,
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _formKey.currentState?.reset();
                    _nameController.clear();
                    _mobileController.clear();
                    _brandController.clear();
                    _modelController.clear();
                    _partController.clear();
                    _messageController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kcPrimaryDark,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28, vertical: 14),
                  ),
                  child: const Text('Done'),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.isDesktop(context);
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final hPadding = ResponsiveBreakpoints.getHorizontalPadding(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 48),
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: kcSurfaceLight,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: kcBorderLight),
        ),
        padding: EdgeInsets.all(isMobile ? 24 : 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: kcPrimaryLight,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'SPARE PART ENQUIRY',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: kcPrimaryDark,
                  letterSpacing: 0.6,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Find the Right Spare Part',
              style: GoogleFonts.plusJakartaSans(
                fontSize: isMobile ? 24 : 32,
                fontWeight: FontWeight.w800,
                color: kcTextDark,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Submit your vehicle details and required spare part. Our team will verify compatibility and assist you directly.',
              style: GoogleFonts.plusJakartaSans(
                fontSize: isMobile ? 13 : 15,
                color: kcTextSecondary,
              ),
            ),
            const SizedBox(height: 18),

            // Direct Call & WhatsApp Contact Row
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: kcBorderLight),
              ),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 16,
                runSpacing: 10,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: kcPrimaryLight,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.phone_in_talk_rounded,
                            size: 16, color: kcPrimaryColor),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Direct Helpline: ',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: kcTextSecondary,
                        ),
                      ),
                      Text(
                        '+91 98421 24312',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: kcTextDark,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: const Color(0xFFDCFCE7),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.chat_rounded,
                            size: 16, color: Color(0xFF16A34A)),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'WhatsApp: ',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: kcTextSecondary,
                        ),
                      ),
                      Text(
                        '+91 98421 24312',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF16A34A),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            verticalSpaceLarge,

            // Form Content
            Form(
              key: _formKey,
              child: Column(
                children: [
                  if (isDesktop)
                    Row(
                      children: [
                        Expanded(
                          child: _buildFormField(
                            controller: _nameController,
                            label: 'Your Name',
                            hint: 'Full name or workshop name',
                            icon: Icons.person_outline_rounded,
                            required: true,
                          ),
                        ),
                        horizontalSpaceMedium,
                        Expanded(
                          child: _buildFormField(
                            controller: _mobileController,
                            label: 'Mobile Number',
                            hint: '10-digit mobile number',
                            icon: Icons.phone_android_rounded,
                            required: true,
                          ),
                        ),
                      ],
                    )
                  else ...[
                    _buildFormField(
                      controller: _nameController,
                      label: 'Your Name',
                      hint: 'Full name or workshop name',
                      icon: Icons.person_outline_rounded,
                      required: true,
                    ),
                    verticalSpaceSmall,
                    _buildFormField(
                      controller: _mobileController,
                      label: 'Mobile Number',
                      hint: '10-digit mobile number',
                      icon: Icons.phone_android_rounded,
                      required: true,
                    ),
                  ],

                  verticalSpaceMedium,

                  if (isDesktop)
                    Row(
                      children: [
                        Expanded(
                          child: _buildFormField(
                            controller: _brandController,
                            label: 'Vehicle Brand',
                            hint: 'e.g. Ola, Ather, Honda, Hero, TVS',
                            icon: Icons.two_wheeler_rounded,
                            required: true,
                          ),
                        ),
                        horizontalSpaceMedium,
                        Expanded(
                          child: _buildFormField(
                            controller: _modelController,
                            label: 'Vehicle Model & Year',
                            hint: 'e.g. S1X / Activa 6G / Splendor (2023)',
                            icon: Icons.directions_bike_rounded,
                            required: true,
                          ),
                        ),
                      ],
                    )
                  else ...[
                    _buildFormField(
                      controller: _brandController,
                      label: 'Vehicle Brand',
                      hint: 'e.g. Ola, Ather, Honda, Hero, TVS',
                      icon: Icons.two_wheeler_rounded,
                      required: true,
                    ),
                    verticalSpaceSmall,
                    _buildFormField(
                      controller: _modelController,
                      label: 'Vehicle Model & Year',
                      hint: 'e.g. S1X / Activa 6G / Splendor (2023)',
                      icon: Icons.directions_bike_rounded,
                      required: true,
                    ),
                  ],

                  verticalSpaceMedium,

                  _buildFormField(
                    controller: _partController,
                    label: 'Spare Part Required',
                    hint:
                        'e.g. Rear Brake Shoe, Drive Belt, Fork Oil Seal, LED Bulb, CDI',
                    icon: Icons.build_circle_outlined,
                    required: true,
                  ),

                  verticalSpaceMedium,

                  _buildFormField(
                    controller: _messageController,
                    label:
                        'Additional Message / Problem Description (Optional)',
                    hint:
                        'Provide any extra details, symptoms or specific part code if available...',
                    icon: Icons.chat_bubble_outline_rounded,
                    maxLines: 3,
                  ),

                  verticalSpaceLarge,

                  // Submit Button
                  SizedBox(
                    width: isDesktop ? 280 : double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _handleSubmit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kcPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.send_rounded,
                              size: 18, color: Colors.white),
                          const SizedBox(width: 8),
                          Text(
                            'Send Enquiry',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  verticalSpaceLarge,
                  const Divider(color: kcBorderLight),
                  const SizedBox(height: 16),

                  // Contact Legal & Policy Links
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: kcBorderLight),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: kcPrimaryLight,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.verified_user_outlined,
                              size: 16, color: kcPrimaryColor),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 12,
                            runSpacing: 6,
                            children: [
                              Text(
                                'VoltSpare Legal & Customer Policies:',
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w700,
                                  color: kcTextDark,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (widget.onNavigate != null) {
                                    widget.onNavigate!('terms-and-conditions');
                                  } else {
                                    locator<NavigationService>()
                                        .navigateTo(Routes.termsAndConditionsView);
                                  }
                                },
                                borderRadius: BorderRadius.circular(4),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 2),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.article_outlined,
                                          size: 14, color: kcPrimaryColor),
                                      const SizedBox(width: 4),
                                      Text(
                                        'Terms & Conditions',
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 12.5,
                                          fontWeight: FontWeight.w600,
                                          color: kcPrimaryColor,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Text(
                                '•',
                                style: TextStyle(
                                    color: kcTextMuted, fontSize: 12),
                              ),
                              InkWell(
                                onTap: () {
                                  if (widget.onNavigate != null) {
                                    widget.onNavigate!('privacy-policy');
                                  } else {
                                    locator<NavigationService>()
                                        .navigateTo(Routes.privacyPolicyView);
                                  }
                                },
                                borderRadius: BorderRadius.circular(4),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 2),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.privacy_tip_outlined,
                                          size: 14, color: kcPrimaryColor),
                                      const SizedBox(width: 4),
                                      Text(
                                        'Privacy Policy',
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 12.5,
                                          fontWeight: FontWeight.w600,
                                          color: kcPrimaryColor,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool required = false,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: label,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: kcTextDark,
                  ),
                  children: [
                    if (required)
                      TextSpan(
                        text: ' *',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: kcDangerColor,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          style: GoogleFonts.plusJakartaSans(fontSize: 14, color: kcTextDark),
          decoration: InputDecoration(
            prefixIcon: maxLines == 1
                ? Icon(icon, size: 18, color: kcPrimaryColor)
                : Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Icon(icon, size: 18, color: kcPrimaryColor),
                  ),
            hintText: hint,
          ),
          validator: required
              ? (val) => (val == null || val.trim().isEmpty)
                  ? 'Please enter $label'
                  : null
              : null,
        ),
      ],
    );
  }
}
