import wollok.game.*
import direcciones.*
import cultivos.*

object personaje {
	const cultivosCocechados = []
	var property position = game.origin()
	const property image = "fplayer.png"

	method mover(_direccion){
		const nuevaPos = _direccion.siguiente(position)
		position = nuevaPos
	}

	method sembrarMaiz(){
		if (not self.hayCultivosEnLaParcela()) {
			const maizNuevo = new Maiz(position = self.position())
			game.addVisual(maizNuevo)
		}
	}

	method hayCultivosEnLaParcela(){
		return game.getObjectsIn(position).size() > 1
	}

	method sembrarTrigo(){
		if (not self.hayCultivosEnLaParcela()) {
			const trigoNuevo = new Trigo(position = self.position())
			game.addVisual(trigoNuevo)
		}
	}

	method sembrarTomaco(){
		if (not self.hayCultivosEnLaParcela()) {
			const tomacoNuevo = new Tomaco(position = self.position())
			game.addVisual(tomacoNuevo)
		}
	}

	method regar(){
		self.validarHayPlanta()
		game.uniqueCollider(self).regar()
	}

	method validarHayPlanta(){
		if (not self.hayCultivosEnLaParcela()){
			self.error('no tengo nada para regar')
		}
	}




}