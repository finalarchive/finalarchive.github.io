#!/bin/bash
# LABEL: Telegram
# CATEGORY: Messenger
# WAJIB: no

wget -O- https://telegram.org/dl/desktop/linux | sudo tar xJ -C /opt/ && sudo ln -s /opt/Telegram/Telegram /usr/local/bin/telegram
telegram &