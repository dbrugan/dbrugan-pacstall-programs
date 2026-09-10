pkgname="elephant-clipboard-bin"
gives="elephant-clipboard"
pkgver="2.22.0"
pkgdesc="Clipboard history and management for Elephant"
url="https://github.com/abenz1267/elephant"
bugs="https://github.com/abenz1267/elephant/issues"
maintainer=("dbrugan <dbrugan@protonmail.com>")
license=("GPL-3.0-or-later")
arch=("amd64")
depends=("elephant")
source=("https://github.com/abenz1267/elephant/releases/download/v${pkgver}/clipboard-linux-amd64.tar.gz")
sha256sums=("9af4030af240339b8027143d50f178350c2734c0167062e1ed8aeaf051f3e722")

package() {
  install -Dm755 "${srcdir}/clipboard-linux-amd64.so" "${pkgdir}/usr/lib/elephant/clipboard-linux-amd64.so"
}
