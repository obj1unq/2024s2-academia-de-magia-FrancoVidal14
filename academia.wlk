class Academia {
	const property muebles = #{} 
	
	method agregarMuebles(mueble){
		muebles.add(mueble)
	} 

	//1
	method estaGuardada(cosa) {
	   return muebles.any({mueble => mueble.laCosaEstaGuardada(cosa)})
	}

	//2
	method dondeEstaLaCosa(cosa){
		return muebles.find({mueble => mueble.laCosaEstaGuardada(cosa)})
	}

	//3
	method sePuedeGuardar(cosa) {
		return muebles.any({mueble => mueble.sePuedeAgregar(cosa)})
	}

	//4
	method enDondeSePuedeAgregar(cosa){
		return muebles.filter({mueble => mueble.sePuedeAgregar(cosa)})
	}

	//5
	method guardarEnLaAcademia(cosa) {
	  if (self.sePuedeGuardar(cosa)){
		(self.enDondeSePuedeAgregar(cosa).anyOne()).agregarCosa(cosa)
	  }
	}

}
class Cosa {
	var property marca    = null 
	var property volumen  = null 
	var property esMagico   = null
	var property reliquia = null
}

class Baul{
  const property cosas = #{}
  var property volumenMaximo = null 

  method agregarCosa(cosa){
	self.validarAgregar(cosa)
	cosas.add(cosa)
  }

  method validarAgregar(cosa) {
	if (not self.sePuedeAgregar(cosa)){
		self.error("No se puede agregar al baul")
	}
  }

  method sePuedeAgregar(cosa){
	return not cosas.contains(cosa) and self.volumenOcupado() + cosa.volumen() > self.volumenOcupado()
  }

  method volumenOcupado(){
	return cosas.sum({cosa => cosa.volumen()})
  }

  method laCosaEstaGuardada(cosa){
	return cosas.contains(cosa)
  }
}
class Gabinete {
  const property cosas = #{}
    method agregarCosa(cosa){
	self.validarAgregar(cosa)
	cosas.add(cosa)
  }

	method validarAgregar(cosa){
		if (not self.sePuedeAgregarCosa(cosa)){
			self.error("La cosa no es magica")
		}
	}

	method sePuedeAgregarCosa(cosa){
		return cosa.esMagico()
	}

  method laCosaEstaGuardada(cosa){
	return cosas.contains(cosa)
  }
}

class Armario {
  const property cosas = #{}
  var property cantidadMaximaDeCosas = null 

  method cantidadDeCosas(){
	return cosas.size()
  } 

    method agregarCosa(cosa){
	self.validarAgregar(cosa)
	cosas.add(cosa)
  }
	method validarAgregar(cosa){
		if (not self.sePuedeAgregarCosa(cosa)){
		self.error("No hay mas espacio")
		}
	}
	method sePuedeAgregarCosa(cosa){
		return cantidadMaximaDeCosas < self.cantidadDeCosas() + 1
	}

	method laCosaEstaGuardada(cosa){
	return cosas.contains(cosa)
  }
}