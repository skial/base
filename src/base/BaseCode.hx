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

    private var padding(get, never):Bool;
    private function get_padding():Bool {
        return CHARS.lastIndexOf('=') == BASE;
    }

    private var modulo(get, never):Int;
    private function get_modulo():Int return 8;

    public function new() {
        super(BYTES);
    }

    public function encode(bytes:Bytes):Bytes {
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

    public function decode(bytes:Bytes):Bytes {
        trace(padding);
        return if (padding) {
            var data = bytes.getData();
            var buffer = new BytesBuffer();
            var length = bytes.length;
            
            while (data.fastGet(length-1) == '='.code) {
                length--;
            }
            
            buffer.add( bytes.sub(0, length) );

            decodeBytes( buffer.getBytes() );

        } else {
            decodeBytes( bytes );

        }
    }

}