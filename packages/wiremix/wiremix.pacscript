pkgname="wiremix"
pkgver="0.11.0"
pkgrel="1"
pkgdesc="Simple TUI audio mixer for PipeWire"
url="https://github.com/tsowell/wiremix"
maintainer=("dbrugan <dbrugan@protonmail.com>")
arch=("amd64")
license=("MIT" "Apache-2.0")
depends=("libpipewire-0.3-0t64")
makedepends=("cargo" "libpipewire-0.3-dev" "pkg-config" "clang")
source=("https://github.com/tsowell/wiremix/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("62a7cace79c9af537e0917a6d4e5da66b2efe2b4abc5f08c0fbaed727acc8c9f")
external_connection=true

build() {
  cd "wiremix-${pkgver}"
  cargo build --release
}

package() {
  cd "wiremix-${pkgver}"
  install -Dm755 target/release/wiremix "${pkgdir}/usr/bin/wiremix"
  install -Dm644 wiremix.desktop "${pkgdir}/usr/share/applications/wiremix.desktop"
}
