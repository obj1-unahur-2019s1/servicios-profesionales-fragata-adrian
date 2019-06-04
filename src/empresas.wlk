import profesionales.*

class EmpresaServicio {
	var property profesionalesContratados = [ ]
	const property honorarioDeReferencia = 0
	
	method cuantosEstudiaronEn(universidad) { 
		return profesionalesContratados.count({p => p.universidad() == universidad})
	}
	
	method profesionalesCaros() { 
		return profesionalesContratados.filter({p => p.honorariosPorHora() > honorarioDeReferencia})
	}
	
	method universidadesFormadoras() { 
		var universidadesFormadoras = #{ }
		profesionalesContratados.forEach({p => universidadesFormadoras.add(p.universidad())})
		return universidadesFormadoras
	}
	
	method profesionalMasBarato() { 
		return profesionalesContratados.min({p => p.honorariosPorHora()})
	}
	
	method esDeGenteAcotada() { 
		return profesionalesContratados.all({p => p.provinciasDondePuedeTrabajar().size() <= 3})
	}
}