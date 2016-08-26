///scr_check_win(id of cells counter list)

var cells_counter = argument0;
var all_cells     = cells_counter[| 0] + cells_counter[| 1] + cells_counter[| 2];

if((cells_counter[| 1] / all_cells) * 100 > 50){
    obj_winer.image_index = 0;
    room_goto(rm_win);
    exit;
}

if((cells_counter[| 2] / all_cells) * 100 > 50){
    obj_winer.image_index = 1;
    room_goto(rm_win);
}
