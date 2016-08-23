///scr_count_cells(id of grid lidt, id of cells counter list)

var grid          = argument0;
var cells_counter = argument1;

cells_counter[| 0] = 0;
cells_counter[| 1] = 0;
cells_counter[| 2] = 0;

var len = ds_list_size(grid);
for(i = 0; i < len; i++){
    switch(ds_list_find_value(grid[| i], 3)){
        case 0:
            cells_counter[| 0]++;
            break;
        case 1:
            cells_counter[| 1]++;
            break;
        case 2:
            cells_counter[| 2]++;
            break;
    }
}
