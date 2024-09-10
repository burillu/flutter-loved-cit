import 'package:get_it/get_it.dart';
import 'package:loved_cit/model/loved_citation_model.dart';
import 'package:loved_cit/repository/loved_citation_repository.dart';

class LovedCitationList {
  List<LovedCitationModel> citations = [];

  Future<void> initialize() async {
    citations = await GetIt.I.get<LovedCitationRepository>().all();
  }

  Future<void> create(String text) async {
    final citation = await GetIt.I.get<LovedCitationRepository>().save(text);
    citations.insert(0, citation);
  }

  Future<void> delete(LovedCitationModel lovedCitationModel) async {
    await GetIt.I.get<LovedCitationRepository>().delete(lovedCitationModel);
    citations.removeWhere((item) => item.id == lovedCitationModel.id);
  }

  bool isContained(String text) {
    return citations.any((item) => item.text == text);
  }
}
