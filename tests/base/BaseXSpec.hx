package base;

import haxe.io.Bytes;

@:asserts
class BaseXSpec {

    /**
        The BaseX implementation uses bitcoin style leading zero compression.
    **/

    public function new() {}

    @:variant("", "")
    @:variant("61", "2g")
    @:variant("626262", "a3gV")
    @:variant("636363", "aPEr")
    @:variant("73696d706c792061206c6f6e6720737472696e67", "2cFupjhnEsSn59qHXstmK2ffpLv2")
    @:variant("00eb15231dfceb60925886b67d065299925915aeb172c06647", "1NS17iag9jJgTHD1VXjvLCEnZuQ3rJDE9L")
    @:variant("516b6fcd0f", "ABnLTmg")
    @:variant("bf4f89001e670274dd", "3SEo3LWLoPntC")
    @:variant("572e4794", "3EFU7m")
    @:variant("ecac89cad93923c02321", "EJDM8drfXA6uyA")
    @:variant("10c8511e", "Rt5zm")
    @:variant("00000000000000000000", "1111111111")
    @:variant("801184cd2cdd640ca42cfc3a091c51d549b2f016d454b2774019c2b2d2e08529fd206ec97e", "5Hx15HFGyep2CfPxsJKe2fXJsCVn5DEiyoeGGF6JZjGbTRnqfiD")
    @:variant("003c176e659bea0f29a3e9bf7880c112b1b31b4dc826268187", "16UjcYNBG9GTK4uq2f7yYEbuifqCzoLMGS")
    @:variant("ffffffffffffffffffff", "FPBt6CHo3fovdL")
    @:variant("ffffffffffffffffffffffffff", "NKioeUVktgzXLJ1B3t")
    @:variant("ffffffffffffffffffffffffffffffff", "YcVfxkQb6JRzqk5kF2tNLv")
    @:variant("ef41b9ce7e830af7", "h26E62FyLQN")
    @:variant("606cbc791036d2e9", "H8Sa62HVULG")
    @:variant("bdcb0ea69c2c8ec8", "YkESUPpnfoD")
    @:variant("1a2358ba67fb71d5", "5NaBN89ajtQ")
    @:variant("e6173f0f4d5fb5d7", "fVAoezT1ZkS")
    @:variant("91c81cbfdd58bbd2", "RPGNSU3bqTX")
    @:variant("329e0bf0e388dbfe", "9U41ZkwwysT")
    @:variant("30b10393210fa65b", "99NMW3WHjjY")
    @:variant("ab3bdd18e3623654", "VeBbqBb4rCT")
    @:variant("fe29d1751ec4af8a", "jWhmYLN9dUm")
    @:variant("c1273ab5488769807d", "3Tbh4kL3WKW6g")
    @:variant("6c7907904de934f852", "2P5jNYhfpTJxy")
    @:variant("05f0be055db47a0dc9", "5PN768Kr5oEp")
    @:variant("3511e6206829b35b12", "gBREojGaJ6DF")
    @:variant("d1c7c2ddc4a459d503", "3fsekq5Esq2KC")
    @:variant("1f88efd17ab073e9a1", "QHJbmW9ZY7jn")
    @:variant("0f45dadf4e64c5d5c2", "CGyVUMmCKLRf")
    @:variant("de1e5c5f718bb7fafa", "3pyy8U7w3KUa5")
    @:variant("123190b93e9a49a46c", "ES3DeFrG1zbd")
    @:variant("8bee94a543e7242e5a", "2nJnuWyLpGf6y")
    @:variant("9fd5f2285362f5cfd834", "9yqFhqeewcW3pF")
    @:variant("6987bac63ad23828bb31", "6vskE5Y1LhS3U4")
    @:variant("19d4a0f9d459cc2a08b0", "2TAsHPuaLhh5Aw")
    @:variant("a1e47ffdbea5a807ab26", "A6XzPgSUJDf1W5")
    @:variant("35c231e5b3a86a9b83db", "42B8reRwPAAoAa")
    @:variant("b2351012a48b8347c351", "B1hPyomGx4Vhqa")
    @:variant("71d402694dd9517ea653", "7Pv2SyAQx2Upu8")
    @:variant("55227c0ec7955c2bd6e8", "5nR64BkskyjHMq")
    @:variant("17b3d8ee7907c1be34df", "2LEg7TxosoxTGS")
    @:variant("7e7bba7b68bb8e95827f", "879o2ATGnmYyAW")
    @:variant("db9c13f5ba7654b01407fb", "wTYfxjDVbiks874")
    @:variant("6186449d20f5fd1e6c4393", "RBeiWhzZNL6VtMG")
    @:variant("5248751cebf4ad1c1a83c3", "MQSVNnc8ehFCqtW")
    @:variant("32090ef18cd479fc376a74", "DQdu351ExDaeYeX")
    @:variant("7cfa5d6ed1e467d986c426", "XzW67T5qfEnFcaZ")
    @:variant("9d8707723c7ede51103b6d", "g4eTCg6QJnB1UU4")
    @:variant("6f4d1e392d6a9b4ed8b223", "Ubo7kZY5aDpAJp2")
    @:variant("38057d98797cd39f80a0c9", "EtjQ2feamJvuqse")
    @:variant("de7e59903177e20880e915", "xB2N7yRBnDYEoT2")
    @:variant("b2ea24a28bc4a60b5c4b8d", "mNFMpJ2P3TGYqhv")
    @:variant("cf84938958589b6ffba6114d", "4v8ZbsGh2ePz5sipt")
    @:variant("dee13be7b8d8a08c94a3c02a", "5CwmE9jQqwtHkTF45")
    @:variant("14cb9c6b3f8cd2e02710f569", "Pm85JHVAAdeUdxtp")
    @:variant("ca3f2d558266bdcc44c79cb5", "4pMwomBAQHuUnoLUC")
    @:variant("c031215be44cbad745f38982", "4dMeTrcxiVw9RWvj3")
    @:variant("1435ab1dbc403111946270a5", "P7wX3sCWNrbqhBEC")
    @:variant("d8c6e4d775e7a66a0d0f9f41", "56GLoRDGWGuGJJwPN")
    @:variant("dcee35e74f0fd74176fce2f4", "5Ap1zyuYiJJFwWcMR")
    @:variant("bfcc0ca4b4855d1cf8993fc0", "4cvafQW4PEhARKv9D")
    @:variant("e02a3ac25ece7b54584b670a", "5EMM28xkpxZ1kkVUM")
    @:variant("fe4d938fc3719f064cabb4bfff", "NBXKkbHwrAsiWTLAk6")
    @:variant("9289cb4f6b15c57e6086b87ea5", "DCvDpjEXEbHjZqskKv")
    @:variant("fc266f35626b3612bfe978537b", "N186PVoBWrNre35BGE")
    @:variant("33ff08c06d92502bf258c07166", "5LC4SoW6jmTtbkbePw")
    @:variant("6a81cac1f3666bc59dc67b1c3c", "9sXgUySUzwiqDU5WHy")
    @:variant("9dfb8e7e744c544c0f323ea729", "EACsmGmkgcwsrPFzLg")
    @:variant("1e7a1e284f70838b38442b682b", "3YEVk9bE7rw5qExMkv")
    @:variant("2a862ad57901a8235f5dc74eaf", "4YS259nuTLfeXa5Wuc")
    @:variant("74c82096baef21f9d3089e5462", "AjAcKEhUfrqm8smvM7")
    @:variant("7a3edbc23d7b600263920261cc", "BBZXyRgey5S5DDZkcK")
    @:variant("20435664c357d25a9c8df751cf4f", "CrwNL6Fbv4pbRx1zd9g")
    @:variant("51a7aa87cf5cb1c12d045ec3422d", "X27NHGgKXmGzzQvDtpC")
    @:variant("344d2e116aa26f1062a2cb6ebbef", "LEDLDvL1Hg4qt1efVXt")
    @:variant("6941add7be4c0b5c7163e4928f8e", "fhMyN6gwoxE3uYraVzV")
    @:variant("10938fcbb7c4ab991649734a14bf", "76TPrSDxzGQfSzMu974")
    @:variant("eafe04d944ba504e9af9117b07de", "2VPgov563ryfe4L2Bj6M")
    @:variant("58d0aeed4d35da20b6f052127edf", "ZenZhXF9YwP8nQvNtNz")
    @:variant("d734984e2f5aecf25f7a3e353f8a", "2N7n3jFsTdyN49Faoq6h")
    @:variant("57d873fdb405b7daf4bafa62068a", "ZJ7NwoP4wHvwyZg3Wjs")
    @:variant("bda4ec7b40d0d65ca95dec4c4d3b", "2CijxjsNyvqTwPCfDcpA")
    @:variant("826c4abdceb1b91f0d4ad665f86d2e", "4edfvuDQu9KzVxLuXHfMo")
    @:variant("e7ecb35d07e65b960cb10574a4f51a", "7VLRYdB4cToipp2J2p3v9")
    @:variant("4f2d72ead87b31d6869fba39eac6dc", "3DUjqJRcfdWhpsrLrGcQs")
    @:variant("8b4f5788d60030950d5dfbf94c585d", "4u44JSRH5jP5X39YhPsmE")
    @:variant("ee4c0a0025d1a74ace9fe349355cc5", "7fgACjABRQUGUEpN6VBBA")
    @:variant("58ac05b9a0b4b66083ff1d489b8d84", "3UtJPyTwGXapcxHx8Rom5")
    @:variant("1aa35c05e1132e8e049aafaef035d8", "kE2eSU7gM2619pT82iGP")
    @:variant("771b0c28608484562a292e5d5d2b30", "4LGYeWhyfrjUByibUqdVR")
    @:variant("78ff9a0e56f9e88dc1cd654b40d019", "4PLggs66qAdbmZgkaPihe")
    @:variant("6d691bdd736346aa5a0a95b373b2ab", "44Y6qTgSvRMkdqpQ5ufkN")
    public function testBase58_hex(input:String, output:String) {
        return testBaseX_hex("123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz", input, output, asserts);
    }

