package base;

import base.Alphabet;
import haxe.io.Bytes;
import haxe.io.BytesData;

#if py
using python.NativeStringTools;
#end

typedef Base64 = 
#if cs
    CsBase64
#elseif python
    PyBase64
#else
    XBase64
#end
;

#if cs
class CsBase64 {
    public function new(padding:Bool = false) {}
    public inline function encode(bytes:Bytes):Value {
        return cs.system.Convert.ToBase64String(bytes.getData());
    }
    public inline function decode(value:Value):Bytes {
        return Bytes.ofData(cs.system.Convert.FromBase64String(value));
    }
}
#elseif python
@:pythonImport("base64") extern class NativeBase64 {
    public static function b64encode(s:BytesData, ?altchars:String):BytesData;
    public static function b64decode(s:BytesData, ?altchars:String):BytesData;
}
class PyBase64 {
    public function new(padding:Bool = false) {}
    public inline function encode(bytes:Bytes):Value {
        return NativeBase64.b64encode(bytes.getData()).decode();
    }
    public inline function decode(value:Value):Bytes {
        return Bytes.ofData(
            NativeBase64.b64decode(
                value.asBytes().getData()
            )
        );
    }
}
#end
class XBase64 extends BaseCode {
    private override function get_BASE():Int return 64;
    private override function get_CHARS():String return '$BASE64=';
    private override function get_modulo():Int return 3;
}