pkgname="gpu-screen-recorder-notification-deb"
gives="gpu-screen-recorder-notification"
pkgver="1.3.7"
pkgrel="1"
pkgdesc="Notification component for GPU Screen Recorder (prebuilt deb)"
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
  "libc6>=2.38"
)

source=("https://github.com/dbrugan/dbrugan-pacstall-programs/releases/download/gpu-screen-recorder-notification-${pkgver}/gpu-screen-recorder-notification_${pkgver}-pacstall${pkgrel}_amd64.deb")
sha256sums=("dc299fa45bef1d0fcf8ae1b4a34a3000e157d645c69a6cfa8b618225575f7c81")
external_connection=true

package() {
  dpkg-deb -R "${srcdir}/gpu-screen-recorder-notification_${pkgver}-pacstall${pkgrel}_amd64.deb" "${pkgdir}"
  rm -rf "${pkgdir}/DEBIAN"
}
