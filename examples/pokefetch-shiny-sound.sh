#!/usr/bin/env bash

sound_file="$HOME/.config/pokefetch/shiny.wav.b64"

{ error=$(pokefetch --verbose 2>&1 1>&$out); } {out}>&1

if $(echo $error | grep 'shiny_roll: 0' >/dev/null); then
  base64 --decode "$sound_file" | ffplay -nodisp -autoexit -i - -loglevel quiet >/dev/null &
  disown
fi
