import plantas.*

class Parcela {
	var ancho
	var largo
	var property horasDeSolDeParcela
	const property plantasDeLaParcela = []
	
	method superficie() = ancho * largo
	method cantidadMaxima() {return
		if(ancho > largo) self.superficie() / 5
		else self.superficie() / 3 + largo
	}
	method tieneComplicaciones() = self.plantasDeLaParcela().any({p =>p.horasDeSol() < horasDeSolDeParcela})
	
	method plantarUnaPLanta(unaPlanta){return
		if(self.cantidadMaxima() > plantasDeLaParcela.size() or unaPlanta.horasDeSol()< horasDeSolDeParcela + 2 )
			plantasDeLaParcela.add(unaPlanta)
		else self.error("No se puede plantar una planta")
	
		
	}
	
	
	
	
	
}






