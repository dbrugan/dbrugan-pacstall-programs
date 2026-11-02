pkgname="reapack"
pkgver="1.2.6"
pkgrel="1"
pkgdesc="Package manager for the REAPER digital audio workstation"
url="https://reapack.com"
arch=("amd64")
license=("LGPL-3.0-or-later")
maintainer=("dbrugan <dbrugan@protonmail.com>")
repology=("reapack")
depends=(
  "reaper"
  "libcurl4"
  "libgcc-s1"
  "libstdc++6"
  "libssl3t64"
  "libxml2"
  "zlib1g"
)
source=("https://github.com/cfillion/reapack/releases/download/v${pkgver}/reaper_reapack-x86_64.so")
sha256sums=("35d80f63d8174c964af589c7d87c4728aa18f06899dce873e33f8d552d1bc7e0")

package() {
  install -Dm644 "${srcdir}/reaper_reapack-x86_64.so" \
    "${pkgdir}/opt/REAPER/UserPlugins/reaper_reapack-x86_64.so"
}

post_install() {
  echo "ReaPack installed to /opt/REAPER/UserPlugins/. Restart REAPER to load it."
}
