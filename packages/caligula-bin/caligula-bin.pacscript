pkgname="caligula-bin"
gives="caligula"
pkgver="0.5.0"
pkgdesc="A lightweight, user-friendly disk imaging tool"
url="https://github.com/ifd3f/caligula"
bugs="https://github.com/ifd3f/caligula/issues"
maintainer=("dbrugan <dbrugan@protonmail.com>")
license=("GPL-3.0-or-later")
arch=("amd64")
source=("https://github.com/ifd3f/caligula/releases/download/v${pkgver}/caligula-x86_64-linux")
sha256sums=("470da9381d2ac44bbd54485ac8c8afcc23fd2aecbce98cd1aba815d1ef5ed3ed")

package() {
  install -Dm755 "${srcdir}/caligula-x86_64-linux" "${pkgdir}/usr/bin/caligula"
}

post_install() {
  echo "Note: caligula may need root/sudo to write to disk devices."
}
