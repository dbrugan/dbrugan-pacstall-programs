pkgname="walker-bin"
gives="walker"
pkgver="2.17.2"
pkgdesc="Multi-purpose launcher for Wayland with a lot of features"
url="https://github.com/abenz1267/walker"
bugs="https://github.com/abenz1267/walker/issues"
maintainer=("dbrugan <dbrugan@protonmail.com>")
license=("GPL-3.0-or-later")
arch=("amd64")
repology=("walker")
depends=(
  "libgtk-4-1"
  "libgtk4-layer-shell0>=0.8"
  "libpoppler-glib8t64"
  "libcairo2"
  "libgdk-pixbuf-2.0-0"
)
source=(
  "https://github.com/abenz1267/walker/releases/download/v${pkgver}/walker-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
  "https://github.com/abenz1267/walker/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  "57e68d1f9f14782f1ae0f1c704509749a545a92531b8788b76b16bc29fcc5c19"
  "e50c606040b24f2a6045292f5f6a08c8a05ac599878ac781b1a5fcf50d353a56"
)

package() {
  install -Dm755 "${srcdir}/walker" "${pkgdir}/usr/bin/walker"

  install -Dm644 "${srcdir}/walker-${pkgver}/resources/config.toml" \
    "${pkgdir}/etc/xdg/walker/config.toml"
  mkdir -p "${pkgdir}/etc/xdg/walker/themes/default"
  install -m644 "${srcdir}/walker-${pkgver}"/resources/themes/default/* \
    "${pkgdir}/etc/xdg/walker/themes/default/"
}

post_install() {
  echo "walker installed. For providers, install elephant-bin (+ elephant-providerlist, elephant-desktopapplications) and run:  elephant service enable"
}
