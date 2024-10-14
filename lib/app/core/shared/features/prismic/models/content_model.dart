// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hb_florestal/app/core/shared/features/prismic/data_types.dart';
import 'package:hb_florestal/app/core/shared/models/translated_string.dart';

class ContentModel extends Equatable {
  final DataTypes type;
  const ContentModel({required this.type});

  factory ContentModel.fromMap(Map<String, dynamic> map) {
    try {
      return switch (map['type']) {
        'apresentacao' => ApresentationContent.fromMap(map),
        'numeros' => NumbersContent.fromMap(map),
        'servicos' => ServicesContent.fromMap(map),
        'sobre' => AboutContent.fromMap(map),
        'equipamentos' => EquipamentosContent.fromMap(map),
        'quem_nos_somos' => QuemNosSomosContent.fromMap(map),
        'contato_e_trabalhe_conosco' => ContactContent.fromMap(map),
        'footer' => FooterContent.fromMap(map),
        _ => const ContentModel(type: DataTypes.other),
      };
    } catch (e) {
      rethrow;
    }
  }

  factory ContentModel.fromJson(String source) => ApresentationContent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [];
}

class ApresentationContent extends ContentModel {
  final SpanString titulo;
  final SpanString subtitulo;

  const ApresentationContent({
    required this.titulo,
    required this.subtitulo,
    super.type = DataTypes.apresentation,
  });

  ApresentationContent copyWith({
    SpanString? titulo,
    SpanString? subtitulo,
    DataTypes? type,
  }) {
    return ApresentationContent(
      titulo: titulo ?? this.titulo,
      subtitulo: subtitulo ?? this.subtitulo,
      type: type ?? this.type,
    );
  }

  factory ApresentationContent.fromMap(Map<String, dynamic> map) {
    return ApresentationContent(
      titulo: SpanString.fromMap(
        map['data']['titulo'].first as Map<String, dynamic>,
        true,
      ),
      subtitulo: SpanString.fromMap(
        map['data']['subtitulo'].first as Map<String, dynamic>,
        true,
      ),
    );
  }

  factory ApresentationContent.fromJson(String source) => ApresentationContent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<String?> get props => [
        titulo.text,
        subtitulo.text,
      ];
}

class NumbersContent extends ContentModel {
  final List<({int number, String descricao})> numbers;

  const NumbersContent({
    required this.numbers,
    super.type = DataTypes.numbers,
  });

  NumbersContent copyWith({
    List<({int number, String descricao})>? numbers,
    DataTypes? type,
  }) {
    return NumbersContent(
      numbers: numbers ?? this.numbers,
      type: type ?? this.type,
    );
  }

  factory NumbersContent.fromMap(Map<String, dynamic> map) {
    var numeros = List<Map<String, dynamic>>.from(map['data']['data']);
    return NumbersContent(
      numbers: numeros.map((e) => (number: e['numero'] as int, descricao: e['descricao'].first['text'] as String)).toList(),
    );
  }

  factory NumbersContent.fromJson(String source) => NumbersContent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<String?> get props => [
        ...numbers.map((e) => '${e.number}-${e.descricao}'),
      ];
}

class ServicesContent extends ContentModel {
  final SpanString descricao;
  final List<({String titulo, String subtitulo, String descricao})> servicos;

  const ServicesContent({
    required this.descricao,
    required this.servicos,
    super.type = DataTypes.servicos,
  });

  ServicesContent copyWith({
    SpanString? descricao,
    List<({String titulo, String subtitulo, String descricao})>? servicos,
    DataTypes? type,
  }) {
    return ServicesContent(
      descricao: descricao ?? this.descricao,
      servicos: servicos ?? this.servicos,
      type: type ?? this.type,
    );
  }

  factory ServicesContent.fromMap(Map<String, dynamic> map) {
    var services = List<Map<String, dynamic>>.from(map['data']['servicos']);
    return ServicesContent(
      descricao: SpanString.fromMap(
        map['data']['descricao'].first as Map<String, dynamic>,
        true,
      ),
      servicos: services
          .map(
            (e) => (titulo: e['titulo'].first['text'] as String, subtitulo: e['subtitulo'].first['text'] as String, descricao: e['descricao1'].first['text'] as String),
          )
          .toList(),
    );
  }

  factory ServicesContent.fromJson(String source) => ServicesContent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<String?> get props => [
        descricao.text,
        ...servicos.map((e) => '${e.titulo}-${e.subtitulo}-${e.descricao}'),
      ];
}

class AboutContent extends ContentModel {
  final SpanString esquerda;
  final SpanString segundo;

  const AboutContent({
    required this.esquerda,
    required this.segundo,
    super.type = DataTypes.sobre,
  });

  AboutContent copyWith({
    SpanString? esquerda,
    SpanString? segundo,
    DataTypes? type,
  }) {
    return AboutContent(
      esquerda: esquerda ?? this.esquerda,
      segundo: segundo ?? this.segundo,
      type: type ?? this.type,
    );
  }

  factory AboutContent.fromMap(Map<String, dynamic> map) {
    return AboutContent(
      esquerda: SpanString.fromMap(
        map['data']['esquerda'].first as Map<String, dynamic>,
        true,
      ),
      segundo: SpanString.fromMap(
        map['data']['segundo'].first as Map<String, dynamic>,
        true,
      ),
    );
  }

