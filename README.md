# amigafonts-pl

Faithfully remade multi platform Amiga fonts in Amiga aspect.

This repository is based on the fonts from the [amigafonts](https://github.com/rewtnull/amigafonts)
repository with additional Polish diacritics. Otherwise the fonts are preserved.

## Contents

      [dir] debian                        - package build files for dpkg-buildpackage
      [dir] eot                           - Embedded OpenType fonts
      [dir] extras                        - extra scripts (see below)
      [dir] equivalents                   - character equivalence files
      [dir] pcf                           - X11 Portable Compiled Fonts
      [dir] psf                           - PC Screen Font v1 fonts
      [dir] screens                       - sample png screenshots of TrueType fonts
      [dir] ttf                           - TrueType fonts
            README.md                     - This file
            README.orig.md                - Original README from https://github.com/rewtnull/amigafonts

## Fonts

The source fonts have been removed, leaving only those with Polish diacritics.
The FON type is not included.

The fonts come in two flavours: tightly spaced and loosely spaced accent glyphs.

## Equivalents

Contain equivalence rules used in these fonts, based on characters displayed by common
UNIX utilities (git, man, mc).

## Screens

TrueType fonts rendered in an xterm window.

## Extras

      make_screens.ksh                    - script to create the samples found under screens
      rotate-console-font.ksh             - installation script for rotate-console-font.service
      rotate-console-font.service         - systemd drop-in to rotate console font
                                            on console-setup/systemd-vconsole-setup.service reload

To run `rotate-console-font.service` as a standalone service, replace `ExecStartPre` with `ExecStart`
in the body of the file.

## Credits

Based on [amigafonts](https://github.com/rewtnull/amigafonts), released under GPL-FE:

      These fonts are released under the GPL-FE license:

      http://www.gnu.org/licenses/gpl-faq.html#FontException


      Topaz is © AmigaInc.
      ttf, fon, eot, raw & psf v1/v2 versions of Topaz are © dMG/t!s^dS!
      ttf, fon, eot, raw & psf v1/v2 versions of TopazPlus are © dMG/t!s^dS!

      P0T-NOoDLE is © Leo "Nudel" Davidson
      ttf, fon, eot, raw & psf v1/v2 versions are © dMG/t!s^dS!

      MicroKnight is © Niels Krogh "Nölb/Grafictive" Mortensen
      ttf, fon, eot, raw & psf v1/v2 versions of MicroKnight are © dMG/t!s^dS!
      ttf, fon, eot, raw & psf v1/v2 versions of MicroKnightPlus are
      © dMG/t!s^dS!

      mO'sOul is © Desoto/Mo'Soul
      ttf, fon, eot, raw & psf v1/v2 versions are © dMG/t!s^dS!
