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
	
	
	method plantarUnaPlanta(unaPlanta){
		plantasDeLaParcela.add(unaPlanta)
		if(self.cantidadMaxima() < plantasDeLaParcela.size() || horasDeSolDeParcela + 2 < unaPlanta.horasDeSol() ){
			self.error("No se puede plantar una planta")
		}
	}
	
	method noHayPlantasMayorAUnMetroYMedio() = plantasDeLaParcela.all({p => p.altura() < 1.5})
	method seAsociaBienCon(unaPlanta)
	method cantidadPlantasBienAsociadas() = plantasDeLaParcela.count({planta => self.seAsociaBienCon(planta)})
	
}

class ParcelaEcologica inherits Parcela {
	override method seAsociaBienCon(unaPlanta) = !self.tieneComplicaciones() && unaPlanta.esParcelaIdeal(self)
}

class ParcelaIndustrial inherits Parcela {
	override method seAsociaBienCon(unaPlanta) = self.cantidadMaxima() <= 2 && unaPlanta.esFuerte()
}
	

object inta {
	const property parcelas = []
	method ingresarParcelas(unaParcela) { parcelas.add(unaParcela) }
	method sumaPlantasPorParcela() = parcelas.sum({p => p.plantasDeLaParcela().size()}) 
	method promedioDePlantasPorParela() = self.sumaPlantasPorParcela() / parcelas.size()
	method parcelasConMasDeCuatroPlantas() = parcelas.filter({p => p.plantasDeLaParcela().size() > 4})
	method masAutoSustentable() = self.parcelasConMasDeCuatroPlantas().max({p => p.cantidadPlantasBienAsociadas()})
	






