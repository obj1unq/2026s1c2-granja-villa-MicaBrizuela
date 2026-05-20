import wollok.game.*
import direcciones.*
import cultivos.*
import granja.*

object personaje {
	const cosechas = #{}
	var property position = game.origin()
	const property image = "fplayer.png"

	method mover(_direccion){
		const nuevaPos = _direccion.siguiente(position)
		position = nuevaPos
	}

	method sembrar(_cultivo){
		if (not self.hayCultivosEnLaParcela()){
			granja.agregarCultivo(_cultivo)
			game.addVisual(_cultivo)
		}
	}

	method hayCultivosEnLaParcela(){
		return granja.hayCultivosEn(position)
	}

	method regar(){
		self.validarHayPlanta('no tengo nada para regar')
		granja.cultivoAca(position).regar()
	}

	method validarHayPlanta(_s){
		if (not self.hayCultivosEnLaParcela()){
			self.error(_s)
		}
	}

	method cosechar(){
		self.validarHayPlanta('no tengo nada para cosechar')
		if (granja.cultivoAca(position).puedoCosechar()) {
			const c = granja.cultivoAca(position)
			cosechas.add(c)
			game.removeVisual(c)
			granja.eliminarCultivo(c)
		}
	}

	method vender(){
		
	}






}