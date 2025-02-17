import 'package:get/get.dart';

class Messages extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {

    //en is language code and US is country code
    'en_US' : {
      'hello' : 'How are you?',
      'general_info' : 'General Info',
      'variation_setup' : 'Variation Setup',
      'product_seo' : 'Product Seo',
      'add_product' : 'Add Product'
    },
    'hi_IN' : {
      'hello' : 'आप कैसे हैं?',
    },
    'fr_FR' : {
      'hello' : 'comment vas-tu?',
    },

  };

}