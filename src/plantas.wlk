/*
 * Lo ideal era que horasDeSol() sea un método abtracto y que solo se defina como atributo en la subclase que lo necesita(Quinoa).Si te fijás en los test, te viste obligado a cargarle el valor 0 cuando no era neceario
 * esParcelaIdeal(unaParcela) también debería ser un método abstracto y sobreescribirlo en las subclases
 */
import parcelas.*

class Planta{
	var property fechaDeLaSemilla
	var property altura

	method esFuerte() = self.horasDeSol() > 10
	method daSemillas() = self.esFuerte()
	method espacioQueOcupa()
	method horasDeSol()
	method esParcelaIdeal(unaParcela)
}

class Menta inherits Planta{
	override method horasDeSol() = 6
	override method daSemillas() = super() or altura > 0.4
	override method espacioQueOcupa() = altura*3
	override method esParcelaIdeal(unaParcela) = unaParcela.superficie() > 6 
	
	
}

class Soja inherits Planta{
	override method horasDeSol() {return 
		if(altura < 0.5) 6
		else if (altura.between(0.5,1))7
		else 9
	}
	override method daSemillas() = super() or (fechaDeLaSemilla > 2007 and altura > 1)
	override method espacioQueOcupa() = altura / 2
	override method esParcelaIdeal(unaParcela) = unaParcela.horasDeSolDeParcela() == self.horasDeSol()
}

class SojaTransgenica inherits Soja{
	override method daSemillas() = false
	 override method esParcelaIdeal(unaParcela) = unaParcela.cantidadMaxima() == 1
	
	
}

class HierbaBuena inherits Menta{
	override method espacioQueOcupa() = super() * 2 
}

class Quinoa inherits Planta{
	var horasDeSol
	override method horasDeSol() = horasDeSol
	override method espacioQueOcupa() = 0.5
	override method daSemillas() = super() or fechaDeLaSemilla < 2005
	override method esParcelaIdeal(unaParcela) = unaParcela.plantasDeLaParcela().all({p => p.altura() < 1.5 }) 
}


