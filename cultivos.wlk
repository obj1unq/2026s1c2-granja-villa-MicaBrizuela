import personaje.*
import wollok.game.*
import direcciones.*
import granja.*

//falta sembrar en cada cultivo 
class Maiz {
	var property position = game.at(1,1)
	var estado = maizBebe
	// method position() {
	// 	// TODO: hacer que aparezca donde lo plante Hector
	// 	return game.at(1, 1)
	// }
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return estado.imagen()
	}

	method regar(){
		estado = maizAdulto
	}

	method puedoCosechar(){
		return estado.esCosechable()
	}

	method precio(){
		return 150
	}
}

class Trigo {
	var property position = game.origin()
	var estado = trigo0
	// method position() {
	// 	// TODO: hacer que aparezca donde lo plante Hector
	// 	return game.at(1, 1)
	// }
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return estado.imagen()
	}

	method regar(){
		estado = estado.siguiente()
	}

	method puedoCosechar(){
		return estado.esCosechable()
	}

	method precio(){
		return (estado.etapa() - 1) * 100
	}
}


class Tomaco {
	var property position = game.at(1, 1)
	// method position() {
	// 	// TODO: hacer que aparezca donde lo plante Hector
	// 	return game.at(1, 1)
	// }
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "tomaco.png"
	}

	method regar(){
		const nuevaPos = tablero.posicionEnEjeY(position)
		if (not granja.hayCultivosEn(nuevaPos)){
			position = nuevaPos
		}
	}
	method puedoCosechar() {
		return true
	}

	method precio(){
		return 80
	}
}

object maizBebe{
	method imagen(){
		return "corn_baby.png"
	}

	method esCosechable(){
		return false
	}
}

object maizAdulto{
	method imagen(){
		return "corn_adult.png"
	}

	method esCosechable(){
		return true
	}
}

object trigo0{
	method imagen(){
		return "wheat_0.png"
	}

	method siguiente(){
		return trigo1
	}

	method etapa(){
		return 0
	}

	method esCosechable(){
		return false
	}
}

object trigo1{
	method imagen(){
		return "wheat_1.png"
	}

	method siguiente(){
		return trigo2
	}

	method etapa(){
		return 1
	}

	method esCosechable(){
		return false
	}
}

object trigo2{
	method imagen(){
		return "wheat_2.png"
	}
	
	method siguiente(){
		return trigo3
	}

	method etapa(){
		return 2
	}

	method esCosechable(){
		return true
	}
}

object trigo3{
	method imagen(){
		return "wheat_3.png"
	}

	method siguiente(){
		return trigo0
	}

	method etapa(){
		return 3
	}

	method esCosechable(){
		return true
	}
}
