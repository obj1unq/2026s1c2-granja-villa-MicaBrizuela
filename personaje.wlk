import wollok.game.*
import direcciones.*
import cultivos.*
import granja.*

object personaje {
	const cosechas = #{}
	var cantidadOro = 0
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
		cantidadOro += cosechas.sum({c => c.precio()})
		cosechas.clear()
	}

	method cantidadCosechas(){
		return cosechas.size()
	}

	method cantidadOro(){
		return cantidadOro
	}

	method declararAcumulado(){
		game.say(self,"Tengo " + self.cantidadOro() + ", y " + self.cantidadCosechas() + " para vender")
		console.println("game deberia haber hablado")
	}

	method dejarAspersorAca(){
		const a = new Aspersor(position = self.position())
		game.addVisual(a)
		granja.agregarAspersor(a)
	}







}