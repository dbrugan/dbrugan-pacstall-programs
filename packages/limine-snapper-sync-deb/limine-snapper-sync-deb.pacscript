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
# runs on Ubuntu 26.04 (resolute), requiring glibc >= 2.34.
depends=(
  "bash"
  "btrfs-progs"
  "coreutils"
  "libc6>=2.34"
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
sha256sums=("85b090a6b5e8545b0637258018197bbabc4160692d78ced9ced16cbe76e10378")
