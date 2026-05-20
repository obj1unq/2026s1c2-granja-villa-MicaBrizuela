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
		return estado.esCesechable()
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
		return estado.esCochechable()
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
}

object maizBebe{
	method imagen(){
		return "corn_baby.png"
	}

	method esCochechable(){
		return false
	}
}

object maizAdulto{
	method imagen(){
		return "corn_adult.png"
	}
}

object trigo0{
	method imagen(){
		return "wheat_0.png"
	}

	method siguiente(){
		return trigo1
	}
}

object trigo1{
	method imagen(){
		return "wheat_1.png"
	}

	method siguiente(){
		return trigo2
	}
}

object trigo2{
	method imagen(){
		return "wheat_2.png"
	}
	
	method siguiente(){
		return trigo3
	}
}

object trigo3{
	method imagen(){
		return "wheat_3.png"
	}

	method siguiente(){
		return trigo0
	}
}
