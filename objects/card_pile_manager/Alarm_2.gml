/// @description player settle 
// 你可以在此编辑器中写入代码 


if (player_count < ds_list_size(player_shown_pile)) {
	if (player_shown_pile[|player_count].card_point == 1) {
		player_shown_pile[|player_count].goal_x = player_reveal_x;
		player_shown_pile[|player_count].goal_y = player_reveal_y;
		player_have_a = true;
	
	} else if (player_shown_pile[|player_count].card_point == 11 ||
	player_shown_pile[|player_count].card_point == 12 ||
	player_shown_pile[|player_count].card_point == 13) {
		player_shown_pile[|player_count].goal_x = player_reveal_x;
		player_shown_pile[|player_count].goal_y = player_reveal_y;
		player_point += 10;
		
	} else {
		player_shown_pile[|player_count].goal_x = player_reveal_x;
		player_shown_pile[|player_count].goal_y = player_reveal_y;
		player_point += player_shown_pile[|player_count].card_point;
	
	} 
	
	player_count ++;
	player_reveal_x += deal_interval;
	
	alarm[2] = 0.2 * room_speed;
} else {
	if (player_have_a) {
		if (player_point + 11 <= 21) {
			player_point += 11;
		} else {
			player_point += 1;
		}
	}
	
	ds_list_add(textbox_manager.textbox_ls,"Player's point: " + string(player_point));
	if (player_point >21) {
		ds_list_add(textbox_manager.textbox_ls,"You Busted.");
	}
	player_reveal = true;
		
	alarm[3] = 1*room_speed;
}





