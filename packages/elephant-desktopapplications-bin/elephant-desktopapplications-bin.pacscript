pkgname="elephant-desktopapplications-bin"
gives="elephant-desktopapplications"
pkgver="2.22.0"
pkgdesc="Desktop application detection and launching for Elephant"
url="https://github.com/abenz1267/elephant"
bugs="https://github.com/abenz1267/elephant/issues"
maintainer=("dbrugan <dbrugan@protonmail.com>")
license=("GPL-3.0-or-later")
arch=("amd64")
depends=("elephant")
source=("https://github.com/abenz1267/elephant/releases/download/v${pkgver}/desktopapplications-linux-amd64.tar.gz")
sha256sums=("c5e527d2538b60b51297d9fe3cb0ce0867db89dce264464be278a4896658eb54")

package() {
  install -Dm755 "${srcdir}/desktopapplications-linux-amd64.so" "${pkgdir}/usr/lib/elephant/desktopapplications-linux-amd64.so"
}
