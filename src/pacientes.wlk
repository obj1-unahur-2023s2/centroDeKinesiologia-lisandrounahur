import aparatos.*

object RapidaRecuperacion {
	const valor = 3
	method valor() = valor
}

class Paciente {
	const edad
	var nivelDeFortaleza
	var nivelDeDolor
	var rutina
	
	method edad()= edad
	method nivelDeFortaleza() = nivelDeFortaleza
	method nivelDeFortaleza(valor){
		nivelDeFortaleza += valor
	}
	
	method nivelDeDolor() = nivelDeDolor
	method nivelDeDolor(valor){
		nivelDeDolor -= valor
	} 
	
	method utilizarAparato(aparato){
		if(self.puedeUtilizarAparato(aparato)){
			aparato.utilizar(self)
		}
		else {
			self.error("No puede utilizar este aparato")
		}
	 }
	 
	method puedeUtilizarAparato(aparato) = aparato.puedeUtilizar(self)
	
	method puedeRealizarRutina() = rutina.all({aparato => self.puedeUtilizarAparato(aparato)})
	
	method realizarRutina() {rutina.forEach({aparato => self.utilizarAparato(aparato)})}
	
}

class PacienteResistente inherits Paciente {
	override method utilizarAparato(aparato){
		if(self.puedeUtilizarAparato(aparato)){
			aparato.utilizar(self)
			self.nivelDeFortaleza(1)
		}
		else {
			self.error("No puede utilizar este aparato")
		}
	}
}

class PacienteCaprichoso inherits Paciente {
	
	override method realizarRutina(){rutina.forEach({aparato => self.utilizarAparato(aparato) self.utilizarAparato(aparato)})}
	override method puedeRealizarRutina() = rutina.all({aparato => self.puedeUtilizarAparato(aparato)}) and rutina.any({aparato => aparato.color() == "rojo"})
}

class PacienteRapidaRecuperacion inherits Paciente {
	override method realizarRutina(){
		self.nivelDeDolor(RapidaRecuperacion.valor())
		rutina.forEach({aparato => self.utilizarAparato(aparato)})
	}
}
