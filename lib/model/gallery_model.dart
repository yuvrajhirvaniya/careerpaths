class Gallery {
  Gallery({
    required this.galleryId,
    required this.instituteId,
    required this.title,
    required this.photo,
    required this.appPhoto,
  });
  late final String galleryId;
  late final String instituteId;
  late final String title;
  late final String photo;
  late final String appPhoto;

  Gallery.fromJson(Map<String, dynamic> json) {
    galleryId = json['galleryId'];
    instituteId = json['instituteId'];
    title = json['title'];
    photo = json['photo'];
    appPhoto = json['app_photo'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['galleryId'] = galleryId;
    _data['instituteId'] = instituteId;
    _data['title'] = title;
    _data['photo'] = photo;
    _data['app_photo'] = appPhoto;
    return _data;
  }
}
