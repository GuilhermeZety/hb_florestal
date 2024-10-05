class SpanString {
  final String text;
  final List<(int indexInicio, int indexFim)> textHighlight;

  SpanString({
    required this.text,
    this.textHighlight = const [],
  });

  factory SpanString.fromMap(Map<String, dynamic> map, bool withHighlight) {
    List<(int, int)> getHighlight() {
      if (withHighlight) {
        return List<Map<String, dynamic>>.from(map['spans'])
            .map(
              (e) => (e['start'] as int, e['end'] as int),
            )
            .toList();
      }
      return [];
    }

    return SpanString(
      text: map['text'],
      textHighlight: getHighlight(),
    );
  }
}
