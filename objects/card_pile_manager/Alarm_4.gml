/// @description add money 
// 你可以在此编辑器中写入代码 

if (global.money < goal_money) {
	global.money += 2;
	audio_play_sound(clinking,0,false);
	alarm[4] = 0.1*room_speed;
} else {
	room_goto(Room_Start);
	
}


