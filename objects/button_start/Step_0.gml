/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 


if (instance_position(mouse_x,mouse_y,self)) {

	sprite_index = start_hlt;
	if (mouse_check_button(mb_left)) {
		butt_click = instance_position(mouse_x,mouse_y,self);
		sprite_index = start_ban;
		if (mouse_check_button_pressed(mb_left) && instance_position(mouse_x,mouse_y,self)) {
			
			if (global.money >= 50) {
				global.money -= 50;
			audio_play_sound(click,0,false);
			audio_play_sound(clinking,0,false);
				
				ds_list_add(textbox_manager.textbox_ls," ");
				ds_list_add(textbox_manager.textbox_ls,"The stake for this");
				ds_list_add(textbox_manager.textbox_ls,"round is... 50 Golds!");
			audio_play_sound(notice,0,false);
				
				alarm[0] = 0.5 * room_speed;
			} else {
			
				ds_list_add(textbox_manager.textbox_ls," ");
				ds_list_add(textbox_manager.textbox_ls,"Hey! You do not have");
				ds_list_add(textbox_manager.textbox_ls,"enough money. Casino");
				ds_list_add(textbox_manager.textbox_ls,"do not accept poors.");
			audio_play_sound(notice,0,false);
			}
		}
			
	}


} else {
	sprite_index = start_def;
	

}


