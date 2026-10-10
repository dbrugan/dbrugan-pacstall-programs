pkgname="elephant-files-bin"
gives="elephant-files"
pkgver="2.22.1"
pkgdesc="File browsing, preview, and operations for Elephant"
url="https://github.com/abenz1267/elephant"
bugs="https://github.com/abenz1267/elephant/issues"
maintainer=("dbrugan <dbrugan@protonmail.com>")
license=("GPL-3.0-or-later")
arch=("amd64")
pacdeps=("elephant-bin")
source=("https://github.com/abenz1267/elephant/releases/download/v${pkgver}/files-linux-amd64.tar.gz")
sha256sums=("1342d88da31610fdadb3c62445c033ca188a4bbcb17da992d1ef2ee0f23be9dc")

package() {
  install -Dm755 "${srcdir}/files-linux-amd64.so" "${pkgdir}/usr/lib/elephant/files-linux-amd64.so"
}
