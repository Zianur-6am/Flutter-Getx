class PopularFoodModel {
  int? _totalSize;

  List<Products>? _products;

  PopularFoodModel(
      {int? totalSize, List<Products>? products}) {
    if (totalSize != null) {
      this._totalSize = totalSize;
    }

    if (products != null) {
      this._products = products;
    }
  }

  int? get totalSize => _totalSize;
  set totalSize(int? totalSize) => _totalSize = totalSize;
  List<Products>? get products => _products;
  set products(List<Products>? products) => _products = products;

  PopularFoodModel.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    if (json['products'] != null) {
      _products = <Products>[];
      json['products'].forEach((v) {
        _products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_size'] = this._totalSize;
    if (this._products != null) {
      data['products'] = this._products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? _id;
  String? _name;
  String? _description;
  String? _image;
  int? _categoryId;
  List<CategoryIds>? _categoryIds;
  List<Variations>? _variations;
  List<AddOns>? _addOns;
  String? _attributes;
  String? _choiceOptions;
  int? _price;
  double? _tax;
  String? _taxType;
  int? _discount;
  String? _discountType;
  String? _availableTimeStarts;
  String? _availableTimeEnds;
  int? _veg;
  int? _status;
  int? _restaurantId;
  String? _createdAt;
  String? _updatedAt;
  int? _orderCount;
  double? _avgRating;
  int? _ratingCount;
  int? _recommended;
  String? _slug;
  Null? _maximumCartQuantity;
  int? _isHalal;
  int? _itemStock;
  int? _sellCount;
  String? _stockType;
  int? _tempAvailable;
  int? _open;
  int? _reviewsCount;
  List<Tags>? _tags;
  String? _restaurantName;
  int? _restaurantStatus;
  int? _restaurantDiscount;
  String? _restaurantOpeningTime;
  String? _restaurantClosingTime;
  bool? _scheduleOrder;
  int? _minDeliveryTime;
  int? _maxDeliveryTime;
  int? _freeDelivery;
  int? _halalTagStatus;
  List<Cuisines>? _cuisines;
  String? _imageFullUrl;
  List<Translations>? _translations;
  List<Null>? _storage;
  List<Null>? _newVariations;

  Products(
      {int? id,
        String? name,
        String? description,
        String? image,
        int? categoryId,
        List<CategoryIds>? categoryIds,
        List<Variations>? variations,
        List<AddOns>? addOns,
        String? attributes,
        String? choiceOptions,
        int? price,
        double? tax,
        String? taxType,
        int? discount,
        String? discountType,
        String? availableTimeStarts,
        String? availableTimeEnds,
        int? veg,
        int? status,
        int? restaurantId,
        String? createdAt,
        String? updatedAt,
        int? orderCount,
        double? avgRating,
        int? ratingCount,
        int? recommended,
        String? slug,
        int? isHalal,
        int? itemStock,
        int? sellCount,
        String? stockType,
        int? tempAvailable,
        int? open,
        int? reviewsCount,
        List<Tags>? tags,
        String? restaurantName,
        int? restaurantStatus,
        int? restaurantDiscount,
        String? restaurantOpeningTime,
        String? restaurantClosingTime,
        bool? scheduleOrder,
        int? minDeliveryTime,
        int? maxDeliveryTime,
        int? freeDelivery,
        int? halalTagStatus,
        List<Cuisines>? cuisines,
        String? imageFullUrl,
        List<Translations>? translations,}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (description != null) {
      this._description = description;
    }
    if (image != null) {
      this._image = image;
    }
    if (categoryId != null) {
      this._categoryId = categoryId;
    }
    if (categoryIds != null) {
      this._categoryIds = categoryIds;
    }
    if (variations != null) {
      this._variations = variations;
    }
    if (addOns != null) {
      this._addOns = addOns;
    }
    if (attributes != null) {
      this._attributes = attributes;
    }
    if (choiceOptions != null) {
      this._choiceOptions = choiceOptions;
    }
    if (price != null) {
      this._price = price;
    }
    if (tax != null) {
      this._tax = tax;
    }
    if (taxType != null) {
      this._taxType = taxType;
    }
    if (discount != null) {
      this._discount = discount;
    }
    if (discountType != null) {
      this._discountType = discountType;
    }
    if (availableTimeStarts != null) {
      this._availableTimeStarts = availableTimeStarts;
    }
    if (availableTimeEnds != null) {
      this._availableTimeEnds = availableTimeEnds;
    }
    if (veg != null) {
      this._veg = veg;
    }
    if (status != null) {
      this._status = status;
    }
    if (restaurantId != null) {
      this._restaurantId = restaurantId;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (orderCount != null) {
      this._orderCount = orderCount;
    }
    if (avgRating != null) {
      this._avgRating = avgRating;
    }
    if (ratingCount != null) {
      this._ratingCount = ratingCount;
    }
    if (recommended != null) {
      this._recommended = recommended;
    }
    if (slug != null) {
      this._slug = slug;
    }
    if (maximumCartQuantity != null) {
      this._maximumCartQuantity = maximumCartQuantity;
    }
    if (isHalal != null) {
      this._isHalal = isHalal;
    }
    if (itemStock != null) {
      this._itemStock = itemStock;
    }
    if (sellCount != null) {
      this._sellCount = sellCount;
    }
    if (stockType != null) {
      this._stockType = stockType;
    }
    if (tempAvailable != null) {
      this._tempAvailable = tempAvailable;
    }
    if (open != null) {
      this._open = open;
    }
    if (reviewsCount != null) {
      this._reviewsCount = reviewsCount;
    }
    if (tags != null) {
      this._tags = tags;
    }
    if (restaurantName != null) {
      this._restaurantName = restaurantName;
    }
    if (restaurantStatus != null) {
      this._restaurantStatus = restaurantStatus;
    }
    if (restaurantDiscount != null) {
      this._restaurantDiscount = restaurantDiscount;
    }
    if (restaurantOpeningTime != null) {
      this._restaurantOpeningTime = restaurantOpeningTime;
    }
    if (restaurantClosingTime != null) {
      this._restaurantClosingTime = restaurantClosingTime;
    }
    if (scheduleOrder != null) {
      this._scheduleOrder = scheduleOrder;
    }
    if (minDeliveryTime != null) {
      this._minDeliveryTime = minDeliveryTime;
    }
    if (maxDeliveryTime != null) {
      this._maxDeliveryTime = maxDeliveryTime;
    }
    if (freeDelivery != null) {
      this._freeDelivery = freeDelivery;
    }
    if (halalTagStatus != null) {
      this._halalTagStatus = halalTagStatus;
    }
    if (cuisines != null) {
      this._cuisines = cuisines;
    }
    if (imageFullUrl != null) {
      this._imageFullUrl = imageFullUrl;
    }
    if (translations != null) {
      this._translations = translations;
    }
    if (storage != null) {
      this._storage = storage;
    }
    if (newVariations != null) {
      this._newVariations = newVariations;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get image => _image;
  set image(String? image) => _image = image;
  int? get categoryId => _categoryId;
  set categoryId(int? categoryId) => _categoryId = categoryId;
  List<CategoryIds>? get categoryIds => _categoryIds;
  set categoryIds(List<CategoryIds>? categoryIds) => _categoryIds = categoryIds;
  List<Variations>? get variations => _variations;
  set variations(List<Variations>? variations) => _variations = variations;
  List<AddOns>? get addOns => _addOns;
  set addOns(List<AddOns>? addOns) => _addOns = addOns;
  String? get attributes => _attributes;
  set attributes(String? attributes) => _attributes = attributes;
  String? get choiceOptions => _choiceOptions;
  set choiceOptions(String? choiceOptions) => _choiceOptions = choiceOptions;
  int? get price => _price;
  set price(int? price) => _price = price;
  double? get tax => _tax;
  set tax(double? tax) => _tax = tax;
  String? get taxType => _taxType;
  set taxType(String? taxType) => _taxType = taxType;
  int? get discount => _discount;
  set discount(int? discount) => _discount = discount;
  String? get discountType => _discountType;
  set discountType(String? discountType) => _discountType = discountType;
  String? get availableTimeStarts => _availableTimeStarts;
  set availableTimeStarts(String? availableTimeStarts) =>
      _availableTimeStarts = availableTimeStarts;
  String? get availableTimeEnds => _availableTimeEnds;
  set availableTimeEnds(String? availableTimeEnds) =>
      _availableTimeEnds = availableTimeEnds;
  int? get veg => _veg;
  set veg(int? veg) => _veg = veg;
  int? get status => _status;
  set status(int? status) => _status = status;
  int? get restaurantId => _restaurantId;
  set restaurantId(int? restaurantId) => _restaurantId = restaurantId;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  int? get orderCount => _orderCount;
  set orderCount(int? orderCount) => _orderCount = orderCount;
  double? get avgRating => _avgRating;
  set avgRating(double? avgRating) => _avgRating = avgRating;
  int? get ratingCount => _ratingCount;
  set ratingCount(int? ratingCount) => _ratingCount = ratingCount;
  int? get recommended => _recommended;
  set recommended(int? recommended) => _recommended = recommended;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  Null? get maximumCartQuantity => _maximumCartQuantity;
  set maximumCartQuantity(Null? maximumCartQuantity) =>
      _maximumCartQuantity = maximumCartQuantity;
  int? get isHalal => _isHalal;
  set isHalal(int? isHalal) => _isHalal = isHalal;
  int? get itemStock => _itemStock;
  set itemStock(int? itemStock) => _itemStock = itemStock;
  int? get sellCount => _sellCount;
  set sellCount(int? sellCount) => _sellCount = sellCount;
  String? get stockType => _stockType;
  set stockType(String? stockType) => _stockType = stockType;
  int? get tempAvailable => _tempAvailable;
  set tempAvailable(int? tempAvailable) => _tempAvailable = tempAvailable;
  int? get open => _open;
  set open(int? open) => _open = open;
  int? get reviewsCount => _reviewsCount;
  set reviewsCount(int? reviewsCount) => _reviewsCount = reviewsCount;
  List<Tags>? get tags => _tags;
  set tags(List<Tags>? tags) => _tags = tags;
  String? get restaurantName => _restaurantName;
  set restaurantName(String? restaurantName) =>
      _restaurantName = restaurantName;
  int? get restaurantStatus => _restaurantStatus;
  set restaurantStatus(int? restaurantStatus) =>
      _restaurantStatus = restaurantStatus;
  int? get restaurantDiscount => _restaurantDiscount;
  set restaurantDiscount(int? restaurantDiscount) =>
      _restaurantDiscount = restaurantDiscount;
  String? get restaurantOpeningTime => _restaurantOpeningTime;
  set restaurantOpeningTime(String? restaurantOpeningTime) =>
      _restaurantOpeningTime = restaurantOpeningTime;
  String? get restaurantClosingTime => _restaurantClosingTime;
  set restaurantClosingTime(String? restaurantClosingTime) =>
      _restaurantClosingTime = restaurantClosingTime;
  bool? get scheduleOrder => _scheduleOrder;
  set scheduleOrder(bool? scheduleOrder) => _scheduleOrder = scheduleOrder;
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
  List<Null>? get storage => _storage;
  set storage(List<Null>? storage) => _storage = storage;
  List<Null>? get newVariations => _newVariations;
  set newVariations(List<Null>? newVariations) =>
      _newVariations = newVariations;

  Products.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _image = json['image'];
    _categoryId = json['category_id'];
    if (json['category_ids'] != null) {
      _categoryIds = <CategoryIds>[];
      json['category_ids'].forEach((v) {
        _categoryIds!.add(new CategoryIds.fromJson(v));
      });
    }
    if (json['variations'] != null) {
      _variations = <Variations>[];
      json['variations'].forEach((v) {
        _variations!.add(new Variations.fromJson(v));
      });
    }
    if (json['add_ons'] != null) {
      _addOns = <AddOns>[];
      json['add_ons'].forEach((v) {
        _addOns!.add(new AddOns.fromJson(v));
      });
    }
    _attributes = json['attributes'];
    _choiceOptions = json['choice_options'];
    _price = json['price'];
    _tax = double.parse(json['tax'].toString());
    _taxType = json['tax_type'];
    _discount = json['discount'];
    _discountType = json['discount_type'];
    _availableTimeStarts = json['available_time_starts'];
    _availableTimeEnds = json['available_time_ends'];
    _veg = json['veg'];
    _status = json['status'];
    _restaurantId = json['restaurant_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _orderCount = json['order_count'];
    _avgRating = double.parse(json['avg_rating'].toString());
    _ratingCount = json['rating_count'];
    _recommended = json['recommended'];
    _slug = json['slug'];
    _maximumCartQuantity = json['maximum_cart_quantity'];
    _isHalal = json['is_halal'];
    _itemStock = json['item_stock'];
    _sellCount = json['sell_count'];
    _stockType = json['stock_type'];
    _tempAvailable = json['temp_available'];
    _open = json['open'];
    _reviewsCount = json['reviews_count'];
    if (json['tags'] != null) {
      _tags = <Tags>[];
      json['tags'].forEach((v) {
        _tags!.add(new Tags.fromJson(v));
      });
    }
    _restaurantName = json['restaurant_name'];
    _restaurantStatus = json['restaurant_status'];
    _restaurantDiscount = json['restaurant_discount'];
    _restaurantOpeningTime = json['restaurant_opening_time'];
    _restaurantClosingTime = json['restaurant_closing_time'];
    _scheduleOrder = json['schedule_order'];
    _minDeliveryTime = json['min_delivery_time'];
    _maxDeliveryTime = json['max_delivery_time'];
    _freeDelivery = json['free_delivery'];
    _halalTagStatus = json['halal_tag_status'];
    if (json['cuisines'] != null) {
      _cuisines = <Cuisines>[];
      json['cuisines'].forEach((v) {
        _cuisines!.add(new Cuisines.fromJson(v));
      });
    }
    _imageFullUrl = json['image_full_url'];
    if (json['translations'] != null) {
      _translations = <Translations>[];
      json['translations'].forEach((v) {
        _translations!.add(new Translations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['description'] = this._description;
    data['image'] = this._image;
    data['category_id'] = this._categoryId;
    if (this._categoryIds != null) {
      data['category_ids'] = this._categoryIds!.map((v) => v.toJson()).toList();
    }
    if (this._variations != null) {
      data['variations'] = this._variations!.map((v) => v.toJson()).toList();
    }
    if (this._addOns != null) {
      data['add_ons'] = this._addOns!.map((v) => v.toJson()).toList();
    }
    data['attributes'] = this._attributes;
    data['choice_options'] = this._choiceOptions;
    data['price'] = this._price;
    data['tax'] = this._tax;
    data['tax_type'] = this._taxType;
    data['discount'] = this._discount;
    data['discount_type'] = this._discountType;
    data['available_time_starts'] = this._availableTimeStarts;
    data['available_time_ends'] = this._availableTimeEnds;
    data['veg'] = this._veg;
    data['status'] = this._status;
    data['restaurant_id'] = this._restaurantId;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['order_count'] = this._orderCount;
    data['avg_rating'] = this._avgRating;
    data['rating_count'] = this._ratingCount;
    data['recommended'] = this._recommended;
    data['slug'] = this._slug;
    data['maximum_cart_quantity'] = this._maximumCartQuantity;
    data['is_halal'] = this._isHalal;
    data['item_stock'] = this._itemStock;
    data['sell_count'] = this._sellCount;
    data['stock_type'] = this._stockType;
    data['temp_available'] = this._tempAvailable;
    data['open'] = this._open;
    data['reviews_count'] = this._reviewsCount;
    if (this._tags != null) {
      data['tags'] = this._tags!.map((v) => v.toJson()).toList();
    }
    data['restaurant_name'] = this._restaurantName;
    data['restaurant_status'] = this._restaurantStatus;
    data['restaurant_discount'] = this._restaurantDiscount;
    data['restaurant_opening_time'] = this._restaurantOpeningTime;
    data['restaurant_closing_time'] = this._restaurantClosingTime;
    data['schedule_order'] = this._scheduleOrder;
    data['min_delivery_time'] = this._minDeliveryTime;
    data['max_delivery_time'] = this._maxDeliveryTime;
    data['free_delivery'] = this._freeDelivery;
    data['halal_tag_status'] = this._halalTagStatus;
    if (this._cuisines != null) {
      data['cuisines'] = this._cuisines!.map((v) => v.toJson()).toList();
    }
    data['image_full_url'] = this._imageFullUrl;
    if (this._translations != null) {
      data['translations'] =
          this._translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryIds {
  String? _id;
  int? _position;

  CategoryIds({String? id, int? position}) {
    if (id != null) {
      this._id = id;
    }
    if (position != null) {
      this._position = position;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['position'] = this._position;
    return data;
  }
}

class Variations {
  int? _variationId;
  String? _name;
  String? _type;
  String? _min;
  int? _max;
  String? _required;
  List<Values>? _values;

  Variations(
      {int? variationId,
        String? name,
        String? type,
        String? min,
        int? max,
        String? required,
        List<Values>? values}) {
    if (variationId != null) {
      this._variationId = variationId;
    }
    if (name != null) {
      this._name = name;
    }
    if (type != null) {
      this._type = type;
    }
    if (min != null) {
      this._min = min;
    }
    if (max != null) {
      this._max = max;
    }
    if (required != null) {
      this._required = required;
    }
    if (values != null) {
      this._values = values;
    }
  }

  int? get variationId => _variationId;
  set variationId(int? variationId) => _variationId = variationId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get min => _min;
  set min(String? min) => _min = min;
  int? get max => _max;
  set max(int? max) => _max = max;
  String? get required => _required;
  set required(String? required) => _required = required;
  List<Values>? get values => _values;
  set values(List<Values>? values) => _values = values;

  Variations.fromJson(Map<String, dynamic> json) {
    _variationId = json['variation_id'];
    _name = json['name'];
    _type = json['type'];
    _min = json['min'].toString();
    _max = int.tryParse(json['max'].toString());
    _required = json['required'];
    if (json['values'] != null) {
      _values = <Values>[];
      json['values'].forEach((v) {
        _values!.add(new Values.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variation_id'] = this._variationId;
    data['name'] = this._name;
    data['type'] = this._type;
    data['min'] = this._min;
    data['max'] = this._max;
    data['required'] = this._required;
    if (this._values != null) {
      data['values'] = this._values!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Values {
  String? _label;
  int? _optionPrice;
  String? _totalStock;
  String? _stockType;
  String? _sellCount;
  int? _optionId;
  int? _currentStock;

  Values(
      {String? label,
        int? optionPrice,
        String? totalStock,
        String? stockType,
        String? sellCount,
        int? optionId,
        int? currentStock}) {
    if (label != null) {
      this._label = label;
    }
    if (optionPrice != null) {
      this._optionPrice = optionPrice;
    }
    if (totalStock != null) {
      this._totalStock = totalStock;
    }
    if (stockType != null) {
      this._stockType = stockType;
    }
    if (sellCount != null) {
      this._sellCount = sellCount;
    }
    if (optionId != null) {
      this._optionId = optionId;
    }
    if (currentStock != null) {
      this._currentStock = currentStock;
    }
  }

  String? get label => _label;
  set label(String? label) => _label = label;
  int? get optionPrice => _optionPrice;
  set optionPrice(int? optionPrice) => _optionPrice = optionPrice;
  String? get totalStock => _totalStock;
  set totalStock(String? totalStock) => _totalStock = totalStock;
  String? get stockType => _stockType;
  set stockType(String? stockType) => _stockType = stockType;
  String? get sellCount => _sellCount;
  set sellCount(String? sellCount) => _sellCount = sellCount;
  int? get optionId => _optionId;
  set optionId(int? optionId) => _optionId = optionId;
  int? get currentStock => _currentStock;
  set currentStock(int? currentStock) => _currentStock = currentStock;

  Values.fromJson(Map<String, dynamic> json) {
    _label = json['label'];
    _optionPrice = int.parse(json['optionPrice'].toString());
    _totalStock = json['total_stock'];
    _stockType = json['stock_type'];
    _sellCount = json['sell_count'];
    _optionId = json['option_id'];
    _currentStock = json['current_stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this._label;
    data['optionPrice'] = this._optionPrice;
    data['total_stock'] = this._totalStock;
    data['stock_type'] = this._stockType;
    data['sell_count'] = this._sellCount;
    data['option_id'] = this._optionId;
    data['current_stock'] = this._currentStock;
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
  List<Translations>? _translations;

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
        List<Translations>? translations}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (price != null) {
      this._price = price;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (restaurantId != null) {
      this._restaurantId = restaurantId;
    }
    if (status != null) {
      this._status = status;
    }
    if (stockType != null) {
      this._stockType = stockType;
    }
    if (addonStock != null) {
      this._addonStock = addonStock;
    }
    if (sellCount != null) {
      this._sellCount = sellCount;
    }
    if (translations != null) {
      this._translations = translations;
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
  List<Translations>? get translations => _translations;
  set translations(List<Translations>? translations) =>
      _translations = translations;

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
    if (json['translations'] != null) {
      _translations = <Translations>[];
      json['translations'].forEach((v) {
        _translations!.add(new Translations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['price'] = this._price;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['restaurant_id'] = this._restaurantId;
    data['status'] = this._status;
    data['stock_type'] = this._stockType;
    data['addon_stock'] = this._addonStock;
    data['sell_count'] = this._sellCount;
    if (this._translations != null) {
      data['translations'] =
          this._translations!.map((v) => v.toJson()).toList();
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
  Null? _createdAt;
  Null? _updatedAt;

  Translations(
      {int? id,
        String? translationableType,
        int? translationableId,
        String? locale,
        String? key,
        String? value,
        Null? createdAt,
        Null? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (translationableType != null) {
      this._translationableType = translationableType;
    }
    if (translationableId != null) {
      this._translationableId = translationableId;
    }
    if (locale != null) {
      this._locale = locale;
    }
    if (key != null) {
      this._key = key;
    }
    if (value != null) {
      this._value = value;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
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
  Null? get createdAt => _createdAt;
  set createdAt(Null? createdAt) => _createdAt = createdAt;
  Null? get updatedAt => _updatedAt;
  set updatedAt(Null? updatedAt) => _updatedAt = updatedAt;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['translationable_type'] = this._translationableType;
    data['translationable_id'] = this._translationableId;
    data['locale'] = this._locale;
    data['key'] = this._key;
    data['value'] = this._value;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}

class Tags {
  int? _id;
  String? _tag;
  String? _createdAt;
  String? _updatedAt;
  Pivot? _pivot;

  Tags(
      {int? id,
        String? tag,
        String? createdAt,
        String? updatedAt,
        Pivot? pivot}) {
    if (id != null) {
      this._id = id;
    }
    if (tag != null) {
      this._tag = tag;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (pivot != null) {
      this._pivot = pivot;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get tag => _tag;
  set tag(String? tag) => _tag = tag;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  Pivot? get pivot => _pivot;
  set pivot(Pivot? pivot) => _pivot = pivot;

  Tags.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _tag = json['tag'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['tag'] = this._tag;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    if (this._pivot != null) {
      data['pivot'] = this._pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? _foodId;
  int? _tagId;

  Pivot({int? foodId, int? tagId}) {
    if (foodId != null) {
      this._foodId = foodId;
    }
    if (tagId != null) {
      this._tagId = tagId;
    }
  }

  int? get foodId => _foodId;
  set foodId(int? foodId) => _foodId = foodId;
  int? get tagId => _tagId;
  set tagId(int? tagId) => _tagId = tagId;

  Pivot.fromJson(Map<String, dynamic> json) {
    _foodId = json['food_id'];
    _tagId = json['tag_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['food_id'] = this._foodId;
    data['tag_id'] = this._tagId;
    return data;
  }
}

class Cuisines {
  int? _id;
  String? _name;
  String? _image;

  Cuisines({int? id, String? name, String? image}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (image != null) {
      this._image = image;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['image'] = this._image;
    return data;
  }
}
