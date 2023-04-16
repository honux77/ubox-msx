#include <stdint.h>
#include "ubox.h"
#include "mplayer.h"
#include "util.h"

#define LOCAL
#include "tiles.h"

extern uint8_t SONG[];

#define WHITESPACE_TILE 129
#define HC 15
#define VC 11
#define TITLE "MUSIC : ALIENALL"

void main()
{
    
    ubox_init_isr(2);

    ubox_set_mode(2);
  
    ubox_set_colors(1, 1, 1);

    ubox_disable_screen();

    ubox_set_tiles(tiles);
    ubox_set_tiles_colors(tiles_colors);
  
    ubox_fill_screen(WHITESPACE_TILE);    
	put_text_hc(VC, TITLE);		    
    put_text_hc(VC + 2, "PRESS ESC TO STOP");
    ubox_enable_screen();

    mplayer_init(SONG, 0);
  
    ubox_set_user_isr(mplayer_play);

	mplayer_play();

    while (1)
    {	
        if (ubox_read_keys(7) == UBOX_MSX_KEY_ESC)
        {
            put_text_hc(VC, "SORRY, CAN'T STOP PLAYING MUSIC");
            mplayer_stop();
            break;
        }
        ubox_wait();
    }
}
