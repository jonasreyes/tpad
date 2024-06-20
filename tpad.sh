#! /bin/bash

# Autor: Jonás Reyes
# Junio 2024
# Puedes usar, estudiar, modificar, adaptar y distribuir la versión original o mejorada de éste código siempre que 
# hagas mención al autor original y mantengas este mensaje.
#

# Generamos las Variables que almacenarán los nombres del Touchpad y Mouse.
TOUCHPAD_NAME="bcm5974"
MOUSE_NAME="Compx Pulsar Xlite Wireless"

# devuelve el id del Touchpad
get_touchpad_id() {
  xinput list --id-only "$TOUCHPAD_NAME"
}

# devuelve lista de perifericos conectados asociados al nombre del mouse que hemos declarado
is_mouse_connected() {
  xinput list --name-only | grep -q "$MOUSE_NAME"
}

# función que habilita el touchpad
enable_touchpad(){
  local id=$(get_touchpad_id)
  xinput enable "$id"
  notify-send "Touchpad activado"
}

# función que deshabilita el touchpad
disable_touchpad(){
  local id=$(get_touchpad_id)
  xinput disable "$id"
  notify-send "Touchpad desactivado"
}

# en caso de que haya un mouse externo conectado procede a invocar las funciones de deshabilitación del Touchpad,
# en caso de que no haya mouse externo conectado, procede a habilitar el Touchpad.
if is_mouse_connected; then
  disable_touchpad
else
  enable_touchpad
fi
