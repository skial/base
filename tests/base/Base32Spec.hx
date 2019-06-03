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
        var base = new Base32();

        asserts.assert( base.encode(Bytes.ofString(input)).toString() == output );
        asserts.assert( base.decode(Bytes.ofString(output)).toString() == input );

        return asserts.done();
    }

    @:variant("Decentralize everything!!", "et1sg3mqqt3gn5djxj11y3msci3817depfzgqejb")
    @:variant("yes mani !", "xf1zgedpcfzg1ebb")
    @:variant("hello world", "pb1sa5dxrb5s6hucco")
    public function testZBase32(input:String, output:String) {
        var base = new ZBase32();

        asserts.assert( base.encode(Bytes.ofString(input)).toString() == output );
        asserts.assert( base.decode(Bytes.ofString(output)).toString() == input );

        return asserts.done();
    }

}