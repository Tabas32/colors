///scr_grid_destroy(grid list id)

var list = argument0;

var len = ds_list_size(list);
repeat(len){
    ds_list_destroy(list[| 0]);
}

ds_list_destroy(list);
