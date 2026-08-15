# Imperio intergaláctico

En un imperio intergaláctico existen distintos tipos de $\textcolor{purple}{\text{naves}}$ espaciales. El $\textcolor{purple}{\text{puntaje total}}$ de cada nave dependerá de con qué tipo de $\textcolor{purple}{\text{sistema de ataque y defensa}}$ esté equipada la misma, el estado actual de ambos y será la $\textcolor{purple}{\text{suma de ambos sistemas}}$.

---

### Características de una **Corbeta:** (30 + 20 = 50 puntos)

- Posee $\textcolor{purple}{\text{3 misiles}}$ que suman $\textcolor{purple}{\text{10 puntos}}$ cada uno. A medida que $\textcolor{purple}{\text{dispara}}$ se le van gastando. Si se queda sin misiles suma 0 puntos en ataque.
- Posee un $\textcolor{purple}{\text{escudo simple}}$, suma $\textcolor{purple}{\text{20 puntos}}$. A medida que $\textcolor{purple}{\text{recibe daños}}$ se le va restando los puntos. Por ejemplo: si una corbeta nueva recibe un ataque de 1 misil, luego del ataque el puntaje de su escudo será solamente de 10 puntos.

---

### Características de un **Destructor:** (50 + 20 + 50 = 120 puntos)

- Posee $\textcolor{purple}{\text{5 misiles}}$. Cuando el destructor tiene los 5 misiles suma $\textcolor{purple}{\text{10 puntos por cada uno + 20 puntos extras}}$. Con $\textcolor{purple}{\text{4 misiles}}$ o menos, sólo suma una unidad por cada misil. Si se queda sin misiles suma 0 puntos en ataque.
- Posee un $\textcolor{purple}{\text{escudo Fenix}}$ que suma $\textcolor{purple}{\text{50 puntos}}$, pero al ser destruido, el mismo revive en forma de escudo simple sumando 30 puntos.

---

### Características de un **Acorazado**: (50 + 100 + 150*2 = 450 puntos)

- Posee un doble sistema de ataque:
    - $\textcolor{purple}{\text{10 bombas de neutrones}}$. Suman $\textcolor{purple}{\text{5 puntos}}$ cada una. A medida que dispara se le van gastando hasta quedarse sin bombas y sumar 0.
    - Torreta iónica: Suma $\textcolor{purple}{\text{100 puntos}}$ al contar con las 10 bombas de neutrones, caso contrario resta $\textcolor{purple}{\text{10 puntos}}$ por cada bomba de neutrones gastada.
- Posee un escudo iónico, que $\textcolor{purple}{\text{multiplica x 2}}$ el puntaje de ataque que tenga la nave que lo contiene.

---

### Características de una Flota:

- Posee un número $\textcolor{purple}{\text{ilimitado}}$ de naves $\textcolor{purple}{\text{mayor a cero}}$. Su $\textcolor{purple}{\text{puntaje total}}$ será la suma de los puntajes totales de las naves que la componen.

---

Se pide:

### 1. Diagrama de clases (**completo**) que representen el modelo descrito.

```mermaid
%%{init: {
  "theme": "base",
  "themeVariables": {
    "background": "#0f1117",
    "primaryColor": "#161b22",
    "primaryBorderColor": "#d2a8ff",
    "primaryTextColor": "#c9d1d9",
    "secondaryColor": "#161b22",
    "tertiaryColor": "#30363d",
    "lineColor": "#79c0ff",
    "textColor": "#c9d1d9",
    "classText": "#c9d1d9",
    "mainBkg": "#161b22",
    "nodeBorder": "#d2a8ff",
    "clusterBkg": "#161b22",
    "clusterBorder": "#30363d",
    "titleColor": "#c9d1d9",
    "edgeLabelBackground": "#0f1117",
    "fontFamily": "Consolas, monospace"
  }
}}%%
classDiagram
    class Nave {
        <<abstract>>
        -ataque: Ataque
        +puntaje()*
    }

    class Corbeta {
        -escudo: EscudoSimple
        +disparar()
        +recibirAtaque()
    }

    class EscudoSimple {
        -puntosPorDanio: Number
    }

    class Destructor {
        -escudo: EscudoFenix
        -estadoConCincoMisiles: Boolean
        +disparar()
        +recibirAtaque()
        +sumarPuntosExtra()
    }

    class EscudoFenix {
        -estaDestruido: Boolean
    }

    class Acorazado {
        -escudo: EscudoIonico
        -torreta: TorretaIonica
        -bombasDeNeutrones: Number
        -torretaIonicaActiva: Boolean
        +disparar()
        +recibirAtaque()
    }

    class Ataque {
        -cantidadDisparos: Number
        -puntosPorDisparo: Number
        +disparar()
        +puntaje() Number
    }

    class TorretaIonica {
        -puntos: Number
        -estadoSuma: Boolean
        -bombasGastadas: Number
        +puntaje() Number
    }

    class EscudoIonico {
        +puntaje(Number: puntaje) Number
    }

    class Flota {
        +puntajeTotal() Number
    }

    class EscudoAtacable {
        <<abstract>>
        -puntos: Number
        +recibirDanio()
        +puntaje() Number
    }

    %% --- Relaciones ---

    EscudoAtacable <|-- EscudoSimple
    EscudoAtacable <|-- EscudoFenix

    Flota o-- "*" Nave

    Nave <|-- Acorazado

    Acorazado o-- Ataque
    Acorazado o-- TorretaIonica
    Acorazado o-- EscudoIonico

    Nave <|-- Destructor
    Destructor o-- Ataque
    Destructor o-- EscudoFenix

    Corbeta o-- Ataque
    Corbeta o-- EscudoSimple
    Nave <|-- Corbeta
```

