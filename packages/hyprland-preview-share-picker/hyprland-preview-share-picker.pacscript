pkgname="hyprland-preview-share-picker"
pkgver="0.2.1"
pkgrel="1"
pkgdesc="An alternative share picker for hyprland with window and monitor previews"
url="https://github.com/WhySoBad/hyprland-preview-share-picker"
bugs="https://github.com/WhySoBad/hyprland-preview-share-picker/issues"
arch=("amd64")
license=("MIT")
maintainer=("dbrugan <dbrugan@protonmail.com>")
depends=(
  "libgtk-4-1"
  "libgtk4-layer-shell0"
  "libwayland-client0"
)
makedepends=(
  "cargo"
  "git"
  "pkg-config"
  "libgtk-4-dev"
  "libgtk4-layer-shell-dev"
  "libwayland-dev"
)
suggests=("hyprland" "xdg-desktop-portal-hyprland" "slurp")
source=("git+https://github.com/WhySoBad/hyprland-preview-share-picker.git#commit=211b7890ed3332f4d1bb1f1a96999e18874a9c3c")
sha256sums=("SKIP")
external_connection=true

prepare() {
  cd "hyprland-preview-share-picker"
  git submodule update --init --recursive
}

build() {
  cd "hyprland-preview-share-picker"
  cargo build --release --locked
  ./target/release/hyprland-preview-share-picker schema > schema.json
}

package() {
  cd "hyprland-preview-share-picker"

  install -Dm755 -T "target/release/hyprland-preview-share-picker" \
    "${pkgdir}/usr/bin/hyprland-preview-share-picker"

  install -Dm644 "schema.json" \
    -t "${pkgdir}/usr/share/hyprland-preview-share-picker/"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

post_install() {
  fancy_message info "Configure the picker in ~/.config/hypr/xdph.conf:"
  fancy_message info "  screencopy { custom_picker_binary = hyprland-preview-share-picker }"
}
