/// @description Insert description here
// You can write your code in this editor

//Checando se posso ir para a proxima room (se ela existe)
if (qtd <=0){
	if (room_next(room) != -1)


{

	room_goto_next();
}
	
	else
{
	//não tem room para ir 
	
	game_restart();

}
}