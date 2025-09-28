


object knightRider {
    method peso() = 500
    method peligrosidad() = 10
    method cantidadDeBultos()=1
    method reaccionarAlCargar(){}

}

object bumblebee {
    var peligrosidad = 15
    var estado = auto
    method peligrosidad() = peligrosidad 
    method peso() = 800
    method cambioDeEstado(nuevoEstado) {
        peligrosidad = nuevoEstado.peligrosidad()
        estado = nuevoEstado
    }
    method cantidadDeBultos()=2
    method reaccionarAlCargar(){
        estado = robot
    }
    method estado()= estado
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
    method cantidadDeBultos(){
        return
        if(cantidad<=100){1} else if(cantidad.between(101,300)){2}else{300}
    }
    method reaccionarAlCargar(){
        cantidad +=  12
    } 
}

object arenaAGranel {
    method peligrosidad() = 1
    var peso = 1
    method cambiarPeso(nuevoPeso) {
        peso = nuevoPeso
    }
    method peso() = peso 
    method cantidadDeBultos()=1
    method reaccionarAlCargar(){
        peso = peso - 10
    }
}

object bateria {
    var peso = 300
    var peligrosidad = 100
    var estado = cargadoConMisiles
    method peligrosidad() =peligrosidad 
    method cambioDeEstado(nuevoEstado) {
        peso = nuevoEstado.peso()
        peligrosidad = nuevoEstado.peligrosidad()
        estado = nuevoEstado
    }
    method peso() = peso 
    method cantidadDeBultos(){
        return estado.cantidadDeBultos()
    }
    method reaccionarAlCargar(){
        estado = cargadoConMisiles
    }
}

object cargadoConMisiles {
    method peso() = 300
    method peligrosidad() = 100
    method cantidadDeBultos() = 2
}

object descargado {
    method peso() = 200
    method peligrosidad() = 0
    method cantidadDeBultos() = 1
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
    method cantidadDeBultos()= 1 + cosas.sum({c=>c.cantidadDeBultos()})
    method reaccionarAlCargar(){
        cosas.forEach({c=>c.reaccionarAlCargar()})
    }
}

object radioactivos {
    var peso = 1
    method peso() = peso
    method cambiarPeso(nuevoPeso){
        peso = nuevoPeso
    }
    method peligrosidad() = 200
    method cantidadDeBultos()=1
    method reaccionarAlCargar(){
        peso = peso + 15
    }
}

object embalaje {
    var cosa = null
    method envolver(unaCosa){
        cosa = unaCosa
    }
    method peso() = if(cosa == null) 0  else cosa.peso()
    method peligrosidad() = if(cosa == null) 0  else cosa.peligrosidad()/2
    method cantidadDeBultos()=2
    method reaccionarAlCargar(){}
}