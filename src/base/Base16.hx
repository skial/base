package base;

import haxe.io.BytesBuffer;

using haxe.io.Bytes;

// https://tools.ietf.org/html/rfc4648#section-6
class Base16 extends BaseCode {

    private override function get_BASE():Int return 16;
    private override function get_CHARS():String return "0123456789ABCDEF";
    

    public override function encode(bytes:Bytes):Bytes {
        return encodeBytes(bytes);
    }

    public override function decode(bytes:Bytes):Bytes {
        return decodeBytes( bytes );
    }

}