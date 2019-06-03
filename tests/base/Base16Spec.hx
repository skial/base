package base;

import haxe.io.Bytes;

@:asserts
class Base16Spec {

    public function new() {}

    @:variant("Decentralize everything!!", "446563656E7472616C697A652065766572797468696E672121")
    @:variant("yes mani !", "796573206D616E692021")
    @:variant("hello world", "68656C6C6F20776F726C64")
    //@:variant("\x00yes mani !", "00796573206D616E692021") // zero bytes are ignored by Bytes.{to/get}String
    //@:variant("\x00\x00yes mani !", "0000796573206D616E692021")
    public function testBase16(input:String, output:String) {
        var base = new Base16();

        asserts.assert( base.encode(Bytes.ofString(input)).toString() == output );
        asserts.assert( base.decode(Bytes.ofString(output)).toString() == input );

        return asserts.done();
    }

}