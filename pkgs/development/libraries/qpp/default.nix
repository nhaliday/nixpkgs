{ stdenv, fetchurl, eigen }:

let
  version = "0.8.2";
in
stdenv.mkDerivation {
  name = "qpp";
  inherit version;

  src = fetchurl {
    url = "https://github.com/vsoftco/qpp/archive/v${version}.tar.gz";
    name = "qpp-${version}.tar.gz";
    sha256 = "247a798e03b2bf74ffa70b974ecf485a7dc7f4e21208448c16a195a77419bde7";
  };

  propagatedBuildInputs = [ eigen ];

  installPhase = ''
    mkdir $out
    cp -R include $out/include
  '';

  meta = with stdenv.lib; {
    description = "C++11 quantum computing library";
    license = licenses.gpl3Plus;
    homepage = "http://vsoftco.github.io/qpp/";
    platforms = platforms.unix;
    inherit version;
  };
}
