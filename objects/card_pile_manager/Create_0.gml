/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 

amount = 13;
type = 13;

pile = ds_list_create();

player_hand_pile = ds_list_create();
player_shown_pile = ds_list_create();
ai_hand_pile = ds_list_create();
ai_shown_pile = ds_list_create();

deal_num = 0;

card_random = ds_list_create();

duration = 5;
timer = 0;

ai_deal = 0; // sequence - 0,1
ai_deal_status = false;
player_deal_status = false;

ai_status = true;
player_status = true;

ai_reveal_timer = 0;
ai_reveal_duration = 5;

player_reveal_timer = 0;
player_reveal_duration = 5;

player_choice = 0; // card
ai_choice = 0; 

ai_count = 0;
player_count = 0;

player_deal_phase = false;
player_reveal = false;

player_point = 0;
ai_point = 0;

// ---- position setting begin -----

card_interval = 2; // pixel
deal_interval =20;

init_x = 100;
init_y = 400;

card_l1_y = 150;
card_l2_y = 550;

card_1_x = 200;
card_2_x = 340;
handcard_interval = 140;

deal_x = 340;
deal_y = 295;

player_deal_x = 340;
player_deal_y = 405;

ai_reveal_x = 220;
ai_reveal_y = 295;

player_reveal_x = 220;
player_reveal_y = 405;

//discard_x = 560;
//discard_y = 350;

// ---- position setting end -----
