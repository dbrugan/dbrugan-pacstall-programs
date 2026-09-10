pkgname="gpu-screen-recorder-ui"
pkgver="1.13.5"
pkgrel="1"
pkgdesc="A fullscreen overlay UI for GPU Screen Recorder in the style of ShadowPlay"
url="https://git.dec05eba.com/gpu-screen-recorder-ui"
maintainer=("dbrugan <dbrugan@protonmail.com>")
arch=("amd64")
license=("GPL-3.0-only")

suggests=(
  "gpu-screen-recorder"
  "gpu-screen-recorder-notification"
)

depends=(
  "libx11-6"
  "libxcomposite1"
  "libxrender1"
  "libwayland-cursor0"
  "libglib2.0-0t64"
  "libxfixes3"
  "libxext6"
  "libxi6"
  "libxcursor1"
  "libxrandr2"
  "libpulse0"
  "libdrm2"
  "libwayland-client0"
  "libxkbcommon0"
  "libgl1"
  "libegl1"
  "libdbus-1-3"
  "libpango-1.0-0"
  "libcap2"
)

makedepends=(
  "meson"
  "ninja-build"
  "pkg-config"
  "g++"
  "git"
  "desktop-file-utils"
  "libx11-dev"
  "libxrandr-dev"
  "libxcomposite-dev"
  "libxfixes-dev"
  "libxext-dev"
  "libxi-dev"
  "libxcursor-dev"
  "libwayland-dev"
  "wayland-protocols"
  "libxkbcommon-dev"
  "libgl-dev"
  "libegl-dev"
  "libpulse-dev"
  "libdrm-dev"
  "libdbus-1-dev"
  "libpango1.0-dev"
  "libcap-dev"
)

source=("git+https://repo.dec05eba.com/gpu-screen-recorder-ui.git#commit=edfc70d99ba9adbce3f7e61642ac21ea1542e50f")
sha256sums=("SKIP")
external_connection=true

build() {
  cd "gpu-screen-recorder-ui"
  git submodule update --init --recursive
  meson setup build --prefix=/usr --buildtype=release -Dstrip=true \
    -Dcapabilities=false -Ddesktop-files=true
  ninja -C build
}

package() {
  cd "gpu-screen-recorder-ui"
  DESTDIR="${pkgdir}" ninja -C build install
}

post_install() {
  setcap cap_setuid+ep /usr/bin/gsr-global-hotkeys \
    || echo "Failed to set capabilities on gsr-global-hotkeys. Global hotkeys may not work."
}
