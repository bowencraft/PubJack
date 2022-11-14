/// @description judge result 
// 你可以在此编辑器中写入代码 
	ds_list_add(textbox_manager.textbox_ls," ");

if ((player_point > ai_point && player_point <= 21) || (ai_point > 21 && player_point <= 21) ) {
	
	ds_list_add(textbox_manager.textbox_ls,"You winned!");
	ds_list_add(textbox_manager.textbox_ls,"You earned " + string(stake * 2) + " golds.");
				audio_play_sound(notice,0,false);
	goal_money = global.money + stake * 2;
	alarm[4] = 1* room_speed;
} else if (player_point == ai_point && player_point <= 21 ) {
	
	ds_list_add(textbox_manager.textbox_ls,"You got a tie.");
	ds_list_add(textbox_manager.textbox_ls,"You earned " + string(stake) + " golds.");
				audio_play_sound(notice,0,false);
	goal_money = global.money + stake;
	alarm[5] = 1* room_speed;
} else {
	
	ds_list_add(textbox_manager.textbox_ls,"You didn't win.");
	audio_play_sound(notice,0,false);
	room_goto(Room_Start);
}




