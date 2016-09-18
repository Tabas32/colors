///scr_read_text_state(text_object)
var text_obj  = argument0;
var backspace = keyboard_check_pressed(vk_backspace); 

if(backspace){
    text_obj.text = string_copy(text_obj.text, 0, string_length(text_obj.text) - 2);
}

if(string_length(text_obj.text) <= text_obj.max_length){
    text_obj.text = keyboard_string;
}
else{
    keyboard_string = text_obj.text;
}