    @:variant("0000000f", "000f")
    @:variant("000fff", "0fff")
    @:variant("ffff", "ffff")
    public function testBase16_hex(input:String, output:String) {
        return testBaseX_hex("0123456789abcdef", input, output, asserts);
    }

    @:variant("000f", "01111")
    @:variant("00ff", "011111111")
    @:variant("0fff", "111111111111")
    @:variant("ff00ff00", "11111111000000001111111100000000")
    @:variant("fb6f9ac3", "11111011011011111001101011000011")
    @:variant("179eea7a", "10111100111101110101001111010")
    @:variant("6db825db", "1101101101110000010010111011011")
    @:variant("93976aa7", "10010011100101110110101010100111")
    public function testBase2_hex(input:String, output:String) {
        return testBaseX_hex("01", input, output, asserts);
    }

    @:exclude public function testBaseX_hex(alphabet:String, hex:String, output:String) {
        var basex = new BaseX(alphabet);

        asserts.assert( basex.encode( Bytes.ofHex(hex) ).toString() == output );
        asserts.assert( basex.decodeUnsafe( Bytes.ofString(output) ).toHex() == hex );

        return asserts.done();
    }

    @:variant("hello world", "StV1DL6CwTryKyV")
    public function testBase58(input, output) {
        return testBaseX("123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz", input, output, asserts);
    }

