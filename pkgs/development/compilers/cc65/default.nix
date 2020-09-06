{ fetchurl, stdenv, gcc }:

stdenv.mkDerivation rec {
  version = "2.18";
  name = "cc65-${version}";

  buildInputs = [ gcc ];
  src = fetchurl {
    url = "https://github.com/cc65/cc65/archive/V${version}.tar.gz";
    sha256 = "1azals9q5whj4lgl4cr4rv31jyriblnkdmc3ib6vxg67hzxj4jni";
  };

  phases = [ "unpackPhase" "buildPhase" "installPhase" ];
  installPhase = "make install PREFIX=$out";

  meta = with stdenv.lib; {
    homepage = https://cc65.github.io/;
    description = "A cross development package for 65(C)02 systems";
    license = licenses.zlib;

    maintainers = with maintainers; [ treed ];
    platforms = platforms.unix;
  };
}
