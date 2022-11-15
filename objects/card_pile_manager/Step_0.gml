/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 

//ds_list_delete(pile,0);
//show_debug_message(pile[|0]);
//show_debug_message("size: " + string(ds_list_size(pile)));



if (timer == 0) {
	if (deal_num == 0) {
		
		for (i=0;i<amount;i++) {
			card_random[|i] = i%type;
		}
		randomize();
		ds_list_shuffle(card_random);
		
		for (i=0;i<amount;i++) {
			var card = instance_create_layer(init_x,init_y + card_interval*i,"Cards",obj_card);
			card.depth = i;
			card.card_type = card_random[|i];
			ds_list_add(pile,card);
			//show_debug_message(string(i) + " " + string(card_random[|i]) + " " + string(card.card_type));
		}
		deal_num = amount;
	
	}



}
// shuffle
//if (timer == 1* room_speed) {

//}

if (timer == 2* room_speed) {
		ds_list_add(textbox_manager.textbox_ls," ");
	ds_list_add(textbox_manager.textbox_ls,"Are you ready?");
			audio_play_sound(notice,0,false);

}
if (timer == 3.5* room_speed) {
		ds_list_add(textbox_manager.textbox_ls," ");
	ds_list_add(textbox_manager.textbox_ls,"Game.. start!");
			audio_play_sound(notice,0,false);
}

if (timer == 4.5* room_speed) {
		ds_list_add(textbox_manager.textbox_ls," ");
	ds_list_add(textbox_manager.textbox_ls,"PC is the initiative.");
	ds_list_add(textbox_manager.textbox_ls,"Dealing the cards...");
			audio_play_sound(notice,0,false);
}

if (timer == 4.7 * room_speed){
		audio_play_sound(flipcard,0,false);
		pile[|0].goal_x = card_1_x;
		pile[|0].goal_y = card_l1_y;
		
		ds_list_add(ai_hand_pile,pile[|0]);
		ds_list_delete(pile,0);
}
// deal 1

if (timer == 5 * room_speed){

		audio_play_sound(flipcard,0,false);
		pile[|0].goal_x = card_2_x;
		pile[|0].goal_y = card_l1_y;
		
		ds_list_add(ai_hand_pile,pile[|0]);
		ds_list_delete(pile,0);
	
}
// deal 2

if (timer == 5.3 * room_speed){

		audio_play_sound(flipcard,0,false);
		pile[|0].goal_x = card_1_x;
		pile[|0].goal_y = card_l2_y;
	
		ds_list_add(player_hand_pile,pile[|0]);
		ds_list_delete(pile,0);
}
// deal 3

if (timer == 5.6 * room_speed){

		audio_play_sound(flipcard,0,false);
		pile[|0].goal_x = card_2_x;
		pile[|0].goal_y = card_l2_y;
		
		ds_list_add(player_hand_pile,pile[|0]);
		ds_list_delete(pile,0);
	
}
// deal 4

if (timer == 6 * room_speed) {
		ds_list_add(textbox_manager.textbox_ls," ");
	ds_list_add(textbox_manager.textbox_ls,"It's PC's turn...");
			audio_play_sound(notice,0,false);
		player_turn = false;
		ai_turn = true;
		sign_ai_turn.visible = true;
		sign_player_turn.visible = false;
}
// add a timer here - no

if (timer == 7.5 * room_speed) {
	ai_deal = irandom_range(0,1);
	//ai_deal_pos = ai_deal;
	if (ai_deal == 0) {
		card_ai = ai_hand_pile[|0];
		ds_list_add(ai_shown_pile,ai_hand_pile[|0]);
		ds_list_delete(ai_hand_pile,0);
	} else 
	if (ai_deal == 1) {
		card_ai = ai_hand_pile[|1];
		ds_list_add(ai_shown_pile,ai_hand_pile[|1]);
		ds_list_delete(ai_hand_pile,1);
	}
	ai_deal_status = true;
	audio_play_sound(flipcard,0,false);
	card_ai.goal_x = deal_x;
	card_ai.goal_y = deal_y;
	ai_choice = card_ai.card_type;
	card_ai.shown = true;
	deal_x += deal_interval;
	
		ds_list_add(textbox_manager.textbox_ls," ");
	ds_list_add(textbox_manager.textbox_ls,"PC show a card!");
			audio_play_sound(notice,0,false);
	
}
// ai deal stage

