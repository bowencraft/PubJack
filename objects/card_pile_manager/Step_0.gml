/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 

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
			show_debug_message(string(i) + " " + string(card_random[|i]) + " " + string(card.card_type));
		}
		deal_num = amount;
	
	}


}
// shuffle

if (timer == 1 * room_speed){
		audio_play_sound(flipcard,0,false);
		pile[|deal_num-1].goal_x = card_1_x;
		pile[|deal_num-1].goal_y = card_l1_y;
	
}
// deal 1

if (timer == 1.2 * room_speed){

		audio_play_sound(flipcard,0,false);
		pile[|deal_num-2].goal_x = card_2_x;
		pile[|deal_num-2].goal_y = card_l1_y;
	
}
// deal 2

if (timer == 1.4 * room_speed){

		audio_play_sound(flipcard,0,false);
		pile[|deal_num-3].goal_x = card_1_x;
		pile[|deal_num-3].goal_y = card_l2_y;
	
}
// deal 3

if (timer == 1.6 * room_speed){

		audio_play_sound(flipcard,0,false);
		pile[|deal_num-4].goal_x = card_2_x;
		pile[|deal_num-4].goal_y = card_l2_y;
	
}
// deal 4

// add a timer here
if (timer == 3 * room_speed) {

		audio_play_sound(flipcard,0,false);
		pile[|deal_num-3].shown = true;
		pile[|deal_num-3].dealing = true;
		pile[|deal_num-4].shown = true;
		pile[|deal_num-4].dealing = true;
}

if (timer == 3.3 * room_speed) {
	ai_deal = irandom_range(0,1);
	if (ai_deal == 0) {
		card_ai = pile[|deal_num-1];
	} else 
	if (ai_deal == 1) {
		card_ai = pile[|deal_num-2];
	}
	ai_deal_status = true;
	audio_play_sound(flipcard,0,false);
	card_ai.goal_x = deal_x;
	card_ai.goal_y = deal_y;
	ai_choice = card_ai.card_type;
}
// ai deal stage

if (timer > 3.3 * room_speed) {
	if (mouse_check_button_pressed(mb_left)) {
		card_click = instance_position(mouse_x,mouse_y,obj_card);
		if (card_click != noone && card_click.dealing) {
			player_choice = card_click;
			player_choice.goal_x = player_deal_x;
			player_choice.goal_y = player_deal_y;
			
			audio_play_sound(flipcard,0,false);
			pile[|deal_num-3].dealing = false;
			pile[|deal_num-4].dealing = false;
			//player_choice = card1;
			player_deal_status = true;
		}
	}
	
	if (player_deal_status && timer > 3.3 * room_speed) {
		if (deal_timer == 1 * room_speed) {
			
			card_ai.shown = true;
		}
		// both side deal judge, should combine with player deal status
		// ask if continue deal or not
		
	}
	if (deal_timer == 3 * room_speed) {

			
		rep_ai = ds_list_find_index(pile,card_ai);
		pile[|rep_ai] = pile[|deal_num-1];
		pile[|deal_num-1] = card_ai;
			
			
		rep_player = ds_list_find_index(pile,player_choice);
		pile[|rep_player] = pile[|deal_num-2];
		pile[|deal_num-2] = player_choice;
			
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
		
		
		
	if (deal_timer < deal_duration * room_speed) {
		deal_timer ++;
	}
		
}




if (timer < duration * room_speed) {
	timer ++;
} else {
	if (deal_num > 0) {
		if (deal_timer >= deal_duration * room_speed) {
			player_deal_status = false;
			deal_timer = 0;
			timer = 0;
		
		}
	} else {
		// end
	}
}

