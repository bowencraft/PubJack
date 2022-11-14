/// @description ai settle
// 你可以在此编辑器中写入代码 


if (ai_count < ds_list_size(ai_shown_pile)) {
	if (ai_shown_pile[|ai_count].card_point == 1) {
		ai_shown_pile[|ai_count].goal_x = ai_reveal_x;
		ai_shown_pile[|ai_count].goal_y = ai_reveal_y;
		ai_have_a = true;
	
	} else if (ai_shown_pile[|ai_count].card_point == 11 ||
	ai_shown_pile[|ai_count].card_point == 12 ||
	ai_shown_pile[|ai_count].card_point == 13) {
		ai_shown_pile[|ai_count].goal_x = ai_reveal_x;
		ai_shown_pile[|ai_count].goal_y = ai_reveal_y;
		ai_point += 10;
		
	} else {
		ai_shown_pile[|ai_count].goal_x = ai_reveal_x;
		ai_shown_pile[|ai_count].goal_y = ai_reveal_y;
		ai_point += ai_shown_pile[|ai_count].card_point;
	
	} 
		
	ai_count ++;
	ai_reveal_x += deal_interval;
	
	alarm[1] = 0.2 * room_speed;
} else {
	if (ai_have_a) {
		if (ai_point + 11 <= 21) {
			ai_point += 11;
		} else {
			ai_point += 1;
		}
	}
	
	ds_list_add(textbox_manager.textbox_ls,"PC's point: " + string(ai_point));
	if (ai_point >21) {
		ds_list_add(textbox_manager.textbox_ls,"PC Busted.");
	}
				audio_play_sound(notice,0,false);
	player_reveal = true;
}



