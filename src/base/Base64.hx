package base;

class Base64 extends BaseCode {
    private override function get_BASE():Int return 64;
    private override function get_CHARS():String return "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
    private override function get_modulo():Int return 3;

}