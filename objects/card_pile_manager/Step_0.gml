/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 

if (!restarting) {
if (timer == 0) {
	if (deal_num == 0) {
		
		for (i=0;i<amount;i++) {
			card_random[|i] = i%type;
		}
		randomize();
		ds_list_shuffle(card_random);
		
		for (i=0;i<amount;i++) {
			var card = instance_create_layer(init_x,init_y - card_interval*i,"Cards",obj_card);
			card.depth = -i;
			card.card_type = card_random[|i];
			ds_list_add(pile,card);
		}
		deal_num = amount;
	
	}



}

if (timer == 1 * room_speed){
		audio_play_sound(flipcard,0,false);
		pile[|deal_num-1].goal_x = card_1_x;
		pile[|deal_num-1].goal_y = card_l1_y;
	
	
	

}

if (timer == 1.2 * room_speed){

		audio_play_sound(flipcard,0,false);
		pile[|deal_num-2].goal_x = card_2_x;
		pile[|deal_num-2].goal_y = card_l1_y;
	
}

if (timer == 1.4 * room_speed){

		audio_play_sound(flipcard,0,false);
		pile[|deal_num-3].goal_x = card_3_x;
		pile[|deal_num-3].goal_y = card_l1_y;
	
}

if (timer == 1.6 * room_speed){

		audio_play_sound(flipcard,0,false);
		pile[|deal_num-4].goal_x = card_1_x;
		pile[|deal_num-4].goal_y = card_l2_y;
	
}

if (timer == 1.8 * room_speed){

		audio_play_sound(flipcard,0,false);
		pile[|deal_num-5].goal_x = card_2_x;
		pile[|deal_num-5].goal_y = card_l2_y;
	
}

if (timer == 2 * room_speed){

		audio_play_sound(flipcard,0,false);
		pile[|deal_num-6].goal_x = card_3_x;
		pile[|deal_num-6].goal_y = card_l2_y;
}

if (timer == 3 * room_speed) {

		audio_play_sound(flipcard,0,false);
		pile[|deal_num-4].shown = true;
		pile[|deal_num-4].dealing = true;
		pile[|deal_num-5].shown = true;
		pile[|deal_num-5].dealing = true;
		pile[|deal_num-6].shown = true;
		pile[|deal_num-6].dealing = true;
}

if (timer == 3.3 * room_speed) {
	ai_deal = irandom_range(0,2);
	if (ai_deal == 0) {
		card_ai = pile[|deal_num-1];
	} else 
	if (ai_deal == 1) {
		card_ai = pile[|deal_num-2];
	} else 
	if (ai_deal == 2) {
		card_ai = pile[|deal_num-3];
	}
	
	audio_play_sound(flipcard,0,false);
	card_ai.goal_x = deal_x;
	card_ai.goal_y = deal_y;
	ai_choice = card_ai.card_type;
	
	//deal_num -= 6;
}

if (timer > 3.3 * room_speed) {
	if (mouse_check_button_pressed(mb_left)) {
		card_click = instance_position(mouse_x,mouse_y,obj_card);
		if (card_click != noone && card_click.dealing) {
			card1 = card_click;
			card1.goal_x = player_deal_x;
			card1.goal_y = player_deal_y;
			
			audio_play_sound(flipcard,0,false);
			pile[|deal_num-4].dealing = false;
			pile[|deal_num-5].dealing = false;
			pile[|deal_num-6].dealing = false;
			player_choice = card1.card_type;
			dealed = true;
		}
	}
	
	if (dealed && timer > 3.3 * room_speed) {
		if (deal_timer == 1 * room_speed) {
			
			card_ai.shown = true;
		}
		if (deal_timer == 2 * room_speed) {
			if (ai_choice == 0) {
				// 0 -scissor, 1 -paper, 2 -rock
				if (player_choice == 0) {
					// same
				} else if (player_choice == 1) {
					ai_score ++;
					audio_play_sound(lose,0,false);
					// ai win
				} else if (player_choice == 2) {
					player_score ++;
					audio_play_sound(success,0,false);
					// player win
				}
			} else if (ai_choice == 1) {
				if (player_choice == 0) {
					audio_play_sound(success,0,false);
					player_score ++;
					// player win
				} else if (player_choice == 1) {
					// same
				} else if (player_choice == 2) {
					ai_score ++;
					audio_play_sound(lose,0,false);
					// ai win
				}
			} else if (ai_choice == 2) {
				if (player_choice == 0) {
					ai_score ++;
					audio_play_sound(lose,0,false);
					// ai win
				} else if (player_choice == 1) {
					audio_play_sound(success,0,false);
					player_score ++;
					// player win
				} else if (player_choice == 2) {
					//  same
				}
			}
		}
		if (deal_timer == 3 * room_speed) {

			//card_ai.goal_x = discard_x;
			//card_ai.goal_y = discard_y - (amount - deal_num) * 2;
			
			//pile[|deal_num-1].goal_x = discard_x;
			//pile[|deal_num-1].goal_y = discard_y - (amount - deal_num + 1) * 2;
			
			rep_ai = ds_list_find_index(pile,card_ai);
			pile[|rep_ai] = pile[|deal_num-1];
			pile[|deal_num-1] = card_ai;
			
			
			rep_player = ds_list_find_index(pile,card1);
			pile[|rep_player] = pile[|deal_num-2];
			pile[|deal_num-2] = card1;
			
			//deal_num -= 6;
			
			audio_play_sound(flipcard,0,false);
			deal_num -= 1;
			pile[|deal_num].goal_x = discard_x;
			pile[|deal_num].goal_y = discard_y - (amount - deal_num) * card_interval;
			pile[|deal_num].depth = deal_num;
			pile[|deal_num].shown = true;
			
			// timer loop
			// status set to start
		}
		
		if (deal_timer == 3.2 * room_speed) {
			show_debug_message(string(deal_num) + " status "+ string(instance_exists(pile[|deal_num])));
			//deal_num -= 1;
			audio_play_sound(flipcard,0,false);
			pile[|deal_num-1].goal_x = discard_x;
			pile[|deal_num-1].goal_y = discard_y - (amount - deal_num + 1) * card_interval;
			pile[|deal_num-1].depth = deal_num - 1;
			pile[|deal_num-1].shown = true;
			deal_num -= 1;
		}
		if (deal_timer == 3.4 * room_speed) {
			deal_num -= 1;
			audio_play_sound(flipcard,0,false);
			pile[|deal_num].goal_x = discard_x;
			pile[|deal_num].goal_y = discard_y - (amount - deal_num) * card_interval;
			pile[|deal_num].depth = deal_num;
			pile[|deal_num].shown = true;
			
		}
		if (deal_timer == 3.6 * room_speed) {
			deal_num -= 1;
			audio_play_sound(flipcard,0,false);
			pile[|deal_num].goal_x = discard_x;
			pile[|deal_num].goal_y = discard_y - (amount - deal_num) * card_interval;
			pile[|deal_num].depth = deal_num;
			pile[|deal_num].shown = true;
			
		} 
		if (deal_timer == 3.8 * room_speed) {
			deal_num -= 1;
			audio_play_sound(flipcard,0,false);
			pile[|deal_num].goal_x = discard_x;
			pile[|deal_num].goal_y = discard_y - (amount - deal_num) * card_interval;
			pile[|deal_num].depth = deal_num;
			pile[|deal_num].shown = true;
			
		}
		if (deal_timer == 4.0 * room_speed) {
			deal_num -= 1;
			audio_play_sound(flipcard,0,false);
			pile[|deal_num].goal_x = discard_x;
			pile[|deal_num].goal_y = discard_y - (amount - deal_num) * card_interval;
			pile[|deal_num].depth = deal_num;
			pile[|deal_num].shown = true;
			
		}
		
		
		if (deal_timer < deal_duration * room_speed) {
			deal_timer ++;
		}
		
	}
}



if (timer < duration * room_speed) {
	timer ++;
} else {
	if (deal_num > 0) {
		if (deal_timer >= deal_duration * room_speed) {
			dealed = false;
			deal_timer = 0;
			timer = 0;
		
		}
	} else {
		if (!restarting) {
			restarting = true;
			alarm[2] = 1 * room_speed;
		
		}
	}
}
}
