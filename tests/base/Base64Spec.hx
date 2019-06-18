package base;

import haxe.io.Bytes;

@:asserts
class Base64Spec {

    public function new() {}

    @:variant("Decentralize everything!!", "RGVjZW50cmFsaXplIGV2ZXJ5dGhpbmchIQ==")
    @:variant("yes mani !", "eWVzIG1hbmkgIQ==")
    @:variant("hello world", "aGVsbG8gd29ybGQ=")
    //@:variant("\x00yes mani !", "AHllcyBtYW5pICE=") // zero bytes are ignored by Bytes.{to/get}String
    //@:variant("\x00\x00yes mani !", "AAB5ZXMgbWFuaSAh")
    public function testBase64(input:String, output:String) {
        var base = new Base64();

        asserts.assert( base.encode(Bytes.ofString(input)).toString() == output );
        asserts.assert( base.decode(output).toString() == input );

        return asserts.done();
    }

    @:variant("Decentralize everything!!", "RGVjZW50cmFsaXplIGV2ZXJ5dGhpbmchIQ==")
    @:variant("yes mani !", "eWVzIG1hbmkgIQ==")
    @:variant("hello world", "aGVsbG8gd29ybGQ=")
    public function testBase64Url(input:String, output:String) {
        var base = new Base64Url();

        asserts.assert( base.encode(Bytes.ofString(input)).toString() == output );
        asserts.assert( base.decode(output).toString() == input );

        return asserts.done();
    }

    @:variant("Decentralize everything!!", "RGVjZW50cmFsaXplIGV2ZXJ5dGhpbmchIQ")
    @:variant("yes mani !", "eWVzIG1hbmkgIQ")
    @:variant("hello world", "aGVsbG8gd29ybGQ")
    public function testBase64Url_noPadding(input:String, output:String) {
        var base = new Base64Url(false);

        asserts.assert( base.encode(Bytes.ofString(input)).toString() == output );
        asserts.assert( base.decode(output).toString() == input );

        return asserts.done();
    }

    @:variant("ff", "_w==")
    @:variant("69b73efeba", "abc-_ro=")
    public function testBase64Url_hex(input:String, output:String) {
        var base = new Base64Url();

        asserts.assert( base.encode(Bytes.ofHex(input)).toString() == output );
        asserts.assert( base.decode(output).toHex() == input );

        return asserts.done();
    }

}