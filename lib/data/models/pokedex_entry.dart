class PokedexEntry {
  String name;
  int number;
  String sprite;

//<editor-fold desc="Data Methods">
  PokedexEntry({
    required this.name,
    required this.number,
    required this.sprite,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokedexEntry &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          number == other.number &&
          sprite == other.sprite);

  @override
  int get hashCode => name.hashCode ^ number.hashCode ^ sprite.hashCode;

  @override
  String toString() {
    return 'PokedexEntry{' +
        ' name: $name,' +
        ' number: $number,' +
        ' sprite: $sprite,' +
        '}';
  }

  PokedexEntry copyWith({
    String? name,
    int? number,
    String? sprite,
  }) {
    return PokedexEntry(
      name: name ?? this.name,
      number: number ?? this.number,
      sprite: sprite ?? this.sprite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'number': this.number,
      'sprite': this.sprite,
    };
  }

  factory PokedexEntry.fromMap(Map<String, dynamic> map) {
    var url = map['url'] as String;
    var trimLastSlash = url.substring(0, url.length - 1);
    String numberString = trimLastSlash.substring(
        trimLastSlash.lastIndexOf('/') + 1, trimLastSlash.length);
    int number = int.parse(numberString);
    String spriteUrl = buildSpriteUrl(number);
    return PokedexEntry(
      name: map['name'] as String,
      number: number,
      sprite: spriteUrl,
    );
  }

  static String buildSpriteUrl(int number) {
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$number.png";
  }
//</editor-fold>
}
