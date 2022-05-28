class Plaga {
	var property poblacion
	
	method nivelDmg() = poblacion 
	method tramiscionEnfermedad() = poblacion >= 10
	method consecuenciasAtq(){ poblacion += poblacion * 0.1 }
	method ataqueElemento(elemento){elemento.sufrirAtqDe_(self)}
}


class Cucaracha inherits Plaga {
	var property pesoProm 
	
	override method nivelDmg() = super() * 0.5
	override method tramiscionEnfermedad() = super() and  pesoProm >= 10 
	override method consecuenciasAtq(){ super() pesoProm +=2} 
}

class Pulgas inherits Plaga {
	override method nivelDmg() = super()*2
}

class Garrapata inherits Pulgas {
	override method consecuenciasAtq() {poblacion+= poblacion * 0.2}
}

class Mosquito inherits Plaga {
	override method tramiscionEnfermedad() = super() and poblacion %3 == 0
}