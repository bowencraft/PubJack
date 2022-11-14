/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 


if (instance_position(mouse_x,mouse_y,self)) {

	sprite_index = back_hlt;
	if (mouse_check_button(mb_left)) {
		butt_click = instance_position(mouse_x,mouse_y,self);
		sprite_index = back_ban;
		if (mouse_check_button_pressed(mb_left) && instance_position(mouse_x,mouse_y,self)) {
			
			audio_play_sound(click,0,false);
			room_goto(Room_Start);
		}
			
	}


} else {
	sprite_index = back_def;
	

}


