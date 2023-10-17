class Aparato {
	method puedeUtilizar()
	method utilizar()
}


class Magneto inherits Aparato{
	var color
	method color() = color
	method puedeUtilizar(_persona) = true
	method utilizar(persona){
		const nivel = persona.nivelDeDolor()
		persona.nivelDeDolor(nivel * 0.1)
	}
}

class Bicicleta inherits Aparato{
	var color
	method color() = color
	method puedeUtilizar(persona) = persona.edad() > 8
	method utilizar(persona){
		persona.nivelDeDolor(4)
		persona.nivelDeFortaleza(3)
	}
	
}

class Minitramp inherits Aparato{
	var color
	method color() = color
	method puedeUtilizar(persona) = persona.nivelDeDolor() < 20
	
	method utilizar(persona){
		persona.nivelDeFortaleza(persona.edad() * 0.1 )
	}
	
}