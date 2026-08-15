# Gimnasio

## **1 - Ejercicio de modelado**

### Se desea modelar parte de un sistema mediante el paradigma de objetos.
---

### Un gimnasio $\textcolor{blue}{\text{tiene}}$ diferentes $\textcolor{lightblue}{\text{planes}}$ para sus $\textcolor{lightblue}{\text{socios}}$, que determinan el $\textcolor{lightblue}{\text{uso de las instalaciones y actividades}}$, para lo cual los socios deben $\textcolor{lightblue}{\text{reservar}}$ cada tipo de actividad (clase o uso de sala de musculación), y no pueden ingresar si no hay $\textcolor{lightblue}{\text{reserva}}$. Hay distintos $\textcolor{blue}{\text{tipos}}$ de planes para asistir:

#### $\textcolor{lightblue}{\text{Plan Básico}}$: el socio puede $\textcolor{blue}{\text{tomar}}$ una clase grupal por semana, y utilizar la sala de cardio y la de musculación hasta dos veces por semana.
#### $\textcolor{lightblue}{\text{Plan NoTanBasico}}$: el socio puede $\textcolor{blue}{\text{tomar}}$ tres clases grupales por semana, y utilizar la sala de cardio y la de musculación hasta cuatro veces por semana.
#### $\textcolor{lightblue}{\text{Plan Libre}}$: el socio puede $\textcolor{blue}{\text{tomar}}$ clases grupales ilimitadas y utilizar las salas de musculación y cardio en forma ilimitada.
#### $\textcolor{lightblue}{\text{Plan FanDeLasClases}}$: el socio puede $\textcolor{blue}{\text{tomar}}$ clases grupal ilimitadas, y utilizar la sala de cardio y la de musculación hasta dos veces por semana.

### Los planes además pueden ser $\textcolor{lightblue}{\text{mensuales}}$ (se paga por mes) o $\textcolor{lightblue}{\text{anuales}}$ (se paga todo el año), $\textcolor{blue}{\text{teniendo}}$ diferentes $\textcolor{lightblue}{\text{precios}}$ y $\textcolor{lightblue}{\text{formas de pago}}$ según cual sea.

---

### Supondremos la existencia de una clase externa `AgendaGimnasio`, con una única instancia `agendaAlgoGimnasio`, a la cual todos los objetos pueden acceder, que tiene métodos `cuantasClasesEstaSemana: unSocio` , y `cuantasVecesASalaMusculacion: unSocio` , y devuelven cuantas reservas ya tienen para las tipo de actividades.

---

### Se pide:

### Modelar en UML (diagrama de clases) el dominio recién descrito. Use nombres adecuados para todas las clases, métodos y asociaciones que defina. Incluya todos los métodos que le parezca necesarios en las clases, pero ninguno más. Los métodos que utilice en los puntos B.a y B.b deben figurar en el diagrama.

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
    title Diagrama de clases del sistema de reservas del gimnasio

    class Gimnasio {
        +Gimnasio() void
        +agregarSocio(socio: Socio) void
    }

    class Plan {
        <<abstract>>
        +Plan(maxClasesPorSemana: int, maxReservasASalaMusculacionPorSemana: int) void
        +verificarMaximoDeReservas(cantidadDeReservas: int) void*
        +reservarSalaMusculacion(socio: Socio) void*
    }

    class Basico {
        -maxClasesPorSemana: int
        -maxReservasASalaMusculacionPorSemana: int
    }

    class NoTanBasico {
        -maxClasesPorSemana: int
        -maxReservasASalaMusculacionPorSemana: int
    }

    class Libre

    class FanDeLasClases {
        -maxReservasASalaMusculacionPorSemana: int
    }

    class Suscripcion {
        <<abstract>>
    }

    class Mensual
    class Anual

    class Precio
    class FormaDePago

    class Socio {
        -plan: Plan
        +Socio(plan: Plan) void
        +reservarClase() void
        +reservarSalaMusculacion() void
    }

    class AgendaGimnasio {
        +cuantasClasesReservadasEstaSemana(unSocio: Socio) int
        +cuantasVecesReservadasASalaMusculacion(unSocio: Socio) int
    }

    class LimiteDeReservasAlcanzadoExcepcion
    class Error

    %% --- Relaciones ---

    Plan ..> LimiteDeReservasAlcanzadoExcepcion

    Suscripcion o-- FormaDePago
    Suscripcion o-- Precio

    Gimnasio "1" o-- "*" Socio

    Socio o-- Plan

    Plan *-- Suscripcion

    Plan ..> AgendaGimnasio

    Plan <|-- Basico
    Plan <|-- NoTanBasico
    Plan <|-- Libre
    Plan <|-- FanDeLasClases

    Suscripcion <|-- Mensual
    Suscripcion <|-- Anual

    Error <|-- LimiteDeReservasAlcanzadoExcepcion
