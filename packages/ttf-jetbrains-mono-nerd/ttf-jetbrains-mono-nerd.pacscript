pkgname="ttf-jetbrains-mono-nerd"
gives="ttf-jetbrains-mono-nerd"
pkgver="3.5.1"
pkgdesc="Patched font JetBrains Mono from nerd fonts library"
url="https://github.com/ryanoasis/nerd-fonts"
bugs="https://github.com/ryanoasis/nerd-fonts/issues"
license=("OFL-1.1-no-RFN")
arch=("all")
provides=("ttf-font-nerd")
conflicts=("nerd-fonts-jetbrains-mono")
replaces=("nerd-fonts-jetbrains-mono")
maintainer=("dbrugan <dbrugan@protonmail.com>")
source=("JetBrainsMono-${pkgver}.tar.xz::https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/JetBrainsMono.tar.xz")
sha256sums=("04d5e8f903693f9dd13e16f867e994834e681eb3c72c0d337a770dcda09010cf")
noextract=("JetBrainsMono-${pkgver}.tar.xz")

package() {
  local srcdir_font="${srcdir}/JetBrainsMono"

  mkdir -p "${srcdir_font}"
  tar -xf "${srcdir}/JetBrainsMono-${pkgver}.tar.xz" -C "${srcdir_font}"

  install -Dm644 "${srcdir_font}"/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 "${srcdir_font}/OFL.txt" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

post_install() {
  fc-cache -f > /dev/null 2>&1 || true
}

post_remove() {
  fc-cache -f > /dev/null 2>&1 || true
}