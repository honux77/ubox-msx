M:game
F:G$draw_map$0_0$0({2}DF,SV:S),C,0,0,0,0,0
S:Lgame.draw_map$y$2_0$33({2}SI:S),R,0,0,[c,b]
S:Lgame.draw_map$x$4_0$35({2}SI:S),B,1,-2
S:Lgame.draw_map$sloc0$0_1$0({2}SI:S),B,1,-2
F:G$run_game$0_0$0({2}DF,SV:S),Z,0,0,0,0,0
F:G$ResetStage$0_0$0({2}DF,SV:S),C,0,0,0,0,0
S:Lgame.ResetStage$y$2_0$41({2}SI:S),R,0,0,[c,b]
S:Lgame.ResetStage$x$4_0$43({2}SI:S),B,1,-2
S:Lgame.ResetStage$sloc0$0_1$0({2}SI:S),B,1,-2
F:Fgame$GetBrickCount$0_0$0({2}DF,SI:S),C,0,0,0,0,0
S:Lgame.GetBrickCount$remainBlocksCount$1_0$45({2}SI:S),R,0,0,[c,b]
S:Lgame.GetBrickCount$y$2_0$46({2}SI:S),R,0,0,[e,d]
S:Lgame.GetBrickCount$x$4_0$48({2}SI:S),B,1,-2
S:Lgame.GetBrickCount$sloc0$0_1$0({2}SI:S),B,1,-2
F:G$ResetBall$0_0$0({2}DF,SV:S),C,0,0,0,0,0
F:G$ProcessInput$0_0$0({2}DF,SV:S),C,0,0,0,0,0
S:Lgame.ProcessInput$paddle_posx$1_0$52({2}SI:S),B,1,2
F:G$RandomBallSpeed$0_0$0({2}DF,SV:S),C,0,0,0,0,0
F:G$ProcessBall$0_0$0({2}DF,SV:S),Z,0,4,0,0,0
S:Lgame.ProcessBall$rect$1_0$55({4}STRect:S),B,1,-26
S:Lgame.ProcessBall$y$2_0$61({2}SI:S),B,1,-4
S:Lgame.ProcessBall$x$4_0$63({2}SI:S),B,1,-2
S:Lgame.ProcessBall$rect$6_0$65({4}STRect:S),B,1,-22
S:Lgame.ProcessBall$result$6_1$66({1}SC:S),R,0,0,[c]
S:Lgame.ProcessBall$sloc0$0_1$0({2}DD,STRect:S),B,1,-18
S:Lgame.ProcessBall$sloc1$0_1$0({2}DD,STRect:S),B,1,-16
S:Lgame.ProcessBall$sloc2$0_1$0({2}DD,STRect:S),B,1,-14
S:Lgame.ProcessBall$sloc3$0_1$0({2}SI:S),B,1,-4
S:Lgame.ProcessBall$sloc4$0_1$0({2}SI:S),B,1,-2
S:Lgame.ProcessBall$sloc5$0_1$0({2}SI:S),B,1,-12
S:Lgame.ProcessBall$sloc6$0_1$0({2}DD,DA5d,SC:S),B,1,-6
S:Lgame.ProcessBall$sloc7$0_1$0({2}DD,SC:S),B,1,-10
S:Lgame.ProcessBall$sloc8$0_1$0({2}DG,STRect:S),B,1,-8
S:Lgame.ProcessBall$sloc9$0_1$0({2}SI:S),B,1,-6
S:Lgame.ProcessBall$sloc10$0_1$0({2}SI:S),B,1,-6
F:G$CheckGameEnd$0_0$0({2}DF,SV:S),Z,0,0,0,0,0
F:G$InitGame$0_0$0({2}DF,SV:S),Z,0,0,0,0,0
S:Lgame.InitGame$screen_width$1_0$71({2}SI:S),B,1,2
S:Lgame.InitGame$screen_height$1_0$0({2}SI:S),B,1,4
F:G$ProcessLogic$0_0$0({2}DF,SV:S),Z,0,0,0,0,0
S:Lgame.ProcessLogic$mouse_posx$1_0$73({2}SI:S),B,1,2
F:G$DrawWorld$0_0$0({2}DF,SV:S),Z,0,0,0,0,0
S:Lgame.DrawWorld$y$2_0$76({2}SI:S),R,0,0,[c,b]
S:Lgame.DrawWorld$x$4_0$78({2}SI:S),B,1,-2
S:Lgame.DrawWorld$sloc0$0_1$0({2}SI:S),B,1,-4
S:Lgame.DrawWorld$sloc1$0_1$0({2}SI:S),B,1,-2
T:Fgame$BallInfo[({0}S:S$vel_x$0_0$0({2}SI:S),Z,0,0)({2}S:S$vel_y$0_0$0({2}SI:S),Z,0,0)({4}S:S$x$0_0$0({2}SI:S),Z,0,0)({6}S:S$y$0_0$0({2}SI:S),Z,0,0)({8}S:S$radius$0_0$0({1}SC:U),Z,0,0)]
T:Fgame$Rect[({0}S:S$x1$0_0$0({1}SC:U),Z,0,0)({1}S:S$y1$0_0$0({1}SC:U),Z,0,0)({2}S:S$x2$0_0$0({1}SC:U),Z,0,0)({3}S:S$y2$0_0$0({1}SC:U),Z,0,0)]
T:Fgame$sprite_attr[({0}S:S$y$0_0$0({1}SC:U),Z,0,0)({1}S:S$x$0_0$0({1}SC:U),Z,0,0)({2}S:S$pattern$0_0$0({1}SC:U),Z,0,0)({3}S:S$attr$0_0$0({1}SC:U),Z,0,0)]
S:G$g_pat_base$0_0$0({1}SC:U),E,0,0
S:G$g_screen_width$0_0$0({2}SI:S),E,0,0
S:G$g_screen_height$0_0$0({2}SI:S),E,0,0
S:G$g_paddle_posx$0_0$0({2}SI:S),E,0,0
S:G$g_paddle_posy$0_0$0({2}SI:S),E,0,0
S:G$ubox_tick$0_0$0({1}SC:U),E,0,0
S:G$g_ball$0_0$0({9}STBallInfo:S),E,0,0
S:G$g_bricks$0_0$0({50}DA10d,DA5d,SC:S),E,0,0
S:G$g_bricks_dirty_map$0_0$0({50}DA10d,DA5d,SC:S),E,0,0
S:G$g_gamestate$0_0$0({1}SC:U),E,0,0
S:G$sp$0_0$0({4}STsprite_attr:S),E,0,0
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
S:G$ubox_set_sprite_pat16$0_0$0({2}DF,SV:S),C,0,0
S:G$ubox_set_sprite_pat16_flip$0_0$0({2}DF,SV:S),C,0,0
S:G$ubox_set_sprite_attr$0_0$0({2}DF,SV:S),C,0,0
S:G$ubox_select_ctl$0_0$0({2}DF,SC:U),C,0,0
S:G$ubox_read_ctl$0_0$0({2}DF,SC:U),C,0,0
S:G$ubox_read_keys$0_0$0({2}DF,SC:U),C,0,0
S:G$spman_init$0_0$0({2}DF,SV:S),C,0,0
S:G$spman_alloc_pat$0_0$0({2}DF,SC:U),C,0,0
S:G$spman_alloc_fixed_sprite$0_0$0({2}DF,SV:S),C,0,0
S:G$spman_alloc_sprite$0_0$0({2}DF,SV:S),C,0,0
S:G$spman_sprite_flush$0_0$0({2}DF,SV:S),C,0,0
S:G$spman_update$0_0$0({2}DF,SV:S),C,0,0
S:G$spman_hide_all_sprites$0_0$0({2}DF,SV:S),C,0,0
S:G$InitEnvironment$0_0$0({2}DF,SV:S),C,0,0
S:G$RenderTile$0_0$0({2}DF,SV:S),C,0,0
S:G$RenderBlock$0_0$0({2}DF,SV:S),C,0,0
S:G$put_text$0_0$0({2}DF,SV:S),C,0,0
S:G$now$0_0$0({2}DF,SI:S),C,0,0
S:G$my_isr$0_0$0({2}DF,SV:S),C,0,0
S:G$InRect$0_0$0({2}DF,SI:S),C,0,0
S:G$EraseTiles$0_0$0({2}DF,SV:S),C,0,0
S:G$draw_map$0_0$0({2}DF,SV:S),C,0,0
S:G$ResetStage$0_0$0({2}DF,SV:S),C,0,0
S:Fgame$GetBrickCount$0_0$0({2}DF,SI:S),C,0,0
S:G$ResetBall$0_0$0({2}DF,SV:S),C,0,0
S:G$ProcessInput$0_0$0({2}DF,SV:S),C,0,0
S:G$RandomBallSpeed$0_0$0({2}DF,SV:S),C,0,0