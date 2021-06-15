## Overview

These are some tools written in Python that are required to build the example
game and can be used in new projects.

This reference should complement both the command line help available in all
tools (with `-h` flag), and the example game itself.

## Data conversion tools

### png2tiles.py

TODO

### png2sprites.py

The tool converts an image that is a multiple of 16x16 into a sprite (or
sprites), to be used by [ubox's sprite functions](ubox-lib-ref.html#sprite-functions).

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

Use `-h` for the full list of options.

### map.py

TODO

## Build helpers

### chksize

TODO

### mkdeps.py

TODO

