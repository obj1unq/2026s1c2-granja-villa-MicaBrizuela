import wollok.game.*
import direcciones.*
class Maiz {
	var property position = null
	var estado = "baby"
	// method position() {
	// 	// TODO: hacer que aparezca donde lo plante Hector
	// 	return game.at(1, 1)
	// }
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "corn_" + estado + ".png"
	}

	method regar(){
		estado = "adult"
	}
}

class Trigo {
	var property position = game.origin()
	var medidorEvolucion = 0
	// method position() {
	// 	// TODO: hacer que aparezca donde lo plante Hector
	// 	return game.at(1, 1)
	// }
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "wheat_" + medidorEvolucion + ".png"
	}

	method regar(){
		if (medidorEvolucion < 3){
			medidorEvolucion += 1
		} else {
			medidorEvolucion = 0
		}
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
		if (not self.hayPlantaAca(nuevaPos)){
			position = nuevaPos
		}
	}

	method hayPlantaAca(_position){
		return game.getObjectsIn(_position).size() == 1
	}
}
