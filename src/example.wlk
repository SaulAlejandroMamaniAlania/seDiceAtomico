object burns{
	var varillas=10
	method prodEnergetica(ciudad){
		return 0.1*varillas
	}
	method contaminacion(){
		return varillas>20
	}
}

object exBosque{
	var capEnToneladas=20
	method prodEnergetica(ciudad){
		return 0.5+capEnToneladas*ciudad.riqueza()
	}
	method contaminacion(){
		return true
	}
	
}

object elSuspiro{
	var turbinas=[turbina1]
	method prodEnergetica(ciudad){
		return turbinas.sum({turbina=>turbina.prodEnergetica(ciudad)})
	}
	
	method contaminacion(){
		return false
	}
}
object turbina1{
	method prodEnergetica(ciudad){
		return 0.2*ciudad.vientos()
	}
}
object springfield{
	/*var  vientos=new List*/
	var property vientos=10
	var property riqueza=0.9
	//var centrales=[burns,exBosque,elSuspiro]
	var centrales=#{burns,exBosque,elSuspiro}
	method vientos(valor){
		vientos=valor
	}
	method produccionEnergeticaDe(central){
		return central.prodEnergetica(self)
	}
	method cubrioNecesidad(cantidad){
		return centrales.sum({central=>central.prodEnergetica(self)}) >= cantidad
	}
	method contaminantes(){
		return centrales.filter({central=>central.contaminacion()})
		
	}
	method estaAlHorno(cantidad){
		return self.cubrioNecesidad(0.5*cantidad)
	}
	method  masProductiva(){
		return centrales.max({central=>central.prodEnergetica(self)})
	}
	
	/*[ex,bosque,fjnsddk].map({central=>central.prodEnergetica()}).sum()
	 [1,2,3].sum({num=>num*3})*/
	 
}
object hidroelectrica{
	method prodEnergetica(ciudad){
		return 20000*ciudad.caudalRio()
	}
	
}
object albuquerque{
	var property caudalRio=150
	var centrales=[hidroelectrica]
	
	method masProductiva(){
		return centrales.first()
	}
}
object region{
	var ciudades=[springfield,albuquerque]
	method centralesMasProductoras(){
		return ciudades.map({ciudad=>ciudad.masProductiva()})
	}
}