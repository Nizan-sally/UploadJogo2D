/// @description Insert description here
// You can write your code in this editor

//checando se estou tocando no chão//
chao = place_meeting(x, y + 1, obj_plat)
parede_dir = place_meeting(x + 1, y, obj_plat);
parede_esq = place_meeting(x - 1, y, obj_plat);


//configurando o timer do pulo
if(chao)
{
	 
timer_pulo = limite_pulo;	
carga = 1;
	
}
else
{

	if(timer_pulo > 0) timer_pulo--;

}


if(parede_dir || parede_esq)
{
	if (parede_dir) ultima_parede = 0;
	else ultima_parede = 1;

	timer_parede = limite_parede
	
}

else
{

	if (timer_parede > 0) timer_parede--;

}


//---------Controles--------//

var left, right,up, down, jump, jump_s, avanco_h, dash;

left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
jump = keyboard_check_pressed(ord("K"));
jump_s = keyboard_check_released(ord("K"));
dash = keyboard_check_pressed(ord("L"));



//configurando informações da movimentação//
avanco_h = (right - left) * max_velh; 

//valor da aceleração//
if(chao) acel = acel_chao;
else acel = acel_ar;




//-------------------State Machine-------------//
switch(estado)
{
	
	case state.parado:
	
		velh = 0;
		velv = 0;
	
	//posso mudar minha velocidade//
	//pulando
	if(jump && chao)
	{
		velv = -max_velv;
	}
	
	//saindo gravidade também//
	if(!chao) velv += grav;
	
	
	
	// saindo do estado//
	//Movendo
	if (abs(velh) > 0 || abs(velv) > 0 || left || right || jump) 
	{
	
	estado = state.movendo;
	
	
	}
	
	//aplicando velocidade horizontal//
velh = (right - left) * max_velh;

	
	//Dash
		
	if(dash && carga > 0)
	{
		//decidindo a direção 
		if (right || up || left || down)
		dir = point_direction(0, 0, (right - left), (down - up));	
		
	else//indo para direção que eseetou olhando
		dir = point_direction(0, 0, ver, 0);			
		
		estado = state.dash;
		carga--;
	}

	
		break;
		 
		case state.movendo:
		
		//Aplicando a movimentação//
		velh = lerp(velh, avanco_h, acel);
		
		//poeira movimento
		if (abs(velh) > max_velh - .5 && chao)
	{
		//criando poeira
		var chace = random(100);
		if (chace > 90)
		{
		
			for (var i = 0; i < random_range(4, 10); i++)
			{
	
			var xx = random_range(x - sprite_width/2, x + sprite_width/2)
	
			instance_create_layer(xx, y, "Instances", obj_vel);

			}
		
		}

	}	
		
		
		
		//gravidade e parede!!
		if (!chao && (parede_dir || parede_esq || timer_parede))
		{
		
			//não estou no chão mas estou tocando na parede
			if (velv > 0)//estou na parede e estou caindo
			{
			
				velv = lerp(velv, delize, acel);
				
			//criando poeira
		var chace = random(100);
		if (chace > 90)
		{
		
			for (var i = 0; i < random_range(4, 10); i++)
			{
	
			var onde = parede_dir - parede_esq;
			var xx = x + onde * sprite_width/2;
			var yy = y + random_range(-sprite_height/4, 0);
	
			instance_create_layer(xx, y, "Instances", obj_vel);

			}
		
		}

	
			
			}
			else
			{
			
				//estou subindo
				
				velv += grav;
				
			}
			
			//pulando pelas parede!!
			if( !ultima_parede && jump) //estou na parede e tentei pular
			{
				velv = -max_velv;
				velh = -max_velh;
				xscale = .5;
				yscale = 1.5;
				
			//criando poeira
			for (var i = 0; i < random_range(4, 10); i++)
				{
	
				var onde = parede_dir - parede_esq;
				var xx = x + sprite_width/2;
				var yy = y + random_range(-sprite_height/4, 0);
	
				instance_create_layer(xx, y, "Instances", obj_vel);

				}
				
			}
			else if(ultima_parede && jump)
			
			{
				velv = -max_velv;
				velh = max_velh;
				xscale = .5;
				yscale = 1.5;
				
			//criando poeira
			for (var i = 0; i < random_range(4, 10); i++)
				{
	
				var onde = parede_dir - parede_esq;
				var xx = x - sprite_width/2;
				var yy = y + random_range(-sprite_height/4, 0);
	
				instance_create_layer(xx, y, "Instances", obj_vel);

				}
				
				
			}
			
		}
		
		else if (!chao)//não estou no chão nem parede
		{
			velv += grav;
		
		}
	
		
		//Pulando
		if(jump && (chao || timer_pulo)) 
		{
		velv = -max_velv;
		
		//alterando a escala
		xscale = .5;
		yscale = 1.5;
		
		//criando poeira
		for (var i = 0; i < random_range(4, 10); i++)
	{
	
	var xx = random_range(x - sprite_width, x + sprite_width)
	
	instance_create_layer(xx, y, "Instances" , obj_vel);

	}
		
}
		
		//buffer do pulo
		if (jump) timer_queda = limite_buffer;
		if (timer_queda > 0) buffer_pulo = true;
		else buffer_pulo = false
		
		if ( buffer_pulo) // eu posso pular
{

	if(chao || timer_pulo) // as demais condições para o pulo sao verdadeiras também
	{
	
	velv = -max_velv;
	
	//alterando a escala
	xscale = .5;
	yscale = 1.5;
	
	timer_pulo = 0;
	timer_queda = 0;
	
		//Criando poeira
	
	for (var i = 0; i < random_range(4, 10); i++)
	{
	
	var xx = random_range(x - sprite_width, x + sprite_width)
	
	instance_create_layer(xx, y, "Instances", obj_vel);

		}	

	}
	
	timer_queda --;

}

	//controlando a altura do pulo
	
	if(jump_s && velv <0) velv *=.7;
	
	
	
	//Dash!!!
		
	if(dash && carga > 0)
	{
		//decidindo a direção 
		dir = point_direction(0, 0, (right - left), (down - up));
		
		
		
		estado = state.dash;
		carga--;
	}

	//Limitando Velocidades//
	velv = clamp(velv, -max_velv, max_velv);
		
		break;
		
		
		
		
		case state.dash:
		
		dura--;
		
		velh = lengthdir_x(len, dir);
		velv = lengthdir_y(len, dir);
		
		
		//deformando o PLayer
		if ( dir == 90 || dir == 270)
		{
		
			yscale = 1.5;
			xscale = .5;
		}
		else
		{
		
		yscale = .5;
		xscale = 1.6;
		
		}
		
		image_blend = c_red;
		
		//criando rastro 
		var rastro = instance_create_layer(x,y, "Instances", obj_player_vest);
		rastro.xscale = xscale ;
		rastro.yscale = yscale;
		
		//Saindo do estado
		if(dura <= 0)
		{
		
		estado = state.movendo;
		dura = room_speed/4;
		
		//Diminuindo a Velocidade
		velh = (max_velh * sign(velh) * .5);
		velv = (max_velv * sign(velv) * .5);
		}
	
		
		break;
		
		case state.morte:
	room_restart();

	
}

//Debug do estado
show_debug_message(estado);

switch(carga)
{

	case 0:
		sat = lerp(sat, 50, .05);
		break;
		
	case 1:
		sat = lerp(sat, 255, .05);
		break;
}

//definindo a cor dele
image_blend = make_color_hsv(20, sat, 255);


//voltando para a escala original
xscale = lerp(xscale, 1, .15);
yscale = lerp (yscale, 1, .15);




//aplicando velocidade/gravidade vertical//

if(!chao)
{
	
//Não estou no chão//
	velv += grav;

}
else
{

//estou no chão
if(jump)
{

velv  = -max_velv;
}

}








