import plagas.*

class Hogar {
	var property nivelMugre = 0
	var property confort = 0
	
	method esBueno() = confort/2 >= nivelMugre 
	method sufrirAtqDe_(plaga){
		nivelMugre += plaga.nivelDmg()
		plaga.consecuenciasAtq()
	} 
}

class Huerta {
	var property capacidadProduccion = 0
	
	method esBueno() = 
		capacidadProduccion > nivelMinimoPedido.nivelMP()
	method sufrirAtqDe_(plaga) {
		capacidadProduccion -= plaga.nivelDmg()*0.1
		if(plaga.tramiscionEnfermedad()){
			0.max(capacidadProduccion -= 10)
			plaga.consecuenciasAtq()
		}
		else{}
	}
}

object nivelMinimoPedido {
	var property nivelMP = 20
}

class Mascota {
	var property nivelSalud = 250
	
	method esBueno()= nivelSalud > 250
	method sufrirAtqDe_(plaga) {
		if(plaga.tramiscionEnfermedad()){
			0.max(nivelSalud -= plaga.nivelDmg())
			plaga.consecuenciasAtq()
		}
		else{}
	}
}

class Barrio {
	const elementos = []
	
	method agregarElementos(elemento){elementos.add(elemento)}
	method esCopado() = 
		elementos.size() / 2 < self.cantElementosBuenos()
	method cantElementosBuenos() = 
		elementos.count({e => e.esBueno()})
}