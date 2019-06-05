package base;

import base.Alphabet;

using haxe.io.Bytes;

class Base2 extends BaseCode {

    private override function get_BASE():Int return 2;
    private override function get_CHARS():String return BASE2;

    public function new() {
        super(false);
    }

    public override function encode(bytes:Bytes):Bytes {
        return encodeBytes(bytes);
    }

    public override function decode(bytes:Bytes):Bytes {
        return decodeBytes( bytes );
    }

}