# astra_elements_dib

## Установка DIB

```
pip3 -m venv DIB
source DIB/bin/activate
pip3 install --upgrade pip
pip3 install diskimage-builder
```
## Настройка debootstrap

```
sudo apt install debootstrap -y
```

```
sudo nano /usr/share/debootstrap/scripts/smolensk

mirror_style release
download_style apt
finddebs_style from-indices
variants - buildd fakechroot minbase
keyring /usr/share/keyrings/debian-archive-keyring.gpg

# include common settings
if [ -e "$DEBOOTSTRAP_DIR/scripts/debian-common" ]; then
 . "$DEBOOTSTRAP_DIR/scripts/debian-common"
elif [ -e /debootstrap/debian-common ]; then
 . /debootstrap/debian-common
elif [ -e "$DEBOOTSTRAP_DIR/debian-common" ]; then
 . "$DEBOOTSTRAP_DIR/debian-common"
else
 error 1 NOCOMMON "File not found: debian-common"
fi
```

В файле /usr/share/debootstrap/scripts/debian-common находим строку содержащую usr-is-merged и закоментируем

## Запуск сборки

В файле astra_elements_dib/Astra-debian-minimal/environment.d/10-debian-minimal.bash указать в переменной DIB_DISTRIBUTION_MIRROR пусть до репозитория с пакетами

```
export DIB_DISTRIBUTION_MIRROR=${DIB_DISTRIBUTION_MIRROR:- http://192.168.1.3:8080 }
```

Запуск:

```
export ELEMENTS_PATH=astra_elements_dib/ && disk-image-create vm Astra-debian
```
