pkgname="opencode-bin"
gives="opencode"
pkgver="1.19.0"
pkgrel="1"
pkgdesc="Open source AI coding agent for the terminal"
url="https://opencode.ai"
bugs="https://github.com/anomalyco/opencode/issues"
arch=("amd64")
license=("MIT")
repology=("project: opencode")
maintainer=("dbrugan <dbrugan@protonmail.com>")
source=("https://github.com/anomalyco/opencode/releases/download/v${pkgver}/opencode-linux-x64.tar.gz")
sha256sums=("7bb9e61ad6feacf2e89c10a6a2c1840e3de4220bb50ba1fc7110f31806076aec")

package() {
  install -Dm755 "${srcdir}/opencode" "${pkgdir}/usr/bin/opencode"
}
