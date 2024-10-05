enum DataTypes {
  apresentation,
  numbers,
  servicos,
  sobre,
  equipamentos,
  quemSomos,
  contato,
  footer,
  other;

  String get toPrismicName => switch (this) {
        DataTypes.apresentation => 'apresentacao',
        DataTypes.numbers => 'numeros',
        DataTypes.servicos => 'servicos',
        DataTypes.sobre => 'sobre',
        DataTypes.equipamentos => 'equipamentos',
        DataTypes.quemSomos => 'quem_nos_somos',
        DataTypes.contato => 'contato_e_trabalhe_conosco',
        DataTypes.footer => 'footer',
        _ => 'outros',
      };
}
