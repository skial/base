package base;

import haxe.io.Bytes;

@:notNull
@:forward
@:forwardStatics
enum abstract Alphabet(String) from String to String {
    public var BASE2 = '01';
    public var BASE8 = '01234567';
    public var BASE10 = '0123456789';
    public var BASE16 = '0123456789ABCDEF';
    public var BASE16_Lower = '0123456789abcdef';
    public var BASE32 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567';
    public var BASE32_Lower = 'abcdefghijklmnopqrstuvwxyz234567';
    public var BASE32_Hex = '0123456789ABCDEFGHIJKLMNOPQRSTUV';
    public var BASE32_Z = 'ybndrfg8ejkmcpqxot1uwisza345h769';
    public var BASE58 = '123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz';
    public var BASE58_Flickr = '123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ';
    public var BASE64 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
    public var BASE64_Url = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_';

    @:to public inline function asBytes():Bytes {
        return Bytes.ofString(this);
    }
}