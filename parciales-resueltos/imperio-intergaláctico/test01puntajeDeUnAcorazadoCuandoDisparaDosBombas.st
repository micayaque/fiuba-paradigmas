test01puntajeDeUnAcorazadoCuandoDisparaDosBombas
	| puntajeEsperado acorazado puntajeAcorazado puntajeAtaqueEsperado puntajeDefensaEsperado |	
		
		"Arrange"	
		acorazado := Acorazado inicializar.
		
		"Act"
		acorazado disparar.
		acorazado disparar.
				
		puntajeAcorazado := acorazado puntaje.
		
		"Assert"
        puntajeAtaqueEsperado := 8*5 + 100 - (10*(10-8)).
        puntajeDefensaEsperado := puntajeAtaqueEsperado * 2.
		puntajeEsperado := puntajeAtaqueEsperado + puntajeDefensaEsperado.
		
		self assert: puntajeAcorazado equals: puntajeEsperado.