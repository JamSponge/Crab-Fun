#define LevelCreateTilePlacement
for (var row=0; row<ds_grid_height(grid); row++)
{
    for (var col=0; col<ds_grid_width(grid); col++)
    {

        //ONLY APPLY TO REQUIRED SPACES    
        if grid[# col, row] = 1
        {
        
        //CHECK NEARBY TILES
           var sum = 0;
           if north() sum += 1;
           if west()  sum += 2;
           if south() sum += 4;
           if east() sum += 8;
           
           grid[# col, row]=sum
        }
    }
}

#define north
if grid[# col-1, row] = 1
{return true}
else {}

#define west
if grid[# col, row-1] = 1
{return true}
else {}

#define east
if grid[# col, row+1] = 1
{return true}
else {}

#define south
if grid[# col+1, row] = 1
{return true}
else {}
