{ stdenv, fetchFromGitHub, nasm, perl, python, libuuid }:

stdenv.mkDerivation rec {
  name = "syslinux-2015-11-09";

  src = fetchFromGitHub {
    owner = "geneC";
    repo = "syslinux";
    rev = "0cc9a99e560a2f52bcf052fd85b1efae35ee812f";
    sha256 = "0wk3r5ki4lc334f9jpml07wpl8d0bnxi9h1l4h4fyf9a0d7n4kmw";
  };

  patches = [ ./perl-deps.patch ];

  nativeBuildInputs = [ nasm perl python ];
  buildInputs = [ libuuid ];

  enableParallelBuilding = false; # Fails very rarely with 'No rule to make target: ...'

  preBuild = ''
    substituteInPlace Makefile --replace /bin/pwd $(type -P pwd)
    substituteInPlace gpxe/src/Makefile.housekeeping --replace /bin/echo $(type -P echo)
    substituteInPlace utils/ppmtolss16 gpxe/src/Makefile --replace /usr/bin/perl $(type -P perl)
  '';

  stripDebugList = "bin sbin share/syslinux/com32";

  makeFlags = [
    "BINDIR=$(out)/bin"
    "SBINDIR=$(out)/sbin"
    "LIBDIR=$(out)/lib"
    "INCDIR=$(out)/include"
    "DATADIR=$(out)/share"
    "MANDIR=$(out)/share/man"
    "PERL=perl"
    "bios"
  ];

  meta = with stdenv.lib; {
    homepage = http://www.syslinux.org/;
    description = "A lightweight bootloader";
    license = licenses.gpl2;
    platforms = platforms.linux;
  };
}
