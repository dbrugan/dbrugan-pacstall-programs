pkgname="walker-bin"
gives="walker"
pkgver="2.17.0"
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
  "eab433ca0f81b4fd2ab611bb00833c5b33df4c883475c763bb1d7337eb0908fb"
  "c3498742a9866422b2947340a515eeb7932333bb8f99b171d159c0a7ece0a12f"
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
