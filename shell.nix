let
    moz_overlay = (import "/home/insipx/.config/nixpkgs/overlays/rust-overlay.nix");
    nixpkgs = import <nixpkgs> { overlays = [ moz_overlay ]; };
    unstable = import (fetchTarball "channel:nixos-unstable") {};
    ruststable = (nixpkgs.latest.rustChannels.stable.rust.override { extensions = [ "rust-src" "rust-analysis" "rustfmt-preview" ];});
in
with nixpkgs;
pkgs.mkShell {
    buildInputs = [
        ruststable
        unstable.rust-analyzer
        unstable.cargo-edit

        # Packages used in WM
        pkgs.st
        pkgs.dmenu
        unstable.nnn

        pkgs.which
        pkgs.zlib
        pkgs.gcc
        pkgs.pkg-config
        pkgs.glib
        pkgs.cairo
        pkgs.pango
        pkgs.python3
        pkgs.gstreamer
        pkgs.xorg.libX11
        pkgs.xorg.libxcb
        pkgs.xorg.xcbutilkeysyms
        pkgs.xorg.xcbutil
        pkgs.xorg.xmodmap
        pkgs.xcb-util-cursor
        pkgs.libxkbcommon
        pkgs.xorg.xorgserver
        pkgs.xorg.libXinerama
    ];
}
