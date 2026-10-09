pkgname="elephant-clipboard-bin"
gives="elephant-clipboard"
pkgver="2.22.1"
pkgdesc="Clipboard history and management for Elephant"
url="https://github.com/abenz1267/elephant"
bugs="https://github.com/abenz1267/elephant/issues"
maintainer=("dbrugan <dbrugan@protonmail.com>")
license=("GPL-3.0-or-later")
arch=("amd64")
depends=("elephant")
source=("https://github.com/abenz1267/elephant/releases/download/v${pkgver}/clipboard-linux-amd64.tar.gz")
sha256sums=("775a7bca91493fffce27f33f65b91c0a92b96b51a3cb3fe0e99143ff0f18e099")

package() {
  install -Dm755 "${srcdir}/clipboard-linux-amd64.so" "${pkgdir}/usr/lib/elephant/clipboard-linux-amd64.so"
}
