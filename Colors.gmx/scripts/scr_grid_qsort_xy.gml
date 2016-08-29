#define scr_grid_qsort_xy
///scr_grid_qsort_xy(grid list id, left boundary, right boudary)

var list  = argument0;
var left  = argument1;
var right = argument2;

var i     = left;
var j     = right;
var pivot = list[| (i + j) div 2];

while(i <= j){
    while(scr_compare_xy(pivot, list[| i])) i++;
    while(scr_compare_xy(list[| j], pivot)) j--;
    
    if(i <= j){
        var temp  = list[| i];
        list[| i] = list[| j];
        list[| j] = temp;
        
        i++;
        j--;
    }
}

if(left < j) scr_grid_qsort_xy(list, left, j);
if(i < right) scr_grid_qsort_xy(list, i, right);

#define scr_compare_xy
///scr_compare_xy(cell a, cell b)
//returns 1 if a > b,  0 if a = b, -1 if a < b

var cell_a = argument0;
var cell_b = argument1;

if(cell_a[| 1] > cell_b[| 1]) return 1;
else if(cell_a[| 1] < cell_b[| 1]) return -1;
else{
    if(cell_a[| 2] > cell_b[| 2]) return 1;
    else if(cell_a[| 2] < cell_b[| 2]) return -1;
    else return 0;
}
