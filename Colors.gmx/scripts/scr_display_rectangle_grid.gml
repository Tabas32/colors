///scr_display_rectangle_grid(grid list id, x, y)

var grid = argument0;
var x_ofset = argument1;
var y_ofset = argument2;

var counter = 0;
var size    = ds_list_size(grid);
var tile    = 0;

//draw black rectangle for better wiev
tile_add(bg_black_rectangle, 0, 0, 760, 392, x_ofset - 28, y_ofset - 20, 1);

//draw cells
while(counter < size){
    var cell = grid[| counter];
    
    switch(cell[| 0]){
        case RED:
            tile_add(bg_red, 0, 0, 16, 16, (16 + (global.map * 16))*cell[| 2] + x_ofset, (16 + (global.map * 16))*cell[| 1] + y_ofset, 0);
            tile = tile_layer_find(0, (16 + (global.map * 16))*cell[| 2] + x_ofset, (16 + (global.map * 16))*cell[| 1] + y_ofset);
            tile_set_scale(tile, 1 + global.map, 1 + global.map);
            break;
        
        case BLUE:
            tile_add(bg_blue, 0, 0, 16, 16, (16 + (global.map * 16))*cell[| 2] + x_ofset, (16 + (global.map * 16))*cell[| 1] + y_ofset, 0);
            tile = tile_layer_find(0, (16 + (global.map * 16))*cell[| 2] + x_ofset, (16 + (global.map * 16))*cell[| 1] + y_ofset);
            tile_set_scale(tile, 1 + global.map, 1 + global.map);
            break;
    
        case GREEN:
            tile_add(bg_green, 0, 0, 16, 16, (16 + (global.map * 16))*cell[| 2] + x_ofset, (16 + (global.map * 16))*cell[| 1] + y_ofset, 0);
            tile = tile_layer_find(0, (16 + (global.map * 16))*cell[| 2] + x_ofset, (16 + (global.map * 16))*cell[| 1] + y_ofset);
            tile_set_scale(tile, 1 + global.map, 1 + global.map);
            break;
        
        case YELLOW:
            tile_add(bg_yellow, 0, 0, 16, 16, (16 + (global.map * 16))*cell[| 2] + x_ofset, (16 + (global.map * 16))*cell[| 1] + y_ofset, 0);
            tile = tile_layer_find(0, (16 + (global.map * 16))*cell[| 2] + x_ofset, (16 + (global.map * 16))*cell[| 1] + y_ofset);
            tile_set_scale(tile, 1 + global.map, 1 + global.map);
            break;
        
        case WHITE:
            tile_add(bg_white, 0, 0, 16, 16, (16 + (global.map * 16))*cell[| 2] + x_ofset, (16 + (global.map * 16))*cell[| 1] + y_ofset, 0);
            tile = tile_layer_find(0, (16 + (global.map * 16))*cell[| 2] + x_ofset, (16 + (global.map * 16))*cell[| 1] + y_ofset);
            tile_set_scale(tile, 1 + global.map, 1 + global.map);
            break;
        
        case PURPLE:
            tile_add(bg_purple, 0, 0, 16, 16, (16 + (global.map * 16))*cell[| 2] + x_ofset, (16 + (global.map * 16))*cell[| 1] + y_ofset, 0);
            tile = tile_layer_find(0, (16 + (global.map * 16))*cell[| 2] + x_ofset, (16 + (global.map * 16))*cell[| 1] + y_ofset);
            tile_set_scale(tile, 1 + global.map, 1 + global.map);
            break;
        
        case CIAN:
            tile_add(bg_cian, 0, 0, 16, 16, (16 + (global.map * 16))*cell[| 2] + x_ofset, (16 + (global.map * 16))*cell[| 1] + y_ofset, 0);
            tile = tile_layer_find(0, (16 + (global.map * 16))*cell[| 2] + x_ofset, (16 + (global.map * 16))*cell[| 1] + y_ofset);
            tile_set_scale(tile, 1 + global.map, 1 + global.map);
            break;
    }
        
    counter++;
}
