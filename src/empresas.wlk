import profesionales.*
import solicitantes.*

class EmpresaServicio {
	var property profesionalesContratados = [ ]
	var property honorarioDeReferencia = 0
	var property clientesDeLaEmpresa = #{ }
	
	method cuantosEstudiaronEn(universidad) { 
		return profesionalesContratados.count({p => p.universidad() == universidad})
	}
	
	method profesionalesCaros() { 
		return profesionalesContratados.filter({p => p.honorariosPorHora() > honorarioDeReferencia})
	}
	
	method universidadesFormadoras() { 
		return profesionalesContratados.map({p => p.universidad()}).asSet() 
	}
	
	method profesionalMasBarato() { 
		return profesionalesContratados.min({p => p.honorariosPorHora()})
	}
	
	method esDeGenteAcotada() { 
		return profesionalesContratados.all({p => p.provinciasDondePuedeTrabajar().size() <= 3})
	}
	
	method puedeSatisfacer(solicitante) {
		return profesionalesContratados.any({p => solicitante.puedeSerAtendidoPor(p)})
	}
	
	method elegirProfesional(solicitante) { 
		return profesionalesContratados.filter({p => solicitante.puedeSerAtendidaPor(p)}).head()
	}
	
	method darServicio(solicitante) { 
		if(self.puedeSatisfacer(solicitante)){
			var profesionalElegido = self.elegirProfesional(solicitante)
			
			profesionalElegido.cobrar(profesionalElegido.honorariosPorHora())
			clientesDeLaEmpresa.add(solicitante)
		}
		else { self.error("No se puede satisfacer")}
	}
	
	method cuantosClientesTiene() { return clientesDeLaEmpresa.size()} 
	
	method tieneComoClienteA(solicitante) { 
		return clientesDeLaEmpresa.contais(solicitante)
	}
	
	method profesionalPocoAtractivo(profesional) {
		var provincias = profesional.provinciasDondePuedeTrabajar()
		var profesionales = provincias.filter({prov => self.profesionalesCalificados(prov)})
		
		return provincias.any({prov => self.sePuedeCubrir(prov)})
	}
	
	method sePuedeCubrir(provincia){
		profesionalesContratados.map({p => p.provinciaDondePuedeTrabajar()}).contains(provincia)
	}
	
	method profesionalesCalificados(provincia){
		profesionalesContratados.filter({p => 
			p.provinciaDondePuedeTrabajar().any({prov => prov == provincia})
		})
	}
	
}

