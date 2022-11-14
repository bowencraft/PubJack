/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 

if (ai_count < ds_list_size(ai_shown_pile)) {
	ai_shown_pile[|ai_count].goal_x = ai_reveal_x;
	ai_shown_pile[|ai_count].goal_y = ai_reveal_y;
	ai_point += ai_shown_pile[|ai_count].card_point;
		
	ai_count ++;
	ai_reveal_x += deal_interval;
	
	alarm[1] = 0.2 * room_speed;
} else {
	player_reveal = true;
}



