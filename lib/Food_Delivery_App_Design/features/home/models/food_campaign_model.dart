class FoodCampaignModel {
  int? _id;
  String? _image;
  String? _description;
  int? _status;
  int? _adminId;
  List<CategoryIds>? _categoryIds;
  List<AddOns>? _addOns;
  String? _attributes;
  String? _choiceOptions;
  int? _price;
  int? _tax;
  String? _taxType;
  int? _discount;
  String? _discountType;
  int? _restaurantId;
  String? _createdAt;
  String? _updatedAt;
  int? _veg;
  int? _tempAvailable;
  int? _open;
  String? _name;
  String? _availableTimeStarts;
  String? _availableTimeEnds;
  String? _availableDateStarts;
  String? _availableDateEnds;
  int? _recommended;
  String? _restaurantName;
  int? _restaurantStatus;
  int? _restaurantDiscount;
  bool? _scheduleOrder;
  int? _ratingCount;
  int? _avgRating;
  int? _minDeliveryTime;
  int? _maxDeliveryTime;
  int? _freeDelivery;
  int? _halalTagStatus;
  List<Cuisines>? _cuisines;
  String? _imageFullUrl;
  List<Translations>? _translations;


  FoodCampaignModel(
      {int? id,
        String? image,
        String? description,
        int? status,
        int? adminId,
        List<CategoryIds>? categoryIds,
        List<Null>? variations,
        List<AddOns>? addOns,
        String? attributes,
        String? choiceOptions,
        int? price,
        int? tax,
        String? taxType,
        int? discount,
        String? discountType,
        int? restaurantId,
        String? createdAt,
        String? updatedAt,
        int? veg,
        int? tempAvailable,
        int? open,
        String? name,
        String? availableTimeStarts,
        String? availableTimeEnds,
        String? availableDateStarts,
        String? availableDateEnds,
        int? recommended,
        String? restaurantName,
        int? restaurantStatus,
        int? restaurantDiscount,
        bool? scheduleOrder,
        int? ratingCount,
        int? avgRating,
        int? minDeliveryTime,
        int? maxDeliveryTime,
        int? freeDelivery,
        int? halalTagStatus,
        List<Cuisines>? cuisines,
        String? imageFullUrl,
        List<Translations>? translations,
      }) {
    if (id != null) {
      _id = id;
    }
    if (image != null) {
      _image = image;
    }
    if (description != null) {
      _description = description;
    }
    if (status != null) {
      _status = status;
    }
    if (adminId != null) {
      _adminId = adminId;
    }

    if (categoryIds != null) {
      _categoryIds = categoryIds;
    }

    if (addOns != null) {
      _addOns = addOns;
    }
    if (attributes != null) {
      _attributes = attributes;
    }
    if (choiceOptions != null) {
      _choiceOptions = choiceOptions;
    }
    if (price != null) {
      _price = price;
    }
    if (tax != null) {
      _tax = tax;
    }
    if (taxType != null) {
      _taxType = taxType;
    }
    if (discount != null) {
      _discount = discount;
    }
    if (discountType != null) {
      _discountType = discountType;
    }
    if (restaurantId != null) {
      _restaurantId = restaurantId;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    if (veg != null) {
      _veg = veg;
    }

    if (tempAvailable != null) {
      _tempAvailable = tempAvailable;
    }
    if (open != null) {
      _open = open;
    }
    if (name != null) {
      _name = name;
    }
    if (availableTimeStarts != null) {
      _availableTimeStarts = availableTimeStarts;
    }
    if (availableTimeEnds != null) {
      _availableTimeEnds = availableTimeEnds;
    }
    if (availableDateStarts != null) {
      _availableDateStarts = availableDateStarts;
    }
    if (availableDateEnds != null) {
      _availableDateEnds = availableDateEnds;
    }
    if (recommended != null) {
      _recommended = recommended;
    }

    if (restaurantName != null) {
      _restaurantName = restaurantName;
    }
    if (restaurantStatus != null) {
      _restaurantStatus = restaurantStatus;
    }
    if (restaurantDiscount != null) {
      _restaurantDiscount = restaurantDiscount;
    }

    if (scheduleOrder != null) {
      _scheduleOrder = scheduleOrder;
    }
    if (ratingCount != null) {
      _ratingCount = ratingCount;
    }
    if (avgRating != null) {
      _avgRating = avgRating;
    }
    if (minDeliveryTime != null) {
      _minDeliveryTime = minDeliveryTime;
    }
    if (maxDeliveryTime != null) {
      _maxDeliveryTime = maxDeliveryTime;
    }
    if (freeDelivery != null) {
      _freeDelivery = freeDelivery;
    }
    if (halalTagStatus != null) {
      _halalTagStatus = halalTagStatus;
    }
    if (cuisines != null) {
      _cuisines = cuisines;
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
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get description => _description;
  set description(String? description) => _description = description;
  int? get status => _status;
  set status(int? status) => _status = status;
  int? get adminId => _adminId;
  set adminId(int? adminId) => _adminId = adminId;

  List<CategoryIds>? get categoryIds => _categoryIds;
  set categoryIds(List<CategoryIds>? categoryIds) => _categoryIds = categoryIds;

  List<AddOns>? get addOns => _addOns;
  set addOns(List<AddOns>? addOns) => _addOns = addOns;
  String? get attributes => _attributes;
  set attributes(String? attributes) => _attributes = attributes;
  String? get choiceOptions => _choiceOptions;
  set choiceOptions(String? choiceOptions) => _choiceOptions = choiceOptions;
  int? get price => _price;
  set price(int? price) => _price = price;
  int? get tax => _tax;
  set tax(int? tax) => _tax = tax;
  String? get taxType => _taxType;
  set taxType(String? taxType) => _taxType = taxType;
  int? get discount => _discount;
  set discount(int? discount) => _discount = discount;
  String? get discountType => _discountType;
  set discountType(String? discountType) => _discountType = discountType;
  int? get restaurantId => _restaurantId;
  set restaurantId(int? restaurantId) => _restaurantId = restaurantId;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  int? get veg => _veg;
  set veg(int? veg) => _veg = veg;

  int? get tempAvailable => _tempAvailable;
  set tempAvailable(int? tempAvailable) => _tempAvailable = tempAvailable;
  int? get open => _open;
  set open(int? open) => _open = open;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get availableTimeStarts => _availableTimeStarts;
  set availableTimeStarts(String? availableTimeStarts) =>
      _availableTimeStarts = availableTimeStarts;
  String? get availableTimeEnds => _availableTimeEnds;
  set availableTimeEnds(String? availableTimeEnds) =>
      _availableTimeEnds = availableTimeEnds;
  String? get availableDateStarts => _availableDateStarts;
  set availableDateStarts(String? availableDateStarts) =>
      _availableDateStarts = availableDateStarts;
  String? get availableDateEnds => _availableDateEnds;
  set availableDateEnds(String? availableDateEnds) =>
      _availableDateEnds = availableDateEnds;
  int? get recommended => _recommended;
  set recommended(int? recommended) => _recommended = recommended;

  String? get restaurantName => _restaurantName;
  set restaurantName(String? restaurantName) =>
      _restaurantName = restaurantName;
  int? get restaurantStatus => _restaurantStatus;
  set restaurantStatus(int? restaurantStatus) =>
      _restaurantStatus = restaurantStatus;
  int? get restaurantDiscount => _restaurantDiscount;
  set restaurantDiscount(int? restaurantDiscount) =>
      _restaurantDiscount = restaurantDiscount;

  bool? get scheduleOrder => _scheduleOrder;
  set scheduleOrder(bool? scheduleOrder) => _scheduleOrder = scheduleOrder;
  int? get ratingCount => _ratingCount;
  set ratingCount(int? ratingCount) => _ratingCount = ratingCount;
  int? get avgRating => _avgRating;
  set avgRating(int? avgRating) => _avgRating = avgRating;
  int? get minDeliveryTime => _minDeliveryTime;
  set minDeliveryTime(int? minDeliveryTime) =>
      _minDeliveryTime = minDeliveryTime;
  int? get maxDeliveryTime => _maxDeliveryTime;
  set maxDeliveryTime(int? maxDeliveryTime) =>
      _maxDeliveryTime = maxDeliveryTime;
  int? get freeDelivery => _freeDelivery;
  set freeDelivery(int? freeDelivery) => _freeDelivery = freeDelivery;
  int? get halalTagStatus => _halalTagStatus;
  set halalTagStatus(int? halalTagStatus) => _halalTagStatus = halalTagStatus;
  List<Cuisines>? get cuisines => _cuisines;
  set cuisines(List<Cuisines>? cuisines) => _cuisines = cuisines;
  String? get imageFullUrl => _imageFullUrl;
  set imageFullUrl(String? imageFullUrl) => _imageFullUrl = imageFullUrl;
  List<Translations>? get translations => _translations;
  set translations(List<Translations>? translations) =>
      _translations = translations;


  FoodCampaignModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _image = json['image'];
    _description = json['description'];
    _status = json['status'];
    _adminId = json['admin_id'];

    if (json['category_ids'] != null) {
      _categoryIds = <CategoryIds>[];
      json['category_ids'].forEach((v) {
        _categoryIds!.add(CategoryIds.fromJson(v));
      });
    }

    if (json['add_ons'] != null) {
      _addOns = <AddOns>[];
      json['add_ons'].forEach((v) {
        _addOns!.add(AddOns.fromJson(v));
      });
    }
    _attributes = json['attributes'];
    _choiceOptions = json['choice_options'];
    _price = json['price'];
    _tax = json['tax'];
    _taxType = json['tax_type'];
    _discount = json['discount'];
    _discountType = json['discount_type'];
    _restaurantId = json['restaurant_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _veg = json['veg'];

    _tempAvailable = json['temp_available'];
    _open = json['open'];
    _name = json['name'];
    _availableTimeStarts = json['available_time_starts'];
    _availableTimeEnds = json['available_time_ends'];
    _availableDateStarts = json['available_date_starts'];
    _availableDateEnds = json['available_date_ends'];
    _recommended = json['recommended'];

    _restaurantName = json['restaurant_name'];
    _restaurantStatus = json['restaurant_status'];
    _restaurantDiscount = json['restaurant_discount'];

    _scheduleOrder = json['schedule_order'];
    _ratingCount = json['rating_count'];
    _avgRating = json['avg_rating'];
    _minDeliveryTime = json['min_delivery_time'];
    _maxDeliveryTime = json['max_delivery_time'];
    _freeDelivery = json['free_delivery'];
    _halalTagStatus = json['halal_tag_status'];
    if (json['cuisines'] != null) {
      _cuisines = <Cuisines>[];
      json['cuisines'].forEach((v) {
        _cuisines!.add(Cuisines.fromJson(v));
      });
    }
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
    data['image'] = _image;
    data['description'] = _description;
    data['status'] = _status;
    data['admin_id'] = _adminId;

    if (_categoryIds != null) {
      data['category_ids'] = _categoryIds!.map((v) => v.toJson()).toList();
    }

    if (_addOns != null) {
      data['add_ons'] = _addOns!.map((v) => v.toJson()).toList();
    }
    data['attributes'] = _attributes;
    data['choice_options'] = _choiceOptions;
    data['price'] = _price;
    data['tax'] = _tax;
    data['tax_type'] = _taxType;
    data['discount'] = _discount;
    data['discount_type'] = _discountType;
    data['restaurant_id'] = _restaurantId;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['veg'] = _veg;


    data['temp_available'] = _tempAvailable;
    data['open'] = _open;
    data['name'] = _name;
    data['available_time_starts'] = _availableTimeStarts;
    data['available_time_ends'] = _availableTimeEnds;
    data['available_date_starts'] = _availableDateStarts;
    data['available_date_ends'] = _availableDateEnds;
    data['recommended'] = _recommended;

    data['restaurant_name'] = _restaurantName;
    data['restaurant_status'] = _restaurantStatus;
    data['restaurant_discount'] = _restaurantDiscount;

    data['schedule_order'] = _scheduleOrder;
    data['rating_count'] = _ratingCount;
    data['avg_rating'] = _avgRating;
    data['min_delivery_time'] = _minDeliveryTime;
    data['max_delivery_time'] = _maxDeliveryTime;
    data['free_delivery'] = _freeDelivery;
    data['halal_tag_status'] = _halalTagStatus;
    if (_cuisines != null) {
      data['cuisines'] = _cuisines!.map((v) => v.toJson()).toList();
    }
    data['image_full_url'] = _imageFullUrl;
    if (_translations != null) {
      data['translations'] =
          _translations!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class CategoryIds {
  String? _id;
  int? _position;

  CategoryIds({String? id, int? position}) {
    if (id != null) {
      _id = id;
    }
    if (position != null) {
      _position = position;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  int? get position => _position;
  set position(int? position) => _position = position;

  CategoryIds.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['position'] = _position;
    return data;
  }
}

class AddOns {
  int? _id;
  String? _name;
  int? _price;
  String? _createdAt;
  String? _updatedAt;
  int? _restaurantId;
  int? _status;
  String? _stockType;
  int? _addonStock;
  int? _sellCount;
  List<Null>? _translations;

  AddOns(
      {int? id,
        String? name,
        int? price,
        String? createdAt,
        String? updatedAt,
        int? restaurantId,
        int? status,
        String? stockType,
        int? addonStock,
        int? sellCount,
        List<Null>? translations}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (price != null) {
      _price = price;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    if (restaurantId != null) {
      _restaurantId = restaurantId;
    }
    if (status != null) {
      _status = status;
    }
    if (stockType != null) {
      _stockType = stockType;
    }
    if (addonStock != null) {
      _addonStock = addonStock;
    }
    if (sellCount != null) {
      _sellCount = sellCount;
    }
    if (translations != null) {
      _translations = translations;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  int? get price => _price;
  set price(int? price) => _price = price;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  int? get restaurantId => _restaurantId;
  set restaurantId(int? restaurantId) => _restaurantId = restaurantId;
  int? get status => _status;
  set status(int? status) => _status = status;
  String? get stockType => _stockType;
  set stockType(String? stockType) => _stockType = stockType;
  int? get addonStock => _addonStock;
  set addonStock(int? addonStock) => _addonStock = addonStock;
  int? get sellCount => _sellCount;
  set sellCount(int? sellCount) => _sellCount = sellCount;
  List<Null>? get translations => _translations;
  set translations(List<Null>? translations) => _translations = translations;

  AddOns.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _price = json['price'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _restaurantId = json['restaurant_id'];
    _status = json['status'];
    _stockType = json['stock_type'];
    _addonStock = json['addon_stock'];
    _sellCount = json['sell_count'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['price'] = _price;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['restaurant_id'] = _restaurantId;
    data['status'] = _status;
    data['stock_type'] = _stockType;
    data['addon_stock'] = _addonStock;
    data['sell_count'] = _sellCount;

    return data;
  }
}

class Cuisines {
  int? _id;
  String? _name;
  String? _image;

  Cuisines({int? id, String? name, String? image}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (image != null) {
      _image = image;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get image => _image;
  set image(String? image) => _image = image;

  Cuisines.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['image'] = _image;
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

