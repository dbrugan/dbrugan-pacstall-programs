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
# runs on Ubuntu 26.04 (resolute), so the artifact needs a matching glibc.
#
# TODO: after the first `build-debs` run, replace SKIP with the published
# sha256 and relax libc6 to the ABI floor reported in the run summary. Both
# values are printed by the workflow and enforced on later runs. Once this
# package is published, drop packages/limine-entry-tool/ (the source recipe
# lives on in recipes/) so only one package provides limine-entry-tool.
depends=(
  "bash"
  "coreutils"
  "efibootmgr"
  "gawk"
  "grep"
  "libc6>=2.43"
  "sed"
  "tar"
  "util-linux"
  "zlib1g"
)

pacdeps=("limine")

source=("https://github.com/dbrugan/dbrugan-pacstall-programs/releases/download/limine-entry-tool-${pkgver}/limine-entry-tool_${pkgver}-pacstall${pkgrel}_amd64.deb")
sha256sums=("SKIP")
