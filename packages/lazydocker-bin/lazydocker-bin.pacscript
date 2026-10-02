pkgname="lazydocker-bin"
gives="lazydocker"
pkgver="0.25.2"
pkgrel="1"
pkgdesc="The lazier way to manage everything docker"
url="https://github.com/jesseduffield/lazydocker"
bugs="https://github.com/jesseduffield/lazydocker/issues"
arch=("amd64")
license=("MIT")
repology=("project: lazydocker")
maintainer=("dbrugan <dbrugan@protonmail.com>")
suggests=("docker-ce" "docker-compose-plugin" "docker-buildx-plugin")
source=("https://github.com/jesseduffield/lazydocker/releases/download/v${pkgver}/lazydocker_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=("0d9dbfc26068b218e7ed84b104748cadc6e3cf733c0afd35465306fb39b9523c")

package() {
  install -Dm755 "${srcdir}/lazydocker" "${pkgdir}/usr/bin/lazydocker"

  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
