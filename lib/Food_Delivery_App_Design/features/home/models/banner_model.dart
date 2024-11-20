class BannerModel {
  List<dynamic>? _campaigns;
  List<Banners>? _banners;

  BannerModel({List<dynamic>? campaigns, List<Banners>? banners}) {
    if (campaigns != null) {
      _campaigns = campaigns;
    }
    if (banners != null) {
      _banners = banners;
    }
  }

  List<dynamic>? get campaigns => _campaigns;
  set campaigns(List<dynamic>? campaigns) => _campaigns = campaigns;
  List<Banners>? get banners => _banners;
  set banners(List<Banners>? banners) => _banners = banners;

  BannerModel.fromJson(Map<String, dynamic> json) {
    // if (json['campaigns'] != null) {
    //   _campaigns = <Null>[];
    //   json['campaigns'].forEach((v) {
    //     _campaigns!.add(new Banners.fromJson(v));
    //   });
    // }
    if (json['banners'] != null) {
      _banners = <Banners>[];
      json['banners'].forEach((v) {
        _banners!.add(Banners.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_campaigns != null) {
      data['campaigns'] = _campaigns!.map((v) => v.toJson()).toList();
    }
    if (_banners != null) {
      data['banners'] = _banners!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banners {
  int? _id;
  String? _title;
  String? _type;
  String? _image;
  Restaurant? _restaurant;

  String? _imageFullUrl;

  Banners(
      {int? id,
        String? title,
        String? type,
        String? image,
        Restaurant? restaurant,
        Null food,
        String? imageFullUrl}) {
    if (id != null) {
      _id = id;
    }
    if (title != null) {
      _title = title;
    }
    if (type != null) {
      _type = type;
    }
    if (image != null) {
      _image = image;
    }
    if (restaurant != null) {
      _restaurant = restaurant;
    }
    if (imageFullUrl != null) {
      _imageFullUrl = imageFullUrl;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get image => _image;
  set image(String? image) => _image = image;
  Restaurant? get restaurant => _restaurant;
  set restaurant(Restaurant? restaurant) => _restaurant = restaurant;
  String? get imageFullUrl => _imageFullUrl;
  set imageFullUrl(String? imageFullUrl) => _imageFullUrl = imageFullUrl;

  Banners.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _type = json['type'];
    _image = json['image'];
    _restaurant = json['restaurant'] != null
        ? Restaurant.fromJson(json['restaurant'])
        : null;
    _imageFullUrl = json['image_full_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['title'] = _title;
    data['type'] = _type;
    data['image'] = _image;
    if (_restaurant != null) {
      data['restaurant'] = _restaurant!.toJson();
    }
    data['image_full_url'] = _imageFullUrl;
    return data;
  }
}

class Restaurant {
  int? _id;
  String? _name;
  String? _phone;
  String? _email;
  String? _logo;
  String? _latitude;
  String? _longitude;
  String? _address;
  Null _footerText;
  int? _minimumOrder;
  Null _comission;
  bool? _scheduleOrder;
  Null _openingTime;
  Null _closeingTime;
  int? _status;
  int? _vendorId;
  String? _createdAt;
  String? _updatedAt;
  bool? _freeDelivery;
  String? _coverPhoto;
  bool? _delivery;
  bool? _takeAway;
  bool? _foodSection;
  double? _tax;
  int? _zoneId;
  bool? _reviewsSection;
  bool? _active;
  String? _offDay;
  int? _selfDeliverySystem;
  bool? _posSystem;
  int? _minimumShippingCharge;
  String? _deliveryTime;
  int? _veg;
  int? _nonVeg;
  int? _orderCount;
  int? _totalOrder;
  int? _perKmShippingCharge;
  String? _restaurantModel;
  Null _maximumShippingCharge;
  String? _slug;
  bool? _orderSubscriptionActive;
  bool? _cutlery;
  String? _metaTitle;
  String? _metaDescription;
  String? _metaImage;
  int? _announcement;
  String? _announcementMessage;
  Null _qrCode;
  Null _additionalData;
  String? _additionalDocuments;
  int? _restaurantStatus;
  List<Foods>? _foods;
  List<Coupons>? _coupons;
  List<Cuisine>? _cuisine;
  List<int>? _ratings;
  double? _avgRating;
  int? _ratingCount;
  int? _positiveRating;
  int? _customerOrderDate;
  bool? _customerDateOrderSratus;
  bool? _instantOrder;
  bool? _halalTagStatus;
  bool? _isExtraPackagingActive;
  bool? _extraPackagingStatus;
  int? _extraPackagingAmount;
  String? _deliveryFee;
  String? _currentOpeningTime;
  List<String>? _characteristics;
  bool? _gstStatus;
  String? _gstCode;
  bool? _freeDeliveryDistanceStatus;
  String? _freeDeliveryDistanceValue;
  String? _logoFullUrl;
  String? _coverPhotoFullUrl;
  String? _metaImageFullUrl;
  List<Translations>? _translations;
  List<Schedules>? _schedules;
  List<Null>? _storage;

  Restaurant(
      {int? id,
        String? name,
        String? phone,
        String? email,
        String? logo,
        String? latitude,
        String? longitude,
        String? address,
        Null footerText,
        int? minimumOrder,
        Null comission,
        bool? scheduleOrder,
        Null openingTime,
        Null closeingTime,
        int? status,
        int? vendorId,
        String? createdAt,
        String? updatedAt,
        bool? freeDelivery,
        String? coverPhoto,
        bool? delivery,
        bool? takeAway,
        bool? foodSection,
        double? tax,
        int? zoneId,
        bool? reviewsSection,
        bool? active,
        String? offDay,
        int? selfDeliverySystem,
        bool? posSystem,
        int? minimumShippingCharge,
        String? deliveryTime,
        int? veg,
        int? nonVeg,
        int? orderCount,
        int? totalOrder,
        int? perKmShippingCharge,
        String? restaurantModel,
        Null maximumShippingCharge,
        String? slug,
        bool? orderSubscriptionActive,
        bool? cutlery,
        String? metaTitle,
        String? metaDescription,
        String? metaImage,
        int? announcement,
        String? announcementMessage,
        Null qrCode,
        Null additionalData,
        String? additionalDocuments,
        int? restaurantStatus,
        List<Foods>? foods,
        List<Coupons>? coupons,
        List<Cuisine>? cuisine,
        List<int>? ratings,
        double? avgRating,
        int? ratingCount,
        int? positiveRating,
        int? customerOrderDate,
        bool? customerDateOrderSratus,
        bool? instantOrder,
        bool? halalTagStatus,
        bool? isExtraPackagingActive,
        bool? extraPackagingStatus,
        int? extraPackagingAmount,
        String? deliveryFee,
        String? currentOpeningTime,
        List<String>? characteristics,
        bool? gstStatus,
        String? gstCode,
        bool? freeDeliveryDistanceStatus,
        String? freeDeliveryDistanceValue,
        String? logoFullUrl,
        String? coverPhotoFullUrl,
        String? metaImageFullUrl,
        List<Translations>? translations,
        List<Schedules>? schedules,
        List<Null>? storage}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (phone != null) {
      _phone = phone;
    }
    if (email != null) {
      _email = email;
    }
    if (logo != null) {
      _logo = logo;
    }
    if (latitude != null) {
      _latitude = latitude;
    }
    if (longitude != null) {
      _longitude = longitude;
    }
    if (address != null) {
      _address = address;
    }
    if (footerText != null) {
      _footerText = footerText;
    }
    if (minimumOrder != null) {
      _minimumOrder = minimumOrder;
    }
    if (comission != null) {
      _comission = comission;
    }
    if (scheduleOrder != null) {
      _scheduleOrder = scheduleOrder;
    }
    if (openingTime != null) {
      _openingTime = openingTime;
    }
    if (closeingTime != null) {
      _closeingTime = closeingTime;
    }
    if (status != null) {
      _status = status;
    }
    if (vendorId != null) {
      _vendorId = vendorId;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    if (freeDelivery != null) {
      _freeDelivery = freeDelivery;
    }
    if (coverPhoto != null) {
      _coverPhoto = coverPhoto;
    }
    if (delivery != null) {
      _delivery = delivery;
    }
    if (takeAway != null) {
      _takeAway = takeAway;
    }
    if (foodSection != null) {
      _foodSection = foodSection;
    }
    if (tax != null) {
      _tax = tax;
    }
    if (zoneId != null) {
      _zoneId = zoneId;
    }
    if (reviewsSection != null) {
      _reviewsSection = reviewsSection;
    }
    if (active != null) {
      _active = active;
    }
    if (offDay != null) {
      _offDay = offDay;
    }
    if (selfDeliverySystem != null) {
      _selfDeliverySystem = selfDeliverySystem;
    }
    if (posSystem != null) {
      _posSystem = posSystem;
    }
    if (minimumShippingCharge != null) {
      _minimumShippingCharge = minimumShippingCharge;
    }
    if (deliveryTime != null) {
      _deliveryTime = deliveryTime;
    }
    if (veg != null) {
      _veg = veg;
    }
    if (nonVeg != null) {
      _nonVeg = nonVeg;
    }
    if (orderCount != null) {
      _orderCount = orderCount;
    }
    if (totalOrder != null) {
      _totalOrder = totalOrder;
    }
    if (perKmShippingCharge != null) {
      _perKmShippingCharge = perKmShippingCharge;
    }
    if (restaurantModel != null) {
      _restaurantModel = restaurantModel;
    }
    if (maximumShippingCharge != null) {
      _maximumShippingCharge = maximumShippingCharge;
    }
    if (slug != null) {
      _slug = slug;
    }
    if (orderSubscriptionActive != null) {
      _orderSubscriptionActive = orderSubscriptionActive;
    }
    if (cutlery != null) {
      _cutlery = cutlery;
    }
    if (metaTitle != null) {
      _metaTitle = metaTitle;
    }
    if (metaDescription != null) {
      _metaDescription = metaDescription;
    }
    if (metaImage != null) {
      _metaImage = metaImage;
    }
    if (announcement != null) {
      _announcement = announcement;
    }
    if (announcementMessage != null) {
      _announcementMessage = announcementMessage;
    }
    if (qrCode != null) {
      _qrCode = qrCode;
    }
    if (additionalData != null) {
      _additionalData = additionalData;
    }
    if (additionalDocuments != null) {
      _additionalDocuments = additionalDocuments;
    }
    if (restaurantStatus != null) {
      _restaurantStatus = restaurantStatus;
    }
    if (foods != null) {
      _foods = foods;
    }
    if (coupons != null) {
      _coupons = coupons;
    }
    if (cuisine != null) {
      _cuisine = cuisine;
    }
    if (ratings != null) {
      _ratings = ratings;
    }
    if (avgRating != null) {
      _avgRating = avgRating;
    }
    if (ratingCount != null) {
      _ratingCount = ratingCount;
    }
    if (positiveRating != null) {
      _positiveRating = positiveRating;
    }
    if (customerOrderDate != null) {
      _customerOrderDate = customerOrderDate;
    }
    if (customerDateOrderSratus != null) {
      _customerDateOrderSratus = customerDateOrderSratus;
    }
    if (instantOrder != null) {
      _instantOrder = instantOrder;
    }
    if (halalTagStatus != null) {
      _halalTagStatus = halalTagStatus;
    }
    if (isExtraPackagingActive != null) {
      _isExtraPackagingActive = isExtraPackagingActive;
    }
    if (extraPackagingStatus != null) {
      _extraPackagingStatus = extraPackagingStatus;
    }
    if (extraPackagingAmount != null) {
      _extraPackagingAmount = extraPackagingAmount;
    }
    if (deliveryFee != null) {
      _deliveryFee = deliveryFee;
    }
    if (currentOpeningTime != null) {
      _currentOpeningTime = currentOpeningTime;
    }
    if (characteristics != null) {
      _characteristics = characteristics;
    }
    if (gstStatus != null) {
      _gstStatus = gstStatus;
    }
    if (gstCode != null) {
      _gstCode = gstCode;
    }
    if (freeDeliveryDistanceStatus != null) {
      _freeDeliveryDistanceStatus = freeDeliveryDistanceStatus;
    }
    if (freeDeliveryDistanceValue != null) {
      _freeDeliveryDistanceValue = freeDeliveryDistanceValue;
    }
    if (logoFullUrl != null) {
      _logoFullUrl = logoFullUrl;
    }
    if (coverPhotoFullUrl != null) {
      _coverPhotoFullUrl = coverPhotoFullUrl;
    }
    if (metaImageFullUrl != null) {
      _metaImageFullUrl = metaImageFullUrl;
    }
    if (translations != null) {
      _translations = translations;
    }
    if (schedules != null) {
      _schedules = schedules;
    }
    if (storage != null) {
      _storage = storage;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get logo => _logo;
  set logo(String? logo) => _logo = logo;
  String? get latitude => _latitude;
  set latitude(String? latitude) => _latitude = latitude;
  String? get longitude => _longitude;
  set longitude(String? longitude) => _longitude = longitude;
  String? get address => _address;
  set address(String? address) => _address = address;
  Null get footerText => _footerText;
  set footerText(Null footerText) => _footerText = footerText;
  int? get minimumOrder => _minimumOrder;
  set minimumOrder(int? minimumOrder) => _minimumOrder = minimumOrder;
  Null get comission => _comission;
  set comission(Null comission) => _comission = comission;
  bool? get scheduleOrder => _scheduleOrder;
  set scheduleOrder(bool? scheduleOrder) => _scheduleOrder = scheduleOrder;
  Null get openingTime => _openingTime;
  set openingTime(Null openingTime) => _openingTime = openingTime;
  Null get closeingTime => _closeingTime;
  set closeingTime(Null closeingTime) => _closeingTime = closeingTime;
  int? get status => _status;
  set status(int? status) => _status = status;
  int? get vendorId => _vendorId;
  set vendorId(int? vendorId) => _vendorId = vendorId;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  bool? get freeDelivery => _freeDelivery;
  set freeDelivery(bool? freeDelivery) => _freeDelivery = freeDelivery;
  String? get coverPhoto => _coverPhoto;
  set coverPhoto(String? coverPhoto) => _coverPhoto = coverPhoto;
  bool? get delivery => _delivery;
  set delivery(bool? delivery) => _delivery = delivery;
  bool? get takeAway => _takeAway;
  set takeAway(bool? takeAway) => _takeAway = takeAway;
  bool? get foodSection => _foodSection;
  set foodSection(bool? foodSection) => _foodSection = foodSection;
  double? get tax => _tax;
  set tax(double? tax) => _tax = tax;
  int? get zoneId => _zoneId;
  set zoneId(int? zoneId) => _zoneId = zoneId;
  bool? get reviewsSection => _reviewsSection;
  set reviewsSection(bool? reviewsSection) => _reviewsSection = reviewsSection;
  bool? get active => _active;
  set active(bool? active) => _active = active;
  String? get offDay => _offDay;
  set offDay(String? offDay) => _offDay = offDay;
  int? get selfDeliverySystem => _selfDeliverySystem;
  set selfDeliverySystem(int? selfDeliverySystem) =>
      _selfDeliverySystem = selfDeliverySystem;
  bool? get posSystem => _posSystem;
  set posSystem(bool? posSystem) => _posSystem = posSystem;
  int? get minimumShippingCharge => _minimumShippingCharge;
  set minimumShippingCharge(int? minimumShippingCharge) =>
      _minimumShippingCharge = minimumShippingCharge;
  String? get deliveryTime => _deliveryTime;
  set deliveryTime(String? deliveryTime) => _deliveryTime = deliveryTime;
  int? get veg => _veg;
  set veg(int? veg) => _veg = veg;
  int? get nonVeg => _nonVeg;
  set nonVeg(int? nonVeg) => _nonVeg = nonVeg;
  int? get orderCount => _orderCount;
  set orderCount(int? orderCount) => _orderCount = orderCount;
  int? get totalOrder => _totalOrder;
  set totalOrder(int? totalOrder) => _totalOrder = totalOrder;
  int? get perKmShippingCharge => _perKmShippingCharge;
  set perKmShippingCharge(int? perKmShippingCharge) =>
      _perKmShippingCharge = perKmShippingCharge;
  String? get restaurantModel => _restaurantModel;
  set restaurantModel(String? restaurantModel) =>
      _restaurantModel = restaurantModel;
  Null get maximumShippingCharge => _maximumShippingCharge;
  set maximumShippingCharge(Null maximumShippingCharge) =>
      _maximumShippingCharge = maximumShippingCharge;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  bool? get orderSubscriptionActive => _orderSubscriptionActive;
  set orderSubscriptionActive(bool? orderSubscriptionActive) =>
      _orderSubscriptionActive = orderSubscriptionActive;
  bool? get cutlery => _cutlery;
  set cutlery(bool? cutlery) => _cutlery = cutlery;
  String? get metaTitle => _metaTitle;
  set metaTitle(String? metaTitle) => _metaTitle = metaTitle;
  String? get metaDescription => _metaDescription;
  set metaDescription(String? metaDescription) =>
      _metaDescription = metaDescription;
  String? get metaImage => _metaImage;
  set metaImage(String? metaImage) => _metaImage = metaImage;
  int? get announcement => _announcement;
  set announcement(int? announcement) => _announcement = announcement;
  String? get announcementMessage => _announcementMessage;
  set announcementMessage(String? announcementMessage) =>
      _announcementMessage = announcementMessage;
  Null get qrCode => _qrCode;
  set qrCode(Null qrCode) => _qrCode = qrCode;
  Null get additionalData => _additionalData;
  set additionalData(Null additionalData) => _additionalData = additionalData;
  String? get additionalDocuments => _additionalDocuments;
  set additionalDocuments(String? additionalDocuments) =>
      _additionalDocuments = additionalDocuments;
  int? get restaurantStatus => _restaurantStatus;
  set restaurantStatus(int? restaurantStatus) =>
      _restaurantStatus = restaurantStatus;
  List<Foods>? get foods => _foods;
  set foods(List<Foods>? foods) => _foods = foods;
  List<Coupons>? get coupons => _coupons;
  set coupons(List<Coupons>? coupons) => _coupons = coupons;
  List<Cuisine>? get cuisine => _cuisine;
  set cuisine(List<Cuisine>? cuisine) => _cuisine = cuisine;
  List<int>? get ratings => _ratings;
  set ratings(List<int>? ratings) => _ratings = ratings;
  double? get avgRating => _avgRating;
  set avgRating(double? avgRating) => _avgRating = avgRating;
  int? get ratingCount => _ratingCount;
  set ratingCount(int? ratingCount) => _ratingCount = ratingCount;
  int? get positiveRating => _positiveRating;
  set positiveRating(int? positiveRating) => _positiveRating = positiveRating;
  int? get customerOrderDate => _customerOrderDate;
  set customerOrderDate(int? customerOrderDate) =>
      _customerOrderDate = customerOrderDate;
  bool? get customerDateOrderSratus => _customerDateOrderSratus;
  set customerDateOrderSratus(bool? customerDateOrderSratus) =>
      _customerDateOrderSratus = customerDateOrderSratus;
  bool? get instantOrder => _instantOrder;
  set instantOrder(bool? instantOrder) => _instantOrder = instantOrder;
  bool? get halalTagStatus => _halalTagStatus;
  set halalTagStatus(bool? halalTagStatus) => _halalTagStatus = halalTagStatus;
  bool? get isExtraPackagingActive => _isExtraPackagingActive;
  set isExtraPackagingActive(bool? isExtraPackagingActive) =>
      _isExtraPackagingActive = isExtraPackagingActive;
  bool? get extraPackagingStatus => _extraPackagingStatus;
  set extraPackagingStatus(bool? extraPackagingStatus) =>
      _extraPackagingStatus = extraPackagingStatus;
  int? get extraPackagingAmount => _extraPackagingAmount;
  set extraPackagingAmount(int? extraPackagingAmount) =>
      _extraPackagingAmount = extraPackagingAmount;
  String? get deliveryFee => _deliveryFee;
  set deliveryFee(String? deliveryFee) => _deliveryFee = deliveryFee;
  String? get currentOpeningTime => _currentOpeningTime;
  set currentOpeningTime(String? currentOpeningTime) =>
      _currentOpeningTime = currentOpeningTime;
  List<String>? get characteristics => _characteristics;
  set characteristics(List<String>? characteristics) =>
      _characteristics = characteristics;
  bool? get gstStatus => _gstStatus;
  set gstStatus(bool? gstStatus) => _gstStatus = gstStatus;
  String? get gstCode => _gstCode;
  set gstCode(String? gstCode) => _gstCode = gstCode;
  bool? get freeDeliveryDistanceStatus => _freeDeliveryDistanceStatus;
  set freeDeliveryDistanceStatus(bool? freeDeliveryDistanceStatus) =>
      _freeDeliveryDistanceStatus = freeDeliveryDistanceStatus;
  String? get freeDeliveryDistanceValue => _freeDeliveryDistanceValue;
  set freeDeliveryDistanceValue(String? freeDeliveryDistanceValue) =>
      _freeDeliveryDistanceValue = freeDeliveryDistanceValue;
  String? get logoFullUrl => _logoFullUrl;
  set logoFullUrl(String? logoFullUrl) => _logoFullUrl = logoFullUrl;
  String? get coverPhotoFullUrl => _coverPhotoFullUrl;
  set coverPhotoFullUrl(String? coverPhotoFullUrl) =>
      _coverPhotoFullUrl = coverPhotoFullUrl;
  String? get metaImageFullUrl => _metaImageFullUrl;
  set metaImageFullUrl(String? metaImageFullUrl) =>
      _metaImageFullUrl = metaImageFullUrl;
  List<Translations>? get translations => _translations;
  set translations(List<Translations>? translations) =>
      _translations = translations;
  List<Schedules>? get schedules => _schedules;
  set schedules(List<Schedules>? schedules) => _schedules = schedules;
  List<Null>? get storage => _storage;
  set storage(List<Null>? storage) => _storage = storage;

  Restaurant.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _phone = json['phone'];
    _email = json['email'];
    _logo = json['logo'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _address = json['address'];
    _footerText = json['footer_text'];
    _minimumOrder = json['minimum_order'];
    _comission = json['comission'];
    _scheduleOrder = json['schedule_order'];
    _openingTime = json['opening_time'];
    _closeingTime = json['closeing_time'];
    _status = json['status'];
    _vendorId = json['vendor_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _freeDelivery = json['free_delivery'];
    _coverPhoto = json['cover_photo'];
    _delivery = json['delivery'];
    _takeAway = json['take_away'];
    _foodSection = json['food_section'];
    _tax = double.parse(json['tax'].toString());
    _zoneId = json['zone_id'];
    _reviewsSection = json['reviews_section'];
    _active = json['active'];
    _offDay = json['off_day'];
    _selfDeliverySystem = json['self_delivery_system'];
    _posSystem = json['pos_system'];
    _minimumShippingCharge = json['minimum_shipping_charge'];
    _deliveryTime = json['delivery_time'];
    _veg = json['veg'];
    _nonVeg = json['non_veg'];
    _orderCount = json['order_count'];
    _totalOrder = json['total_order'];
    _perKmShippingCharge = json['per_km_shipping_charge'];
    _restaurantModel = json['restaurant_model'];
    _maximumShippingCharge = json['maximum_shipping_charge'];
    _slug = json['slug'];
    _orderSubscriptionActive = json['order_subscription_active'];
    _cutlery = json['cutlery'];
    _metaTitle = json['meta_title'];
    _metaDescription = json['meta_description'];
    _metaImage = json['meta_image'];
    _announcement = json['announcement'];
    _announcementMessage = json['announcement_message'];
    _qrCode = json['qr_code'];
    _additionalData = json['additional_data'];
    _additionalDocuments = json['additional_documents'];
    _restaurantStatus = json['restaurant_status'];
    if (json['foods'] != null) {
      _foods = <Foods>[];
      json['foods'].forEach((v) {
        _foods!.add(Foods.fromJson(v));
      });
    }
    if (json['coupons'] != null) {
      _coupons = <Coupons>[];
      json['coupons'].forEach((v) {
        _coupons!.add(Coupons.fromJson(v));
      });
    }
    if (json['cuisine'] != null) {
      _cuisine = <Cuisine>[];
      json['cuisine'].forEach((v) {
        _cuisine!.add(Cuisine.fromJson(v));
      });
    }
    _ratings = json['ratings'].cast<int>();
    _avgRating = double.parse(json['avg_rating'].toString());
    _ratingCount = json['rating_count'];
    _positiveRating = json['positive_rating'];
    _customerOrderDate = json['customer_order_date'];
    _customerDateOrderSratus = json['customer_date_order_sratus'];
    _instantOrder = json['instant_order'];
    _halalTagStatus = json['halal_tag_status'];
    _isExtraPackagingActive = json['is_extra_packaging_active'];
    _extraPackagingStatus = json['extra_packaging_status'];
    _extraPackagingAmount = json['extra_packaging_amount'];
    _deliveryFee = json['delivery_fee'];
    _currentOpeningTime = json['current_opening_time'];
    _characteristics = json['characteristics'].cast<String>();
    _gstStatus = json['gst_status'];
    _gstCode = json['gst_code'];
    _freeDeliveryDistanceStatus = json['free_delivery_distance_status'];
    _freeDeliveryDistanceValue = json['free_delivery_distance_value'];
    _logoFullUrl = json['logo_full_url'];
    _coverPhotoFullUrl = json['cover_photo_full_url'];
    _metaImageFullUrl = json['meta_image_full_url'];
    if (json['translations'] != null) {
      _translations = <Translations>[];
      json['translations'].forEach((v) {
        _translations!.add(Translations.fromJson(v));
      });
    }
    if (json['schedules'] != null) {
      _schedules = <Schedules>[];
      json['schedules'].forEach((v) {
        _schedules!.add(Schedules.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['phone'] = _phone;
    data['email'] = _email;
    data['logo'] = _logo;
    data['latitude'] = _latitude;
    data['longitude'] = _longitude;
    data['address'] = _address;
    data['footer_text'] = _footerText;
    data['minimum_order'] = _minimumOrder;
    data['comission'] = _comission;
    data['schedule_order'] = _scheduleOrder;
    data['opening_time'] = _openingTime;
    data['closeing_time'] = _closeingTime;
    data['status'] = _status;
    data['vendor_id'] = _vendorId;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['free_delivery'] = _freeDelivery;
    data['cover_photo'] = _coverPhoto;
    data['delivery'] = _delivery;
    data['take_away'] = _takeAway;
    data['food_section'] = _foodSection;
    data['tax'] = _tax;
    data['zone_id'] = _zoneId;
    data['reviews_section'] = _reviewsSection;
    data['active'] = _active;
    data['off_day'] = _offDay;
    data['self_delivery_system'] = _selfDeliverySystem;
    data['pos_system'] = _posSystem;
    data['minimum_shipping_charge'] = _minimumShippingCharge;
    data['delivery_time'] = _deliveryTime;
    data['veg'] = _veg;
    data['non_veg'] = _nonVeg;
    data['order_count'] = _orderCount;
    data['total_order'] = _totalOrder;
    data['per_km_shipping_charge'] = _perKmShippingCharge;
    data['restaurant_model'] = _restaurantModel;
    data['maximum_shipping_charge'] = _maximumShippingCharge;
    data['slug'] = _slug;
    data['order_subscription_active'] = _orderSubscriptionActive;
    data['cutlery'] = _cutlery;
    data['meta_title'] = _metaTitle;
    data['meta_description'] = _metaDescription;
    data['meta_image'] = _metaImage;
    data['announcement'] = _announcement;
    data['announcement_message'] = _announcementMessage;
    data['qr_code'] = _qrCode;
    data['additional_data'] = _additionalData;
    data['additional_documents'] = _additionalDocuments;
    data['restaurant_status'] = _restaurantStatus;
    if (_foods != null) {
      data['foods'] = _foods!.map((v) => v.toJson()).toList();
    }
    if (_coupons != null) {
      data['coupons'] = _coupons!.map((v) => v.toJson()).toList();
    }
    if (_cuisine != null) {
      data['cuisine'] = _cuisine!.map((v) => v.toJson()).toList();
    }
    data['ratings'] = _ratings;
    data['avg_rating'] = _avgRating;
    data['rating_count'] = _ratingCount;
    data['positive_rating'] = _positiveRating;
    data['customer_order_date'] = _customerOrderDate;
    data['customer_date_order_sratus'] = _customerDateOrderSratus;
    data['instant_order'] = _instantOrder;
    data['halal_tag_status'] = _halalTagStatus;
    data['is_extra_packaging_active'] = _isExtraPackagingActive;
    data['extra_packaging_status'] = _extraPackagingStatus;
    data['extra_packaging_amount'] = _extraPackagingAmount;
    data['delivery_fee'] = _deliveryFee;
    data['current_opening_time'] = _currentOpeningTime;
    data['characteristics'] = _characteristics;
    data['gst_status'] = _gstStatus;
    data['gst_code'] = _gstCode;
    data['free_delivery_distance_status'] = _freeDeliveryDistanceStatus;
    data['free_delivery_distance_value'] = _freeDeliveryDistanceValue;
    data['logo_full_url'] = _logoFullUrl;
    data['cover_photo_full_url'] = _coverPhotoFullUrl;
    data['meta_image_full_url'] = _metaImageFullUrl;
    if (_translations != null) {
      data['translations'] =
          _translations!.map((v) => v.toJson()).toList();
    }
    if (_schedules != null) {
      data['schedules'] = _schedules!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Foods {
  int? _id;
  String? _image;
  String? _name;
  String? _imageFullUrl;
  List<Translations>? _translations;
  List<Null>? _storage;

  Foods(
      {int? id,
        String? image,
        String? name,
        String? imageFullUrl,
        List<Translations>? translations,
        List<Null>? storage}) {
    if (id != null) {
      _id = id;
    }
    if (image != null) {
      _image = image;
    }
    if (name != null) {
      _name = name;
    }
    if (imageFullUrl != null) {
      _imageFullUrl = imageFullUrl;
    }
    if (translations != null) {
      _translations = translations;
    }
    if (storage != null) {
      _storage = storage;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get imageFullUrl => _imageFullUrl;
  set imageFullUrl(String? imageFullUrl) => _imageFullUrl = imageFullUrl;
  List<Translations>? get translations => _translations;
  set translations(List<Translations>? translations) =>
      _translations = translations;
  List<Null>? get storage => _storage;
  set storage(List<Null>? storage) => _storage = storage;

  Foods.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _image = json['image'];
    _name = json['name'];
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
    data['name'] = _name;
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

class Coupons {
  int? _id;
  String? _title;
  String? _code;
  String? _startDate;
  String? _expireDate;
  int? _minPurchase;
  int? _maxDiscount;
  int? _discount;
  String? _discountType;
  String? _couponType;
  int? _limit;
  int? _status;
  String? _createdAt;
  String? _updatedAt;
  String? _data;
  int? _totalUses;
  String? _createdBy;
  String? _customerId;
  Null _slug;
  int? _restaurantId;
  List<Translations>? _translations;

  Coupons(
      {int? id,
        String? title,
        String? code,
        String? startDate,
        String? expireDate,
        int? minPurchase,
        int? maxDiscount,
        int? discount,
        String? discountType,
        String? couponType,
        int? limit,
        int? status,
        String? createdAt,
        String? updatedAt,
        String? data,
        int? totalUses,
        String? createdBy,
        String? customerId,
        Null slug,
        int? restaurantId,
        List<Translations>? translations}) {
    if (id != null) {
      _id = id;
    }
    if (title != null) {
      _title = title;
    }
    if (code != null) {
      _code = code;
    }
    if (startDate != null) {
      _startDate = startDate;
    }
    if (expireDate != null) {
      _expireDate = expireDate;
    }
    if (minPurchase != null) {
      _minPurchase = minPurchase;
    }
    if (maxDiscount != null) {
      _maxDiscount = maxDiscount;
    }
    if (discount != null) {
      _discount = discount;
    }
    if (discountType != null) {
      _discountType = discountType;
    }
    if (couponType != null) {
      _couponType = couponType;
    }
    if (limit != null) {
      _limit = limit;
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
    if (data != null) {
      _data = data;
    }
    if (totalUses != null) {
      _totalUses = totalUses;
    }
    if (createdBy != null) {
      _createdBy = createdBy;
    }
    if (customerId != null) {
      _customerId = customerId;
    }
    if (slug != null) {
      _slug = slug;
    }
    if (restaurantId != null) {
      _restaurantId = restaurantId;
    }
    if (translations != null) {
      _translations = translations;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get code => _code;
  set code(String? code) => _code = code;
  String? get startDate => _startDate;
  set startDate(String? startDate) => _startDate = startDate;
  String? get expireDate => _expireDate;
  set expireDate(String? expireDate) => _expireDate = expireDate;
  int? get minPurchase => _minPurchase;
  set minPurchase(int? minPurchase) => _minPurchase = minPurchase;
  int? get maxDiscount => _maxDiscount;
  set maxDiscount(int? maxDiscount) => _maxDiscount = maxDiscount;
  int? get discount => _discount;
  set discount(int? discount) => _discount = discount;
  String? get discountType => _discountType;
  set discountType(String? discountType) => _discountType = discountType;
  String? get couponType => _couponType;
  set couponType(String? couponType) => _couponType = couponType;
  int? get limit => _limit;
  set limit(int? limit) => _limit = limit;
  int? get status => _status;
  set status(int? status) => _status = status;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  String? get data => _data;
  set data(String? data) => _data = data;
  int? get totalUses => _totalUses;
  set totalUses(int? totalUses) => _totalUses = totalUses;
  String? get createdBy => _createdBy;
  set createdBy(String? createdBy) => _createdBy = createdBy;
  String? get customerId => _customerId;
  set customerId(String? customerId) => _customerId = customerId;
  Null get slug => _slug;
  set slug(Null slug) => _slug = slug;
  int? get restaurantId => _restaurantId;
  set restaurantId(int? restaurantId) => _restaurantId = restaurantId;
  List<Translations>? get translations => _translations;
  set translations(List<Translations>? translations) =>
      _translations = translations;

  Coupons.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _code = json['code'];
    _startDate = json['start_date'];
    _expireDate = json['expire_date'];
    _minPurchase = json['min_purchase'];
    _maxDiscount = json['max_discount'];
    _discount = json['discount'];
    _discountType = json['discount_type'];
    _couponType = json['coupon_type'];
    _limit = json['limit'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _data = json['data'];
    _totalUses = json['total_uses'];
    _createdBy = json['created_by'];
    _customerId = json['customer_id'];
    _slug = json['slug'];
    _restaurantId = json['restaurant_id'];
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
    data['title'] = _title;
    data['code'] = _code;
    data['start_date'] = _startDate;
    data['expire_date'] = _expireDate;
    data['min_purchase'] = _minPurchase;
    data['max_discount'] = _maxDiscount;
    data['discount'] = _discount;
    data['discount_type'] = _discountType;
    data['coupon_type'] = _couponType;
    data['limit'] = _limit;
    data['status'] = _status;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['data'] = _data;
    data['total_uses'] = _totalUses;
    data['created_by'] = _createdBy;
    data['customer_id'] = _customerId;
    data['slug'] = _slug;
    data['restaurant_id'] = _restaurantId;
    if (_translations != null) {
      data['translations'] =
          _translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cuisine {
  int? _id;
  String? _name;
  String? _image;
  int? _status;
  String? _slug;
  String? _createdAt;
  String? _updatedAt;
  String? _imageFullUrl;
  Pivot? _pivot;
  List<Translations>? _translations;
  List<Null>? _storage;

  Cuisine(
      {int? id,
        String? name,
        String? image,
        int? status,
        String? slug,
        String? createdAt,
        String? updatedAt,
        String? imageFullUrl,
        Pivot? pivot,
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
    if (status != null) {
      _status = status;
    }
    if (slug != null) {
      _slug = slug;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    if (imageFullUrl != null) {
      _imageFullUrl = imageFullUrl;
    }
    if (pivot != null) {
      _pivot = pivot;
    }
    if (translations != null) {
      _translations = translations;
    }
    if (storage != null) {
      _storage = storage;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get image => _image;
  set image(String? image) => _image = image;
  int? get status => _status;
  set status(int? status) => _status = status;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  String? get imageFullUrl => _imageFullUrl;
  set imageFullUrl(String? imageFullUrl) => _imageFullUrl = imageFullUrl;
  Pivot? get pivot => _pivot;
  set pivot(Pivot? pivot) => _pivot = pivot;
  List<Translations>? get translations => _translations;
  set translations(List<Translations>? translations) =>
      _translations = translations;
  List<Null>? get storage => _storage;
  set storage(List<Null>? storage) => _storage = storage;

  Cuisine.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _status = json['status'];
    _slug = json['slug'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _imageFullUrl = json['image_full_url'];
    _pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
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
    data['status'] = _status;
    data['slug'] = _slug;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['image_full_url'] = _imageFullUrl;
    if (_pivot != null) {
      data['pivot'] = _pivot!.toJson();
    }
    if (_translations != null) {
      data['translations'] =
          _translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pivot {
  int? _restaurantId;
  int? _cuisineId;

  Pivot({int? restaurantId, int? cuisineId}) {
    if (restaurantId != null) {
      _restaurantId = restaurantId;
    }
    if (cuisineId != null) {
      _cuisineId = cuisineId;
    }
  }

  int? get restaurantId => _restaurantId;
  set restaurantId(int? restaurantId) => _restaurantId = restaurantId;
  int? get cuisineId => _cuisineId;
  set cuisineId(int? cuisineId) => _cuisineId = cuisineId;

  Pivot.fromJson(Map<String, dynamic> json) {
    _restaurantId = json['restaurant_id'];
    _cuisineId = json['cuisine_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['restaurant_id'] = _restaurantId;
    data['cuisine_id'] = _cuisineId;
    return data;
  }
}

class Schedules {
  int? _id;
  int? _restaurantId;
  int? _day;
  String? _openingTime;
  String? _closingTime;
  Null _createdAt;
  Null _updatedAt;

  Schedules(
      {int? id,
        int? restaurantId,
        int? day,
        String? openingTime,
        String? closingTime,
        Null createdAt,
        Null updatedAt}) {
    if (id != null) {
      _id = id;
    }
    if (restaurantId != null) {
      _restaurantId = restaurantId;
    }
    if (day != null) {
      _day = day;
    }
    if (openingTime != null) {
      _openingTime = openingTime;
    }
    if (closingTime != null) {
      _closingTime = closingTime;
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
  int? get restaurantId => _restaurantId;
  set restaurantId(int? restaurantId) => _restaurantId = restaurantId;
  int? get day => _day;
  set day(int? day) => _day = day;
  String? get openingTime => _openingTime;
  set openingTime(String? openingTime) => _openingTime = openingTime;
  String? get closingTime => _closingTime;
  set closingTime(String? closingTime) => _closingTime = closingTime;
  Null get createdAt => _createdAt;
  set createdAt(Null createdAt) => _createdAt = createdAt;
  Null get updatedAt => _updatedAt;
  set updatedAt(Null updatedAt) => _updatedAt = updatedAt;

  Schedules.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _restaurantId = json['restaurant_id'];
    _day = json['day'];
    _openingTime = json['opening_time'];
    _closingTime = json['closing_time'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['restaurant_id'] = _restaurantId;
    data['day'] = _day;
    data['opening_time'] = _openingTime;
    data['closing_time'] = _closingTime;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}
