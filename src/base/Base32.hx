package base;

import base.Alphabet;
import haxe.io.BytesBuffer;

using haxe.io.Bytes;

// https://tools.ietf.org/html/rfc4648#section-6
class Base32 extends BaseCode {

    private override function get_BASE():Int return 32;
    private override function get_CHARS():String return '$BASE32=';
    private override function get_modulo():Int return 8;

    override public function encode(bytes:Bytes):Bytes {
        var _buffer = new BytesBuffer();
        _buffer.add( encodeBytes(bytes) );

        if (padding) switch (8 - (_buffer.length % 8) % 8) {
            case x if (x > 0 && x < 7):
                for (i in 0...x) _buffer.addByte( '='.code );

            case _:

        }
        
        return _buffer.getBytes();
    }

}