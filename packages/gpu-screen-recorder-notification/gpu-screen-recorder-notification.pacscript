pkgname="gpu-screen-recorder-notification"
gives="gsr-notify"
pkgver="1.3.6"
pkgrel="1"
pkgdesc="Notification component for GPU Screen Recorder"
url="https://git.dec05eba.com/gpu-screen-recorder-notification"
maintainer=("dbrugan <dbrugan@protonmail.com>")
arch=("amd64")
license=("GPL-3.0-only")

depends=(
  "libxext6"
  "libwayland-client0"
  "libwayland-cursor0"
  "libwayland-egl1"
  "libx11-6"
  "libxrender1"
  "libxrandr2"
  "libxkbcommon0"
  "libglib2.0-0t64"
  "libpangoft2-1.0-0"
)

makedepends=(
  "meson"
  "ninja-build"
  "pkg-config"
  "cmake"
  "g++"
  "git"
  "libx11-dev"
  "libxext-dev"
  "libxrender-dev"
  "libxrandr-dev"
  "libxkbcommon-dev"
  "libwayland-dev"
  "wayland-protocols"
  "libglib2.0-dev"
  "libgio-2.0-dev"
  "libpango1.0-dev"
)

source=("git+https://repo.dec05eba.com/gpu-screen-recorder-notification.git#commit=54bc6c8f139a5ff4025a4585d01c9e3f23894b72")
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
