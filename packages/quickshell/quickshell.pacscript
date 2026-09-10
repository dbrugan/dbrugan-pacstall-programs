pkgname="quickshell"
pkgver="0.3.0"
pkgrel="1"
pkgdesc="Flexible toolkit for making desktop shells with QtQuick"
url="https://quickshell.org/"
maintainer=("dbrugan <dbrugan@protonmail.com>")
arch=("amd64")
license=("LGPL-3.0-or-later")

conflicts=("quickshell-git")
provides=("quickshell")

depends=(
  "libqt6core6t64"
  "libqt6gui6"
  "libqt6qml6"
  "libqt6quick6"
  "libqt6quickcontrols2-6"
  "libqt6widgets6"
  "libqt6dbus6"
  "libqt6network6"
  "libqt6waylandclient6"
  "libqt6svg6"
  "libwayland-client0"
  "libxcb1"
  "libxkbcommon0"
  "libdrm2"
  "libgbm1"
  "libegl1"
  "libgl1"
  "libpipewire-0.3-0t64"
  "libpam0g"
  "libjemalloc2"
  "libunwind8"
  "libpolkit-agent-1-0"
  "libpolkit-gobject-1-0"
  "libglib2.0-0t64"
)

makedepends=(
  "build-essential"
  "cmake"
  "ninja-build"
  "pkg-config"
  "git"
  "qt6-base-dev"
  "qt6-base-private-dev"
  "qt6-declarative-dev"
  "qt6-declarative-private-dev"
  "qt6-wayland-dev"
  "qt6-wayland-private-dev"
  "qt6-svg-dev"
  "qt6-shadertools-dev"
  "spirv-tools"
  "libwayland-dev"
  "wayland-protocols"
  "libxcb1-dev"
  "xcb-proto"
  "libpipewire-0.3-dev"
  "libpam0g-dev"
  "libdrm-dev"
  "libgbm-dev"
  "libegl-dev"
  "libvulkan-dev"
  "libjemalloc-dev"
  "libunwind-dev"
  "libdwarf-dev"
  "libpolkit-agent-1-dev"
  "libpolkit-gobject-1-dev"
  "libglib2.0-dev"
  "libcli11-dev"
)

source=("https://github.com/quickshell-mirror/quickshell/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("5229069b0f1d375f34b0a04a4e6a69156e2f010995d9ec5a943793424e589b5d")
external_connection=true

build() {
  cd "quickshell-${pkgver}"
  cmake -GNinja -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DINSTALL_QML_PREFIX=lib/x86_64-linux-gnu/qt6/qml \
    -DDISTRIBUTOR="Pacstall (personal)" \
    -DVENDOR_CPPTRACE=ON
  cmake --build build -j"${NCPU}"
}

package() {
  cd "quickshell-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build
}
