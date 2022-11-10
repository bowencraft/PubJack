///// @description Destroy
//// 你可以在此编辑器中写入代码 

for (i=0;i<amount;i++) {
	instance_destroy(pile[|i]);
}

ds_list_destroy(pile);
deal_num = 0;
dealing = 0;
deal_timer = 0;
timer = 0;
discard_count = 0;
shuffle_count = 0;

show_debug_message("destroyed")
pile = ds_list_create();

for (i=0;i<amount;i++) {
	card_random[|i] = i%type;
}
ds_list_shuffle(card_random);
		
for (i=0;i<amount;i++) {
	var card = instance_create_layer(init_x,init_y - card_interval*i,"Cards",obj_card);
	card.depth = -i;
	card.card_type = card_random[|i];
	ds_list_add(pile,card);
}

show_debug_message("created")
alarm[3] = 0.2 * room_speed;