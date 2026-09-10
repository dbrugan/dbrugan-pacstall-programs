pkgname="elephant-bin"
gives="elephant"
pkgver="2.22.0"
pkgdesc="Powerful data provider service and backend for building custom application launchers and desktop utilities"
url="https://github.com/abenz1267/elephant"
bugs="https://github.com/abenz1267/elephant/issues"
maintainer=("dbrugan <dbrugan@protonmail.com>")
license=("GPL-3.0-or-later")
arch=("amd64")
repology=("elephant")
source=("https://github.com/abenz1267/elephant/releases/download/v${pkgver}/elephant-linux-amd64.tar.gz")
sha256sums=("4370562d65ae23eb3398e0b80ad429e7049197e17647e8c7526c709b89df8340")

package() {
  install -Dm755 "${srcdir}/elephant-linux-amd64" "${pkgdir}/usr/bin/elephant"
}

post_install() {
  echo "Elephant installed. As your user, run:  elephant service enable"
  echo "For providers, install the matching elephant-<provider> deb(s)."
}
