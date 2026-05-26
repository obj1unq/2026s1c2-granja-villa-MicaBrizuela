

import wollok.game.*
object granja {
    const cultivos = #{}

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
