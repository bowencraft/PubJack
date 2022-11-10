/// @description Shuffle
// 你可以在此编辑器中写入代码 
if (shuffle_count < amount) {
	audio_play_sound(flipcard,0,false);
	pile[|shuffle_count].depth = (-amount - shuffle_count);
	shuffle_count ++;
	
	show_debug_message("shuffling")
	alarm[3] = 0.1* room_speed;
} else {
	deal_num = amount;
	restarting = false;
	dealed = false;
	show_debug_message("shuffled")
}



