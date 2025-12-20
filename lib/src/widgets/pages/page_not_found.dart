import 'package:flutter/material.dart';
import 'package:toolkit_core/toolkit_core.dart';

/// A beautiful custom 404 page not found widget.
/// Can be used as a standalone page or within navigation error handling.
class PageNotFound extends StatefulWidget {
  /// Title text to display. Defaults to "404".
  final String? title;

  /// Subtitle text to display. Defaults to "Page Not Found".
  final String? subtitle;

  /// Description text. Defaults to a helpful message.
  final String? description;

  /// Optional custom action button.
  final Widget? actionButton;

  /// Callback when the default "Go Home" button is tapped.
  /// Only used if actionButton is not provided.
  final VoidCallback? onGoHome;

  /// Background color. If null, uses theme background.
  final Color? backgroundColor;

  /// Accent color for the icon and button. If null, uses theme primary color.
  final Color? accentColor;

  const PageNotFound({
    super.key,
    this.title,
    this.subtitle,
    this.description,
    this.actionButton,
    this.onGoHome,
    this.backgroundColor,
    this.accentColor,
  });

  @override
  State<PageNotFound> createState() => _PageNotFoundState();
}

class _PageNotFoundState extends State<PageNotFound>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.elasticOut),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.3, 1.0, curve: Curves.easeOutCubic),
          ),
        );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final bgColor = widget.backgroundColor ?? colorScheme.surface;
    final accent = widget.accentColor ?? colorScheme.primary;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated 404 Icon
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: _FloatingIcon(
                      icon: Icons.sentiment_dissatisfied_rounded,
                      color: accent,
                      size: 120,
                    ),
                  ),
                ),
                YGap(40),

                // Animated Title
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Text(
                      widget.title ?? '404',
                      style: TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.bold,
                        color: accent,
                        letterSpacing: 4,
                      ),
                    ),
                  ),
                ),
                YGap(16),

                // Animated Subtitle
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Text(
                      widget.subtitle ?? 'Page Not Found',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
                YGap(16),

                // Animated Description
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: Text(
                        widget.description ??
                            'Oops! The page you\'re looking for seems to have wandered off. Let\'s get you back on track.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: colorScheme.onSurfaceVariant,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
                YGap(48),

                // Animated Action Button
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child:
                        widget.actionButton ??
                        TapBounce(
                          onTap:
                              widget.onGoHome ??
                              () {
                                if (Navigator.of(context).canPop()) {
                                  Navigator.of(context).pop();
                                }
                              },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              color: accent,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: accent.withValues(alpha: 0.3),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.home_rounded,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                XGap(12),
                                Text(
                                  'Go Home',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Floating icon widget with subtle animation
class _FloatingIcon extends StatefulWidget {
  final IconData icon;
  final Color color;
  final double size;

  const _FloatingIcon({
    required this.icon,
    required this.color,
    required this.size,
  });

  @override
  State<_FloatingIcon> createState() => _FloatingIconState();
}

class _FloatingIconState extends State<_FloatingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _floatController;
  late Animation<double> _floatAnimation;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _floatAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _floatAnimation.value),
          child: child,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: widget.color.withValues(alpha: 0.1),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: widget.color.withValues(alpha: 0.2),
              blurRadius: 30,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Icon(widget.icon, size: widget.size, color: widget.color),
      ),
    );
  }
}
