pkgname="elephant-providerlist-bin"
gives="elephant-providerlist"
pkgver="2.22.0"
pkgdesc="Dynamic listing of all loaded providers and menus for Elephant"
url="https://github.com/abenz1267/elephant"
bugs="https://github.com/abenz1267/elephant/issues"
maintainer=("dbrugan <dbrugan@protonmail.com>")
license=("GPL-3.0-or-later")
arch=("amd64")
depends=("elephant")
source=("https://github.com/abenz1267/elephant/releases/download/v${pkgver}/providerlist-linux-amd64.tar.gz")
sha256sums=("82f0de50e4e0e343cee1333e67b1f4ac372f44b94bc24390cd7ace5cce97f500")

package() {
  install -Dm755 "${srcdir}/providerlist-linux-amd64.so" "${pkgdir}/usr/lib/elephant/providerlist-linux-amd64.so"
}
