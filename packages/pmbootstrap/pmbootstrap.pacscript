pkgname="pmbootstrap"
pkgver="3.12.1"
pkgrel="2"
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
sha256sums=("1a097b09eec2ceafe224fd2d76eda88e8a7280911b3d17497c096e521c4cdf7a")

build() {
  cd "pmbootstrap-${pkgver}"
  python3 -m pip install --no-build-isolation --no-deps --ignore-installed --root-user-action=ignore --prefix=/usr --root="${PWD}/stage" .
}

package() {
  cd "pmbootstrap-${pkgver}"
  cp -a stage/. "${pkgdir}/"
}
