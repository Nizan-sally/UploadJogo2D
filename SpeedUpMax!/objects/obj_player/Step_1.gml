/// @description Insert description here
// You can write your code in this editor


//checando se eu acabei de cair no chao

var temp = place_meeting(x, y + 1, obj_plat);
if(temp && !chao)//acabei de tocar no chao!!!
{
	xscale = 1.6;
	yscale = .5;
	

	//poeira
	for (var i = 0; i < random_range(4, 10); i++)
	{
	
	var xx = random_range(x - sprite_width, x + sprite_width)
	
	instance_create_layer(xx, y, "Instances", obj_vel);

	}

}

