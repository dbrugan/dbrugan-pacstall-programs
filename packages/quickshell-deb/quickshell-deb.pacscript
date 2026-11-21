pkgname="quickshell-deb"
pkgver="0.3.2"
pkgrel="1"
pkgdesc="Flexible toolkit for making desktop shells with QtQuick (prebuilt deb)"
url="https://quickshell.org/"
maintainer=("dbrugan <dbrugan@protonmail.com>")
arch=("amd64")
license=("LGPL-3.0-or-later")

conflicts=("quickshell" "quickshell-git")
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

source=("https://github.com/dbrugan/dbrugan-pacstall-programs/releases/download/quickshell-${pkgver}/quickshell_${pkgver}-pacstall1_amd64.deb")
sha256sums=("1f20dab7650cf8eb53bf01bd45822239e9fc8c044785d308d36c3d56f257788f")
external_connection=true

package() {
  dpkg-deb -R "${srcdir}/quickshell_${pkgver}-pacstall1_amd64.deb" "${pkgdir}"
  rm -rf "${pkgdir}/DEBIAN"
}
