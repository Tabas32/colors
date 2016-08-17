///scr_update_rectangle_colors(grid list id, x ofset, y ofset)

var grid = argument0;
var x_ofset = argument1;
var y_ofset = argument2;

var size = ds_list_size(grid);
var i    = 0;

while(i < size){
    var cell = grid[| i++];
    var color = cell[| 0];
    
    if(cell[| 0] == RED)
        tile_set_background(tile_layer_find(0, cell[| 2]*16 + x_ofset, cell[| 1]*16 + y_ofset), bg_red);
    if(cell[| 0] == BLUE)
        tile_set_background(tile_layer_find(0, cell[| 2]*16 + x_ofset, cell[| 1]*16 + y_ofset), bg_blue);
    if(cell[| 0] == GREEN)
        tile_set_background(tile_layer_find(0, cell[| 2]*16 + x_ofset, cell[| 1]*16 + y_ofset), bg_green);
    if(cell[| 0] == YELLOW)
        tile_set_background(tile_layer_find(0, cell[| 2]*16 + x_ofset, cell[| 1]*16 + y_ofset), bg_yellow);
    if(cell[| 0] == WHITE)
        tile_set_background(tile_layer_find(0, cell[| 2]*16 + x_ofset, cell[| 1]*16 + y_ofset), bg_white);
    if(cell[| 0] == PURPLE)
        tile_set_background(tile_layer_find(0, cell[| 2]*16 + x_ofset, cell[| 1]*16 + y_ofset), bg_purple);
    if(cell[| 0] == CIAN)
        tile_set_background(tile_layer_find(0, cell[| 2]*16 + x_ofset, cell[| 1]*16 + y_ofset), bg_cian);
}
