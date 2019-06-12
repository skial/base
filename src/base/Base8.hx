package base;

import haxe.io.Bytes;

class Base8 {

    public function new() {}

    public function encode(bytes:Bytes):Bytes {
        var data = bytes.getData();
        var out = Bytes.alloc(bytes.length*3);
        out.fill(0, out.length, '0'.code);
        var pos = 0;

        for (i in 0...bytes.length) {
            var code = Bytes.fastGet(data, i);
            // find largest power in `code`.
            var idx = 1;
            var pow = 8;
            while (true) {
                var tmp = pow * 8;
                if (tmp > code) break;
                pow = tmp;
                idx++;
            }
            // base10 to base8
            toOctal(code, pow, idx, out, pos);
            pos += 3;
        }
        
        return out;
    }

    /*private static function largestPower(b:Int, p:Int):{l:Int, e:Int} {
        if (b < p) return {l:0, e:0};
        var idx = 1;
        var n = p;
        while (true) {
            var i = n * p;
            if (i > b) break;
            n = i;
            idx++;
        }
        return {l:n, e:idx};
    }*/

    // @see https://en.wikipedia.org/wiki/Octal
    public static function toOctal(value:Int, power:Int, exponent:Int, bytes:Bytes, pos:Int) {
        //var bytes = Bytes.alloc(3);
        var quotient:Int = 0;
        var remainder:Int = 0;

        while (exponent > 0/* && value > 0 && power > 0*/) {
            quotient = Math.floor(value / power);
            remainder = value % power;
            bytes.set( pos + /*(bytes.length-1)*/(2-exponent), (exponent > 0 ? quotient : remainder) + '0'.code );
            
            if (exponent-1 <= 0/* && remainder > 0*/) {
                bytes.set( pos + /*(bytes.length-1)*/2, remainder + '0'.code);
                break;
            }

            power = Math.round(Math.pow(8, exponent-1));
            exponent--;
            value = remainder;
        }

    }

    public function decode(bytes:Bytes):Bytes {
        var idk = 0;
        var pos = 0;
        var data = bytes.getData();
        var output = Bytes.alloc(Math.round(bytes.length / 3));

        while (idk <= bytes.length-1 && pos <= output.length-1) {
            var a = Bytes.fastGet(data, idk++) - '0'.code;
            var b = Bytes.fastGet(data, idk++) - '0'.code;
            var c = Bytes.fastGet(data, idk++) - '0'.code;

            // a * (8 * 8);
            // b * (8)
            // c * (1)
            output.set(pos++, a * 64 + b * 8 + c);
        }
        
        return output;
    }

}