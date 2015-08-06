image_alpha += (0 - image_alpha) *0.005;
depth = depth-1
if depth <=0{ depth =0}
if image_alpha <0.01{
instance_destroy()
}