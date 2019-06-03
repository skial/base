package base;

import base.Alphabet.BASE2;

using haxe.io.Bytes;

class Base2 extends BaseCode {

    private override function get_BASE():Int return 2;
    private override function get_CHARS():String return BASE2;

    public override function encode(bytes:Bytes):Bytes {
        return encodeBytes(bytes);
    }

    public override function decode(bytes:Bytes):Bytes {
        return decodeBytes( bytes );
    }

}