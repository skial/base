package base;

import haxe.io.Bytes;

@:asserts
class Base32Spec {

    public function new() {}

    @:variant("Decentralize everything!!", "IRSWGZLOORZGC3DJPJSSAZLWMVZHS5DINFXGOIJB==")
    @:variant("yes mani !", "PFSXGIDNMFXGSIBB=")
    @:variant("hello world", "NBSWY3DPEB3W64TMMQ")
    //@:variant("\x00yes mani !", "AB4WK4ZANVQW42JAEE") // zero bytes are ignored by Bytes.{to/get}String
    //@:variant("\x00\x00yes mani !", "AAAHSZLTEBWWC3TJEAQQ")
    public function testBase32(input:String, output:String) {
        var base16 = new Base32();

        asserts.assert( base16.encode(Bytes.ofString(input)).toString() == output );
        asserts.assert( base16.decode(Bytes.ofString(output)).toString() == input );

        return asserts.done();
    }

}