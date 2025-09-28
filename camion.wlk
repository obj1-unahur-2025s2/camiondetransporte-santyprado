object camion {
    const carga = []
    method cargar(algo) {
      carga.add(algo)
      algo.reaccionarAlCargar()
    }
    method descargar(algo){
        carga.remove(algo)
    }
    method cargarVariasCosas(listaDeCosas) {
      carga.addAll(listaDeCosas)
    }
    method peso(){return 1000 + carga.sum({c=>c.peso()})}  

    method cargaConUnPeso(unPeso){
        return carga.any({c =>c.peso()==unPeso}) 
    }
    method cargasPares(){
        return carga.all({c=>c.peso().even()})
    }    
     method cargaConPeligrosidad(unaPeligrosidad) {
        return carga.find({c => c.peligrosidad() == unaPeligrosidad})
    } 

    method todasLasCosasPeligrosas(unaPeligrosidad) {
      return carga.filter({c => c.peligrosidad() > unaPeligrosidad})
    }

    method estaExcedido() {return self.peso() > 2500} 

    method puedeCircularEnRuta(unaPeligrosidad) {
        return not self.estaExcedido() and not carga.any({c => c.peligrosidad() > unaPeligrosidad}) 
    } 

    method cosaMasPesada()= carga.max({a =>a.peso()})
    method contieneCosaQuePesa(maximo,minimo)=carga.any({c =>c.peso().between(minimo, maximo)})
    method totalDeBultosCargados() = carga.sum({c=>c.cantidadDeBultos()})
}