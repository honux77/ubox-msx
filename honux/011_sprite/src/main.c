#include "ubox.h"

#define LOCAL
#include "tiles.h"

#define WHITESPACE_TILE 129

void put_text(uint8_t x, uint8_t y, const uint8_t *text)
{
    while (*text)
        ubox_put_tile(x++, y, *text++ + 128 - 31);
}

void main()
{

    ubox_init_isr(2);

    ubox_set_mode(2);

    ubox_set_colors(1, 1, 1);

    ubox_disable_screen();

    ubox_set_tiles(tiles);
    ubox_set_tiles_colors(tiles_colors);

    ubox_fill_screen(WHITESPACE_TILE);
    put_text(0, 1, "HELLO MAC & MSX!!");

    for (int i = 0; i < 256; i++)
    {
        ubox_put_tile(i % 32, i / 32 + 2, i);
    }
    put_text(8, 11, "SPRITE TEST END");

    ubox_enable_screen();

    while (1)
    {
        ubox_wait();
    }
}
