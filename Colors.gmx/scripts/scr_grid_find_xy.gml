///scr_grid_find_xy(grid list id, x, y)

var list     = argument0;
var wanted_x = argument1;
var wanted_y = argument2;

var len = ds_list_size(list);
for(var i = 0; i < len; i++){
    if(ds_list_find_value(list[| i], 2) == wanted_x && ds_list_find_value(list[| i], 1) == wanted_y){
        return list[| i];
    }
}

return -1;
