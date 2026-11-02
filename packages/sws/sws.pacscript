pkgname="sws"
pkgver="2.14.0.7"
pkgrel="1"
pkgdesc="SWS/S&M extension collection for the REAPER digital audio workstation"
url="https://sws-extension.org"
arch=("amd64")
license=("MIT")
maintainer=("dbrugan <dbrugan@protonmail.com>")
repology=("sws")
depends=(
  "libgcc-s1"
  "libstdc++6"
)
source=("https://github.com/reaper-oss/sws/releases/download/v${pkgver}/reaper_sws-x86_64.so")
sha256sums=("4cf0629aeeff346c1ed9a355ce826febfacf9775bd6f49f09b1b4f9f053b8644")

package() {
  install -Dm644 "${srcdir}/reaper_sws-x86_64.so" \
    "${pkgdir}/opt/REAPER/UserPlugins/reaper_sws-x86_64.so"
}

post_install() {
  echo "SWS/S&M installed to /opt/REAPER/UserPlugins/. Restart REAPER to load it."
}
