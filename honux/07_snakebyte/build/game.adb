M:game
F:G$run_game$0_0$0({2}DF,SV:S),Z,0,0,0,0,0
F:G$InitGame$0_0$0({2}DF,SV:S),Z,0,0,0,0,0
S:Lgame.InitGame$i$1_1$83({2}SI:S),R,0,0,[c,b]
S:Lgame.InitGame$j$1_1$83({2}SI:S),R,0,0,[e,d]
S:Lgame.InitGame$sloc0$0_1$0({2}DD,DA30d,SC:S),B,1,-4
S:Lgame.InitGame$sloc1$0_1$0({2}DD,SC:S),B,1,-2
F:G$MoveBody$0_0$0({2}DF,DG,STSnakeNode:S),C,0,-2,0,0,0
S:Lgame.MoveBody$node$1_0$88({2}DG,STSnakeNode:S),B,1,2
S:Lgame.MoveBody$xPos$1_0$88({2}SI:S),B,1,4
S:Lgame.MoveBody$yPos$1_0$88({2}SI:S),B,1,6
S:Lgame.MoveBody$sloc0$0_1$0({2}DG,DG,STSnakeNode:S),B,1,-9
S:Lgame.MoveBody$sloc1$0_1$0({2}DG,STSnakeNode:S),B,1,-7
S:Lgame.MoveBody$sloc2$0_1$0({2}DG,SC:S),B,1,-5
S:Lgame.MoveBody$sloc3$0_1$0({2}DG,SC:S),B,1,-3
S:Lgame.MoveBody$sloc4$0_1$0({1}SC:S),B,1,-1
S:Lgame.MoveBody$sloc5$0_1$0({2}DG,STSnakeNode:S),B,1,-7
F:G$GenerateNewFrog$0_0$0({2}DF,SV:S),Z,0,0,0,0,0
S:Lgame.GenerateNewFrog$randy$1_0$92({1}SC:S),R,0,0,[c]
S:Lgame.GenerateNewFrog$randx$1_0$92({1}SC:S),R,0,0,[e]
F:G$CheckWall$0_0$0({2}DF,SC:S),C,0,0,0,0,0
S:Lgame.CheckWall$player$1_0$94({2}DG,STSnakeNode:S),B,1,2
S:Lgame.CheckWall$result$1_0$95({1}SC:S),B,1,-1
S:Lgame.CheckWall$sloc0$0_1$0({1}SC:S),B,1,-1
F:G$inputKey$0_0$0({2}DF,SV:S),Z,0,0,0,0,0
F:G$ProcessLogic$0_0$0({2}DF,SV:S),Z,0,-2,0,0,0
S:Lgame.ProcessLogic$player$1_0$101({2}DG,STSnakeNode:S),B,1,2
S:Lgame.ProcessLogic$x_offset$2_1$104({1}SC:S),B,1,-2
S:Lgame.ProcessLogic$y_offset$2_1$104({1}SC:S),B,1,-1
S:Lgame.ProcessLogic$next_pos_x$2_2$108({1}SC:S),B,1,-8
S:Lgame.ProcessLogic$next_pos_y$2_2$108({1}SC:S),B,1,-7
S:Lgame.ProcessLogic$objectType$2_2$108({1}SC:S),R,0,0,[a]
S:Lgame.ProcessLogic$tail$3_3$110({2}DG,STSnakeNode:S),R,0,0,[c,b]
S:Lgame.ProcessLogic$new_node_x$3_4$112({2}SI:S),R,0,0,[]
S:Lgame.ProcessLogic$new_node_y$3_4$112({2}SI:S),R,0,0,[]
S:Lgame.ProcessLogic$newNode$3_5$113({2}DG,STSnakeNode:S),R,0,0,[e,d]
S:Lgame.ProcessLogic$sloc0$0_1$0({1}SC:S),B,1,-2
S:Lgame.ProcessLogic$sloc1$0_1$0({1}SC:S),B,1,-1
S:Lgame.ProcessLogic$sloc2$0_1$0({2}DG,STSnakeNode:S),B,1,-10
S:Lgame.ProcessLogic$sloc3$0_1$0({1}SC:S),B,1,-8
S:Lgame.ProcessLogic$sloc4$0_1$0({1}SC:S),B,1,-7
S:Lgame.ProcessLogic$sloc5$0_1$0({2}DD,SC:S),B,1,-6
S:Lgame.ProcessLogic$sloc6$0_1$0({2}DG,DG,STSnakeNode:S),B,1,-4
S:Lgame.ProcessLogic$sloc7$0_1$0({1}SC:S),B,1,-2
S:Lgame.ProcessLogic$sloc8$0_1$0({1}SC:S),B,1,-1
F:G$DrawObject$0_0$0({2}DF,SV:S),Z,0,-3,0,0,0
S:Lgame.DrawObject$c$1_0$114({1}SC:U),B,1,-3
S:Lgame.DrawObject$row$2_0$115({1}SC:U),B,1,-2
S:Lgame.DrawObject$col$4_0$117({1}SC:U),B,1,-1
S:Lgame.DrawObject$sloc0$0_1$0({1}SC:U),B,1,-3
S:Lgame.DrawObject$sloc1$0_1$0({1}SC:U),B,1,-2
S:Lgame.DrawObject$sloc2$0_1$0({2}SI:U),B,1,-5
S:Lgame.DrawObject$sloc3$0_1$0({2}DD,DA30d,SC:S),B,1,-8
S:Lgame.DrawObject$sloc4$0_1$0({1}SC:U),B,1,-1
S:Lgame.DrawObject$sloc5$0_1$0({2}SI:S),B,1,-6
S:Lgame.DrawObject$sloc6$0_1$0({2}SI:S),B,1,-4
F:G$DrawBackground$0_0$0({2}DF,SV:S),Z,0,0,0,0,0
S:Lgame.DrawBackground$index$2_0$121({2}SI:S),R,0,0,[c,b]
S:Lgame.DrawBackground$index$2_0$122({2}SI:S),R,0,0,[c,b]
S:Lgame.DrawBackground$index$2_0$123({2}SI:S),R,0,0,[c,b]
S:Lgame.DrawBackground$index$2_0$124({2}SI:S),R,0,0,[c,b]
T:Fgame$SnakeNode[({0}S:S$dir$0_0$0({2}SI:S),Z,0,0)({2}S:S$x$0_0$0({1}SC:S),Z,0,0)({3}S:S$y$0_0$0({1}SC:S),Z,0,0)({4}S:S$next$0_0$0({2}DG,STSnakeNode:S),Z,0,0)]
T:Fgame$Rect[({0}S:S$x1$0_0$0({1}SC:U),Z,0,0)({1}S:S$y1$0_0$0({1}SC:U),Z,0,0)({2}S:S$x2$0_0$0({1}SC:U),Z,0,0)({3}S:S$y2$0_0$0({1}SC:U),Z,0,0)]
T:Fgame$sprite_attr[({0}S:S$y$0_0$0({1}SC:U),Z,0,0)({1}S:S$x$0_0$0({1}SC:U),Z,0,0)({2}S:S$pattern$0_0$0({1}SC:U),Z,0,0)({3}S:S$attr$0_0$0({1}SC:U),Z,0,0)]
T:Fgame$tm[({0}S:S$tm_sec$0_0$0({1}SC:U),Z,0,0)({1}S:S$tm_min$0_0$0({1}SC:U),Z,0,0)({2}S:S$tm_hour$0_0$0({1}SC:U),Z,0,0)({3}S:S$tm_mday$0_0$0({1}SC:U),Z,0,0)({4}S:S$tm_mon$0_0$0({1}SC:U),Z,0,0)({5}S:S$tm_year$0_0$0({2}SI:S),Z,0,0)({7}S:S$tm_wday$0_0$0({1}SC:U),Z,0,0)({8}S:S$tm_yday$0_0$0({2}SI:S),Z,0,0)({10}S:S$tm_isdst$0_0$0({1}SC:U),Z,0,0)({11}S:S$tm_hundredth$0_0$0({1}SC:U),Z,0,0)]
S:G$g_score$0_0$0({2}SI:S),E,0,0
S:G$step_time$0_0$0({2}SI:S),E,0,0
S:G$g_next_step$0_0$0({4}SL:S),E,0,0
S:G$g_key$0_0$0({2}SI:S),E,0,0
S:G$g_player$0_0$0({2}DG,STSnakeNode:S),E,0,0
S:G$ubox_tick$0_0$0({1}SC:U),E,0,0
S:G$g_objMap$0_0$0({600}DA20d,DA30d,SC:S),E,0,0
S:G$g_gamestate$0_0$0({1}SC:U),E,0,0
S:G$ubox_set_mode$0_0$0({2}DF,SV:S),C,0,0
S:G$ubox_enable_screen$0_0$0({2}DF,SV:S),C,0,0
S:G$ubox_disable_screen$0_0$0({2}DF,SV:S),C,0,0
S:G$ubox_set_colors$0_0$0({2}DF,SV:S),C,0,0
S:G$ubox_write_vm$0_0$0({2}DF,SV:S),C,0,0
S:G$ubox_read_vm$0_0$0({2}DF,SV:S),C,0,0
S:G$ubox_wvdp$0_0$0({2}DF,SV:S),C,0,0
S:G$ubox_get_vsync_freq$0_0$0({2}DF,SC:U),C,0,0
S:G$ubox_set_tiles$0_0$0({2}DF,SV:S),C,0,0
S:G$ubox_set_tiles_colors$0_0$0({2}DF,SV:S),C,0,0
S:G$ubox_put_tile$0_0$0({2}DF,SV:S),C,0,0
S:G$ubox_get_tile$0_0$0({2}DF,SC:U),C,0,0
S:G$ubox_fill_screen$0_0$0({2}DF,SV:S),C,0,0
S:G$ubox_init_isr$0_0$0({2}DF,SV:S),C,0,0
S:G$ubox_set_user_isr$0_0$0({2}DF,SV:S),C,0,0
S:G$ubox_wait$0_0$0({2}DF,SV:S),C,0,0
S:G$ubox_wait_for$0_0$0({2}DF,SV:S),C,0,0
S:G$ubox_reset_tick$0_0$0({2}DF,SV:S),C,0,0
S:G$ubox_set_sprite_pat8$0_0$0({2}DF,SV:S),C,0,0
S:G$ubox_set_sprite_pat8_flip$0_0$0({2}DF,SV:S),C,0,0
S:G$ubox_set_sprite_attr$0_0$0({2}DF,SV:S),C,0,0
S:G$ubox_set_sprite_pat16$0_0$0({2}DF,SV:S),C,0,0
S:G$ubox_set_sprite_pat16_flip$0_0$0({2}DF,SV:S),C,0,0
S:G$ubox_select_ctl$0_0$0({2}DF,SC:U),C,0,0
S:G$ubox_read_ctl$0_0$0({2}DF,SC:U),C,0,0
S:G$ubox_read_keys$0_0$0({2}DF,SC:U),C,0,0
S:G$time$0_0$0({2}DF,SL:U),C,0,0
S:G$gmtime$0_0$0({2}DF,DG,STtm:S),C,0,0
S:G$localtime$0_0$0({2}DF,DG,STtm:S),C,0,0
S:G$mktime$0_0$0({2}DF,SL:U),C,0,0
S:G$asctime$0_0$0({2}DF,DG,SC:S),C,0,0
S:G$ctime$0_0$0({2}DF,DG,SC:S),C,0,0
S:G$atof$0_0$0({2}DF,SF:S),C,0,0
S:G$atoi$0_0$0({2}DF,SI:S),C,0,0
S:G$atol$0_0$0({2}DF,SL:S),C,0,0
S:G$atoll$0_0$0({2}DF,SI:S),C,0,0
S:G$strtol$0_0$0({2}DF,SL:S),C,0,0
S:G$strtoul$0_0$0({2}DF,SL:U),C,0,0
S:G$_uitoa$0_0$0({2}DF,SV:S),C,0,0
S:G$_itoa$0_0$0({2}DF,SV:S),C,0,0
S:G$_ultoa$0_0$0({2}DF,SV:S),C,0,0
S:G$_ltoa$0_0$0({2}DF,SV:S),C,0,0
S:G$rand$0_0$0({2}DF,SI:S),C,0,0
S:G$srand$0_0$0({2}DF,SV:S),C,0,0
S:G$calloc$0_0$0({2}DF,DG,SV:S),C,0,0
S:G$malloc$0_0$0({2}DF,DG,SV:S),C,0,0
S:G$realloc$0_0$0({2}DF,DG,SV:S),C,0,0
S:G$free$0_0$0({2}DF,SV:S),C,0,0
S:G$bsearch$0_0$0({2}DF,DG,SV:S),C,0,0
S:G$qsort$0_0$0({2}DF,SV:S),C,0,0
S:G$abs$0_0$0({2}DF,SI:S),C,0,0
S:G$labs$0_0$0({2}DF,SL:S),C,0,0
S:G$mblen$0_0$0({2}DF,SI:S),C,0,0
S:G$mbtowc$0_0$0({2}DF,SI:S),C,0,0
S:G$wctomb$0_0$0({2}DF,SI:S),C,0,0
S:G$mbstowcs$0_0$0({2}DF,SI:U),C,0,0
S:G$wcstombs$0_0$0({2}DF,SI:U),C,0,0
S:G$put_text$0_0$0({2}DF,SV:S),C,0,0
S:G$RenderTile$0_0$0({2}DF,SV:S),C,0,0
S:G$now$0_0$0({2}DF,SI:S),C,0,0
S:G$my_isr$0_0$0({2}DF,SV:S),C,0,0
S:G$memccpy$0_0$0({2}DF,DG,SV:S),C,0,0
S:G$memcpy$0_0$0({2}DF,DG,SV:S),C,0,0
S:G$memmove$0_0$0({2}DF,DG,SV:S),C,0,0
S:G$strcpy$0_0$0({2}DF,DG,SC:S),C,0,0
S:G$strncpy$0_0$0({2}DF,DG,SC:S),C,0,0
S:G$strcat$0_0$0({2}DF,DG,SC:S),C,0,0
S:G$strncat$0_0$0({2}DF,DG,SC:S),C,0,0
S:G$strdup$0_0$0({2}DF,DG,SC:S),C,0,0
S:G$strndup$0_0$0({2}DF,DG,SC:S),C,0,0
S:G$memcmp$0_0$0({2}DF,SI:S),C,0,0
S:G$strcmp$0_0$0({2}DF,SI:S),C,0,0
S:G$strncmp$0_0$0({2}DF,SI:S),C,0,0
S:G$strxfrm$0_0$0({2}DF,SI:U),C,0,0
S:G$memchr$0_0$0({2}DF,DG,SV:S),C,0,0
S:G$strchr$0_0$0({2}DF,DG,SC:S),C,0,0
S:G$strcspn$0_0$0({2}DF,SI:U),C,0,0
S:G$strpbrk$0_0$0({2}DF,DG,SC:S),C,0,0
S:G$strrchr$0_0$0({2}DF,DG,SC:S),C,0,0
S:G$strspn$0_0$0({2}DF,SI:U),C,0,0
S:G$strstr$0_0$0({2}DF,DG,SC:S),C,0,0
S:G$strtok$0_0$0({2}DF,DG,SC:S),C,0,0
S:G$memset$0_0$0({2}DF,DG,SV:S),C,0,0
S:G$strlen$0_0$0({2}DF,SI:U),C,0,0
S:G$MoveBody$0_0$0({2}DF,DG,STSnakeNode:S),C,0,-2
S:G$CheckWall$0_0$0({2}DF,SC:S),C,0,0
