///scr_ai_basic(id of grid list, id enemy main cell)
//returns color


//initializing list for looping through grid
var grid    = argument0
var cells   = ds_list_create();
var c_cells = ds_list_create();

ds_list_add(cells, argument1);
var rider = cells[| 0];
var position = ds_list_find_index(grid, rider);
ds_list_delete(grid, position);

//initializing array for storing number of color around enemy cells
colors[0] = 0;
for(var i = 1; i < 7; i++){
    colors[i] = 0;
}

//looping through grid
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
        
        if(ds_list_find_value(rider[| i], 3) == 0 && 
           ds_list_find_index(c_cells, rider[| i]) < 0){
            //loop through color
            ds_list_add(c_cells, rider[| i]);
            
            var c_rider_position = ds_list_size(c_cells) - 1;
            var c_rider          = c_cells[| c_rider_position];
            var c_position       = ds_list_find_index(grid, c_rider);
            
            ds_list_delete(grid, c_position);
            
            var c_done = false;
            while(!c_done){
                var j = 4;
                var c_neighbors = ds_list_size(c_rider) - 4;
                
                while(c_neighbors > 0){
                    if(ds_list_find_value(c_rider[| j], 0) == c_rider[| 0] && 
                       ds_list_find_value(c_rider[| j], 3) == 0){
                        if(ds_list_find_index(c_cells, c_rider[| j]) < 0){
                            ds_list_add(c_cells, c_rider[| j]);
                            c_position = ds_list_find_index(grid, c_rider[| j]);
                            ds_list_delete(grid, c_position);
                        }
                    }
                    
                    c_neighbors--;
                    j++;
                }
                
                if(c_rider_position++ < ds_list_size(c_cells) - 1)
                    c_rider = c_cells[| c_rider_position];
                else
                    c_done = true;
            }
        }
        
        neighbors--;
        i++;
    }
    
    if(rider_position++ < ds_list_size(cells) - 1)
        rider = cells[| rider_position];
    else
        done = true;
}

//destroy cells
var size = ds_list_size(cells);

repeat(size){
    ds_list_add(grid, cells[| 0]);
    ds_list_delete(cells, 0);
}
ds_list_destroy(cells);

//destroy c_cells
size = ds_list_size(c_cells);

repeat(size){
    colors[ds_list_find_value(c_cells[| 0], 0)]++;
    ds_list_add(grid, c_cells[| 0]);
    ds_list_delete(c_cells, 0);
}
ds_list_destroy(c_cells);

//finding most frequent color
var maximum = 0;
for(var i = 0; i < 7; i++){
    if(colors[i] > colors[maximum])
        maximum = i;
}

return maximum;
