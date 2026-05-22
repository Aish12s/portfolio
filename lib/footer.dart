import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key, this.onToggleTheme, this.isDarkMode = false});

  final VoidCallback? onToggleTheme;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;
    final isCompact = MediaQuery.sizeOf(context).width < 700;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isCompact ? 20 : 28),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1E40AF), Color(0xFF2563EB), Color(0xFF3B82F6)],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2563EB).withValues(alpha: 0.25),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: isCompact
          ? Column(
        children: [
          _FooterIdentity(year: year),
          const SizedBox(height: 18),
          _FooterStatus(
            onToggle: onToggleTheme,
            isDarkMode: isDarkMode,
          ),
        ],
      )
          : Row(
        children: [
          Expanded(child: _FooterIdentity(year: year)),
          const SizedBox(width: 24),
          _FooterStatus(
            onToggle: onToggleTheme,
            isDarkMode: isDarkMode,
          ),
        ],
      ),
    );
  }
}

class _FooterIdentity extends StatelessWidget {
  const _FooterIdentity({required this.year});
  final int year;

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).width < 700;
    return Column(
      crossAxisAlignment: isCompact ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        const Text(
          'Aishwarya Subhash Suvarna',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '© $year Portfolio. Built with Flutter for web and mobile.',
          textAlign: isCompact ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.8),
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

class _FooterStatus extends StatelessWidget {
  const _FooterStatus({this.onToggle, this.isDarkMode = false});

  final VoidCallback? onToggle;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isDarkMode ? Icons.dark_mode : Icons.light_mode,
            size: 16,
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          const Text(
            'Theme',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          Transform.scale(
            scale: 0.8,
            child: Switch(
              value: isDarkMode,
              onChanged: (_) => onToggle?.call(),
              activeColor: Colors.white,
              activeTrackColor: Colors.white.withValues(alpha: 0.3),
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.white.withValues(alpha: 0.3),
            ),
          ),
        ],
      ),
    );
  }
}
