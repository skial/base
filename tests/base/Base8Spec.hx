package base;

import haxe.io.Bytes;

@:asserts 
class Base8Spec {

    var base8 = new Base8();

    public function new() {}

    @:variant("hello world", "150145154154157040167157162154144")
    @:variant("Decentralize everything!!!", "104145143145156164162141154151172145040145166145162171164150151156147041041041")
    public function testBase8(input:String, output:String) {
        asserts.assert( base8.encode( Bytes.ofString(input) ).toString() == output );
        asserts.assert( base8.decode( Bytes.ofString(output) ).toString() == input );
        return asserts.done();
    }

}