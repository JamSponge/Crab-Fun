depth = depth+1

if image_alpha > 0.2 {image_alpha += (0 - image_alpha) *0.005}
else {
image_alpha += (0 - image_alpha) *0.05
}

/* SCALING IS FUCKED BECAUSE OF ORIGINAL SETUP
if image_alpha <0.5 {
image_xscale += (0 - image_xscale) *0.005
image_yscale += (0 - image_yscale) *0.005
}*/

if image_alpha < 0.2 {image_speed = 0.1}
if image_index > 19 { image_speed = 0}

if depth >=1000{ depth =1000}
if image_alpha <0.01{
instance_destroy()
}

if image_xscale < 0 {image_xscale = 0}
if image_yscale < 0 {image_yscale = 0}