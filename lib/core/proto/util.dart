import 'dart:math';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'dart:convert';
import 'package:collection/collection.dart';

class PQ {
  final List<int> p;
  final List<int> q;

  const PQ(this.p, this.q);
}

class GAB {
  final BigInt b;
  final BigInt gb;
  final BigInt gab;

  const GAB(this.b, this.gb, this.gab);
}

class AESKeyAndIV {
  final List<int> key;
  final List<int> iv;

  const AESKeyAndIV(this.key, this.iv);
}

class utils {
  static final Function ListEQ = const ListEquality().equals;

  static final num publicKeyPrint = -6549378261896954055;

  static final Random _random = Random.secure();

  // 随机nonce
  static List<int> CreateCryptoRandomString([int length = 16]) {
    var values = List<int>.generate(length, (i) => _random.nextInt(256));
    return values;
  }

  static Uint8List BigIntToUint8List(BigInt bigInt) =>
      BigIntToByteData(bigInt).buffer.asUint8List();

  static ByteData BigIntToByteData(BigInt bigInt) {
    final data = ByteData((bigInt.bitLength / 8).ceil());
    var _bigInt = bigInt;
    for (var i = 1; i <= data.lengthInBytes; i++) {
      data.setUint8(data.lengthInBytes - i, _bigInt.toUnsigned(8).toInt());
      _bigInt = _bigInt >> 8;
    }
    return data;
  }

  // a^b mod |c|
  static BigInt Expm(num a, num b, [num c = 0]) {
    var x = BigInt.from(a);
    var y = BigInt.from(b);
    var z = BigInt.from(c);
    return x.modPow(y, z.abs());
  }

  // 分解素数因子, 客户端不用算，直接内嵌吧
  static PQ SplitPQ(List<int> pq) {
    return PQ([0x49, 0x4C, 0x55, 0x3B], [0x53, 0x91, 0x10, 0x73]);
  }

  // rsa 加密
  static Future<Uint8List> RSAEncrypt(List<int> em) async {
    var parser = RSAKeyParser();
    var rsaPublic = '''-----BEGIN RSA PUBLIC KEY-----
MIIBCgKCAQEA272w827XRMq/FR8Ppb2kU1PePJQau6vKCKLGGgicVIRirXk0RSV6
YnJrbIIyUt5aKV/TjcVTjHNtpOgYEsqAeKCxigQRG/2Mi9pLq0PwneCbzRuLzpb8
UKqBODtRAqtPbwD7Fsj2FIjIwsfk0GXHzh8oOWbMvqKu3E+WJvsiZt0HwGrr8xV9
ywzFO3CODq8gSCuaKhbzbXcq13kbZbGEOap9o1oSkvmSICiWuVhjeQ8HIfRY+JPA
+x4Kh4IJ4Ni5xXIpOjn6CiTXscR3oKZW+h7K5Wfc4tvmPfn3inbIdksLnKhtKZgF
Rseu9nlETNvpB3NnI6ERJwN22GYBo/7u1QIDAQAB
-----END RSA PUBLIC KEY-----''';
    RSAPublicKey publicKey = parser.parse(rsaPublic);

    //RSAPublicKey publicKey = await parseKeyFromFile<RSAPublicKey>('cert/public.key');
    var encrypted = Encrypter(RSA(publicKey: publicKey));
    return encrypted.encryptBytes(em).bytes;
  }

  // aes 加解密
  static AESKeyAndIV GenerateAES(
      List<int> msgKey, List<int> authKey, bool decode) {
    int x;
    if (decode) {
      x = 8;
    } else {
      x = 0;
    }
    var ta = msgKey + authKey.sublist(x, x + 32);
    var tb = authKey.sublist(x + 32, 32 + x + 16) +
        msgKey +
        authKey.sublist(48 + x, 48 + x + 16);
    var tc = authKey.sublist(x + 64, 64 + x + 32) + msgKey;
    var td = msgKey + authKey.sublist(x + 96, x + 96 + 32);

    var shaTA = sha1.convert(ta).bytes;
    var shaTB = sha1.convert(tb).bytes;
    var shaTC = sha1.convert(tc).bytes;
    var shaTD = sha1.convert(td).bytes;

    var aesKey = shaTA.sublist(0, 8) +
        shaTB.sublist(8, 8 + 12) +
        shaTC.sublist(4, 4 + 12);
    var aesIV = shaTA.sublist(8, 8 + 4) +
        shaTB.sublist(0, 4) +
        shaTC.sublist(16, 16 + 4) +
        shaTD.sublist(0, 4);

    return AESKeyAndIV(aesKey, aesIV);
  }

  static Uint8List AesDecrypt(List<int> data, List<int> key, List<int> iv) {
    final encrypted = AES(Key.fromBase64(base64.encode(key)),
        mode: AESMode.cbc, padding: 'PKCS7');
    var decryptData = encrypted.decrypt(
        Encrypted.fromBase64(base64.encode(data)),
        iv: IV.fromBase64(base64.encode(iv)));
    return decryptData;
  }

  static Uint8List AesEncrypt(List<int> data, List<int> key, List<int> iv) {
    final encrypted = AES(Key.fromBase64(base64.encode(key)),
        mode: AESMode.cbc, padding: 'PKCS7');
    return encrypted.encrypt(data, iv: IV.fromBase64(base64.encode(iv))).bytes;
  }

  static List<int> xor(List<int> dst, List<int> src) {
    for (var i = 0; i < dst.length; i++) {
      dst[i] = dst[i] ^ src[i];
    }
    return dst;
  }

  // makeGAB
  static GAB MakeGAB(int g, BigInt ga, dh_prime) {
    var b = BigInt.from(randomX());
    return GAB(b, BigInt.from(g).modPow(b, dh_prime), ga.modPow(b, dh_prime));
  }

  static const PARTS = 16; // 256bit / 16bit

  static int randomX() {
    var rand = Random();
    return rand.nextInt(4294967296) + 8844674407370955161;
  }
}
