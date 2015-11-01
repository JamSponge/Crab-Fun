if instance_exists(oPlayer)
    {
    Facing = point_direction (x,y,oCamera.x,oCamera.y)
    }
else
    {
    Facing = oEnemyArrayController.EnemyArray[EnemyID,1].image_angle
    }
