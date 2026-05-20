//la responsabilidad de saber que hay en una aprcela,
// le quita de enicma la resposabilidad al wollok.game:
// por ahora se queda con la responsabilidad
// - recordar donde hay cultivos
// - abstraer el mostrar el cultivo en pantalla
// 

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

object cultivo{
    method esCultivo(){
        return true
    }
}
