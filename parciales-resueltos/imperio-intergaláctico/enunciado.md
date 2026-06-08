## Imperio intergaláctico

En un imperio intergaláctico existen distintos tipos de $\textcolor{purple}{\text{naves espaciales}}$. El puntaje total de cada nave dependerá de con qué tipo de sistema de ataque y defensa esté equipada la misma, el estado actual de ambos y será la suma de ambos sistemas.

Características de una **Corbeta:** (30 + 20 = 50 puntos)

- Posee 3 misiles que suman 10 puntos cada uno. A medida que dispara se le van gastando. Si se queda sin misiles suma 0 puntos en ataque.
- Posee un escudo simple, suma 20 puntos. A medida que recibe daños se le va restando los puntos. Por ejemplo: si una corbeta nueva recibe un ataque de 1 misil, luego del ataque el puntaje de su escudo será solamente de 10 puntos.

Características de un **Destructor:** (50 + 20 + 50 = 120 puntos)

- Posee 5 misiles. Cuando el destructor tiene los 5 misiles suma 10 puntos por cada uno + 20 puntos extras. Con 4 misiles o menos, sólo suma una unidad por cada misil. Si se queda sin misiles suma 0 puntos en ataque.
- Posee un escudo Fenix que suma 50 puntos, pero al ser destruido, el mismo revive en forma de escudo simple sumando 30 puntos.

Características de un **Acorazado**: (50 + 100 + 150*2 = 450 puntos)

- Posee un doble sistema de ataque:
    - 10 bombas de neutrones. Suman 5 puntos cada una. A medida que dispara se le van gastando hasta quedarse sin bombas y sumar 0.
    - Torreta iónica: Suma 100 puntos al contar con las 10 bombas de neutrones, caso contrario resta 10 puntos por cada bomba de neutrones gastada.
- Posee un escudo iónico, que multiplica x 2 el puntaje de ataque que tenga la nave que lo contiene.

Características de una Flota:

- Posee un número ilimitado de naves mayor a cero. Su puntaje total será la suma de los puntajes totales de las naves que la componen.

*NOTA 1: El puntaje total puede ser positivo, cero o negativo dadas las circunstancias en algún momento para una nave.*

*NOTA 2: En cada disparo se consume 1 misil/bomba de neutrones  a la vez*

*NOTA3: Al recibir ataques las naves van restando su puntaje de escudo. (Salvo el escudo iónico que no se ve afectado por ataques, siempre multiplica por 2 su puntaje de ataque)*

*NOTA 4: Los puntajes no son estáticos, son dinámicos. Por ejemplo el puntaje de ataque va cambiando a medida que se gastan disparos. Lo mismo pasa para el puntaje de defensa, puede ir cambiando a medida que se reciben ataques y todo eso repercute en el puntaje final.*

Los casos de uso son:

1. Calcular el **puntaje total** de un **Acorazado** nuevo luego de disparar 2 bombas de neutrones.
2. Calcular el **puntaje total** de una flota con una **Corbeta**, un **Destructor** y un **Acorazado** nuevos.

Se pide:

1. Diagrama de clases (**completo**) que representen el modelo descrito.
2. Diagrama de secuencia para cada uno de los casos de uso. **IMPORTANTE**: En cada diagrama de secuencia se debe mostrar la inicialización de los objetos involucrados.
3. Código de prueba para cada uno de los casos de uso.