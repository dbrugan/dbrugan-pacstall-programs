pkgname="python3-terminaltexteffects"
_pkgname="terminaltexteffects"
gives="tte"
pkgver="0.15.0"
pkgrel="1"
pkgdesc="Visual effects engine applied to text in the terminal"
url="https://github.com/ChrisBuilds/terminaltexteffects"
bugs="https://github.com/ChrisBuilds/terminaltexteffects/issues"
arch=("any")
depends=("python3")
makedepends=(
  "python3-build"
  "python3-installer"
  "python3-wheel"
  "python3-setuptools"
  "python3-hatchling"
)
provides=("tte")
conflicts=("terminaltexteffects")
license=("MIT")
repology=("pypi:terminaltexteffects")
maintainer=("dbrugan <dbrugan@protonmail.com>")
source=("terminaltexteffects-${pkgver}.tar.gz::${url}/archive/refs/tags/release-${pkgver}.tar.gz")
sha256sums=("2f0c6796e1d6530bcec2c5533bd080b329872a4be1d66b641939a6dbda8479ca")

build() {
  cd "${_pkgname}-release-${pkgver}"

  python3 -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-release-${pkgver}"

  python3 -m installer --destdir="${pkgdir}" dist/*.whl

  rm -f "${pkgdir}/usr/bin/terminaltexteffects"

  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
