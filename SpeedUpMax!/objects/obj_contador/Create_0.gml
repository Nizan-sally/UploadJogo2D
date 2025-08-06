/// @description Insert description here
// You can write your code in this editor
// contador
audio_stop_sound(snd_musica_fundo)
instance_destroy(obj_contador2)
instance_destroy(obj_contador3)
instance_destroy(obj_contador4)
instance_destroy(obj_contador5)
persistent = true;
tempo0 = 30;
alarm[0] = 60;
audio_play_sound(snd_musica_fundo, 1, true);


