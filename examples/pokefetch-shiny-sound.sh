#!/usr/bin/env bash

{ error=$(pokefetch --verbose 2>&1 1>&$out); } {out}>&1

if $(echo $error | grep 'shiny_roll: 0' >/dev/null); then
  ffplay -nodisp -autoexit $HOME/.config/potd/shiny.wav -loglevel quiet >/dev/null &
  disown
fi
