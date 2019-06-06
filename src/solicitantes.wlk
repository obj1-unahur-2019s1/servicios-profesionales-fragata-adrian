import profesionales.*
import empresas.*

class Persona {
	var property provincia
	
	method puedeSerAtendidaPor(profesional) { 
		return profesional.provinciasDondePuedeTrabajar().contains(provincia)
	}
}

class Institucion {
	var property universidadesQueReconoce = #{ }
	
	method puedeSerAtendidaPor(profesional) { 
		return universidadesQueReconoce.contains(profesional.universidad())
	}
}