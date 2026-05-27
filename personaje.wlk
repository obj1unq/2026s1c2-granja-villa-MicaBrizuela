// personaje.wlk
// personaje.wlk
// personaje.wlk
// personaje.wlk
// personaje.wlk
// personaje.wlk
// personaje.wlk
// personaje.wlk
// personaje.wlk
// personaje.wlk
// personaje.wlk
// personaje.wlk
import wollok.game.*
import direcciones.*
import cultivos.*
import granja.*

object personaje {
	const property cosechas = #{} //testing
	var cantidadOro = 0
	var property position = game.origin()
	const property image = "fplayer.png"

	method mover(_direccion){
		const nuevaPos = _direccion.siguiente(position)
		position = nuevaPos
	}

	method sembrar(_cultivo){
		self.validarNoHayNada("No tengo espacio para plantar")
		granja.agregarCultivo(_cultivo)
		
	}

	method validarNoHayNada(_s){
		if (granja.hayAlgoAca(position)){
			self.error(_s)
		}
	}

	method regar(){
		self.validarHayPlanta('no tengo nada para regar')
		granja.cultivoAca(position).regar()
	}

	method validarHayPlanta(_s){
		if (not granja.hayCultivosEn(position)){
			self.error(_s)
		}
	}

	method cosechar(){
		self.validarHayPlanta('no tengo nada para cosechar')
		self.validarPuedoCosechar()
		const c = granja.cultivoAca(position)
		cosechas.add(c)
		granja.eliminarCultivo(c)
	}

	method validarPuedoCosechar() {
		if (not granja.cultivoAca(position).puedoCosechar()){
			self.error("Le falta riego")
		}
	}

	method vender(){
		if (granja.hayMercadoAca(position) and granja.mercadoAca(position).puedoPagar(cosechas)){
			granja.mercadoAca(position).comprar(cosechas)
			cosechas.clear()
		}
	}

	method recibirPago(_oro){
		cantidadOro += _oro
	}

	method cantidadCosechas(){
		return cosechas.size()
	}

	method cantidadOro(){
		return cantidadOro
	}

	method declararAcumulado(){
		game.say(self,"Tengo " + self.cantidadOro() + ", y " + self.cantidadCosechas() + " para vender")
	}

	method dejarAspersorAca(){
		self.validarNoHayNada("No tengo espacio")
		granja.agregarAspersor(position)
	}







}