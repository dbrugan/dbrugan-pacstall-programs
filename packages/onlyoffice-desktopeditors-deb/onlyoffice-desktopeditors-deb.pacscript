pkgname="onlyoffice-desktopeditors-deb"
gives="onlyoffice-desktopeditors"
pkgver="9.4.0"
pkgrel="1"
pkgdesc="Open-source office suite for documents, spreadsheets, presentations, and PDF editing"
url="https://www.onlyoffice.com/download-desktop"
bugs="https://github.com/ONLYOFFICE/DesktopEditors/issues"
arch=("amd64")
license=("AGPL-3.0-only")
repology=("project: onlyoffice-desktopeditors")
maintainer=("dbrugan <dbrugan@protonmail.com>")
source=("https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v${pkgver}/onlyoffice-desktopeditors_amd64.deb")
sha256sums=("4271434e81be42b1559fd989d24bf6d413482f278dc6a5e328202a4fc1a18649")
optdepends=("onlyoffice-desktopeditors-help: Offline documentation and help files")
post_install() {
  fancy_message info "ONLYOFFICE Desktop Editors installed. Run 'desktopeditors' for the GUI."
}
