/// @description Insert description here
// You can write your code in this editor

//gerando os pedaços
for(var i = 0; i < irandom_range(20, 50); i++)
	{
		var ped = instance_create_layer(x,y, "Instances", obj_part);
		ped.sprite_index = sprite_index;
	
	}
	audio_play_sound(snd_item, 1, false);
	
instance_destroy();

