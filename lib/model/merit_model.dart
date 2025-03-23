class MeritModel {
  MeritModel({
    required this.Year,
    required this.cutOff,
  });
  late final String Year;
  late final List<CutOff> cutOff;

  MeritModel.fromJson(Map<String, dynamic> json) {
    Year = json['Year'];
    cutOff = List.from(json['CutOff']).map((e) => CutOff.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Year'] = Year;
    _data['CutOff'] = cutOff.map((e) => e.toJson()).toList();
    return _data;
  }
}

class CutOff {
  CutOff({
    required this.meritId,
    required this.instituteId,
    required this.generalCutOff,
    required this.obcCutOff,
    required this.scstCutOff,
    required this.esmCutOff,
    required this.year,
    required this.course,
  });
  late final String meritId;
  late final String instituteId;
  late final String generalCutOff;
  late final String obcCutOff;
  late final String scstCutOff;
  late final String esmCutOff;
  late final String year;
  late final String course;

  CutOff.fromJson(Map<String, dynamic> json) {
    meritId = json['meritId'];
    instituteId = json['instituteId'];
    generalCutOff = json['generalCutOff'];
    obcCutOff = json['obcCutOff'];
    scstCutOff = json['scstCutOff'];
    esmCutOff = json['esmCutOff'];
    year = json['year'];
    course = json['course'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['meritId'] = meritId;
    _data['instituteId'] = instituteId;
    _data['generalCutOff'] = generalCutOff;
    _data['obcCutOff'] = obcCutOff;
    _data['scstCutOff'] = scstCutOff;
    _data['esmCutOff'] = esmCutOff;
    _data['year'] = year;
    _data['course'] = course;
    return _data;
  }
}
