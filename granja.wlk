
import direcciones.*
import wollok.game.*
object granja {
    const cultivos = #{}
    const aspersores = #{}

    method agregarAspersor(_aspersor){
        aspersores.add(_aspersor)
    }

    method regadoAutomatico(){
        aspersores.forEach({as => as.regarLimitrofes()})
    }

    method agregarCultivo(_cultivo){
        cultivos.add(_cultivo)
    }

    method eliminarCultivo(_cultivo){
        cultivos.remove(_cultivo)
    }

    method hayCultivosEn(_position){
        return cultivos.any({c => c.position() == _position})
    }

    method cultivoAca(_position){
        return cultivos.find({c => c.position() == _position})
    }
}

class Aspersor{
    var property position = null
    method image(){
        return "aspersor.png"
    }
    method regarLimitrofes(){
        tablero.limitrofes(position).forEach({l => self.regarSiPuedo(l)})
    }

    method regarSiPuedo(l){
        if (granja.hayCultivosEn(l)){
            granja.cultivoAca(l).regar()
        }
    }
}
