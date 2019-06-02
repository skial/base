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
        var base16 = new Base64();

        asserts.assert( base16.encode(Bytes.ofString(input)).toString() == output );
        asserts.assert( base16.decode(Bytes.ofString(output)).toString() == input );

        return asserts.done();
    }

}