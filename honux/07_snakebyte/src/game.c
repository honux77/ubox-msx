#include "ubox.h"
#include "game.h"
#include "util.h"
#include <string.h>

//256 * 168 화면 생성
#define TILE_WIDTH 8
#define MAP_WIDTH 30
#define MAP_HEIGHT 20
#define INIT_SPEED 7

struct Rect
{
	uint8_t x1;
	uint8_t y1;
	uint8_t x2;
	uint8_t y2;
};

typedef struct Point
{
	uint8_t x;
	uint8_t y;	
}Point;

typedef enum
{
	LEFT = 0,
	RIGHT,
	UP,
	DOWN
} eDirection;

typedef enum
{
	NOTHING = 0,
	FROG,
	SNAKE
} eObject;

typedef struct SnakeNode
{
	int dir;
	char x;
	char y;
	struct SnakeNode *next;
} SnakeNode;

int g_score = 0; //획득점수
int g_high_score = 0; //최고점수
uint8_t g_score_text[10] = "SCORE 000";
uint8_t g_high_score_text[9] = "HIGH 000";
int step_time = 10;
char g_objMap[MAP_HEIGHT][MAP_WIDTH];

extern uint8_t g_gamestate;

long g_next_step = 0;		//조각 이동가능한 시간. 현재시간이 이 값을 넘으면 조각을 이동시킨다.

SnakeNode *g_player = 0;

void InitGame();
void ProcessLogic(SnakeNode *player);
void GenerateNewFrog(Point* point);
void DrawBackground();
void DrawScore();
void DrawHighScore();

void DrawScore() {
	int num = g_score;
	for (int i = 8; i >= 6; i--) {			
		g_score_text[i] = (num % 10) + '0';
		num /= 10;
	}	
	put_text(MAP_WIDTH - 9, 0, g_score_text); 
}
void DrawHighScore() {
	if (g_score > g_high_score) {
		g_high_score = g_score;
	}
	int num = g_high_score;

	for (int i = 7; i >= 5; i--) {			
		g_high_score_text[i] = (num % 10) + '0';
		num /= 10;
	}	
	put_text(MAP_WIDTH - 22, 0, g_high_score_text); 
}

void run_game()
{
	g_gamestate = STATE_IN_GAME;

	InitGame();
	ubox_disable_screen();
	ubox_fill_screen(WHITESPACE_TILE);
	DrawBackground();
	ubox_enable_screen();

	while (1)
	{
		ProcessLogic(g_player);		
		ubox_wait();

		if (g_gamestate == STATE_GAME_OVER)
			break;
	}
}

struct Point g_frog;



void InitGame()
{
	srand(now());
	g_score = 0;
	step_time = INIT_SPEED;

	g_player = malloc(sizeof(SnakeNode));
	g_player->dir = rand() % 4; //초기 방향

	g_player->x = MAP_WIDTH / 2;
	g_player->y = MAP_HEIGHT / 2;
	g_player->next = NULL;

	int i, j;
	for (i = 0; i < MAP_HEIGHT; i++)
	{
		for (j = 0; j < MAP_WIDTH; j++)
		{
			g_objMap[i][j] = NOTHING;
		}
	}	

	GenerateNewFrog(&g_frog);
	g_next_step = now() + step_time;	
}

SnakeNode* MoveBody(SnakeNode *node, int xPos, int yPos) 
{
    if (node->next == NULL) 
	{
        g_objMap[node->y][ node->x] = NOTHING;
    }
    else 
	{
        node->next = MoveBody(node->next, node->x, node->y);
    }
    node->x = xPos;
    node->y = yPos;
    return node;
}


void GenerateNewFrog(Point* point)
{		
	do
	{
		point->x = (int)(rand() % (MAP_WIDTH - 1));
		point->y = (int)(rand() % (MAP_HEIGHT - 1));

	} while (g_objMap[point->y][point->x] != NOTHING);
	g_objMap[point->y][point->x] = FROG;

}

