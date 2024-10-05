import 'package:flutter/material.dart';
import 'package:hb_florestal/app/core/common/constants/app_colors.dart';
import 'package:hb_florestal/app/core/common/constants/app_fonts.dart';
import 'package:hb_florestal/app/core/common/extensions/color_extension.dart';
import 'package:hb_florestal/app/core/common/utils/toasting.dart';
import 'package:hb_florestal/app/ui/components/loader.dart';

// Custom buttons are created by extending the MaterialButton class
class Button extends StatefulWidget {
  final Future<void> Function()? onPressed;
  final Widget child;
  final FocusNode? focusNode;
  final VoidCallback? onLongPress;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsets padding;
  final bool disabled;

  const Button({
    super.key,
    required this.onPressed,
    required this.child,
    this.focusNode,
    this.onLongPress,
    this.disabled = false,
    this.backgroundColor = AppColors.primary,
    this.foregroundColor,
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
  });
  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isLoading = false;
  late Future<void> Function() action;

  @override
  void initState() {
    action = () async {
      if (!mounted) return;
      if (widget.disabled) return;
      try {
        if (widget.onPressed == null) return;

        isLoading = true;
        if (!mounted) return;
        setState(() {});

        await widget.onPressed!();

        isLoading = false;
        if (!mounted) return;
        setState(() {});
      } catch (err) {
        if (!mounted) return;
        if (err is TypeError) {
          Toasting.error(context, title: 'Erro: $err', stackTrace: err.stackTrace);
          return;
        }
        if (err is Exception) {
          Toasting.error(context, title: 'Erro: $err');
          return;
        }
        Toasting.error(context, title: 'Erro: $err');
      }
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        var content = Material(
          color: widget.backgroundColor?.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap: action,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: widget.backgroundColor!,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: widget.padding,
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontFamily: AppFonts.defaultFont,
                    color: widget.foregroundColor ?? widget.backgroundColor!.lighten(0.3),
                    fontSize: 16,
                    fontWeight: AppFonts.medium,
                    letterSpacing: 0.3,
                  ),
                  child: Center(
                    child: isLoading ? const Loader(size: 16, inverted: true) : widget.child,
                  ),
                ),
              ),
            ),
          ),
        );
        return content;
      },
    );
  }
}
