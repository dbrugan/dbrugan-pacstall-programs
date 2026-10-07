pkgname="limine"
pkgver="12.9.3"
pkgrel="1"
pkgdesc="Modern, secure, portable, multiprotocol bootloader and boot manager"
url="https://github.com/Limine-Bootloader/Limine"
bugs="https://github.com/Limine-Bootloader/Limine/issues"
maintainer=("dbrugan <dbrugan@protonmail.com>")
arch=("amd64")
license=("BSD-2-Clause")

makedepends=(
  "gcc"
  "make"
)

source=("https://github.com/Limine-Bootloader/Limine/releases/download/v${pkgver}/limine-binary.tar.xz")
sha256sums=("e02a473c6dc6df25159697f94930272397f21fd86e5d4eeee61bba72c95ec8d2")

build() {
  cd "limine-binary"
  make
}

package() {
  cd "limine-binary"

  install -Dm755 "limine" -t "${pkgdir}/usr/bin/"

  install -Dm644 \
    "BOOTAA64.EFI" \
    "BOOTIA32.EFI" \
    "BOOTLOONGARCH64.EFI" \
    "BOOTRISCV64.EFI" \
    "BOOTX64.EFI" \
    "limine-bios-cd.bin" \
    "limine-bios-hdd.h" \
    "limine-bios-pxe.bin" \
    "limine-bios.sys" \
    "limine-uefi-cd.bin" \
    -t "${pkgdir}/usr/share/limine/"

  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

post_install() {
  fancy_message info "The Limine EFI binaries are in /usr/share/limine/."
  fancy_message info "Deploy the bootloader with 'sudo limine-install' (from limine-entry-tool),"
  fancy_message info "or on legacy BIOS systems with 'sudo limine bios-install /dev/sdX'."
}