char CheckWall(SnakeNode *player)
{	
	char result = 1;
	if (player->dir == LEFT)
	{
		if (player->x > 0)		
			result = 0;				
	}
	else if (player->dir == RIGHT)
	{
		if (player->x < MAP_WIDTH - 1)
			result = 0;		
	}
	else if (player->dir == UP)
	{
		if (player->y > 0)		
			result = 0;		
	}
	else if (player->dir == DOWN)
	{
		if (player->y < MAP_HEIGHT - 1)			
			result = 0;		
	}

	return result;
}

void ProcessLogic(SnakeNode *player)
{
	if (g_gamestate != STATE_IN_GAME)
		return;
	
	char x_offset = 0;
	char y_offset = 0;

	switch(ubox_read_keys(8))
	{
	case UBOX_MSX_KEY_LEFT:
		player->dir = LEFT;
		break;
	case UBOX_MSX_KEY_RIGHT:
		player->dir = RIGHT;
		break;
	case UBOX_MSX_KEY_UP:
		player->dir = UP;
		break;
	case UBOX_MSX_KEY_DOWN:
		player->dir = DOWN;
		break;
	}

	switch(ubox_read_ctl(UBOX_MSX_CTL_PORT1)) {
	case UBOX_MSX_CTL_LEFT:
		player->dir = LEFT;
		break;
	case UBOX_MSX_CTL_DOWN:
		player->dir = DOWN;
		break;
	case UBOX_MSX_CTL_RIGHT:
		player->dir = RIGHT;
		break;	
	case UBOX_MSX_CTL_UP:
		player->dir = UP;
		break;
	}

	switch(player->dir)
	{
	case LEFT:
		x_offset = -1;
		break;
	case RIGHT:			
		x_offset = 1;
		break;
	case UP:			
		y_offset = -1;
		break;
	case DOWN:			
		y_offset = 1;
		break;
	}

	if (now() > g_next_step)
	{		
		
		if(CheckWall(player))
		{
			g_gamestate = STATE_GAME_OVER;
			return;
		}			

		char pos_x = player->x;
		char pos_y = player->y;
		char next_pos_x = player->x + x_offset;
		char next_pos_y = player->y + y_offset;

		char objectType = g_objMap[next_pos_y][next_pos_x];
		SnakeNode *tail = player; // 뱀의 마지막 부분을 찾는다
		while (tail->next != NULL)
		{
			tail = tail->next;
		}

		int tail_x = tail->x;
		int tail_y = tail->y;

		switch (objectType)
		{
		case FROG:					
			g_score++;
			if (g_score > 0 && g_score % 3 == 0) {
				step_time -= 1;
			if (step_time < 1)
				step_time = 1;
			}

			DrawScore();				
			DrawHighScore();	
			MoveBody(player, next_pos_x, next_pos_y);
			
			SnakeNode *newNode = malloc(sizeof(SnakeNode));
			newNode->x = tail_x;
			newNode->y = tail_y;

			newNode->dir = tail->dir;
			newNode->next = NULL;
			tail->next = newNode;

			GenerateNewFrog(&g_frog);						

			break;
		case SNAKE:
			g_gamestate = STATE_GAME_OVER;
			break;
		default:
			MoveBody(player, next_pos_x, next_pos_y);
			RenderTile(tail_x + 1, tail_y + 1, BLACK_TILE); 
			break;
		}

		g_objMap[next_pos_y][next_pos_x] = SNAKE;
		g_next_step = now() + step_time;
								
		RenderTile(g_frog.x + 1, g_frog.y + 1, GREEN_TILE);

		if(g_score > 0)
			RenderTile(pos_x + 1, pos_y + 1, YELLOW_TILE);  	

		RenderTile(next_pos_x + 1, next_pos_y + 1, WHITE_TILE); 
	}
}

void DrawBackground()
{
	for (int index = 0; index < MAP_WIDTH + 1; index++)
		RenderTile(index, 0, 77);

	for (int index = 0; index < MAP_WIDTH + 2; index++)
		RenderTile(index, MAP_HEIGHT + 1, 77);

	for (int index = 1; index < MAP_HEIGHT + 1; index++)
		RenderTile(0, index, 77);

	for (int index = 0; index < MAP_HEIGHT + 1; index++)
		RenderTile(MAP_WIDTH + 1, index, 77);
	DrawScore();
	DrawHighScore();
}