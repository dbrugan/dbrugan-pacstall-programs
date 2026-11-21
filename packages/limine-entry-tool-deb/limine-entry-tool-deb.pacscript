pkgname="limine-entry-tool-deb"
gives="limine-entry-tool"
pkgver="1.40.0"
pkgrel="1"
pkgdesc="Entry management for the Limine bootloader"
url="https://gitlab.com/Zesko/limine-entry-tool"
bugs="https://gitlab.com/Zesko/limine-entry-tool/-/issues"
maintainer=("dbrugan <dbrugan@protonmail.com>")
arch=("amd64")
license=("GPL-3.0-or-later")

# This package installs a prebuilt deb produced by
# .github/workflows/build-debs.yml from recipes/limine-entry-tool. The build
# runs on Ubuntu 26.04 (resolute), requiring glibc >= 2.34.
depends=(
  "bash"
  "coreutils"
  "efibootmgr"
  "gawk"
  "grep"
  "libc6>=2.34"
  "sed"
  "tar"
  "util-linux"
  "zlib1g"
)

pacdeps=("limine")

source=("https://github.com/dbrugan/dbrugan-pacstall-programs/releases/download/limine-entry-tool-${pkgver}/limine-entry-tool_${pkgver}-pacstall${pkgrel}_amd64.deb")
sha256sums=("67f269be34fc3d5b5e6707a12b75fa572938cb764aa2ce0e2238971f87afe715")
