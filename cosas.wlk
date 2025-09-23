


object knightRider {
    method peso() = 500
    method peligrosidad() = 10
}

object bumblebee {
    var peligrosidad = 15
    var estado = auto
    
    method peso() = 800
    method cambioDeEstado(nuevoEstado) {
        peligrosidad = nuevoEstado.peligrosidad()
        estado = nuevoEstado
    }
    
}

object auto {
    method peligrosidad() = 15
}
object robot {
    method peligrosidad() = 30
}

object paqueteDeLadrillos {
    method peligrosidad() = 2
    var cantidad = 1
    method peso() = 2 * cantidad
    method cambiarCantidad(nuevaCantidad) {
        cantidad = nuevaCantidad
    }
}

object arenaAGranel {
    method peligrosidad() = 1
    var peso = 1
    method cambiarPeso(nuevoPeso) {
        peso = nuevoPeso
    }
}

object bateria {
    var peso = 300
    var peligrosidad = 100
    var estado = cargadoConMisiles
    method cambioDeEstado(nuevoEstado) {
        peso = nuevoEstado.peso()
        peligrosidad = nuevoEstado.peligrosidad()
        estado = nuevoEstado
    }
}

object cargadoConMisiles {
    method peso() = 300
    method peligrosidad() = 100
}

object descargado {
    method peso() = 200
    method peligrosidad() = 0
}

object contenedorPortuario {
    const cosas = []
    var peligrosidad = 0
    method peligrosidad() = peligrosidad
    method peligrosidadDeCosas(){
        if (cosas.isEmpty()){
            peligrosidad = 0}
        else {
            peligrosidad = cosas.max({i => i.peligrosidad()}).peligrosidad()
        }
    }
    method pesoCosas() {
        return cosas.fold(0, {acum, i => acum + i.peso()})
    }
    method cargarCosa(unaCosa){
        cosas.add(unaCosa)
    }
    method peso() = 100 + self.pesoCosas()
}

object radioactivos {
    var peso = 1
    method peso() = peso
    method cambiarPeso(nuevoPeso){
        peso = nuevoPeso
    }
    method peligrosidad() = 200
}

object embalaje {
    var cosa = null
    method envolver(unaCosa){
        cosa = unaCosa
    }
    method peso() = if(cosa == null) 0  else cosa.peso()
    method peligrosidad() = if(cosa == null) 0  else cosa.peligrosidad()/2
}