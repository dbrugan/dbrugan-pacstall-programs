pkgname="gpu-screen-recorder-notification"
gives="gsr-notify"
pkgver="1.3.4"
pkgrel="1"
pkgdesc="Notification component for GPU Screen Recorder"
url="https://git.dec05eba.com/gpu-screen-recorder-notification"
maintainer=("dbrugan <dbrugan@protonmail.com>")
arch=("amd64")
license=("GPL-3.0-only")

depends=(
  "libxext6"
  "libwayland-client0"
)

makedepends=(
  "meson"
  "ninja-build"
  "pkg-config"
  "g++"
  "git"
  "libxext-dev"
  "libwayland-dev"
  "wayland-protocols"
)

source=("git+https://repo.dec05eba.com/gpu-screen-recorder-notification.git#commit=8db381865f5d03212f51fdadcf0d357ed6ea4a60")
sha256sums=("SKIP")
external_connection=true

build() {
  cd "gpu-screen-recorder-notification"
  git submodule update --init --recursive
  meson setup build --prefix=/usr --buildtype=release -Dstrip=true
  ninja -C build
}

package() {
  cd "gpu-screen-recorder-notification"
  DESTDIR="${pkgdir}" ninja -C build install
}
