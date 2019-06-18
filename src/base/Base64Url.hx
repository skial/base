package base;

import base.Alphabet;

class Base64Url extends Base64.XBase64 {
    
    private override function get_CHARS():String return '$BASE64_Url=';

}