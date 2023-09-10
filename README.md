# astra_elements_dib

## Установка DIB

pip3 -m venv DIB
pip3 install --upgrade pip
pip3 install diskimage-builder

export ELEMENTS_PATH=astra_elements_dib/ && disk-image-create vm Astra-debian
