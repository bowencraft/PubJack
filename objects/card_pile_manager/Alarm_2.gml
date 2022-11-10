/// @description Discard
// 你可以在此编辑器中写入代码 
if (discard_count < amount) {
	discarding_card = pile[|discard_count];
	audio_play_sound(flipcard,0,false);
	discarding_card.goal_x = init_x;
	discarding_card.goal_y = init_y - card_interval * discard_count;
	discarding_card.shown = false;
	discarding_card.depth = (amount*2 - discard_count);
	discard_count ++;
	alarm[2] = 0.1 * room_speed;
	show_debug_message("discarded")
} else {
	show_debug_message("destroying")
	alarm[1] = 1 * room_speed;
}



