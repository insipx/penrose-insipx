with import <nixpkgs> { };

rustPlatform.buildRustPackage rec {
  name = "penrose-${version}";
  version = "0.1.0";
  src = ./.;
  buildInputs = [ openssl pkgconfig  zlib gcc glib cairo pango python3
                  gstreamer xorg.libX11 xorg.libxcb xorg.xcbutilkeysyms
                  xorg.xcbutil xorg.xmodmap xcb-util-cursor libxkbcommon
                  xorg.xorgserver ];
  checkPhase = "";
  cargoSha256 = "sha256:04zbnvwsdfjaqijvm2g84xpfb56sqmv9727fa4h6x75sixlyfs9h";

  meta = with stdenv.lib; {
    description = "Insipx's Penrose WM";
    homepage = https://github.com/insipx/penrose-insipx;
    license = licenses.mit;
    maintainers = [ "dev@andrewplaza.dev" ];
    platforms = platforms.linux;
  };
}
