# base
> A collection of various base encodings.

### Overview
| Base  | padding | zero compression | lower case |
|- |- |- |-
| 2 | ❌ | ✔ | ❌ |
| 8 | ❌ | ✔ | ❌ |
| 10| ❌ | ✔ | ❌ |
| 16| ❌ | ❌| ✔  |
| 32| ✔  | ❌| ✔  |
| 58| ❌ | ✔ | ❌ |
| 64| ✔  | ❌| ❌ |

### Included Alternatives
- Base2
    + Base2ZC: Supports Bitcoin style zero compression.
- Base16: Uppercase by default.
    + Base16Lower: Lowercase character set.
- Base32: Uppercase by default. Padding by default.
    + Base32Lower: Lowercase character set.
    + Base32Hex: See [en.wikipedia.org](https://en.wikipedia.org/wiki/Base32#base32hex) for further info.
    + Base32HexLower: Lowercase hex character set.
    + ZBase32: See [en.wikipedia.org](https://en.wikipedia.org/wiki/Base32#z-base-32) for further info.
- Base58: Uses Bitcoin character set by default.
    + Base58Flickr: Uses Flickrs character set.
- Base64: Uppercase by default. Padding by default.
    + Base64Url: Url safe.

### Included Alphabets

```Haxe
enum abstract Alphabet {
  public var BASE2 = '01';
  public var BASE8 = '01234567';
  public var BASE10 = '0123456789';
  public var BASE16 = '0123456789ABCDEF';
  public var BASE16_Lower = '0123456789abcdef';
  public var BASE32 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567';
  public var BASE32_Lower = 'abcdefghijklmnopqrstuvwxyz234567';
  public var BASE32_Hex = '0123456789ABCDEFGHIJKLMNOPQRSTUV';
  public var BASE32_Z = 'ybndrfg8ejkmcpqxot1uwisza345h769';
  public var BASE58 = '123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz';
  public var BASE58_Flickr = '123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ';
  public var BASE64 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
  public var BASE64_Url = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_';
}
```

### Notes

The class [`base.BaseX`](https://github.com/skial/base/blob/master/src/base/BaseX.hx) is ported from [`cryptocoinjs/base-x`](https://github.com/cryptocoinjs/base-x) with the [`MIT`](https://github.com/cryptocoinjs/base-x#license-mit) license.