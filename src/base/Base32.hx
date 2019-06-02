package base;

import haxe.io.BytesBuffer;

using haxe.io.Bytes;

// https://tools.ietf.org/html/rfc4648#section-6
class Base32 extends BaseCode {

    private override function get_BASE():Int return 32;
    private override function get_CHARS():String return "ABCDEFGHIJKLMNOPQRSTUVWXYZ234567=";
    private override function get_modulo():Int return 8;

}