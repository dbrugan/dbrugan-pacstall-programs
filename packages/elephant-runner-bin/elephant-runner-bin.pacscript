pkgname="elephant-runner-bin"
gives="elephant-runner"
pkgver="2.22.1"
pkgdesc="Command execution and PATH scanning for Elephant"
url="https://github.com/abenz1267/elephant"
bugs="https://github.com/abenz1267/elephant/issues"
maintainer=("dbrugan <dbrugan@protonmail.com>")
license=("GPL-3.0-or-later")
arch=("amd64")
depends=("elephant")
source=("https://github.com/abenz1267/elephant/releases/download/v${pkgver}/runner-linux-amd64.tar.gz")
sha256sums=("0a6ff0435b62b5c804a55cc2cd7af9ea846f412eeec62277212b7f14a6fc15ca")

package() {
  install -Dm755 "${srcdir}/runner-linux-amd64.so" "${pkgdir}/usr/lib/elephant/runner-linux-amd64.so"
}
