/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 

if (card_pile_manager.player_deal_phase) {
	if (instance_position(mouse_x,mouse_y,self)) {

		sprite_index = sus_hlt;
		if (mouse_check_button(mb_left)) {
			
			audio_play_sound(click,0,false);
			butt_click = instance_position(mouse_x,mouse_y,self);
			sprite_index = sus_ban;
			
		}


	} else {
		sprite_index = sus_def;
	

	}

} else {
	sprite_index = sus_ban;
}

