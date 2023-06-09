#!/usr/bin/env python3
#
# Copyright (C) 2018-2023 by Juan J. Martinez <jjm@usebox.net>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#

__version__ = "1.0"

import sys
from argparse import ArgumentParser
from PIL import Image
from collections import defaultdict

DEF_W = 8
DEF_H = 8

# TOSHIBA palette
MSX_COLS = [
    (255, 0, 255),
    (0, 0, 0),
    (102, 204, 102),
    (136, 238, 136),
    (68, 68, 221),
    (119, 119, 255),
    (187, 85, 85),
    (119, 221, 221),
    (221, 102, 102),
    (255, 119, 119),
    (204, 204, 85),
    (238, 238, 136),
    (85, 170, 85),
    (187, 85, 187),
    (204, 204, 204),
    (238, 238, 238),
]


def main():

    parser = ArgumentParser(
        description="PNG to SCR file",
        epilog="Copyright (C) 2018-2023 Juan J Martinez <jjm@usebox.net>",
    )

    parser.add_argument(
        "--version", action="version", version="%(prog)s " + __version__
    )

    parser.add_argument("image", help="image to convert")

    args = parser.parse_args()

    try:
        image = Image.open(args.image)
    except IOError:
        parser.error("failed to open the image")

    if image.mode != "RGB":
        parser.error("not a RGB image")

    (w, h) = image.size

    if w % 256 or h % 192:
        parser.error("%s size is not 256x192" % args.image)

    data = image.getdata()

    color_idx = defaultdict(list)
    color = []
    out = []
    ntiles = 0
    for y in range(0, h, DEF_H):
        for x in range(0, w, DEF_W):
            # tile data
            tile = [
                data[x + i + ((y + j) * w)] for j in range(DEF_H) for i in range(DEF_W)
            ]

            # get the attibutes of the tile
            # FIXME: this may not be right
            for i in range(0, len(tile), DEF_W):
                cols = list(sorted(set(tile[i : i + DEF_W])))

                if len(cols) > 2:
                    parser.error(
                        "tile %d (%d, %d) has more than two colors: %r"
                        % (ntiles, x, y, cols)
                    )
                elif len(cols) == 1:
                    cols.append(MSX_COLS[1])

                for c in cols:
                    if c not in MSX_COLS:
                        parser.error(
                            "tile %d (%d, %d) has a color not in the MSX palette: %r"
                            % (ntiles, x, y, c)
                        )

                # each tile has two coloributes per row
                color_idx[ntiles * DEF_H + i // DEF_W] = cols
                color.append((MSX_COLS.index(cols[1]) << 4) | MSX_COLS.index(cols[0]))

            frame = []
            for i in range(0, len(tile), 8):
                byte = 0
                p = 7
                for k in range(8):
                    # 0 or 1 is determined by the order in the coloributes for that row
                    byte |= (
                        color_idx[ntiles * DEF_H + i // DEF_W].index(tile[i + k]) << p
                    )
                    p -= 1

                frame.append(byte)
            ntiles += 1
            out.extend(frame)

    sys.stdout.buffer.write(bytes(out))
    sys.stdout.buffer.write(bytes(color))


if __name__ == "__main__":
    main()
