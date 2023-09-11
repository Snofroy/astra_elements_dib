# astra_elements_dib

## Установка DIB

```
pip3 -m venv DIB
pip3 install --upgrade pip
pip3 install diskimage-builder
```
## Запуск сборки

В файле astra_elements_dib/Astra-debian-minimal/environment.d/10-debian-minimal.bash указать в переменной DIB_DISTRIBUTION_MIRROR пусть до репозитория с пакетами

```
export DIB_DISTRIBUTION_MIRROR=${DIB_DISTRIBUTION_MIRROR:- http://192.168.1.3:8080 }
```

Запуск:

```
export ELEMENTS_PATH=astra_elements_dib/ && disk-image-create vm Astra-debian
```
