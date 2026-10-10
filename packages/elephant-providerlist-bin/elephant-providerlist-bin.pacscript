pkgname="elephant-providerlist-bin"
gives="elephant-providerlist"
pkgver="2.22.1"
pkgdesc="Dynamic listing of all loaded providers and menus for Elephant"
url="https://github.com/abenz1267/elephant"
bugs="https://github.com/abenz1267/elephant/issues"
maintainer=("dbrugan <dbrugan@protonmail.com>")
license=("GPL-3.0-or-later")
arch=("amd64")
pacdeps=("elephant-bin")
source=("https://github.com/abenz1267/elephant/releases/download/v${pkgver}/providerlist-linux-amd64.tar.gz")
sha256sums=("bafb807419f9cf38825935e15097aea10adc8678234468a7971543d3bba59862")

package() {
  install -Dm755 "${srcdir}/providerlist-linux-amd64.so" "${pkgdir}/usr/lib/elephant/providerlist-linux-amd64.so"
}
