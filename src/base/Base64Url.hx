package base;

import base.Alphabet.BASE64_Url;

class Base64Url extends Base64 {
    
    private override function get_CHARS():String return '$BASE64_Url=';

}