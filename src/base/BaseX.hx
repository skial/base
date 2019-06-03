package base;

import haxe.io.BytesBuffer;

using StringTools;
using haxe.io.Bytes;

class BaseX {

    @:isVar private var ALPHABET(default, set):String = '';
    private function set_ALPHABET(v:String):String {
        return ALPHABET = v;
    }

    private var BASE(get, never):Int;
    private inline function get_BASE() return ALPHABET.length;

    @:isVar private var LEADER(get, null):String;
    private function get_LEADER() {
        if (LEADER == null) LEADER = ALPHABET.charAt(0);
        return LEADER;
    }

    private var FACTOR(get, never):Float;
    private inline function get_FACTOR() return Math.log(BASE) / Math.log(256);

    private var iFACTOR(get, never):Float;
    private inline function get_iFACTOR() return Math.log(256) / Math.log(BASE);

    @:isVar private var BASEMAP(get, null):Bytes;
    private function get_BASEMAP():Bytes {
        if (BASEMAP == null) {
            BASEMAP = Bytes.alloc(256);
            BASEMAP.fill(0, 255, 255);
        }
        return BASEMAP;
    }

    public function new(alphabet:String) {
        ALPHABET = alphabet;
        if (ALPHABET.length >= 255) throw 'Alphabet is too long';

        @:keep BASEMAP;

        for (i in 0...ALPHABET.length) {
            var x = ALPHABET.charAt(i);
            var xc = x.fastCodeAt(0);

            if (BASEMAP.get(xc) != 255) throw '$x is duplicate';
            BASEMAP.set(xc, i);
        }
    }

    public function encode(source:Bytes):Bytes {
        if (source.length == 0) return source;

        var data = source.getData();

        var zeroes = 0;
        var length = 0;
        var pbegin = 0;
        var pend = source.length;
        
        while (pbegin != pend && data.fastGet(pbegin) == 0) {
            pbegin++;
            zeroes++;
        }

        // Allocate enough space in big-endian base58 representation.
        var size = Math.floor((pend - pbegin) * iFACTOR + 1);
        var b58 = Bytes.alloc(size);
        
        // Process the bytes.
        while (pbegin != pend) {
            var carry = data.fastGet(pbegin);
            // Apply "b58 = b58 * 256 + ch".
            var i = 0;
            var it = size - 1;
            while ((carry != 0 || i < length) && (it != -1)) {
                carry += (256 * b58.get(it));
                b58.set(it, carry % BASE);
                carry = Math.floor(carry / BASE);
                it--;
                i++;
            }

            if (carry != 0) throw 'Non-zero carry';
            length = i;
            pbegin++;
        }
        

        // Skip leading zeroes in base58 result.
        var it = size - length;
        
        while (it != size && b58.get(it) == 0) {
            it++;
        }
        

        // Translate the result into bytes.
        var str = new BytesBuffer();
        var leaderCode = LEADER.fastCodeAt(0);
        
        for (_ in 0...zeroes) str.addByte(leaderCode);

        while (it < size) {
            
            str.addByte( ALPHABET.fastCodeAt(b58.get(it)) );
            ++it;
        }

        return str.getBytes();
    }

    public function decodeUnsafe(source:Bytes):Bytes {
        var EMPTY = Bytes.alloc(0);
        if (source.length == 0) return EMPTY;
        var data = source.getData();

        var psz = 0;

        // Skip leading spaces.
        if (source.get(psz) == ' '.code) return EMPTY;

        // Skip and count leading `1`s.
        var zeroes = 0;
        var length = 0;
        var leaderCode = LEADER.charCodeAt(0);

        while (psz < source.length && data.fastGet(psz) == leaderCode) {
            zeroes++;
            psz++;
        }

        // Allocate enough space in big-endian base256 representation.
        var size = Math.floor(((source.length - psz) * FACTOR) + 1); // log(58) / log(256), rounded up.
        var b256 = Bytes.alloc(size);

        // Process the characters.
        while (psz < source.length) {
            // Decode character.
            var carry = BASEMAP.get(data.fastGet(psz));

            if (carry == 255) break;

            var i = 0;
            var it = size - 1;

            while ((carry != 0 || i < length) && it != -1) {
                carry += (BASE * b256.get(it)) >>> 0;
                b256.set(it, (carry % 256) >>> 0);
                carry = Math.floor(carry / 256);
                it--;
                i++;
            }

            if (carry != 0) throw 'Non-zero carry.';
            length = i;
            psz++;
        }

        // Skip trailing spaces.
        if (psz < source.length && data.fastGet(psz) == ' '.code) return EMPTY;

        // Skip leading zeroes in b256.
        var it = size - length;
        while (it != size && b256.get(it) == 0) {
            it++;
        }

        var vch = Bytes.alloc(zeroes + (size - it));
        vch.fill(0, zeroes, 0);

        var j = zeroes;
        while (it != size) {
            vch.set( j++, b256.get(it++) );
        }

        return vch;
    }

    public function decode(string:Bytes) {
        var bytes = decodeUnsafe(string);
        if (bytes.length != 0) return bytes;

        throw 'Non-base $BASE character';
    }

}