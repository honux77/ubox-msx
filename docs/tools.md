## Overview

These are some tools written in Python that are required to build the example
game and can be used in new projects.

This reference should complement both the command line help available in all
tools (with `-h` flag), and the example game itself.

## Data conversion tools

### png2tiles.py

This tool converts an image in PNG RGB image into a tileset of up to 256 tiles.

The image is expected to use an approximation to RGB for the colours in the
Toshiba palette.

| Palette index | RGB value | Notes |
| --- | --- | --- |
| 0 | 255, 0, 255 | Transparent |
| 1| 0,   0,   0 | |
| 2 | 102, 204, 102 | |
| 3 | 136, 238, 136 | |
| 4 | 68,  68, 221 | |
| 5 | 119, 119, 255 | |
| 6 | 187,  85,  85 | |
| 7 | 119, 221, 221 | |
| 8 | 221, 102, 102 | |
| 9 | 255, 119, 119 | |
| 10 | 204, 204,  85 | |
| 11 | 238, 238, 136 | |
| 12 | 85, 170,  85 | |
| 13 | 187,  85, 187 | |
| 14 | 204, 204, 204 | |
| 15 | 238, 238, 238 | |

Any other colour will result in an error converting the image.

The tool ensures that the tiles follow the *screen 2* mode restrictions: 2
colours per line on each 8x8 tile.

By default the generated file will include a colour map, with `ID_colors` as
identifier (if the default "tiles" is used, the table will use `tiles_colors`).

The colour table can be omitted using the `--no-colors` flag.

Example of use:
```
png2tiles.py tiles.png > tiles.h
```
This will result in a C include output. To generate assembler, use `--asm` flag.

The output can be used with [ubox_set_tiles](ubox-lib-ref.html#ubox_set_tiles) and
[ubox_set_tiles_colors](ubox-lib-ref.html#ubox_set_tiles_colors), and the rest
of the [tiles functions](ubox-lib-ref.html#tile-functions).

### png2sprites.py

This tool converts a PNG RGB image that is a multiple of 16x16 into a sprite
(or sprites), to be used by [ubox's sprite
functions](ubox-lib-ref.html#sprite-functions).

The result is 1 bit per pixel data without colour information. The colour will
be provided as part of the `attr` field in the `sprite_attr` struct when
calling [ubox_set_sprite_attr](ubox-lib-ref.html#ubox_set_sprite_attr).

The tool interprets dark grey (RGB: 28, 28, 28) as transparent in the MSX
palette, and any other colour will be used as visible the monochrome data. If
the image has more than one colour, it will be used to identify different
sprites.

For example:

![Example sprite with 2 colours per frame](images/player.png)

Will be translated into 6 sprites: 3 frames (16x16) with 2 sprites per frame,
corresponding to the sprite defined by the green colour and the sprite
defined by the white colour.

Usage following the example:
```
png2sprites.py -i player_sprite player.png > player.h
```

### map.py

TODO

## Build helpers

### chksize

TODO

### mkdeps.py

TODO

