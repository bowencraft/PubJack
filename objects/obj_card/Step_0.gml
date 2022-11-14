/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 

if (shown) {
		//show_debug_message(string(card_type));
	switch (card_type) {
		case 0:
			sprite_index = card_clubs_A;
		break;
		case 1:
			sprite_index = card_clubs_02;
		break;
		case 2:
			sprite_index = card_clubs_03;
		break;
		case 3:
			sprite_index = card_clubs_04;
		break;
		case 4:
			sprite_index = card_clubs_05;
		break;
		case 5:
			sprite_index = card_clubs_06;
		break;
		case 6:
			sprite_index = card_clubs_07;
		break;
		case 7:
			sprite_index = card_clubs_08;
		break;
		case 8:
			sprite_index = card_clubs_09;
		break;
		case 9:
			sprite_index = card_clubs_10;
		break;
		case 10:
			sprite_index = card_clubs_J;
		break;
		case 11:
			sprite_index = card_clubs_Q;
		break;
		case 12:
			sprite_index = card_clubs_K;
		break;
	}
} else {
	sprite_index = card_back;
}
card_point = card_type +1;

x = lerp(x,goal_x,0.5 * move_spd);
y = lerp(y,goal_y,0.5 * move_spd);

if (instance_position(mouse_x,mouse_y,self)) {

if (dealing) {
	if (!mouse_colli) {
		//old_goal_y = goal_y;
		mouse_colli = true;
		goal_y -= 20;
	
	}
}


} else {
if (dealing) {
	if (mouse_colli) {
		//old_goal_y = goal_y;
	
		mouse_colli = false;
		goal_y += 20;
	
	}
}

}

if (goal_x > card_pile_manager.init_x) {
	depth = -goal_x;
}