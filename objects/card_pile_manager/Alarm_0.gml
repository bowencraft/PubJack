/// @description ai deal
// 你可以在此编辑器中写入代码 


				
// ai deal 1 card

ai_deal = irandom_range(0,1);
//ai_deal_pos = ai_deal;
if (ai_deal == 0) {
	card_ai = ai_hand_pile[|0];
	//ai_deal_pos = 0;
	ds_list_add(ai_shown_pile,ai_hand_pile[|0]);
	ds_list_delete(ai_hand_pile,0);
} else 
if (ai_deal == 1) {
	card_ai = ai_hand_pile[|1];
	//ai_deal_pos = 1;
	show_debug_message(ai_hand_pile[|0])
	ds_list_add(ai_shown_pile,ai_hand_pile[|1]);
	ds_list_delete(ai_hand_pile,1);
}
audio_play_sound(flipcard,0,false);
//show_debug_message(string(card_ai) + " card_ai");

card_ai.goal_x = deal_x;
card_ai.goal_y = deal_y;
ai_choice = card_ai.card_type;
card_ai.shown = true;
deal_x += deal_interval;
ds_list_add(textbox_manager.textbox_ls,"PC show a card.");
			audio_play_sound(notice,0,false);