

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

  ChildrenData(this.emotions, this.games);

  ChildrenData.fromJson(Map<String, dynamic> json)
      : emotions = (json['emotions'] as List).map((e) => Emotion.fromJson(e)).toList(),
        games = (json['play-game'] as List).map((e) => Game.fromJson(e)).toList();
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