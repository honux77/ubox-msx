#include <stdint.h>
#include "ubox.h"
#include "util.h"

inline int strlen(const uint8_t *text) {
    int n = 0;
    while (*text) { 
        n++;
        text++;
    }
    return n;
}

inline int getHC(const uint8_t *text) {
    int ret =  HC - strlen(text) / 2;
    if (ret > 0) return ret;
    else return 0;
}

void put_text(uint8_t x, uint8_t y, const uint8_t *text)
{
    while (*text)
        ubox_put_tile(x++, y, *text++ + 128 - 31);
}

void put_text_hc(uint8_t y, const uint8_t *text)
{
    int x = getHC(text);
    while (*text)
        ubox_put_tile(x++, y, *text++ + 128 - 31);
}