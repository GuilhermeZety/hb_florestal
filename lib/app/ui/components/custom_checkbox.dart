import 'package:flutter/material.dart';
import 'package:hb_florestal/app/core/common/constants/app_colors.dart';

class CustomCheckBox extends StatefulWidget {
  final bool value;
  final bool readOnly;
  final ValueChanged<bool> onChanged;
  final Color checkedIconColor;
  final Color? checkedFillColor;
  final IconData checkedIcon;
  final Color uncheckedIconColor;
  final Color? uncheckedFillColor;
  final IconData uncheckedIcon;
  final double? borderWidth;
  final double? checkBoxSize;
  final bool shouldShowBorder;
  final Color? borderColor;
  final double? borderRadius;
  final double? splashRadius;
  final Color? splashColor;
  final String? tooltip;
  final MouseCursor? mouseCursors;

  const CustomCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
    this.checkedIconColor = Colors.white,
    this.checkedFillColor,
    this.checkedIcon = Icons.check,
    this.uncheckedIconColor = Colors.transparent,
    this.uncheckedFillColor,
    this.uncheckedIcon = Icons.close,
    this.borderWidth,
    this.checkBoxSize,
    this.shouldShowBorder = false,
    this.borderColor = Colors.black12,
    this.borderRadius,
    this.splashRadius,
    this.readOnly = false,
    this.splashColor,
    this.tooltip,
    this.mouseCursors,
  });

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  late bool _checked;
  late CheckStatus _status;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(CustomCheckBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    _init();
  }

  void _init() {
    _checked = widget.value;
    if (_checked) {
      _status = CheckStatus.checked;
    } else {
      _status = CheckStatus.unchecked;
    }
  }

  Widget _buildIcon() {
    late Color fillColor;
    late Color iconColor;
    late IconData iconData;

    switch (_status) {
      case CheckStatus.checked:
        fillColor = widget.checkedFillColor ?? AppColors.primary;
        iconColor = widget.checkedIconColor;
        iconData = widget.checkedIcon;
        break;
      case CheckStatus.unchecked:
        fillColor = widget.uncheckedFillColor ?? const Color(0x00222222).withOpacity(0.1);
        iconColor = widget.uncheckedIconColor;
        iconData = widget.uncheckedIcon;
        break;
    }

    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius ?? 6)),
        border: Border.all(
          color:
              widget.shouldShowBorder ? (widget.borderColor ?? AppColors.primary.withOpacity(0.6)) : (!widget.value ? (widget.borderColor ?? AppColors.primary.withOpacity(0.6)) : Colors.transparent),
          width: widget.shouldShowBorder ? widget.borderWidth ?? 2.0 : 1.0,
        ),
      ),
      child: Icon(
        iconData,
        color: iconColor,
        size: widget.checkBoxSize ?? 18,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: _buildIcon(),
      onPressed: widget.readOnly ? () {} : () => widget.onChanged(!_checked),
      splashRadius: widget.splashRadius,
      splashColor: widget.splashColor,
      tooltip: widget.tooltip,
      mouseCursor: widget.mouseCursors ?? SystemMouseCursors.click,
    );
  }
}

enum CheckStatus { checked, unchecked }
