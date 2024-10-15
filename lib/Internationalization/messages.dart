import 'package:get/get.dart';

class Messages extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {

    //en is language code and US is country code
    'en_US' : {
      'hello' : 'How are you?',
    },
    'hi_IN' : {
      'hello' : 'आप कैसे हैं?',
    },
    'fr_FR' : {
      'hello' : 'comment vas-tu?',
    },

  };

}