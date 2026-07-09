import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../theme/app_theme.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _badge('✦ Connect'),
          const SizedBox(height: 20),
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.white, AppTheme.primary, AppTheme.secondary],
            ).createShader(bounds),
            child: const Text(
              "Let's Talk",
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 700) {
                return _buildMobileLayout();
              }
              return _buildDesktopLayout();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildContactInfo()),
        const SizedBox(width: 60),
        Expanded(child: _buildContactForm()),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildContactInfo(),
        const SizedBox(height: 40),
        _buildContactForm(),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Start a Project 🚀',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          "Have something in mind? Let's build the future together.",
          style: TextStyle(
            color: Color(0xFF8888CC),
            fontSize: 16,
            height: 1.8,
          ),
        ),
        const SizedBox(height: 24),
        _contactLink('📧', 'Keshabsarkar2018@gmail.com'),
        const SizedBox(height: 10),
        _contactLink('🐙', 'github.com/Keshab1997'),
        const SizedBox(height: 10),
        _contactLink('📞', '+91 9382284190'),
      ],
    );
  }

  Widget _buildContactForm() {
    return Column(
      children: [
        _buildTextField(_nameController, 'Your Name'),
        const SizedBox(height: 14),
        _buildTextField(_emailController, 'Email Address'),
        const SizedBox(height: 14),
        _buildTextField(_subjectController, 'Subject'),
        const SizedBox(height: 14),
        _buildTextField(_messageController, 'Tell me about your vision...',
            maxLines: 4),
        const SizedBox(height: 20),
	        GestureDetector(
	          onTap: () async {
	            final uri = Uri(
	              scheme: 'mailto',
	              path: 'Keshabsarkar2018@gmail.com',
	              queryParameters: {
	                'subject': _subjectController.text,
	                'body': 'From: ${_nameController.text}\n'
	                    'Email: ${_emailController.text}\n\n'
	                    '${_messageController.text}',
	              },
	            );
	            if (await canLaunchUrl(uri)) {
	              await launchUrl(uri);
	            }
	          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: const LinearGradient(
                colors: [AppTheme.primary, AppTheme.secondary],
              ),
            ),
            child: const Text(
              'Send Message →',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _badge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.primary.withOpacity(0.2)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppTheme.primary,
          fontSize: 12,
          letterSpacing: 2,
        ),
      ),
    );
  }

  Widget _contactLink(String emoji, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.02),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 22)),
          const SizedBox(width: 14),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFFE0E0FF),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint,
      {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Color(0xFFE0E0FF)),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFF6666AA)),
        filled: true,
        fillColor: Colors.white.withOpacity(0.02),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.06)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.06)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppTheme.primary),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20, vertical: 18,
        ),
      ),
    );
  }
}