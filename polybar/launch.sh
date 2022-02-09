#!/bin/bash

killall -q polybar

polybar laptop -r 2>&1 | tee -a /tmp/polybar.log & disown
polybar left -r 2>&1 | tee -a /tmp/polybar.log & disown
polybar center -r 2>&1 | tee -a /tmp/polybar.log & disown
polybar right -r 2>&1 | tee -a /tmp/polybar.log & disown
