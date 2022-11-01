import parcelas.*

class Planta{
	var fechaDeLaSemilla
	var property altura
	var horasDeSol
	
	method horasDeSol() = horasDeSol
	method esFuerte() = self.horasDeSol() > 10
	method daSemillas() = self.esFuerte()
	method espacioQueOcupa()
	
}

class Menta inherits Planta{
	override method horasDeSol() = 6
	override method daSemillas() = super() or altura > 0.4
	override method espacioQueOcupa() = altura*3
	method esParcelaIdeal(unaParcela) = unaParcela.superficie() > 6 
	
	
}

class Soja inherits Planta{
	override method horasDeSol() {return 
		if(altura < 0.5) 6
		else if (altura < 1)7
		else 9
	}
	override method daSemillas() = super() or (fechaDeLaSemilla > 2007 and altura > 1)
	override method espacioQueOcupa() = altura / 2
	method esParcelaIdeal(unaParcela) = unaParcela.horasDeSolDeParcela() == self.horasDeSol()
}

class SojaTransgenica inherits Soja{
	override method daSemillas() = false
	 override method esParcelaIdeal(unaParcela) = unaParcela.cantidadMaxima() == 1
	
	
}

class HierbaBuena inherits Menta{
	override method espacioQueOcupa() = super() * 2 
}

class Quinoa inherits Planta{
	override method espacioQueOcupa() = 0.5
	override method daSemillas() = super() or fechaDeLaSemilla < 2005
	method esParcelaIdeal(unaParcela) = unaParcela.plantasDeLaParcela().all({p => p.altura() < 1.5 }) 
}