---

### 2. Diagrama de secuencia para cada uno de los casos de uso. **IMPORTANTE**: En cada diagrama de secuencia se debe mostrar la inicialización de los objetos involucrados.

Los casos de uso son:

#### 1. Calcular el **puntaje total** de un **Acorazado** nuevo luego de disparar 2 bombas de neutrones.

```mermaid
%%{init: {
	"mirrorActors": false,
  "theme": "base",
  "themeVariables": {
    "background": "#0f1117",
    "actorBkg": "#1e2536",
    "actorBorder": "#4f8ef7",
    "actorTextColor": "#e2e8f0",
    "actorLineColor": "#2a3347",
    "signalColor": "#4f8ef7",
    "signalTextColor": "#e2e8f0",
    "labelBoxBkgColor": "#1e2536",
    "labelBoxBorderColor": "#2a3347",
    "labelTextColor": "#8899aa",
    "loopTextColor": "#8899aa",
    "noteBkgColor": "#1e2536",
    "noteBorderColor": "#a78bfa",
    "noteTextColor": "#e2e8f0",
    "activationBorderColor": "#4f8ef7",
    "activationBkgColor": "#2a3347"
  }
}}%%
sequenceDiagram
    actor test as Test01

    create participant ac as :Acorazado
    test ->> ac: <<create>> inicializar
    activate ac

    create participant atb as ataque1<br/>:BombasDeNeutrones
    ac ->> atb: <<create>> BombasDeNeutrones(10)

    create participant att as ataque2<br/>:TorretaIonica
    ac ->> att: <<create>> TorretaIonica()

    create participant de as defensa<br/>:EscudoIonico
    ac ->> de: <<create>> EscudoIonico()

    deactivate ac

    test ->> ac: disparar()
    activate ac
    ac ->> atb: disparar()
    deactivate ac

    test ->> ac: disparar()
    activate ac
    ac ->> atb: disparar()
    deactivate ac

    test ->> ac: puntaje()
    activate ac
    ac ->> atb: puntajeBombas = puntaje()
    activate atb
    atb -->> ac: puntajeBombas = 5*8 = 40
    deactivate atb
    ac ->> att: puntajeTorreta = puntaje()
    activate att
    att -->> ac: puntajeTorreta = 100 - 10*2 = 80
    deactivate att
    Note right of ac: puntajeAtaque = puntajeBombas + puntajeTorreta = 120
    ac ->> de: puntajeEscudo = puntaje(puntajeAtaque)
    activate de
    de -->> ac: puntajeEscudo = puntajeAtaque * 2 = 240
    deactivate de
    ac -->> test: puntajeTotal = puntajeAtaque + puntajeEscudo = 360
    deactivate ac
```

#### 2. Calcular el **puntaje total** de una flota con una **Corbeta**, un **Destructor** y un **Acorazado** nuevos.

