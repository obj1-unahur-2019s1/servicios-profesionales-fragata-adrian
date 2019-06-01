
class Universidad {
	var property provincia
	var property honorariosPorHora = 0
}

class ProfesionalAsociado {
	var property universidad
	
	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	method honorariosPorHora() { return 3000 }
}

class ProfesionalVinculado inherits Universidad{
	var property universidad
	
	method provinciasDondePuedeTrabajar() { return #{ provincia } }
}

class ProfesionalLibre inherits Universidad {
	var property universidad
	var property provinciasDondePuedeTrabajar = #{ }
	var property honorario = 0
	
	override method honorariosPorHora() { return super() + honorario }
}
