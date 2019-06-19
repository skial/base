package base;

import base.Alphabet;
import haxe.io.BytesData;

using haxe.io.Bytes;

#if py
using python.NativeStringTools;
#end

typedef Base64 = 
#if cs
    CsBase64
#elseif python
    PyBase64
#elseif php
    PhpBase64
#elseif java
    JavaBase64
#else
    XBase64
#end
;

private class BaseBase64 {
    private var padding:Bool;
    public function new(padding:Bool = true) {
        this.padding = padding;
    }
}
#if cs
class CsBase64 extends BaseBase64 {
    public inline function encode(bytes:Bytes):Value {
        var result = cs.system.Convert.ToBase64String(bytes.getData());
        if (!padding) {
            var length = result.length;
            while (result.charAt(length-1) == '=') length--;
            return result.substring(0, length);

        }
        return result;
    }
    public inline function decode(value:Value):Bytes {
        var value:String = value;
        if (!padding) {
            for (_ in 0...(4 - (value.length % 4))) value += '=';
        }
        return Bytes.ofData(cs.system.Convert.FromBase64String(value));
    }
}
#elseif python
@:pythonImport("base64") extern class NativeBase64 {
    public static function b64encode(s:BytesData, ?altchars:String):BytesData;
    public static function b64decode(s:BytesData, ?altchars:String):BytesData;
}
class PyBase64 extends BaseBase64 {
    public inline function encode(bytes:Bytes):Value {
        var result = NativeBase64.b64encode(bytes.getData()).decode();

        if (!padding) {
            var length = result.length;
            while (result.charAt(length-1) == '=') length--;
            return result.substring(0, length);
        }

        return result;
    }
    public inline function decode(value:Value):Bytes {
        var bytes = value.asBytes();
        if (!padding) {
            var buffer = new haxe.io.BytesBuffer();
            buffer.add(bytes);
            for (_ in 0...(4 - (bytes.length % 4))) buffer.addByte( '='.code );
            bytes = buffer.getBytes();
        }
        return Bytes.ofData( NativeBase64.b64decode( bytes.getData() ) );
    }
}
#elseif php
class PhpBase64 extends BaseBase64 {
    public inline function encode(bytes:Bytes):Value {
        var result = php.Global.base64_encode(bytes.toString());
        if (!padding) {
            var length = result.length;
            while (result.charAt(length-1) == '=') length--;
            return result.substring(0, length);
        }
        return result;
    }
    public inline function decode(value:Value):Bytes {
        // PHP seems to handle extra padding with no issues.
        return Bytes.ofString(php.Global.base64_decode(value, true));
    }
}
#elseif java
class JavaBase64 extends BaseBase64 {
    public inline function encode(bytes:Bytes):Value {
        var encoder = java.util.Base64.getEncoder();
        if (!padding) encoder = encoder.withoutPadding();
        return encoder.encode(bytes.getData());
    }
    public inline function decode(value:Value):Bytes {
        return Bytes.ofData(java.util.Base64.getDecoder().decode(value));
    }
}
#end
class XBase64 extends BaseCode {
    private override function get_BASE():Int return 64;
    private override function get_CHARS():String return '$BASE64=';
    private override function get_modulo():Int return 3;
}