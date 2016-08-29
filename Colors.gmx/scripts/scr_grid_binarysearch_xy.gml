///scr_grid_binarysearch_xy(sorted grid list id, x, y)

var list     = argument0;
var wanted_x = argument1;
var wanted_y = argument2;

var wanted = ds_list_create();
ds_list_add(wanted, 0, wanted_y, wanted_x);

var left  = 0;
var right = ds_list_size(list) - 1;

while(left <= right){
    var middle  = (left + right) div 2;
    var compare = scr_compare_xy(wanted, list[| middle]);
    
    if(compare == 0){
        ds_list_destroy(wanted);
        return list[| middle];
    }
    else if(compare == 1) left = middle + 1;
    else right = middle - 1;
}

ds_list_destroy(wanted);
return -1;
