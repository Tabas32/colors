///scr_create_rectangle_grid(list id)

//every list of cell has form:
//{[color] [row / y] [column / x] [ocupation] [neighbors]}
//color - from 0 to 6
//ocupation - 0 none
//            1 player 1
//            2 player 2

randomize();

var rows    = 22 - (global.map * 11);
var columns = 44 - (global.map * 22);

//Create list of cells
var cells_list = argument0;

for(var i = 0; i < rows; i++){
    for(var j = 0; j < columns; j++){
        var sub_list = ds_list_create();
        ds_list_add(sub_list, -1, i, j, 0);
        
        ds_list_add(cells_list, sub_list);
    }
}

for(var i = 0; i < rows; i++){
    for(var j = 0; j < columns; j++){
        var position = i * columns + j;
        
        ds_list_replace(cells_list[| position], 0, irandom(6));
        
        if(j > 0 && ds_exists(cells_list[| (position - 1)], ds_type_list))
            ds_list_add(cells_list[| position], cells_list[| (position - 1)]);
            
        if(j < columns - 1 && ds_exists(cells_list[| (position + 1)], ds_type_list))
            ds_list_add(cells_list[| position], cells_list[| (position + 1)]);
            
        if(position - columns >= 0 && ds_exists(cells_list[| (position - columns)], ds_type_list))
            ds_list_add(cells_list[| position], cells_list[| (position - columns)]);
            
        if(position + columns < (rows * columns) - 1 && ds_exists(cells_list[| (position + columns)], ds_type_list))
            ds_list_add(cells_list[| position], cells_list[| (position + columns)]);
    }
}

ds_list_replace(cells_list[| (columns - 1)], 3, 2); // main cell of player 2
ds_list_replace(cells_list[| ((rows - 1) * columns)], 3, 1); // main cell of player 1
