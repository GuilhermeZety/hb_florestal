import 'package:flutter/material.dart';

class GradientTextHighlight extends StatelessWidget {
  final String text;
  final List<(int, int)> spans;
  final LinearGradient gradient;
  final TextStyle? style;

  const GradientTextHighlight({
    super.key,
    required this.text,
    required this.spans,
    required this.gradient,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    final textSpans = _buildTextSpans();

    return Text.rich(
      TextSpan(
        children: textSpans,
        style: style,
      ),
    );
  }

  List<InlineSpan> _buildTextSpans() {
    List<InlineSpan> textSpans = [];
    int currentIndex = 0;

    for (var span in spans) {
      if (span.$1 > currentIndex) {
        // Parte não destacada
        textSpans.add(
          TextSpan(
            text: text.substring(currentIndex, span.$1),
          ),
        );
      }

      // Parte destacada com gradient
      textSpans.add(
        WidgetSpan(
          child: ShaderMask(
            shaderCallback: (bounds) {
              return gradient.createShader(
                Rect.fromLTWH(0, 0, bounds.width, bounds.height),
              );
            },
            child: Text(
              text.substring(span.$1, span.$2),
              style: style?.copyWith(color: Colors.white) ?? const TextStyle(color: Colors.white), // cor de base para a máscara
            ),
          ),
        ),
      );

      currentIndex = span.$2;
    }

    // Adiciona o texto restante, se houver
    if (currentIndex < text.length) {
      textSpans.add(
        TextSpan(
          text: text.substring(currentIndex),
        ),
      );
    }

    return textSpans;
  }
}
