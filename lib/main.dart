import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:loved_cit/app.dart';
import 'package:loved_cit/repository/loved_citation_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final lovedCitationRepository = LovedCitationRepository();
  await lovedCitationRepository.initialize();
  GetIt.I.registerSingleton(lovedCitationRepository);
  runApp(App());
}
