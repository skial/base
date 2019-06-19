package base;

import haxe.io.Bytes;
import haxe.io.BytesData;

abstract Value(ValueObject) from ValueObject {

    @:to public inline function toString():String return this.asString();
    @:to public inline function asBytes():Bytes return this.asBytes();

    @:from static inline function fromString(value:String):Value {
        return new ValueString(value);
    }
    @:from static inline function fromBytes(value:Bytes):Value {
        return new ValueBytes(value);
    }
    @:from static inline function fromBytesData(value:BytesData):Value {
        return new ValueBytesData(value);
    }
}

#if !(cs || java)
@:remove
#end
interface ValueObject {
    public function asBytes():Bytes;
    public function asString():String;
}

@:structInit
private class ValueBytes implements ValueObject {
    var value:Bytes;

    public inline function new(v:Bytes) {
        value = v;
    }

    public inline function asBytes():Bytes return this.value;
    public inline function asString():String return this.value.toString();
}

@:structInit
private class ValueString implements ValueObject {
    var value:String;

    public inline function new(v:String) {
        value = v;
    }

    public inline function asBytes():Bytes return Bytes.ofString(this.value);
    public inline function asString():String return this.value;
}

@:structInit
private class ValueBytesData implements ValueObject {
    var value:BytesData;

    public inline function new(v:BytesData) {
        value = v;
    }

    public inline function asBytes():Bytes return Bytes.ofData(this.value);
    public inline function asString():String return
    #if py
        this.value.decode()
    #else
        Bytes.ofData(this.value).toString()
    #end
    ;
}