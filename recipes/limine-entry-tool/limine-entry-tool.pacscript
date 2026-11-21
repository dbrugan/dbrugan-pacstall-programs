pkgname="limine-entry-tool"
pkgver="1.40.0"
pkgrel="1"
pkgdesc="Entry management for the Limine bootloader"
url="https://gitlab.com/Zesko/limine-entry-tool"
bugs="https://gitlab.com/Zesko/limine-entry-tool/-/issues"
maintainer=("dbrugan <dbrugan@protonmail.com>")
arch=("amd64")
license=("GPL-3.0-or-later")

depends=(
  "bash"
  "coreutils"
  "efibootmgr"
  "gawk"
  "grep"
  "sed"
  "tar"
  "util-linux"
)

pacdeps=("limine")

makedepends=(
  "gcc"
  "git"
  "libc6-dev"
  "unzip"
  "zlib1g-dev"
)

source=(
  "git+https://gitlab.com/Zesko/limine-entry-tool.git#commit=35dab4b732861f5e8d307a1a7873856a877913aa"
  "https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-25.0.2/graalvm-community-jdk-25.0.2_linux-x64_bin.tar.gz"
  "https://services.gradle.org/distributions/gradle-9.8.0-bin.zip"
)
sha256sums=("SKIP" "e0be791c8fda4d03b6b0a0cb824fef3149736170057b3a515252b44419606af0" "bafd5ce9cfaea0fbccfdc8439a1ac42fbd4cd9c89dc9a988228d8a2639a58e6c")
external_connection=true

backup=("etc/limine-entry-tool.conf")

prepare() {
  mv graalvm-community-* "graalvm"
  if ! command -v "${srcdir}/graalvm/bin/javac" > /dev/null 2>&1; then
    fancy_message error "javac not found in the GraalVM tarball"
    return 1
  fi
}

build() {
  cd "limine-entry-tool"
  export JAVA_HOME="${srcdir}/graalvm"
  export GRAALVM_HOME="${JAVA_HOME}"
  export GRADLE_USER_HOME="${srcdir}/.gradle"
  "${srcdir}/gradle-9.8.0/bin/gradle" clean nativeCompile \
    -Dorg.gradle.java.home="${JAVA_HOME}" --no-daemon
}

package() {
  cd "limine-entry-tool"
  local src="install/arch-linux/limine-entry-tool"

  install -Dm755 "build/native/nativeCompile/limine-entry-tool" \
    "${pkgdir}/usr/lib/limine/limine-entry-tool"

  install -Dm644 \
    "${src}/usr/lib/limine/auth-helper" \
    "${src}/usr/lib/limine/limine-common-functions" \
    -t "${pkgdir}/usr/lib/limine/"

  install -Dm755 \
    "${src}/usr/bin/limine-enroll-config" \
    "${src}/usr/bin/limine-entry-tool" \
    "${src}/usr/bin/limine-install" \
    "${src}/usr/bin/limine-list" \
    "${src}/usr/bin/limine-remove-entry" \
    "${src}/usr/bin/limine-reset-enroll" \
    "${src}/usr/bin/limine-scan" \
    -t "${pkgdir}/usr/bin/"

  install -Dm644 "${src}/etc/limine-entry-tool.conf" \
    "${pkgdir}/etc/limine-entry-tool.conf"

  install -Dm755 \
    "${src}/etc/boot/hooks/post.d/89-warn-missing-file-hashes" \
    "${src}/etc/boot/hooks/post.d/91-example-esp-set-ro.disabled" \
    -t "${pkgdir}/etc/boot/hooks/post.d/"
  install -Dm755 "${src}/etc/boot/hooks/pre.d/05-example-esp-set-rw.disabled" \
    -t "${pkgdir}/etc/boot/hooks/pre.d/"

  ln -sf "/usr/bin/limine-enroll-config" \
    "${pkgdir}/etc/boot/hooks/post.d/90-limine-enroll-config"
  ln -sf "/usr/bin/limine-reset-enroll" \
    "${pkgdir}/etc/boot/hooks/pre.d/10-limine-reset-enroll"

  install -Dm644 "LICENSE" "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

post_install() {
  fancy_message info "Copy the config and set ESP_PATH plus KERNEL_CMDLINE[default]:"
  fancy_message info "  sudo cp /etc/limine-entry-tool.conf /etc/default/limine"
  fancy_message info "Then deploy the bootloader and show the boot menu:"
  fancy_message info "  sudo limine-install && limine-list"
  fancy_message info "Optionally install b2sum (Ubuntu: coreutils-from-uutils) for boot integrity"
  fancy_message info "checks; verification is skipped when b2sum is missing."
}
