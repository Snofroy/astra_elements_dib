# astra_elements_dib

## Создать репозиторий Astra Linux

```
sudo mkdir -p /srv/repo/alce
sudo apt install rsync -y
sudo rsync --delete -aqLz dl.astralinux.ru::astra/astra/stable/2.12_x86-64/repository/ /srv/repo/alce
```

## Установка DIB

```
pip3 -m venv DIB
pip3 install --upgrade pip
pip3 install diskimage-builder
```
## Запуск сборки

```
export ELEMENTS_PATH=astra_elements_dib/ && disk-image-create vm Astra-debian
```
