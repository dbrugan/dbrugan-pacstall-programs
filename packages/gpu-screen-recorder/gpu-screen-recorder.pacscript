pkgname="gpu-screen-recorder"
pkgver="6.0.0"
pkgrel="1"
pkgdesc="A screen recorder that uses the GPU for encoding with minimal impact on system performance"
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
)

makedepends=(
  "meson"
  "ninja-build"
  "pkg-config"
  "gcc"
  "git"
  "libx11-dev"
  "libxcomposite-dev"
  "libxrandr-dev"
  "libxfixes-dev"
  "libxdamage-dev"
  "libxext-dev"
  "libpulse-dev"
  "libva-dev"
  "libdrm-dev"
  "libwayland-dev"
  "libcap-dev"
  "libpipewire-0.3-dev"
  "libdbus-1-dev"
  "libavcodec-dev"
  "libavformat-dev"
  "libavutil-dev"
  "libswresample-dev"
  "libavfilter-dev"
  "libvulkan-dev"
  "wayland-protocols"
)

source=("git+https://repo.dec05eba.com/gpu-screen-recorder.git#commit=80517840f4ae64469721598e8373d81f2e4493dd")
sha256sums=("SKIP")
external_connection=true

build() {
  cd "gpu-screen-recorder"
  meson setup build --prefix=/usr --buildtype=release -Dstrip=true \
    -Dsystemd=false -Dcapabilities=false -Dportal=true -Dapp_audio=true \
    -Dplugin_examples=false -Dffmpeg_static=false
  ninja -C build
}

package() {
  cd "gpu-screen-recorder"
  DESTDIR="${pkgdir}" ninja -C build install
}

post_install() {
  setcap cap_sys_admin+ep /usr/bin/gsr-kms-server \
    || echo "Failed to set capabilities on gsr-kms-server. Monitor recording may require root."
}
