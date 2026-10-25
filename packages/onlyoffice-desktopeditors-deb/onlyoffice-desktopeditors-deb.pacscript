pkgname="onlyoffice-desktopeditors-deb"
gives="onlyoffice-desktopeditors"
pkgver="10.0.0"
pkgrel="1"
pkgdesc="Open-source office suite for documents, spreadsheets, presentations, and PDF editing"
url="https://www.onlyoffice.com/download-desktop"
bugs="https://github.com/ONLYOFFICE/DesktopEditors/issues"
arch=("amd64")
license=("AGPL-3.0-only")
repology=("project: onlyoffice-desktopeditors")
maintainer=("dbrugan <dbrugan@protonmail.com>")
source=("https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v${pkgver}/onlyoffice-desktopeditors_amd64.deb")
sha256sums=("2190edb4022a2ac2f6eee0f78815520f0e4ece1e8a1097c645a6f9b225c8b59c")
optdepends=("onlyoffice-desktopeditors-help: Offline documentation and help files")
post_install() {
  fancy_message info "ONLYOFFICE Desktop Editors installed. Run 'desktopeditors' for the GUI."
}
