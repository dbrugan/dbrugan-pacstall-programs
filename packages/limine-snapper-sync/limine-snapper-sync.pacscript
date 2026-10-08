pkgname="limine-snapper-sync"
pkgver="1.32.1"
pkgrel="1"
pkgdesc="Synchronizes Limine boot entries with Snapper Btrfs snapshots"
url="https://gitlab.com/Zesko/limine-snapper-sync"
bugs="https://gitlab.com/Zesko/limine-snapper-sync/-/issues"
maintainer=("dbrugan <dbrugan@protonmail.com>")
arch=("amd64")
license=("GPL-3.0-or-later")

depends=(
  "bash"
  "btrfs-progs"
  "coreutils"
  "libnotify"
  "procps"
  "sed"
  "snapper"
  "systemd"
  "util-linux"
)

pacdeps=("limine")

makedepends=(
  "gcc"
  "gettext"
  "git"
  "libc6-dev"
  "zlib1g-dev"
)

optdepends=(
  "inotify-tools: Watches snapshot creation/deletion (otherwise the Snapper plugin drives syncs)"
  "rsync: Needed for RESTORE_METHOD=rsync"
  "xxhash: Faster xxhsum hashing for deduplication"
  "b3sum: Blake3 hashing for deduplication"
)

source=(
  "git+https://gitlab.com/Zesko/limine-snapper-sync.git#commit=b4c0da2d4532a993809219f9e5d51a1fa85fcb93"
  "https://github.com/graalvm/graalvm-ce-builds/releases/download/graal-25.2.4/graalvm-community-jdk-25i2-25.0.4_linux-x64_bin.tar.gz"
  "https://services.gradle.org/distributions/gradle-9.8.0-bin.zip"
)
sha256sums=(
  "SKIP"
  "3f4a89de8eaa96f2ed677f09957c7e872cd8467aad3537f8b5394c1b8c4b942e"
  "bafd5ce9cfaea0fbccfdc8439a1ac42fbd4cd9c89dc9a988228d8a2639a58e6c"
)
external_connection=true

backup=("etc/limine-snapper-sync.conf")

prepare() {
  mv graalvm-community-jdk-*/ "graalvm"
  if ! command -v "${srcdir}/graalvm/bin/javac" > /dev/null 2>&1; then
    fancy_message error "javac not found in the GraalVM tarball"
    return 1
  fi
}

build() {
  cd "limine-snapper-sync"
  export JAVA_HOME="${srcdir}/graalvm"
  export GRAALVM_HOME="${JAVA_HOME}"
  export GRADLE_USER_HOME="${srcdir}/.gradle"
  "${srcdir}/gradle-9.8.0/bin/gradle" clean nativeCompile \
    -Dorg.gradle.java.home="${JAVA_HOME}" --no-daemon
}

package() {
  cd "limine-snapper-sync"
  local src="install/arch-linux"

  install -Dm755 "build/native/nativeCompile/limine-snapper-sync" \
    "${pkgdir}/usr/lib/limine/limine-snapper-sync"

  install -Dm755 \
    "${src}/usr/bin/limine-snapper-info" \
    "${src}/usr/bin/limine-snapper-list" \
    "${src}/usr/bin/limine-snapper-notify" \
    "${src}/usr/bin/limine-snapper-remove" \
    "${src}/usr/bin/limine-snapper-restore" \
    "${src}/usr/bin/limine-snapper-sync" \
    "${src}/usr/bin/limine-snapper-watcher" \
    -t "${pkgdir}/usr/bin/"

  install -Dm644 "${src}/usr/lib/limine/limine-mutex" \
    "${pkgdir}/usr/lib/limine/limine-mutex"
  install -Dm755 "${src}/usr/lib/snapper/plugins/10-limine-snapper-sync" \
    "${pkgdir}/usr/lib/snapper/plugins/10-limine-snapper-sync"

  install -Dm644 "${src}/usr/lib/systemd/system/limine-snapper-sync.service" \
    "${pkgdir}/usr/lib/systemd/system/limine-snapper-sync.service"
  install -Dm644 \
    "${src}/usr/lib/systemd/system/snapper-cleanup.service.d/limine-snapper-override.conf" \
    "${pkgdir}/usr/lib/systemd/system/snapper-cleanup.service.d/limine-snapper-override.conf"

  install -Dm644 "${src}/etc/limine-snapper-sync.conf" \
    "${pkgdir}/etc/limine-snapper-sync.conf"
  install -Dm644 \
    "${src}/etc/xdg/autostart/limine-restore-notify.desktop" \
    "${src}/etc/xdg/autostart/limine-snapper-notify.desktop" \
    -t "${pkgdir}/etc/xdg/autostart/"
  install -Dm644 "${src}/usr/share/applications/limine-snapper-restore.desktop" \
    "${pkgdir}/usr/share/applications/limine-snapper-restore.desktop"
  install -Dm644 \
    "${src}/usr/share/icons/hicolor/128x128/apps/LimineSnapperSync.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/LimineSnapperSync.png"

  local mo lang
  for mo in "${src}"/usr/share/locale/*/LC_MESSAGES/limine-snapper-sync.mo; do
    [[ -e ${mo} ]] || continue
    lang="$(basename "$(dirname "$(dirname "${mo}")")")"
    install -Dm644 "${mo}" \
      "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/limine-snapper-sync.mo"
  done

  install -Dm644 "README.md" "CHANGELOG.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

post_install() {
  fancy_message info "Copy the config to /etc/default/limine (which takes precedence) and set ESP_PATH:"
  fancy_message info "  sudo cp /etc/limine-snapper-sync.conf /etc/default/limine"
  fancy_message info "Add a '//Snapshots' or '/Snapshots' entry to \$ESP_PATH/limine.conf, then run"
  fancy_message info "'sudo limine-snapper-sync' and enable automatic syncing with"
  fancy_message info "'sudo systemctl enable --now limine-snapper-sync.service'."
}
