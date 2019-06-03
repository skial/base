package base;

import haxe.io.Bytes;

@:asserts
class Base2Spec {

    public function new() {}

    @:variant("Decentralize everything!!", "01000100011001010110001101100101011011100111010001110010011000010110110001101001011110100110010100100000011001010111011001100101011100100111100101110100011010000110100101101110011001110010000100100001")
    @:variant("yes mani !", "01111001011001010111001100100000011011010110000101101110011010010010000000100001")
    @:variant("hello world", "0110100001100101011011000110110001101111001000000111011101101111011100100110110001100100")
    public function testBase2(input:String, output:String) {
        var base = new Base2();

        asserts.assert( base.encode(Bytes.ofString(input)).toString() == output );
        asserts.assert( base.decode(Bytes.ofString(output)).toString() == input );

        return asserts.done();
    }

}