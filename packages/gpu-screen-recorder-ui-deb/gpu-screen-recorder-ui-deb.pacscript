pkgname="gpu-screen-recorder-ui-deb"
gives="gpu-screen-recorder-ui"
pkgver="1.14.1"
pkgrel="1"
pkgdesc="A fullscreen overlay UI for GPU Screen Recorder in the style of ShadowPlay (prebuilt deb)"
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
  "libpangoft2-1.0-0"
  "libcap2"
  "libc6>=2.38"
)

source=("https://github.com/dbrugan/dbrugan-pacstall-programs/releases/download/gpu-screen-recorder-ui-${pkgver}/gpu-screen-recorder-ui_${pkgver}-pacstall${pkgrel}_amd64.deb")
sha256sums=("d2ad7ab2af5437e1a0653979ba6772eae1a3b4f63a97ed91c3d79b77d909160f")
external_connection=true

package() {
  dpkg-deb -R "${srcdir}/gpu-screen-recorder-ui_${pkgver}-pacstall${pkgrel}_amd64.deb" "${pkgdir}"
  rm -rf "${pkgdir}/DEBIAN"
}

post_install() {
  setcap cap_setuid+ep /usr/bin/gsr-global-hotkeys \
    || echo "Failed to set capabilities on gsr-global-hotkeys. Global hotkeys may not work."
}