```


---

### Modelar en UML (diagrama de secuencia, con objetos y mensajes) el caso completo para los siguientes escenarios:
* ### Un socio con plan **NoTanBasico** quiere reservar la sala de musculación.

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
    title Caso de uso: Un socio con plan no tan básico quiere reservar la sala de musculación

    actor test as Test01

    create participant agenda as :AgendaGimnasio
    test ->> agenda: AgendaGimnasio()

    create participant gimnasio as :Gimnasio
    test ->> gimnasio: Gimnasio(agenda)

    create participant plan as plan:NoTanBasico
    test ->> plan: PlanNoTanBasico()

    create participant socio as socio:Socio
    test ->> socio: Socio(plan)

    test ->> gimnasio: agregarSocio(socio)

    test ->> socio: reservarSalaMusculacion()
    activate socio
    socio ->> plan: reservarSalaMusculacion(socio)
    activate plan
    plan ->> agenda: cuantasVecesReservadasASalaMusculacion(socio)
    activate agenda
    agenda -->> plan: 0
    deactivate agenda

    plan ->> plan: verificarMaximoDeReservasASalaMusculacion(0)
    activate plan
    deactivate plan
    plan ->> agenda: reservarSalaMusculacion(socio)
    deactivate plan
    deactivate socio
```

* ### Un socio con el plan **FanDeLasClases** quiere usar la sala de musculación, pero ya la ha usado 2 veces esa semana.

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
    title Caso de uso: Un socio con plan fan de las clases quiere reservar la sala de musculación pero ya llegó a su límite

    actor test as Test02

    create participant agenda as :AgendaGimnasio
    test ->> agenda: AgendaGimnasio()

    create participant gimnasio as :Gimnasio
    test ->> gimnasio: Gimnasio(agenda)

    create participant plan as plan:FanDeLasClases
    test ->> plan: PlanFanDeLasClases()

    create participant socio as socio:Socio
    test ->> socio: Socio(plan)

    test ->> gimnasio: agregarSocio(socio)

    test ->> socio: reservarSalaMusculacion()
    activate socio
    socio ->> plan: reservarSalaMusculacion(socio)
    activate plan
    plan ->> agenda: cuantasVecesReservadasASalaMusculacion(socio)
    activate agenda
    agenda -->> plan: 0
    deactivate agenda

    plan ->> plan: verificarMaximoDeReservasASalaMusculacion(0)
    activate plan
    deactivate plan
    plan ->> agenda: reservarSalaMusculacion(socio)
    deactivate plan
    deactivate socio

    test ->> socio: reservarSalaMusculacion()
    activate socio
    socio ->> plan: reservarSalaMusculacion(socio)
    activate plan
    plan ->> agenda: cuantasVecesReservadasASalaMusculacion(socio)
    activate agenda
    agenda -->> plan: 1
    deactivate agenda

    plan ->> plan: verificarMaximoDeReservasASalaMusculacion(1)
    activate plan
    deactivate plan
    plan ->> agenda: reservarSalaMusculacion(socio)
    deactivate plan
    deactivate socio

    test ->> socio: reservarSalaMusculacion()
    activate socio
    socio ->> plan: reservarSalaMusculacion(socio)
    activate plan
    plan ->> agenda: cuantasVecesReservadasASalaMusculacion(socio)
    activate agenda
    agenda -->> plan: 2
    deactivate agenda

    plan ->> plan: verificarMaximoDeReservasASalaMusculacion(2)
    activate plan
    create participant excepcion as :LimiteDeReservasAlcanzadoExcepcion
    plan ->> excepcion: LimiteDeReservasAlcanzadoExcepcion()
    deactivate plan
    deactivate plan

    deactivate socio
```

> **IMPORTANTE**
> En cada diagrama de secuencia mostrar la inicialización de los objetos involucrados