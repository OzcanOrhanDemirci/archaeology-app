import 'package:flutter/material.dart';

class AppClickable extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final Color? rippleColor;
  final double borderRadius;
  final bool isExit; // Çıkış butonu gibi kırmızı efektler için

  const AppClickable({
    super.key,
    required this.child,
    required this.onTap,
    this.rippleColor,
    this.borderRadius = 12.0,
    this.isExit = false,
  });

  @override
  State<AppClickable> createState() => _AppClickableState();
}

class _AppClickableState extends State<AppClickable> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {

    final Color themeColor = Theme.of(context).iconTheme.color!;
    final Color effectColor = widget.isExit
        ? Colors.red
        : (widget.rippleColor ?? themeColor);

    return AnimatedScale(

      scale: _isPressed ? 0.95 : 1.0,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: InkWell(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          splashColor: effectColor.withValues(alpha: 0.2),
          highlightColor: effectColor.withValues(alpha: 0.1),
          onTapDown: (_) => setState(() => _isPressed = true),
          onTapUp: (_) => setState(() => _isPressed = false),
          onTapCancel: () => setState(() => _isPressed = false),
          onTap: () async {

            setState(() => _isPressed = true);
            await Future.delayed(const Duration(milliseconds: 60));
            if (mounted) {
              setState(() => _isPressed = false);
              widget.onTap();
            }
          },
          child: widget.child,
        ),
      ),
    );
  }
}