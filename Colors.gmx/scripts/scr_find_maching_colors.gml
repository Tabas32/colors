///scr_find_maching_colors(gird list id, main cell id, enemy main cell id)

var grid  = argument0;

//looping throught grid from main cell and looking for same color or ocupation
var main_cell = argument1;
var rider = main_cell;

var p1_cells = ds_list_create();

ds_list_add(p1_cells, rider);
var position = ds_list_find_index(grid, rider);
ds_list_delete(grid, position);

var done = false;
var rider_position = 0;

while(!done){
    var i = 4;
    var neighbors = ds_list_size(rider) - 4;
    
    while(neighbors > 0){
        if((ds_list_find_value(rider[| i], 0) == rider[| 0] &&
           ds_list_find_value(rider[| i], 3) == 0) ||
           ds_list_find_value(rider[| i], 3) == rider[| 3]){
            
            ds_list_replace(rider[| i], 3, rider[| 3]);
            ds_list_replace(rider[| i], 0, rider[| 0]);
            
            if(ds_list_find_index(p1_cells, rider[| i]) < 0){
                ds_list_add(p1_cells, rider[| i]);
                position = ds_list_find_index(grid, rider[| i]);
                ds_list_delete(grid, position);
            }
        }
        
        i++;
        neighbors--;
    }
    
    if(rider_position++ < ds_list_size(p1_cells) - 1)
        rider = p1_cells[| rider_position];
    else
        done = true; 
}


//looping throught grid from enemy main cell and looking for every cell
//cell which can not be found, shall have same ocupation as main cell
enemy_main = argument2;
rider = enemy_main;

var other_cells = ds_list_create();

ds_list_add(other_cells, rider);
position = ds_list_find_index(grid, rider);
ds_list_delete(grid, position);

done = false;
rider_position = 0;

while(!done){
    var i = 4;
    var neighbors = ds_list_size(rider) - 4;
    
    while(neighbors > 0){
        if(ds_list_find_value(rider[| i], 3) == 0) ||
           ds_list_find_value(rider[| i], 3) == enemy_main[| 3]{
            
            if(ds_list_find_index(other_cells, rider[| i]) < 0){
                ds_list_add(other_cells, rider[| i]);
                position = ds_list_find_index(grid, rider[| i]);
                ds_list_delete(grid, position);
            }
        }
        
        i++;
        neighbors--;
    }
    
    if(rider_position++ < ds_list_size(other_cells) - 1)
        rider = other_cells[| rider_position];
    else
        done = true; 
}

//change ocupation and color for rest cells
var size = ds_list_size(grid);
for(i = 0; i < size; i++){
    ds_list_replace(grid[| i], 3, main_cell[| 3]);
    ds_list_replace(grid[| i], 0, main_cell[| 0]);
}

//destroy p1_cells
size = ds_list_size(p1_cells);

repeat(size){
    ds_list_add(grid, p1_cells[| 0]);
    ds_list_delete(p1_cells, 0);
}
ds_list_destroy(p1_cells);

//destroy other_cells
size = ds_list_size(other_cells);

repeat(size){
    ds_list_add(grid, other_cells[| 0]);
    ds_list_delete(other_cells, 0);
}
ds_list_destroy(other_cells);
