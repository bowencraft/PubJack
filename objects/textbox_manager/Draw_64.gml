/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 

draw_set_font(score_font);
text_content = "";

for (var i =0;i<ds_list_size(textbox_ls);i++) {
	text_content += textbox_ls[|i];
	text_content += "\n";
}

draw_text_transformed(764,26,text_content,1,1,0);


