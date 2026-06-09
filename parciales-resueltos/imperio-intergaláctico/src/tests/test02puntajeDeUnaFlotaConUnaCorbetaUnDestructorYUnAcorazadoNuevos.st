test02puntajeDeUnaFlotaConUnaCorbetaUnDestructorYUnAcorazadoNuevos
	| puntajeEsperado acorazado puntajeFlota corbeta destructor flota |	

	"Arrange"	
	acorazado := Acorazado inicializar.
	corbeta := Corbeta inicializar.
	destructor := Destructor inicializar.

    "la flota posee un número de naves mayor a cero, debe cumplirse desde su inicialización"
	flota := Flota inicializarConNaves: {acorazado. corbeta. destructor}.
	
	"Act"		
	puntajeFlota := flota puntajeTotal.
	
	"Assert"	
    puntajeEsperado := 620.
	self assert: puntajeFlota equals: puntajeEsperado.