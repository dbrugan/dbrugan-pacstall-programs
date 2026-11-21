pkgname="limine-snapper-sync-deb"
gives="limine-snapper-sync"
pkgver="1.32.1"
pkgrel="1"
pkgdesc="Synchronizes Limine boot entries with Snapper Btrfs snapshots"
url="https://gitlab.com/Zesko/limine-snapper-sync"
bugs="https://gitlab.com/Zesko/limine-snapper-sync/-/issues"
maintainer=("dbrugan <dbrugan@protonmail.com>")
arch=("amd64")
license=("GPL-3.0-or-later")

# This package installs a prebuilt deb produced by
# .github/workflows/build-debs.yml from recipes/limine-snapper-sync. The build
# runs on Ubuntu 26.04 (resolute), so the artifact needs a matching glibc.
#
# TODO: after the first `build-debs` run, replace SKIP with the published
# sha256 and relax libc6 to the ABI floor reported in the run summary. Both
# values are printed by the workflow and enforced on later runs. Once this
# package is published, drop packages/limine-snapper-sync/ (the source recipe
# lives on in recipes/) so only one package provides limine-snapper-sync.
depends=(
  "bash"
  "btrfs-progs"
  "coreutils"
  "libc6>=2.43"
  "libnotify-bin"
  "procps"
  "sed"
  "snapper"
  "systemd"
  "util-linux"
  "zlib1g"
)

pacdeps=("limine")

optdepends=(
  "inotify-tools: Watches snapshot creation/deletion (otherwise the Snapper plugin drives syncs)"
  "rsync: Needed for RESTORE_METHOD=rsync"
  "xxhash: Faster xxhsum hashing for deduplication"
  "b3sum: Blake3 hashing for deduplication"
)

source=("https://github.com/dbrugan/dbrugan-pacstall-programs/releases/download/limine-snapper-sync-${pkgver}/limine-snapper-sync_${pkgver}-pacstall${pkgrel}_amd64.deb")
sha256sums=("SKIP")
