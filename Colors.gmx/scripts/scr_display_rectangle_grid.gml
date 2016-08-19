///scr_display_rectangle_grid(grid list id, x, y)

var grid = argument0;
var x_ofset = argument1;
var y_ofset = argument2;

var counter = 0;
var size = ds_list_size(grid);

//draw black rectangle for better wiev
tile_add(bg_black_rectangle, 0, 0, 1000, 520, x_ofset - 20, y_ofset - 20, 10);

//draw cells
while(counter < size){
    var cell = grid[| counter];
    
    if(cell[| 0] == RED)
        tile_add(bg_red, 0, 0, 16, 16, 16*cell[| 2] + x_ofset, 16*cell[| 1] + y_ofset, 0);
        
    if(cell[| 0] == BLUE)
        tile_add(bg_blue, 0, 0, 16, 16, 16*cell[| 2] + x_ofset, 16*cell[| 1] + y_ofset, 0);
    
    if(cell[| 0] == GREEN)
        tile_add(bg_green, 0, 0, 16, 16, 16*cell[| 2] + x_ofset, 16*cell[| 1] + y_ofset, 0);
        
    if(cell[| 0] == YELLOW)
        tile_add(bg_yellow, 0, 0, 16, 16, 16*cell[| 2] + x_ofset, 16*cell[| 1] + y_ofset, 0);
        
    if(cell[| 0] == WHITE)
        tile_add(bg_white, 0, 0, 16, 16, 16*cell[| 2] + x_ofset, 16*cell[| 1] + y_ofset, 0);
        
    if(cell[| 0] == PURPLE)
        tile_add(bg_purple, 0, 0, 16, 16, 16*cell[| 2] + x_ofset, 16*cell[| 1] + y_ofset, 0);
        
    if(cell[| 0] == CIAN)
        tile_add(bg_cian, 0, 0, 16, 16, 16*cell[| 2] + x_ofset, 16*cell[| 1] + y_ofset, 0);
        
    counter++;
}
