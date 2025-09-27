#!/bin/sh
if playerctl --player=spotify status &>/dev/null; then playerctl --player=spotify play-pause; else playerctl play-pause; fi
