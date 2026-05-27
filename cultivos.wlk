// cultivos.wlk
// cultivos.wlk
// cultivos.wlk
// cultivos.wlk
// cultivos.wlk
// cultivos.wlk
// cultivos.wlk
// cultivos.wlk
import personaje.*
import wollok.game.*
import direcciones.*
import granja.*

class Maiz {
	var property position = game.at(1,1)
	var property estado = maizBebe //test property
	method image() {
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
	var property estado = trigo0 //solo por testing
	method image() {
		return "wheat_" + estado.etapa() + ".png"
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
	method image() {
		return "tomaco.png"
	}

	method regar(){
		const nuevaPos = tablero.posicionEnEjeY(position)
		if (not granja.hayAlgoAca(nuevaPos)){ //no se mueve si hay algo, no explota
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
object tomacoFactory{
	method crear(){
		return new Tomaco(position = personaje.position())
	}
}

object maizFactory{
	method crear(){
		return new Maiz(position = personaje.position())
	}
}

object trigoFactory{
	method crear(){
		return new Trigo(position = personaje.position())
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


class Mercado{
    const property mercaderia = #{}
    var property position = null
    const property image = "market.png"
    var property cantidadMonedas = null

    method puedoPagar(_cultivos){
        return self.montoAPagar(_cultivos) <= cantidadMonedas
    }

    method montoAPagar(_cultivos){
        return _cultivos.sum({c => c.precio()})
    }

    method comprar(_cultivos){
        personaje.recibirPago(self.montoAPagar(_cultivos))
		cantidadMonedas -= self.montoAPagar(_cultivos)
        mercaderia.addAll(_cultivos)
    }
}

object mercadoFactory{
    method crear(){
        return new Mercado(position = tablero.posicionAleatoria(), cantidadMonedas = (100.. 500).anyOne())
    }
}