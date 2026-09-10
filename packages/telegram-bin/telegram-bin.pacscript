pkgname="telegram-bin"
gives="telegram"
pkgver="7.0.9"
pkgrel="1"
pkgdesc="Official Telegram Desktop client - static binaries installed to /opt/Telegram with working in-app self-updater"
arch=("amd64")
url="https://telegram.org/"
license=("GPL-3.0-only")
repology=("project: telegram-desktop")
maintainer=("dbrugan <dbrugan@protonmail.com>")

source_base_url='https://github.com/telegramdesktop/tdesktop'
source=(
  "${source_base_url}/raw/v${pkgver}/Telegram/Resources/art/icon16.png"
  "${source_base_url}/raw/v${pkgver}/Telegram/Resources/art/icon32.png"
  "${source_base_url}/raw/v${pkgver}/Telegram/Resources/art/icon48.png"
  "${source_base_url}/raw/v${pkgver}/Telegram/Resources/art/icon64.png"
  "${source_base_url}/raw/v${pkgver}/Telegram/Resources/art/icon128.png"
  "${source_base_url}/raw/v${pkgver}/Telegram/Resources/art/icon256.png"
  "${source_base_url}/raw/v${pkgver}/Telegram/Resources/art/icon512.png"
  "@${pkgname}-${pkgver}::${source_base_url}/releases/download/v${pkgver}/tsetup.${pkgver}.tar.xz"
)
sha256sums=(
  "ea1f36152b143cc2664daef5026656d55be2230ed42d43628e17ef7d2fff718c"
  "9e4180c78c895783b4559c5e1a7868a2c9aa30a29969fe5dbe9a4ce4cf5cde6c"
  "041b78681a35f07c3c929662fc66b6592c88588dc7297a5394ef7f923f2118e2"
  "554dff9f55697d4e8ec69e9aa53678aa5dae3e91aa13adc3b115526d8d51dfc9"
  "731431e47a5bc91c697d25c3a54fe7ba004752f5b66e0f282c47588ff7a314e6"
  "3fb1400c7dc9bbc3b5cb3ffedcbf4a9b09c53e28b57a7ff33a8a6b9048864090"
  "e297771c75bd2f81d637a3234f83568be62092f67d16946be23895fa92fa7119"
  "d3c05df0259ab116d11d8c1cdc1403019d2a3be303ad3b46d16a84e19df6615f"
)

package() {
  local appdir="${pkgdir}/opt/Telegram"

  install -dm755 "${appdir}"
  install -m755 "${srcdir}/Telegram/Telegram" "${appdir}/Telegram"
  install -m755 "${srcdir}/Telegram/Updater" "${appdir}/Updater"

  if [[ ! -x "${appdir}/Telegram" || ! -f "${appdir}/Updater" ]]; then
    fancy_message error "Telegram binaries missing from source archive; aborting build"
    return 1
  fi

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/Telegram/Telegram" "${pkgdir}/usr/bin/${gives}"

  install -Dm644 /dev/null "${pkgdir}/usr/share/applications/org.telegram.desktop.desktop"
  cat > "${pkgdir}/usr/share/applications/org.telegram.desktop.desktop" << EOF
[Desktop Entry]
Version=1.0
Name=Telegram Desktop
Comment=Official Telegram Desktop Client
TryExec=/usr/bin/${gives}
Exec=/usr/bin/${gives} -- %u
Icon=telegram
Terminal=false
StartupNotify=false
Type=Application
Categories=Chat;Network;InstantMessaging;Qt;
MimeType=x-scheme-handler/tg;
Keywords=tg;chat;im;messaging;messenger;sms;telegram;
StartupWMClass=TelegramDesktop
X-GNOME-UsesNotifications=true
EOF

  local icon_size icon_dir
  for icon_size in 16 32 48 64 128 256 512; do
    icon_dir="${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
    install -Dm644 "${srcdir}/icon${icon_size}.png" "${icon_dir}/telegram.png"
  done
  install -Dm644 "${srcdir}/icon256.png" "${pkgdir}/usr/share/pixmaps/telegram.png"
}

post_install() {
  local target_user="${PACSTALL_USER:-$(logname 2> /dev/null || echo root)}"

  if [[ -n ${target_user} && ${target_user} != "root" ]] && id "${target_user}" > /dev/null 2>&1; then
    sudo chown -R "${target_user}:${target_user}" /opt/Telegram
  fi

  fancy_message info "Telegram Desktop is installed at /opt/Telegram and updates itself in-app. User data lives in ~/.local/share/TelegramDesktop."
}

post_remove() {
  sudo rm -rf /opt/Telegram
}
