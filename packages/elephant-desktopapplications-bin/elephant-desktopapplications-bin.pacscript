pkgname="elephant-desktopapplications-bin"
gives="elephant-desktopapplications"
pkgver="2.22.1"
pkgdesc="Desktop application detection and launching for Elephant"
url="https://github.com/abenz1267/elephant"
bugs="https://github.com/abenz1267/elephant/issues"
maintainer=("dbrugan <dbrugan@protonmail.com>")
license=("GPL-3.0-or-later")
arch=("amd64")
pacdeps=("elephant-bin")
source=("https://github.com/abenz1267/elephant/releases/download/v${pkgver}/desktopapplications-linux-amd64.tar.gz")
sha256sums=("a185897cae065c036a2b2a5beac08201e0a233ad51587b9a553428434225c75a")

package() {
  install -Dm755 "${srcdir}/desktopapplications-linux-amd64.so" "${pkgdir}/usr/lib/elephant/desktopapplications-linux-amd64.so"
}
