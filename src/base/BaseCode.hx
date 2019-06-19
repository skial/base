package base;

import haxe.io.BytesBuffer;

using haxe.io.Bytes;

class BaseCode extends haxe.crypto.BaseCode {

    public var BASE(get, never):Int;
    private function get_BASE():Int return 32;
    public var CHARS(get, never):String;
    private function get_CHARS():String return "ABCDEFGHIJKLMNOPQRSTUVWXYZ234567";
    public var BYTES(get, never):Bytes; 
    private function get_BYTES():Bytes return Bytes.ofString( get_CHARS().substring(0, BASE) );

    @:isVar private var padding(get, set):Null<Bool>;
    private function get_padding():Bool {
        if (padding == null) padding = CHARS.lastIndexOf('=') == BASE;
        return padding;
    }
    private inline function set_padding(v:Bool):Bool {
        return padding = v;
    }

    private var modulo(get, never):Int;
    private function get_modulo():Int return 8;

    public function new(?padding:Bool = true) {
        if (!padding) this.padding = false;
        super(BYTES);
    }

    public function encode(bytes:Bytes):Value {
        var _buffer = new BytesBuffer();
        _buffer.add( encodeBytes(bytes) );

        if (padding) switch bytes.length % modulo {
            case 1: 
                _buffer.addByte( '='.code );
                _buffer.addByte( '='.code );

            case 2:
                _buffer.addByte( '='.code );
            
            case _:

        }

        return _buffer.getBytes();
    }

    public function decode(value:Value):Bytes {
        var bytes:Bytes = value;
        return if (padding) {
            var data = bytes.getData();
            var length = bytes.length;
            
            while (data.fastGet(length-1) == '='.code) {
                length--;
            }

            decodeBytes( bytes.sub(0, length) );

        } else {
            decodeBytes( bytes );

        }
    }

}