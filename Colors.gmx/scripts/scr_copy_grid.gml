///scr_copy_grid(source grid list id, target grid list id)

var source = argument0;
var target = argument1;

target[| 0] = ds_list_create();
ds_list_add(target[| 0], ds_list_find_value(source[| 0], 0), ds_list_find_value(source[| 0], 1),
                         ds_list_find_value(source[| 0], 2), ds_list_find_value(source[| 0], 3));

var r_position = 0;

while(r_position < ds_list_size(target)){
    var rider = target[| r_position];
    
    //find riders original in source
    var r_original = scr_grid_find_xy(source, rider[| 2], rider[| 1]);
    
    //add neighbors to rider
    var r_len = ds_list_size(r_original);
    for(var i = 4; i < r_len; i++){
        var neighbor = scr_grid_find_xy(target, ds_list_find_value(r_original[| i], 2), ds_list_find_value(r_original[| i], 1));
        
        //if neighbor is alredy copied then rider can reference it
        //else it must be copied first
        if(neighbor == -1){
            neighbor = ds_list_create();
            ds_list_add(neighbor, ds_list_find_value(r_original[| i], 0), ds_list_find_value(r_original[| i], 1),
                                  ds_list_find_value(r_original[| i], 2), ds_list_find_value(r_original[| i], 3));
                                  
            ds_list_add(target, neighbor);
        }
        
        ds_list_add(rider, neighbor);
    }
    
    r_position++;
}
