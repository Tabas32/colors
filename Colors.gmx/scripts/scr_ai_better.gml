///scr_ai_better(grid list id, player1 main cell, player2 main cell)
//returns color


var grid    = argument0;
var p1_main = argument1;
var p2_main = argument2;

scr_grid_qsort_xy(grid, 0, ds_list_size(grid) - 1);

var cell_counter = ds_list_create();
var maximum      = 0;
var ret_val      = 0;

for(var i = 0; i < 7; i++){
    var grid_copy = ds_list_create();
    
    scr_grid_copy(grid, grid_copy);
    
    var p1_copy = scr_grid_binarysearch_xy(grid_copy, p1_main[| 2], p1_main[| 1]);
    var p2_copy = scr_grid_binarysearch_xy(grid_copy, p2_main[| 2], p2_main[| 1]);
    
    ds_list_replace(p2_copy, 0, i);
    
    scr_find_maching_colors(grid_copy, p2_copy, p1_copy);
    scr_count_cells(grid_copy, cell_counter);
    
    if(cell_counter[| 2] > maximum){
        maximum = cell_counter[| 2];
        ret_val = i;
    }
    
    scr_grid_destroy(grid_copy);
}

return ret_val;
