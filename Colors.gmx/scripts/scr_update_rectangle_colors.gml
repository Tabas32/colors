///scr_update_rectangle_colors(grid list id, x ofset, y ofset)

var grid = argument0;
var x_ofset = argument1;
var y_ofset = argument2;

var size = ds_list_size(grid);
var i    = 0;
var tile = 0;

while(i < size){
    var cell = grid[| i++];
    var color = cell[| 0];
    
    switch(cell[| 0]){
        case RED:
            tile = tile_layer_find(0, cell[| 2]*(16 + global.map * 16) + x_ofset, cell[| 1]*16 + y_ofset);
            tile_set_background(tile, bg_red);
            tile_set_scale(tile, 1 + global.map, 1 + global.map);
            break;
            
        case BLUE:
            tile = tile_layer_find(0, cell[| 2]*(16 + global.map * 16) + x_ofset, cell[| 1]*16 + y_ofset);
            tile_set_background(tile, bg_blue);
            tile_set_scale(tile, 1 + global.map, 1 + global.map);
            break;
            
        case GREEN:
            tile = tile_layer_find(0, cell[| 2]*(16 + global.map * 16) + x_ofset, cell[| 1]*16 + y_ofset);
            tile_set_background(tile, bg_green);
            tile_set_scale(tile, 1 + global.map, 1 + global.map);
            break;
            
        case YELLOW:
            tile = tile_layer_find(0, cell[| 2]*(16 + global.map * 16) + x_ofset, cell[| 1]*16 + y_ofset);
            tile_set_background(tile, bg_yellow);
            tile_set_scale(tile, 1 + global.map, 1 + global.map);
            break;
            
        case WHITE:
            tile = tile_layer_find(0, cell[| 2]*(16 + global.map * 16) + x_ofset, cell[| 1]*16 + y_ofset);
            tile_set_background(tile, bg_white);
            tile_set_scale(tile, 1 + global.map, 1 + global.map);
            break;
            
        case PURPLE:
            tile = tile_layer_find(0, cell[| 2]*(16 + global.map * 16) + x_ofset, cell[| 1]*16 + y_ofset);
            tile_set_background(tile, bg_purple);
            tile_set_scale(tile, 1 + global.map, 1 + global.map);
            break;
            
        case CIAN:
            tile = tile_layer_find(0, cell[| 2]*(16 + global.map * 16) + x_ofset, cell[| 1]*16 + y_ofset);
            tile_set_background(tile, bg_cian);
            tile_set_scale(tile, 1 + global.map, 1 + global.map);
            break;
    }
}
