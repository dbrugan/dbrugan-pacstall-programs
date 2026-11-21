pkgname="gpu-screen-recorder-deb"
gives="gpu-screen-recorder"
pkgver="6.1.5"
pkgrel="1"
pkgdesc="A screen recorder that uses the GPU for encoding with minimal impact on system performance (prebuilt deb)"
url="https://git.dec05eba.com/gpu-screen-recorder"
maintainer=("dbrugan <dbrugan@protonmail.com>")
arch=("amd64")
license=("GPL-3.0-only")

depends=(
  "libx11-6"
  "libxcomposite1"
  "libxrandr2"
  "libxfixes3"
  "libxdamage1"
  "libxext6"
  "libpulse0"
  "libva2"
  "libva-drm2"
  "libdrm2"
  "libwayland-client0"
  "libwayland-egl1"
  "libcap2"
  "libpipewire-0.3-0t64"
  "libdbus-1-3"
  "libavcodec62"
  "libavformat62"
  "libavutil60"
  "libswresample6"
  "libavfilter11"
  "libspa-0.2-modules"
  "libvulkan1"
  "libc6>=2.34"
)

source=("https://github.com/dbrugan/dbrugan-pacstall-programs/releases/download/gpu-screen-recorder-${pkgver}/gpu-screen-recorder_${pkgver}-pacstall${pkgrel}_amd64.deb")
sha256sums=("8cc4545a1b81bef8eed4103721d8329d20d2457b1cf17820c8a3325be8d5d914")
external_connection=true

package() {
  dpkg-deb -R "${srcdir}/gpu-screen-recorder_${pkgver}-pacstall${pkgrel}_amd64.deb" "${pkgdir}"
  rm -rf "${pkgdir}/DEBIAN"
}

post_install() {
  setcap cap_sys_admin+ep /usr/bin/gsr-kms-server \
    || echo "Failed to set capabilities on gsr-kms-server. Monitor recording may require root."
}
