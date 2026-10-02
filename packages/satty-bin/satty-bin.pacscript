pkgname="satty-bin"
gives="satty"
pkgver="0.22.0"
pkgrel="1"
pkgdesc="Modern screenshot annotation tool, inspired by Swappy and Flameshot"
url="https://github.com/Satty-org/Satty"
bugs="https://github.com/Satty-org/Satty/issues"
arch=("amd64")
license=("MPL-2.0")
depends=(
  "libgtk-4-1"
  "libadwaita-1-0"
  "libgdk-pixbuf-2.0-0"
  "libpango-1.0-0"
  "libglib2.0-0t64"
  "fontconfig"
  "hicolor-icon-theme"
)
repology=("project: satty")
maintainer=("dbrugan <dbrugan@protonmail.com>")
source=("satty-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/satty-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=("eb7a028c4a5ce331c2f355add8e2b807a7d697fe4495f7e1965786a4f6bcd5b8")

package() {
  install -Dm755 "${srcdir}/satty" "${pkgdir}/usr/bin/satty"
  install -Dm644 "${srcdir}/satty.desktop" \
    "${pkgdir}/usr/share/applications/satty.desktop"

  install -Dm644 "${srcdir}/assets/satty.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/satty.svg"

  install -Dm644 "${srcdir}/man/satty.1" \
    "${pkgdir}/usr/share/man/man1/satty.1"

  install -Dm644 "${srcdir}/completions/satty.bash" \
    "${pkgdir}/usr/share/bash-completion/completions/satty"
  install -Dm644 "${srcdir}/completions/_satty" \
    "${pkgdir}/usr/share/zsh/site-functions/_satty"
  install -Dm644 "${srcdir}/completions/satty.fish" \
    "${pkgdir}/usr/share/fish/vendor_completions.d/satty.fish"
  install -Dm644 "${srcdir}/completions/satty.nu" \
    "${pkgdir}/usr/share/nushell/completions/satty.nu"
  install -Dm644 "${srcdir}/completions/satty.elv" \
    "${pkgdir}/usr/share/elvish/lib/satty.elv"

  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
