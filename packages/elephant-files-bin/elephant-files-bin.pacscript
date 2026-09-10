pkgname="elephant-files-bin"
gives="elephant-files"
pkgver="2.22.0"
pkgdesc="File browsing, preview, and operations for Elephant"
url="https://github.com/abenz1267/elephant"
bugs="https://github.com/abenz1267/elephant/issues"
maintainer=("dbrugan <dbrugan@protonmail.com>")
license=("GPL-3.0-or-later")
arch=("amd64")
depends=("elephant")
source=("https://github.com/abenz1267/elephant/releases/download/v${pkgver}/files-linux-amd64.tar.gz")
sha256sums=("cb25ec2349697ea2280cfc3ad39c106473a57929a5967a68466162c42f66a3a9")

package() {
  install -Dm755 "${srcdir}/files-linux-amd64.so" "${pkgdir}/usr/lib/elephant/files-linux-amd64.so"
}
