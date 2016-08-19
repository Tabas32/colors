///scr_ai_basic(id of grid list, id enemy main cell)

//initializing list for looping through grid
var grid = argument0
var cells = ds_list_create();

ds_list_add(cells, argument1);
var rider = cells[| 0];
var position = ds_list_find_index(grid, rider);
ds_list_delete(grid, position);

//initializing array for storing number of color around enemy cells
colors[0] = 0;
for(i = 1; i < 7; i++){
    colors[i] = 0;
}

//looping though grid
var done = false;
var rider_position = 0;
while(!done){
    var i = 4;
    var neighbors = ds_list_size(rider) - 4;
    
    while(neighbors > 0){
        if(ds_list_find_value(rider[| i], 3) == 2){
            if(ds_list_find_index(cells, rider[| i]) < 0){
                ds_list_add(cells, rider[| i]);
                position = ds_list_find_index(grid, rider[| i]);
                ds_list_delete(grid, position);
            }
        }
        
        if(ds_list_find_value(rider[| i], 3) == 0){
            colors[ds_list_find_value(rider[| i], 0)]++;
        }
        
        neighbors--;
        i++;
    }
    
    if(rider_position++ < ds_list_size(cells) - 1)
        rider = cells[| rider_position];
    else
        done = true;
}

//destroy other_cells
var size = ds_list_size(cells);

repeat(size){
    ds_list_add(grid, cells[| 0]);
    ds_list_delete(cells, 0);
}
ds_list_destroy(cells);

//finding most frequent color
var maximum = 0;
for(i = 0; i < 7; i++){
    if(colors[i] > colors[maximum])
        maximum = i
}

return maximum;
