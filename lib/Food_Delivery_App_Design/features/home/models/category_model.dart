class CategoriesModel {
  int? _id;
  String? _name;
  String? _image;
  int? _parentId;
  int? _position;
  int? _status;
  String? _createdAt;
  String? _updatedAt;
  int? _priority;
  String? _slug;
  int? _productsCount;
  int? _childesCount;
  String? _imageFullUrl;

  List<Translations>? _translations;


  CategoriesModel(
      {int? id,
        String? name,
        String? image,
        int? parentId,
        int? position,
        int? status,
        String? createdAt,
        String? updatedAt,
        int? priority,
        String? slug,
        int? productsCount,
        int? childesCount,
        String? imageFullUrl,
        List<Null>? childes,
        List<Translations>? translations,
        List<Null>? storage}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (image != null) {
      _image = image;
    }
    if (parentId != null) {
      _parentId = parentId;
    }
    if (position != null) {
      _position = position;
    }
    if (status != null) {
      _status = status;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    if (priority != null) {
      _priority = priority;
    }
    if (slug != null) {
      _slug = slug;
    }
    if (productsCount != null) {
      _productsCount = productsCount;
    }
    if (childesCount != null) {
      _childesCount = childesCount;
    }
    if (imageFullUrl != null) {
      _imageFullUrl = imageFullUrl;
    }
    if (translations != null) {
      _translations = translations;
    }

  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get image => _image;
  set image(String? image) => _image = image;
  int? get parentId => _parentId;
  set parentId(int? parentId) => _parentId = parentId;
  int? get position => _position;
  set position(int? position) => _position = position;
  int? get status => _status;
  set status(int? status) => _status = status;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  int? get priority => _priority;
  set priority(int? priority) => _priority = priority;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  int? get productsCount => _productsCount;
  set productsCount(int? productsCount) => _productsCount = productsCount;
  int? get childesCount => _childesCount;
  set childesCount(int? childesCount) => _childesCount = childesCount;
  String? get imageFullUrl => _imageFullUrl;
  set imageFullUrl(String? imageFullUrl) => _imageFullUrl = imageFullUrl;
  List<Translations>? get translations => _translations;
  set translations(List<Translations>? translations) =>
      _translations = translations;


  CategoriesModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _parentId = json['parent_id'];
    _position = json['position'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _priority = json['priority'];
    _slug = json['slug'];
    _productsCount = json['products_count'];
    _childesCount = json['childes_count'];
    _imageFullUrl = json['image_full_url'];

    if (json['translations'] != null) {
      _translations = <Translations>[];
      json['translations'].forEach((v) {
        _translations!.add(Translations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['image'] = _image;
    data['parent_id'] = _parentId;
    data['position'] = _position;
    data['status'] = _status;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['priority'] = _priority;
    data['slug'] = _slug;
    data['products_count'] = _productsCount;
    data['childes_count'] = _childesCount;
    data['image_full_url'] = _imageFullUrl;
    if (_translations != null) {
      data['translations'] =
          _translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Translations {
  int? _id;
  String? _translationableType;
  int? _translationableId;
  String? _locale;
  String? _key;
  String? _value;
  Null _createdAt;
  Null _updatedAt;

  Translations(
      {int? id,
        String? translationableType,
        int? translationableId,
        String? locale,
        String? key,
        String? value,
        Null createdAt,
        Null updatedAt}) {
    if (id != null) {
      _id = id;
    }
    if (translationableType != null) {
      _translationableType = translationableType;
    }
    if (translationableId != null) {
      _translationableId = translationableId;
    }
    if (locale != null) {
      _locale = locale;
    }
    if (key != null) {
      _key = key;
    }
    if (value != null) {
      _value = value;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get translationableType => _translationableType;
  set translationableType(String? translationableType) =>
      _translationableType = translationableType;
  int? get translationableId => _translationableId;
  set translationableId(int? translationableId) =>
      _translationableId = translationableId;
  String? get locale => _locale;
  set locale(String? locale) => _locale = locale;
  String? get key => _key;
  set key(String? key) => _key = key;
  String? get value => _value;
  set value(String? value) => _value = value;
  Null get createdAt => _createdAt;
  set createdAt(Null createdAt) => _createdAt = createdAt;
  Null get updatedAt => _updatedAt;
  set updatedAt(Null updatedAt) => _updatedAt = updatedAt;

  Translations.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _translationableType = json['translationable_type'];
    _translationableId = json['translationable_id'];
    _locale = json['locale'];
    _key = json['key'];
    _value = json['value'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['translationable_type'] = _translationableType;
    data['translationable_id'] = _translationableId;
    data['locale'] = _locale;
    data['key'] = _key;
    data['value'] = _value;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}
