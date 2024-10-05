import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hb_florestal/app/core/common/constants/app_constants.dart';
import 'package:hb_florestal/app/core/shared/current_session.dart';
import 'package:hb_florestal/app/core/shared/features/prismic/models/content_model.dart';

class PrismicService {
  static Future<String?> getUpdatedRef() async {
    var response = await Dio().get(AppConstants.prismicUrl);

    var refs = List<Map<String, dynamic>>.from(response.data['refs']);

    if (refs.isEmpty) {
      return null;
    }

    var masterRef = refs.where((e) => e['isMasterRef']);

    return masterRef.first['ref'];
  }

  //CACHED

  static Future<List<ContentModel>> getContent() async {
    try {
      final prefs = CurrentSession().prefs;

      final ref = await getUpdatedRef();
      if (ref == null) {
        throw Exception('Erro ao Atualizar a REF da CDN');
      }

      final cachedRef = prefs.getString('prismic-ref');
      if (cachedRef != null) {
        if (cachedRef == ref) {
          var prismicData = prefs.getStringList('prismic-data');

          if (prismicData != null && prismicData.isNotEmpty) return prismicData.map<ContentModel>((e) => ContentModel.fromMap(jsonDecode(e))).toList();
        }
      }

      var response = await Dio().get(AppConstants.getFullPrismicUrl(ref));

      await (
        prefs.setString('prismic-ref', ref),
        prefs.setStringList('prismic-data', List<Map<String, dynamic>>.from(response.data['results']).map<String>((e) => jsonEncode(e)).toList()),
      ).wait;

      return response.data['results'].map<ContentModel>((e) => ContentModel.fromMap(e)).toList();
    } catch (err, stt) {
      log(err.toString(), error: err, stackTrace: stt);
      rethrow;
    }
  }
}
