class ChildrenData {
  List<Emotion> emotions;

  ChildrenData(this.emotions,);

  ChildrenData.fromJson(Map<String, dynamic> json)
      : emotions = (json['emotions'] as List).map((e) => Emotion.fromJson(e)).toList();
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