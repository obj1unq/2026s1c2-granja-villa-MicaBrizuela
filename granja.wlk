// granja.wlk
// granja.wlk
// granja.wlk
// granja.wlk
// granja.wlk
// granja.wlk
// granja.wlk
// granja.wlk
// granja.wlk
// granja.wlk
// granja.wlk
// granja.wlk
// granja.wlk
// granja.wlk
// granja.wlk
// granja.wlk
// granja.wlk
// granja.wlk
// granja.wlk
// granja.wlk
// granja.wlk
// granja.wlk
// granja.wlk

import direcciones.*
import wollok.game.*
import cultivos.*

object granja {
    const property cultivos = #{} //property solo por testig
    const property aspersores = #{} //property solo por testig
    const property mercados = #{}//property solo por testig

    method hayAlgoAca(_position){
        return self.hayMercadoAca(_position) or self.hayCultivosEn(_position) or self.hayAspersorAca(_position)
    }

    method abrirMercado(){
        if(mercados.size() < 3){
            const m = mercadoFactory.crear()
            self.agregarMercado(m)
            self.abrirMercado()
        }
    }

    method agregarMercado(_mercado) {
        game.addVisual(_mercado)
        mercados.add(_mercado)
    }

    method hayMercadoAca(_position){
        return mercados.any({m => m.position() == _position})
    }

    method mercadoAca(_position){
        return mercados.find({m => m.position() == _position})
    }

    method agregarAspersor(_position){
        const a = aspersorFactory.crear(_position)
        game.addVisual(a)
        aspersores.add(a)
    }

    method hayAspersorAca(_position){
        return aspersores.any({m => m.position() == _position})
    }

    method regadoAutomatico(){
        aspersores.forEach({as => as.regarLimitrofes()})
    }

    method agregarCultivo(_cultivo){
        game.addVisual(_cultivo)
        cultivos.add(_cultivo)
    }

    method eliminarCultivo(_cultivo){
        game.removeVisual(_cultivo)
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

object aspersorFactory {
    method crear(_position){
        return new Aspersor(position = _position)
    }
}

