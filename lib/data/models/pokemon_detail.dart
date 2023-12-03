class PokemonDetail {
  String name;
  int id;
  String artwork;
  List<PokemonTypes> types;

//<editor-fold desc="Data Methods">
  PokemonDetail({
    required this.name,
    required this.id,
    required this.artwork,
    required this.types,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokemonDetail &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          id == other.id &&
          artwork == other.artwork &&
          types == other.types);

  @override
  int get hashCode =>
      name.hashCode ^ id.hashCode ^ artwork.hashCode ^ types.hashCode;

  @override
  String toString() {
    return 'PokemonDetail{' +
        ' name: $name,' +
        ' id: $id,' +
        ' artwork: $artwork,' +
        ' types: $types,' +
        '}';
  }

  PokemonDetail copyWith({
    String? name,
    int? id,
    String? artwork,
    List<PokemonTypes>? types,
  }) {
    return PokemonDetail(
      name: name ?? this.name,
      id: id ?? this.id,
      artwork: artwork ?? this.artwork,
      types: types ?? this.types,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'id': this.id,
      'artwork': this.artwork,
      'types': this.types,
    };
  }

  factory PokemonDetail.fromMap(Map<String, dynamic> map) {
    var number = map['id'];
    return PokemonDetail(
      name: map['name'] as String,
      id: map['id'] as int,
      artwork: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$number.png",
      types: List<PokemonTypes>.from(
        (map['types'] as List<dynamic>).map<PokemonTypes>(
              (x) => PokemonTypes.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

//</editor-fold>
}

class PokemonTypes {
  int slot;
  PokemonType type;

//<editor-fold desc="Data Methods">
  PokemonTypes({
    required this.slot,
    required this.type,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokemonTypes &&
          runtimeType == other.runtimeType &&
          slot == other.slot &&
          type == other.type);

  @override
  int get hashCode => slot.hashCode ^ type.hashCode;

  @override
  String toString() {
    return 'PokemonTypes{' + ' slot: $slot,' + ' type: $type,' + '}';
  }

  PokemonTypes copyWith({
    int? slot,
    PokemonType? type,
  }) {
    return PokemonTypes(
      slot: slot ?? this.slot,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'slot': this.slot,
      'type': this.type,
    };
  }

  factory PokemonTypes.fromMap(Map<String, dynamic> map) {
    return PokemonTypes(
      slot: map['slot'] as int,
      type: PokemonType.fromMap(map['type'] as Map<String, dynamic>),
    );
  }

//</editor-fold>
}

class PokemonType {
  String name;
  String url;

//<editor-fold desc="Data Methods">
  PokemonType({
    required this.name,
    required this.url,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokemonType &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          url == other.url);

  @override
  int get hashCode => name.hashCode ^ url.hashCode;

  @override
  String toString() {
    return 'PokemonType{' + ' name: $name,' + ' url: $url,' + '}';
  }

  PokemonType copyWith({
    String? name,
    String? url,
  }) {
    return PokemonType(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'url': this.url,
    };
  }

  factory PokemonType.fromMap(Map<String, dynamic> map) {
    return PokemonType(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

//</editor-fold>
}