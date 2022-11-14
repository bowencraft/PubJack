/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 


if (player_count < ds_list_size(player_shown_pile)) {
	player_shown_pile[|player_count].goal_x = player_reveal_x;
	player_shown_pile[|player_count].goal_y = player_reveal_y;
	player_point += player_shown_pile[|player_count].card_point;
		
	player_count ++;
	player_reveal_x += deal_interval;
	
	alarm[2] = 0.2 * room_speed;
} else {
	player_reveal = true;
}





