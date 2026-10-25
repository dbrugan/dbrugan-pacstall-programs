pkgname="opencode-bin"
gives="opencode"
pkgver="1.19.4"
pkgrel="1"
pkgdesc="Open source AI coding agent for the terminal"
url="https://opencode.ai"
bugs="https://github.com/anomalyco/opencode/issues"
arch=("amd64")
license=("MIT")
repology=("project: opencode")
maintainer=("dbrugan <dbrugan@protonmail.com>")
source=("https://github.com/anomalyco/opencode/releases/download/v${pkgver}/opencode-linux-x64.tar.gz")
sha256sums=("849bd6b3d959a1d2ef200ed1634a51c79a45ca236aa26665d75debd694805cce")

package() {
  install -Dm755 "${srcdir}/opencode" "${pkgdir}/usr/bin/opencode"
}
