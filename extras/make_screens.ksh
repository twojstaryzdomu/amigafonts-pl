#!/bin/ksh
#
# Needs X windows; requires xterm, spectacle & either rpm or dpkg

dir="${1:-.}"
size=10
pkg=amigafonts-pl

(dpkg -L ${pkg} 2>/dev/null \
  || rpm -ql ${pkg}  2>/dev/null) \
  | grep -Po '(?<=truetype/).*(?=.ttf)' \
  | sed -e 's|_| |g;s|pl|PL|g' \
  | while read font; do
    xterm \
      -fa "${font//-/\-}${size:+:size=${size}}" \
      -bg black \
      -fg lightgrey \
      -geometry 105x25 \
      -title "${font} ${size}" \
      +sb \
      -hold \
      -e "tput civis;
      echo -e '
  Font: '${font}' 

  Size: '${size}'

  Pójdź, kińże tę chmurność w głąb flaszy

  The Quick Brown Fox Jumps Over The Lazy Dog

  Ą ą Ć ć Ę ę Ł ł Ń ń Ó ó Ś ś Ż ż Ź ź

  A a B b C c D d E e F f G g H h I i J j K k L l M m N n O o P p Q q R r S s T t U u V v X x Y y Z z

  0 1 2 3 4 5 6 7 8 9 - _ + = ! @ # $ % ^ & * ( ) [ ] { } < > . , ; : ? / ~ \` \" '\"' \"'|

  “ « ” »

  ┌────────────────────┐
  │  ←   ↓   •   ↑  →  │
  ├────────────────────┤
  │  ←   ↓   •   ↑  →  │
  └────────────────────┘
  
'; sleep 1" & \
    spectacle -a "${font}" -b -n -o "${dir}/${font} ${size}.png"
    kill %%
  done
