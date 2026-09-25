pkgname="pmbootstrap"
pkgver="3.11.1"
pkgrel="1"
pkgdesc="A sophisticated chroot/build/flash tool to develop and install postmarketOS"
url="https://gitlab.postmarketos.org/postmarketOS/pmbootstrap"
bugs="https://gitlab.postmarketos.org/postmarketOS/pmbootstrap/-/issues"
maintainer=("dbrugan <dbrugan@protonmail.com>")
arch=("all")
license=("GPL-3.0-or-later")
depends=("python3" "git" "openssl" "procps" "tar" "util-linux")
recommends=("python3-argcomplete")
makedepends=("python3-pip" "python3-setuptools")
source=("https://gitlab.postmarketos.org/postmarketOS/pmbootstrap/-/archive/${pkgver}/pmbootstrap-${pkgver}.tar.gz")
sha256sums=("64e4dccf7597ddc9cc807c00dc317c8bc78dc6203345d07a24c0541429938871")

build() {
  cd "pmbootstrap-${pkgver}"
  python3 -m pip install --no-build-isolation --no-deps --root-user-action=ignore --prefix=/usr --root="${PWD}/stage" .
}

package() {
  cd "pmbootstrap-${pkgver}"
  cp -a stage/. "${pkgdir}/"
}