if (timer == 9 * room_speed) {
		ds_list_add(textbox_manager.textbox_ls," ");
		ds_list_add(textbox_manager.textbox_ls,"It is your turn...");
			audio_play_sound(notice,0,false);
		player_turn = true;
		ai_turn = false;
		sign_ai_turn.visible = false;
		sign_player_turn.visible = true;
		ds_list_add(textbox_manager.textbox_ls," ");
		ds_list_add(textbox_manager.textbox_ls,"Now you can show a");
		ds_list_add(textbox_manager.textbox_ls,"card to opponent.");
			audio_play_sound(notice,0,false);
		
		
		audio_play_sound(flipcard,0,false);
		player_hand_pile[|0].shown = true;
		player_hand_pile[|0].dealing = true;
		player_hand_pile[|1].shown = true;
		player_hand_pile[|1].dealing = true;
}

if (timer > 9 * room_speed) {
	if (mouse_check_button_pressed(mb_left)) {
		card_click = instance_position(mouse_x,mouse_y,obj_card);
		if (card_click != noone && card_click.dealing) {
			player_choice = card_click;
			player_choice.goal_x = player_deal_x;
			player_choice.goal_y = player_deal_y;
			player_deal_x += deal_interval;
			ds_list_add(player_shown_pile,player_choice);
			
			ds_list_delete(player_hand_pile,
			ds_list_find_index(player_hand_pile,player_choice));
			
			audio_play_sound(flipcard,0,false);
			player_hand_pile[|0].dealing = false;
			player_shown_pile[|ds_list_size(player_shown_pile)-1].dealing = false;
		ds_list_add(textbox_manager.textbox_ls," ");
			ds_list_add(textbox_manager.textbox_ls,"You show a card!");
			audio_play_sound(notice,0,false);
			
			player_deal_status = true;
		}
	}
	
	// ai phase
	if (player_deal_status) {
		player_deal_status = false;
		if (ai_status) {
			ai_timer = 0;
		} else if (player_status) {
			player_deal_phase = true;
		ds_list_add(textbox_manager.textbox_ls," ");
			ds_list_add(textbox_manager.textbox_ls,"It is your turn...");
			ds_list_add(textbox_manager.textbox_ls,"You can choose to");
			ds_list_add(textbox_manager.textbox_ls,"draw or stand.");
			audio_play_sound(notice,0,false);
		}
	}
	
	if (ai_timer == 0 * room_speed) {
		player_turn = false;
		ai_turn = true;
	}
	
	if (ai_timer == 0.5 * room_speed) {
		ds_list_add(textbox_manager.textbox_ls," ");
		ds_list_add(textbox_manager.textbox_ls,"It's PC's turn...");
			audio_play_sound(notice,0,false);
		sign_ai_turn.visible = true;
		sign_player_turn.visible = false;
	}
	
	if (ai_timer == 2 * room_speed) {
	
		
		// ai choose whether continue
		
		if (ai_status) {
			
			temp_player_count = 0;
			for (var j=0; j<ds_list_size(player_shown_pile); j++) {
				temp_card = ds_list_find_value(player_shown_pile,j);
				show_debug_message(temp_card);
				temp_player_count += ( temp_card.card_type+1 );
			}
			
			temp_ai_count = 0;
			for (var j=0; j<ds_list_size(ai_shown_pile); j++) {
				temp_ai_count += ai_shown_pile[|j].card_type + 1;
			}
			temp_ai_count += ai_hand_pile[|0].card_type +1;
			
			
			if (temp_ai_count < 18) {
				ai_deal = 1;
				
			} else {
				if (temp_player_count >= (temp_ai_count - 8)) {
					ai_deal = irandom_range(0,1);
				
				} else {
					ai_deal = 0;
				
				}
			}
			
			
			//ai_deal = irandom_range(0,1);
			
			if (ai_deal == 0) {
				ai_status = false;
		ds_list_add(textbox_manager.textbox_ls," ");
				ds_list_add(textbox_manager.textbox_ls,"PC choose to stand.");
			audio_play_sound(notice,0,false);
			} 
			else if (ai_deal == 1) {
		ds_list_add(textbox_manager.textbox_ls," ");
				ds_list_add(textbox_manager.textbox_ls,"PC choose to draw");
				ds_list_add(textbox_manager.textbox_ls,"another card.");
			audio_play_sound(notice,0,false);
				
					pile[|0].goal_x = card_1_x + 0.5*handcard_interval;
					pile[|0].goal_y = card_l1_y;
		
					ds_list_add(ai_hand_pile,pile[|0]);
					ds_list_delete(pile,0);
					
					alarm[0] = 2 * room_speed;
					// 本code依靠此alarm运行，debug不出来为什么了但是请不要删
			}
			

		} else if (player_status) {
			player_deal_phase = true;
		ds_list_add(textbox_manager.textbox_ls," ");
			ds_list_add(textbox_manager.textbox_ls,"It is your turn...");
			ds_list_add(textbox_manager.textbox_ls,"You can choose to");
			ds_list_add(textbox_manager.textbox_ls,"draw or stand.");
			audio_play_sound(notice,0,false);
		
		}
	}
	
	//if (ai_timer == 4 * room_speed) {
				
	//	// ai deal 1 card

	//	ai_deal = irandom_range(0,1);
	//	//ai_deal_pos = ai_deal;
	//	if (ai_deal == 0) {
	//		card_ai = ai_hand_pile[|0];
	//		card_ai.goal_x = deal_x;
	//		card_ai.goal_y = deal_y;
	//		card_ai.shown = true;
	//		//ai_deal_pos = 0;
	//		ds_list_add(ai_shown_pile,ai_hand_pile[|0]);
	//		ds_list_delete(ai_hand_pile,0);
	//	} else 
	//	if (ai_deal == 1) {
	//		card_ai = ai_hand_pile[|1];
	//		card_ai.goal_x = deal_x;
	//		card_ai.goal_y = deal_y;
	//		card_ai.shown = true;
	//	ai_choice = card_ai.card_type;
	//		//ai_deal_pos = 1;
	//		//show_debug_message(ai_hand_pile[|0])
	//		ds_list_add(ai_shown_pile,ai_hand_pile[|1]);
	//		ds_list_delete(ai_hand_pile,1);
	//		//card_ai = ai_shown_pile[|ds_list_size(ai_shown_pile)-1];
	//	}
	//	audio_play_sound(flipcard,0,false);
	//	//show_debug_message(string(card_ai) + " card_ai");

	//	ds_list_add(textbox_manager.textbox_ls,"PC show a card.");
	//	//card_ai.goal_x = deal_x;
	//	//card_ai.goal_y = deal_y;
	//	//card_ai.shown = true;
	//	//ai_choice = card_ai.card_type;
	//	deal_x += deal_interval;


	//}
	
	
	if (ai_timer == 5 * room_speed) {
		player_deal_phase = true;
		
		ds_list_add(textbox_manager.textbox_ls," ");
		ds_list_add(textbox_manager.textbox_ls,"It is your turn...");
		ds_list_add(textbox_manager.textbox_ls,"You can choose to");
		ds_list_add(textbox_manager.textbox_ls,"draw or stand.");
			audio_play_sound(notice,0,false);
	}
	
	if (player_turn) {
		if (mouse_check_button_pressed(mb_left)) {
			butt_click = instance_position(mouse_x,mouse_y,button_shuffle);
			if (butt_click != noone) {
				ds_list_shuffle(player_hand_pile);
				for (var i =0;i<ds_list_size(player_hand_pile);i++) {
					player_hand_pile[|i].goal_x = card_1_x + i* handcard_interval;
				}
			}
		}
	}
	
	
	
	// player phase
	if (player_deal_phase) {
		
		
		player_turn = true;
		ai_turn = false;
		sign_ai_turn.visible = false;
		sign_player_turn.visible = true;
		
		if (mouse_check_button_pressed(mb_left)) {
			butt_click = instance_position(mouse_x,mouse_y,button_draw);
			if (butt_click != noone) {
				pile[|0].goal_x = card_1_x + 0.5*handcard_interval;
				pile[|0].goal_y = card_l2_y;
				pile[|0].shown = true;
			
				ds_list_add(player_hand_pile,pile[|0]);
				ds_list_delete(pile,0);
			
		
				audio_play_sound(flipcard,0,false);
				player_hand_pile[|0].shown = true;
				player_hand_pile[|0].dealing = true;
				player_hand_pile[|1].shown = true;
				player_hand_pile[|1].dealing = true;
		ds_list_add(textbox_manager.textbox_ls," ");
				ds_list_add(textbox_manager.textbox_ls,"You choose to draw");
				ds_list_add(textbox_manager.textbox_ls,"another card.");
			
		ds_list_add(textbox_manager.textbox_ls," ");
				ds_list_add(textbox_manager.textbox_ls,"Now you can show a");
				ds_list_add(textbox_manager.textbox_ls,"card to opponent.");
			audio_play_sound(notice,0,false);
			
				player_deal_phase = false;
				//phase finished, jump to deal
			
				//player_deal_status = false;
			}
		}

		if (mouse_check_button_pressed(mb_left)) {
			butt_click = instance_position(mouse_x,mouse_y,button_suspension);
			if (butt_click != noone) {
		ds_list_add(textbox_manager.textbox_ls," ");
				ds_list_add(textbox_manager.textbox_ls,"You choose to stand.");
			audio_play_sound(notice,0,false);
				player_status = false;
				player_deal_status = true;
				// phase finished, jump to pc
				player_deal_phase = false;
			}
		}

	}
	
	if (ds_list_size(pile) == 0) {
		player_status = false;
		ai_status = false;
		
	}
	
	
}
	