    @:variant("h", "1101000")
    @:variant("Decentralize everything!!", "1000100011001010110001101100101011011100111010001110010011000010110110001101001011110100110010100100000011001010111011001100101011100100111100101110100011010000110100101101110011001110010000100100001")
    @:variant("yes mani !", "1111001011001010111001100100000011011010110000101101110011010010010000000100001")
    @:variant("hello world", "110100001100101011011000110110001101111001000000111011101101111011100100110110001100100")
    public function testBase2(input:String, output:String) {
        #if (nodejs && basexjs)
        var x = new BaseXJS("01");
        trace( x.encode(new js.node.buffer.Buffer(input)), output );
        //trace( x.encode(js.node.buffer.Buffer.hxFromBytes(Bytes.ofString(input))), output );
        #end
        return testBaseX("01", input, output, asserts);
    }

    @:variant("h", "150")
    @:variant("hello world", "64145330661571007355734466144")
    public function testBase8(input:String, output:String) {
        #if (nodejs && basexjs)
        var x = new BaseXJS("01234567");
        trace( x.encode(new js.node.buffer.Buffer(input)), output );
        #end
        return testBaseX("01234567", input, output, asserts);
    }

    @:exclude public function testBaseX(alphabet:String, input:String, output:String) {
        var basex = new BaseX(alphabet);
        var inputBytes = Bytes.ofString(input);
        var outputBytes = Bytes.ofString(output);
        var encoded = basex.encode( inputBytes );
        var decoded = basex.decode( outputBytes );

        asserts.assert( encoded.length == outputBytes.length );
        asserts.assert( encoded.toString() == output );
        asserts.assert( decoded.toString() == input );

        return asserts.done();
    }

}
#if (nodejs && basexjs)
@:jsRequire('./basex.js')
extern class BaseXJS {

    @:selfCall public function new(base:String);
    public function decode(v:String):js.node.buffer.Buffer;
    public function encode(v:js.node.buffer.Buffer):String;

}

#end