```mermaid
%%{init: {
	"mirrorActors": false,
  "theme": "base",
  "themeVariables": {
    "background": "#0f1117",
    "actorBkg": "#1e2536",
    "actorBorder": "#4f8ef7",
    "actorTextColor": "#e2e8f0",
    "actorLineColor": "#2a3347",
    "signalColor": "#4f8ef7",
    "signalTextColor": "#e2e8f0",
    "labelBoxBkgColor": "#1e2536",
    "labelBoxBorderColor": "#2a3347",
    "labelTextColor": "#8899aa",
    "loopTextColor": "#8899aa",
    "noteBkgColor": "#1e2536",
    "noteBorderColor": "#a78bfa",
    "noteTextColor": "#e2e8f0",
    "activationBorderColor": "#4f8ef7",
    "activationBkgColor": "#2a3347"
  }
}}%%
sequenceDiagram
    actor test as Test02

    create participant ac as :Acorazado
    test ->> ac: <<create>> inicializar
    activate ac

    create participant atb as ataqueA1<br/>:BombasDeNeutrones
    ac ->> atb: <<create>> BombasDeNeutrones(10)

    create participant att as ataqueA2<br/>:TorretaIonica
    ac ->> att: <<create>> TorretaIonica()

    create participant deA as defensaA<br/>:EscudoIonico
    ac ->> deA: <<create>> EscudoIonico()

    deactivate ac

    create participant co as :Corbeta
    test ->> co: <<create>> inicializar
    activate co

    create participant atc as ataqueC<br/>:Misiles
    co ->> atc: <<create>> Misiles(3)

    create participant deC as defensaC<br/>:EscudoSimple
    co ->> deC: <<create>> EscudoSimple()

    deactivate co

    create participant de as :Destructor
    test ->> de: <<create>> inicializar
    activate de

    create participant atd as ataqueD<br/>:Misiles
    de ->> atd: <<create>> Misiles(5)

    create participant deD as defensaD<br/>:EscudoFenix
    de ->> deD: <<create>> EscudoFenix()

    deactivate de

    create participant flota as :Flota
    test ->> flota: inicializarConNaves: {acorazado, corbeta, destructor}

    test ->> flota: puntajeTotal()
    activate flota

    flota ->> ac: puntaje()
    activate ac
    ac ->> atb: puntajeBombas = puntaje()
    activate atb
    atb -->> ac: puntajeBombas = 5*10 = 50
    deactivate atb
    ac ->> att: puntajeTorreta = puntaje()
    activate att
    att -->> ac: puntajeTorreta = 100 - 10*0 = 100
    deactivate att
    Note right of ac: puntajeAtaqueAcorazado = puntajeBombas + puntajeTorreta = 150
    ac ->> deA: puntajeEscudoAcorazado = puntaje(puntajeAtaqueAcorazado)
    activate deA
    deA -->> ac: puntajeEscudoAcorazado = puntajeAtaqueAcorazado * 2 = 300
    deactivate deA
    ac -->> flota: puntajeAcorazado = puntajeAtaqueAcorazado + puntajeEscudoAcorazado = 450
    deactivate ac

    Note right of flota: puntajeFlota = puntajeAcorazado = 450

    flota ->> co: puntaje()
    activate co
    co ->> atc: puntajeMisiles = puntaje()
    activate atc
    atc -->> co: puntajeMisiles = 10*3 = 30
    deactivate atc
    co ->> deC: puntajeEscudoCorbeta = puntaje()
    activate deC
    deC -->> co: puntajeEscudoCorbeta = 20 - 0*10 = 20
    deactivate deC
    Note right of co: puntajeCorbeta = puntajeMisiles + puntajeEscudoCorbeta = 50
    co -->> flota: puntajeCorbeta = 50
    deactivate co

    Note right of flota: puntajeFlota = puntajeAcorazado + puntajeCorbeta = 500

    flota ->> de: puntaje()
    activate de
    de ->> atd: puntajeMisiles = puntaje()
    activate atd
    atd -->> de: puntajeMisiles = 10*5 = 50
    atd ->> atd: sumar20(puntajeMisiles)
    atd -->> atd: puntajeMisiles = 50 + 20 = 70
    deactivate atd
    de ->> deD: puntajeEscudoDestructor = puntaje()
    activate deD
    deD -->> de: puntajeEscudoDestructor = 50
    deactivate deD
    Note right of de: puntajeDestructor = puntajeMisiles + puntajeEscudoDestructor = 120
    de -->> flota: puntajeDestructor = 120
    deactivate de

    Note right of flota: puntajeFlota = puntajeAcorazado + puntajeCorbeta + puntajeDestructor = 570
    deactivate flota
    flota -->> test: puntajeTotal = 570
```

### 3. Código de prueba para cada uno de los casos de uso.

```smalltalk
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
```

```smalltalk
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
```