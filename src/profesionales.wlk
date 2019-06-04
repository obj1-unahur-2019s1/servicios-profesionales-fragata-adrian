
class Universidad {
	var property provincia 
	var property honorariosPorHora = 0
	var property dineroPorDonaciones = 0
	
	method recibirDonacion(cuanto) { dineroPorDonaciones += cuanto }
}

class ProfesionalVinculado {
	var property universidad
	
	method provinciasDondePuedeTrabajar() { return #{ universidad.provincia() } }
	
	method honorariosPorHora() { return universidad.honorariosPorHora()}
	
	method cobrar(importe) { universidad.recibirDonacion(importe/2) }
}

class ProfesionalAsociado {
	var property universidad
	
	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	method honorariosPorHora() { return 3000 }
	
	method cobrar(importe) { asociacionProfesionesDelLitoral.recibirDonacion(importe) }
}

class ProfesionalLibre{
	var property universidad
	var property provinciasDondePuedeTrabajar = #{ }
	var property honorario = 0 
	var property dinero = 0
	
	method honorariosPorHora() { return honorario }
	
	method cobrar(importe) { dinero += importe }
	
	method pasarDinero(persona, cuanto) { 
		dinero -= cuanto
		persona.cobrar(cuanto)
	}
}

object asociacionProfesionesDelLitoral {
	var property dineroPorDonaciones = 0
	
	method recibirDonacion(cuanto) { dineroPorDonaciones += cuanto }
}//