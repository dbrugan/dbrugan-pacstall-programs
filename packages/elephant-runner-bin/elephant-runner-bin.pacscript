pkgname="elephant-runner-bin"
gives="elephant-runner"
pkgver="2.22.0"
pkgdesc="Command execution and PATH scanning for Elephant"
url="https://github.com/abenz1267/elephant"
bugs="https://github.com/abenz1267/elephant/issues"
maintainer=("dbrugan <dbrugan@protonmail.com>")
license=("GPL-3.0-or-later")
arch=("amd64")
depends=("elephant")
source=("https://github.com/abenz1267/elephant/releases/download/v${pkgver}/runner-linux-amd64.tar.gz")
sha256sums=("2d46ee6310b31265b8eca767b049f5d481396c10aa9e6090106ad5a45062929a")

package() {
  install -Dm755 "${srcdir}/runner-linux-amd64.so" "${pkgdir}/usr/lib/elephant/runner-linux-amd64.so"
}
