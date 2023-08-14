class MakeDo {
  int id;
  List<String> emotions;
  bool under13;
  bool over13;
  String title;
  String? caution;
  String description;
  String? src;
  List<String>? howItHelps;
  List<String> materials;
  List<Instruction> instructions;

  MakeDo(
      {required this.id,
        required this.emotions,
        required this.under13,
        required this.over13,
        required this.title,
        required this.caution,
        required this.description,
        required this.src,
        required this.howItHelps,
        required this.materials,
        required this.instructions}
      );

  MakeDo.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    emotions = json['emotions'].cast<String>(),
    under13 = json['under13'],
    over13 = json['over13'],
    title = json['title'],
    caution = json['caution'],
    description = json['description'],
    src = json['src'],
    howItHelps = json['how-it-helps']?.cast<String>(),
    materials = json['materials'].cast<String>(),
    instructions = (json['instructions'] as List).map((e) => Instruction.fromJson(e)).toList();

  @override
  String toString() {
    return 'MakeDo{id: $id, emotions: $emotions, under13: $under13, over13: $over13, title: $title, caution: $caution, description: $description, src: $src, howItHelps: $howItHelps, materials: $materials, instructions: $instructions}';
  }
}

class Instruction {
  String? src;
  List<String> step;

  Instruction({required this.src, required this.step});

  Instruction.fromJson(Map<String, dynamic> json):
    src = json['src'],
    step = json['step'].cast<String>();

  @override
  String toString() {
    return 'Instruction{src: $src, step: $step}';
  }
}

class Game {
  int id;
  List<String> emotions;
  String name;
  String description;
  String src;
  List<String> howItHelps;
  String game;

  Game(
      this.id,
      this.emotions,
      this.name,
      this.description,
      this.src,
      this.howItHelps,
      this.game
      );

  Game.fromJson(Map<String, dynamic> json):
        id = json['id'],
        emotions = json['emotions'].cast<String>(),
        name = json['name'],
        description = json['description'],
        src = json['src'],
        howItHelps = json['how-it-helps'].cast<String>(),
        game = json['game'];

  @override
  String toString() {
    return 'Game{id: $id, emotions: $emotions, name: $name, description: $description, src: $src, howItHelps: $howItHelps, game: $game}';
  }
}

class ChildrenData {
  List<Emotion> emotions;
  List<Game> games;
  List<MakeDo> makeDoList;

  ChildrenData(this.emotions, this.games, this.makeDoList);

  ChildrenData.fromJson(Map<String, dynamic> json)
      : emotions = (json['emotions'] as List).map((e) => Emotion.fromJson(e)).toList(),
        games = (json['play-game'] as List).map((e) => Game.fromJson(e)).toList(),
        makeDoList = (json['do-make'] as List).map((e) => MakeDo.fromJson(e)).toList();
}

class EmotionDataForAge {
  String title;
  String image;
  String description;
  List<String> symptoms;

  EmotionDataForAge(this.title, this.image, this.description, this.symptoms);

  EmotionDataForAge.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        image = json['src'],
        description = json['description'],
        symptoms = json['symptoms'].cast<String>();

  @override
  String toString() {
    return 'EmotionDataForAge{title: $title, image: $image, description: $description, symptoms: $symptoms}';
  }
}

class Emotion {
  int id;
  String name;
  bool restricted;
  EmotionDataForAge under13;
  EmotionDataForAge over13;

  Emotion(this.id, this.name, this.restricted, this.under13, this.over13);

  Emotion.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        restricted = json['restricted'],
        under13 = EmotionDataForAge.fromJson(json['under13']),
        over13 = EmotionDataForAge.fromJson(json['over13']);

  @override
  String toString() {
    return 'Emotion{id: $id, name: $name, restricted: $restricted, under13: $under13, over13: $over13}';
  }
}