if (!player_status && !ai_status) {
	if (ai_reveal_timer == 0) {
	
		ds_list_add(textbox_manager.textbox_ls," ");
		ds_list_add(textbox_manager.textbox_ls,"Game end.");
		ds_list_add(textbox_manager.textbox_ls,"Settling points...");
			audio_play_sound(notice,0,false);
	}
	// reveal ai card
	if (ai_reveal_timer < ai_reveal_duration * room_speed) {
		ai_reveal_timer++;
	}
	if (player_reveal) {
	
		if (player_reveal_timer < player_reveal_duration * room_speed) {
			player_reveal_timer++;
		}
	}
	
	if (ai_reveal_timer == 0.4 * room_speed) {
		ai_hand_pile[|0].shown = true;
		ai_hand_pile[|0].goal_x = ai_reveal_x;
		ai_hand_pile[|0].goal_y = ai_reveal_y;
		ai_point += ai_hand_pile[|0].card_point;
		ai_reveal_x += deal_interval;
		
	}
	if (ai_reveal_timer == 0.6 * room_speed) {
		alarm[1] = 0.1 * room_speed;
	}
	
	if (player_reveal_timer == 0.4 * room_speed) {
		player_hand_pile[|0].shown = true;
		player_hand_pile[|0].goal_x = player_reveal_x;
		player_hand_pile[|0].goal_y = player_reveal_y;
		player_point += player_hand_pile[|0].card_point;
		player_reveal_x += deal_interval;
		
	}
	if (player_reveal_timer == 0.6 * room_speed) {
		alarm[2] = 0.1 * room_speed;
	}
	show_debug_message("ai point: " + string(ai_point) + ", player point: " + string(player_point));

	
}


if (timer < duration * room_speed) {
	timer ++;
}

if (ai_timer < ai_duration * room_speed) {
	ai_timer ++;
}