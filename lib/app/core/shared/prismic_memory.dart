import 'dart:developer';

import 'package:hb_florestal/app/core/shared/features/prismic/models/content_model.dart';
import 'package:hb_florestal/app/core/shared/features/prismic/prismic_service.dart';

class PrismicMemory {
  //SingleTon
  PrismicMemory._();
  static final PrismicMemory _instance = PrismicMemory._();
  factory PrismicMemory() => PrismicMemory._instance;
  //

  ApresentationContent? apresentation;
  NumbersContent? numbers;
  ServicesContent? servicos;
  AboutContent? sobre;
  EquipamentosContent? equipamentos;
  QuemNosSomosContent? quemSomos;
  ContactContent? contato;
  FooterContent? footer;

  Future load() async {
    Stopwatch stopwatch = Stopwatch()..start();
    var response = await PrismicService.getContent();

    if (response.isNotEmpty) {
      apresentation = response.whereType<ApresentationContent>().first;
      numbers = response.whereType<NumbersContent>().first;
      servicos = response.whereType<ServicesContent>().first;
      sobre = response.whereType<AboutContent>().first;
      equipamentos = response.whereType<EquipamentosContent>().first;
      quemSomos = response.whereType<QuemNosSomosContent>().first;
      contato = response.whereType<ContactContent>().first;
      footer = response.whereType<FooterContent>().first;

      stopwatch.stop();
      log('Prismic carregado em ${stopwatch.elapsedMilliseconds}ms', name: 'Prismic');
    }
  }
}
