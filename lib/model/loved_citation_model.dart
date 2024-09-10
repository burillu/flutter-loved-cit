class LovedCitationModel {
  final int id;
  final String text;

  const LovedCitationModel({required this.id, required this.text});

  factory LovedCitationModel.fromRecord(Map<String, dynamic> data) {
    final id = data["id"];
    final text = data["text"];

    return LovedCitationModel(id: id, text: text);
  }
}