  factory AboutContent.fromJson(String source) => AboutContent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<String?> get props => [
        esquerda.text,
        segundo.text,
      ];
}

class EquipamentosContent extends ContentModel {
  final SpanString descricao;
  final List<({String imagem, String titulo, String descricao})> equipamentos;

  const EquipamentosContent({
    required this.descricao,
    required this.equipamentos,
    super.type = DataTypes.equipamentos,
  });

  EquipamentosContent copyWith({
    SpanString? descricao,
    List<({String imagem, String titulo, String descricao})>? equipamentos,
    DataTypes? type,
  }) {
    return EquipamentosContent(
      descricao: descricao ?? this.descricao,
      equipamentos: equipamentos ?? this.equipamentos,
      type: type ?? this.type,
    );
  }

  factory EquipamentosContent.fromMap(Map<String, dynamic> map) {
    var equipaments = List<Map<String, dynamic>>.from(map['data']['equipamento']);
    return EquipamentosContent(
      descricao: SpanString.fromMap(
        map['data']['descricao'].first as Map<String, dynamic>,
        true,
      ),
      equipamentos: equipaments
          .map(
            (e) => (imagem: e['imagem']['url'] as String, titulo: e['titulo'].first['text'] as String, descricao: e['descricao1'].first['text'] as String),
          )
          .toList(),
    );
  }

  factory EquipamentosContent.fromJson(String source) => EquipamentosContent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<String?> get props => [
        descricao.text,
        ...equipamentos.map((e) => '${e.imagem}-${e.titulo}-${e.descricao}'),
      ];
}

class QuemNosSomosContent extends ContentModel {
  final SpanString titulo;
  final SpanString descricao;

  const QuemNosSomosContent({
    required this.descricao,
    required this.titulo,
    super.type = DataTypes.quemSomos,
  });

  QuemNosSomosContent copyWith({
    SpanString? descricao,
    SpanString? titulo,
    DataTypes? type,
  }) {
    return QuemNosSomosContent(
      descricao: descricao ?? this.descricao,
      titulo: titulo ?? this.titulo,
      type: type ?? this.type,
    );
  }

  factory QuemNosSomosContent.fromMap(Map<String, dynamic> map) {
    return QuemNosSomosContent(
      descricao: SpanString.fromMap(
        map['data']['descricao'].first as Map<String, dynamic>,
        true,
      ),
      titulo: SpanString.fromMap(
        map['data']['titulo'].first as Map<String, dynamic>,
        true,
      ),
    );
  }

  factory QuemNosSomosContent.fromJson(String source) => QuemNosSomosContent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<String?> get props => [
        descricao.text,
        titulo.text,
      ];
}

class ContactContent extends ContentModel {
  final SpanString contatoDescricao;
  final SpanString trabalheConoscoDescricao;

  const ContactContent({
    required this.contatoDescricao,
    required this.trabalheConoscoDescricao,
    super.type = DataTypes.contato,
  });

  ContactContent copyWith({
    SpanString? contatoDescricao,
    SpanString? trabalheConoscoDescricao,
    DataTypes? type,
  }) {
    return ContactContent(
      contatoDescricao: contatoDescricao ?? this.contatoDescricao,
      trabalheConoscoDescricao: trabalheConoscoDescricao ?? this.trabalheConoscoDescricao,
      type: type ?? this.type,
    );
  }

  factory ContactContent.fromMap(Map<String, dynamic> map) {
    return ContactContent(
      contatoDescricao: SpanString.fromMap(
        map['data']['contato_descricao'].first as Map<String, dynamic>,
        true,
      ),
      trabalheConoscoDescricao: SpanString.fromMap(
        map['data']['trabalhe_conosco_descricao'].first as Map<String, dynamic>,
        true,
      ),
    );
  }

  factory ContactContent.fromJson(String source) => ContactContent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<String?> get props => [
        contatoDescricao.text,
        trabalheConoscoDescricao.text,
      ];
}

class FooterContent extends ContentModel {
  final String instagramLink;
  final String whatsappNumber;
  final String numero;
  final String email;
  final String endereco;

  const FooterContent({
    required this.instagramLink,
    required this.whatsappNumber,
    required this.numero,
    required this.email,
    required this.endereco,
    super.type = DataTypes.footer,
  });

  FooterContent copyWith({
    String? instagramLink,
    String? whatsappNumber,
    String? numero,
    String? email,
    String? endereco,
    DataTypes? type,
  }) {
    return FooterContent(
      instagramLink: instagramLink ?? this.instagramLink,
      whatsappNumber: whatsappNumber ?? this.whatsappNumber,
      numero: numero ?? this.numero,
      email: email ?? this.email,
      endereco: endereco ?? this.endereco,
      type: type ?? this.type,
    );
  }

  factory FooterContent.fromMap(Map<String, dynamic> map) {
    return FooterContent(
      instagramLink: map['data']['instagram_link']['url'] as String,
      whatsappNumber: map['data']['whatsapp_number'].first['text'] as String,
      numero: map['data']['numero'].first['text'] as String,
      email: map['data']['email'].first['text'] as String,
      endereco: map['data']['endereco'].first['text'] as String,
    );
  }

  factory FooterContent.fromJson(String source) => FooterContent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<String?> get props => [
        instagramLink,
        whatsappNumber,
        numero,
        email,
        endereco,
      ];
}
