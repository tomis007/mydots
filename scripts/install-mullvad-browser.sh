#!/usr/bin/env bash

wget --trust-server-names https://mullvad.net/en/download/browser/linux-x86_64/latest -P /tmp
tar -xvf /tmp/mullvad-browser-linux* -C /tmp
sudo mv /tmp/mullvad-browser /usr/lib/ 
cd /usr/lib/mullvad-browser && ./start-mullvad-browser.desktop --register-app
