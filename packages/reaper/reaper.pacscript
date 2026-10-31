pkgname="reaper"
gives="reaper"
pkgver="7.84"
pkgrel="1"
pkgdesc="Complete digital audio production application for recording, editing, mixing and mastering"
url="https://reaper.fm"
arch=("amd64")
license=("custom:Cockos")
maintainer=("dbrugan <dbrugan@protonmail.com>")
repology=("reaper")
depends=(
  "libasound2"
  "libx11-6"
  "libxi6"
  "libgl1"
  "libfontconfig1"
)
optdepends=(
  "jackd2: JACK audio backend"
  "pulseaudio: PulseAudio audio backend"
)
source=("https://www.reaper.fm/files/${pkgver%%.*}.x/reaper${pkgver//./}_linux_x86_64.tar.xz")
sha256sums=("d87b39862bec6a82bbb530731ae1fa36bba4bc9954ff72518a187420eed9ec7d")

package() {
  local appdir="${pkgdir}/opt/REAPER"

  XDG_DATA_HOME="${srcdir}/desktop" \
    sh "${srcdir}/reaper_linux_x86_64/install-reaper.sh" \
    --install "${pkgdir}/opt" --integrate-user-desktop

  rm -f "${appdir}/uninstall-reaper.sh"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/REAPER/reaper" "${pkgdir}/usr/bin/${gives}"

  install -Dm644 "${appdir}/EULA.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  sed -i 's#^Exec.*#Exec="/opt/REAPER/reaper" %F#g' \
    "${srcdir}/desktop/applications/cockos-reaper.desktop"
  install -Dm644 "${srcdir}/desktop/applications/cockos-reaper.desktop" \
    "${pkgdir}/usr/share/applications/cockos-reaper.desktop"

  install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  install -m644 "${srcdir}/desktop/icons/hicolor/256x256/apps/"*.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"

  install -Dm644 "${srcdir}/desktop/mime/packages/application-x-reaper.xml" \
    "${pkgdir}/usr/share/mime/packages/application-x-reaper.xml"
}

post_install() {
  echo "REAPER installed to /opt/REAPER. Free 60-day evaluation continues with your own license."
}
