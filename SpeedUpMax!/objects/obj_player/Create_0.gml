/// @description Insert description here
// You can write your code in this editor

grav = .3;
acel_chao = .1;
acel_ar = .07;
acel = acel_chao;
delize = .5;

//------Velocidades----//
velh = 0;
velv = 0;

//-----limites da Velocidade----//
max_velh = 6;
max_velv = 8;
len = 10;


//bonus para pulo
limite_pulo = 6;
timer_pulo = limite_pulo;

limite_buffer = 6;
timer_queda	= 0;
buffer_pulo = false;


limite_parede = 6;
timer_parede = 0;
  
//--------Variaveis de Controle--------//
chao = false
parede_dir = false;
parede_esq = false;
 

yscale = 1;
xscale = 1;
dura = room_speed/4;
dir = 0;
carga = 1;
ultima_parede = 0;
ver = 1;

//controlando cor

sat = 255;

//state machine
enum state
{
 parado,movendo, dash, morte
 }

estado = state.parado;

//-------CRIANDO A CAMERA
if (!instance_exists(obj_camera))
{

	//camera não exite
	
instance_create_layer(0, 0, "instances", obj_camera);

}

