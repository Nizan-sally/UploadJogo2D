/// @description Insert description here
// You can write your code in this editor

//recarga
if(other.carga <=0) other.carga++;
audio_play_sound(snd_bonus, 1, false);
//gerando os pedaços
for(var i = 0; i < irandom_range(20, 50); i++)
	{
		
		var ped = instance_create_layer(x,y, "Instances", obj_part);
		ped.sprite_index = sprite_index;
	
	
	}

sumir = true;

alarm[0] = room_speed *3;