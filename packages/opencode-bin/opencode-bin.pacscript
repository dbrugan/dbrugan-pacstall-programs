pkgname="opencode-bin"
gives="opencode"
pkgver="2.2.3"
pkgrel="1"
pkgdesc="Open source AI coding agent for the terminal"
url="https://opencode.ai"
bugs="https://github.com/anomalyco/opencode/issues"
arch=("amd64")
license=("MIT")
repology=("project: opencode")
maintainer=("dbrugan <dbrugan@protonmail.com>")
source=("https://github.com/anomalyco/opencode/releases/download/v${pkgver}/opencode-linux-x64.tar.gz")
sha256sums=("ef3aeeaf5522b10d69a3da7bbd6e6d8d259f845833d96b8310767d3407b18a35")

package() {
  install -Dm755 "${srcdir}/opencode" "${pkgdir}/usr/bin/opencode"
}
