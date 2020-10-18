# GVoice  :computer:

Este proyecto consiste en una plataforma enfocada en realizar gráficas 2D por medio de comandos de voz, facilitando de esta manera la interiorización de conceptos propios de las matemáticas, en particular propios del precálculo.

Cualquier persona podrá hacer uso de esta aplicación gracias a su fácil interacción, además se busca reforzar un buen manejo del lenguaje utilizado en las matemáticas.

# Integrantes  :octocat:
|            Nombre                |                      Github nickname                      |
|----------------------------------|-----------------------------------------------------------|
| Iván Mauricio Hernández Triana   | [elestrategaactual](https://github.com/elestrategaactual) | 
| Juan Fernando Ramírez Montes     |    [jramirezmon](https://github.com/jramirezmon)          |
| Andres Mauricio Morales          |    [mora200217](https://github.com/@mora200217)           |
| Miguel Rodríguez Fuentes         |  [marodriguezfu](https://github.com/Marodriguezfu)        |


# Introducción

Últimamente el desarrollo de aplicaciones que aporten al proceso de aprendizaje han ido en aumento, ya que la alta interactividad que se puede llegar a obtener con estas plataformas en general es beneficioso para incentivar a las personas a aprender, gran parte del éxito de estas se debe justamente a su diseño y facilidad de acceso a todas las personas, lo cual reduce la dificultad inicial de manejar una aplicación en particular para directamente pasar a los beneficios de la misma.

Esta aplicaión busca ser justamente ese puente de fácil acceso al aprendizaje de asignaturas propias de las matemáticas que pueden llegar a ser muy complejas para las personas, haciendo uso del reconocimiento de voz para minimizar el tiempo que puede llegar a invertir un profesor o estudiante en la elaboración de la gráfica para poder directamente enfocarse en los conceptos.


## Problemática

En la actualidad, las matemáticas hacen parte fundamental del proceso educativo de la mayoría de las personas desde etapas tempranas en las escuelas, y no es de menos, ya que hoy en día la mayoría de profesiones requieren un conocimiento en esta área ya sea para llevar a cabo métricas y análisis de diversos experimentos, para tener una compresión más profunda de la información masiva proveniente de internet, o en casos como la ingeniería, donde se hace un uso extensivo de esta área.

Dada esta relevancia, es de gran importancia garantizar que tanto los estudiantes como los profesores cuenten con las herramientas adecuadas para promover el aprendizaje de las matemáticas y una de las formas de hacerlo es por medio de las gráficas, las cuales herramientas como Geogebra o Wolfram Mathematica logran hacer con eficacia.

El problema radica en que a algunas personas les cuesta hacer el correcto uso de estas herramientas, dado que utilizan en ciertas ocasiones comandos específicos del software para poder hacer las cosas.

Este proyecto busca justamente minimizar el tiempo y esfuerzo que le puede costar a las personas realizar diversas gráficas, para lograr esto se propone la solución por medio de comandos de voz, haciendo el proceso más intuitivo con el fin de que se puedan enfocar más en aprendizaje de los conceptos tan importantes para el mundo actual.
## Marco teórico

El proyecto toma conceptos propios de la programación orientada a objetos ya que permite una implementación más ordenada de la aplicación, adicional a esto, se usa toda la documetación disponible tanto de Java como de Processing para el desarrollo del proyecto y la implementación de las [estructuras de datos](https://www.coursera.org/learn/data-structures) en el mismo.

## Antecedentes

Para el desarrollo del proyecto se han usado referencias de aplicaciones como [GeoGebra](https://www.geogebra.org/graphing?lang=es), [Wolfram Mathematica](https://www.wolfram.com/mathematica/online/) y [Desmos](https://www.desmos.com/calculator?lang=es), las cuales si bien son excelentes a la hora de graficar y ofrecer otras soluciones propias de la geometría descriptiva no cuentan con un control por medio de la voz, aplicaciones que integren esta funcionalidad son realmente escasas y mucho mas para el español.

# Objetivos

## General

Representar cualquier grafica 2D propia de las matemáticas a travéz de comandos por voz.

## Específicos

- Convertir los comandos ve voz a una cadena de texto.
- Procesar la cadena de texto de tal forma que el programa reconozca a qué grafica se hace referencia.
    - Implementar esta funcionalidad haciendo uso de árboles.
    - Realizar la búsqueda por medio de un hash.
    - Guardar las palabras clave para realizar la gráfica por medio de otras estructuras.
    - Diseñar pruebas que permitan medir la eficiencia de los algoritmos utilizados.
- Representar cualquier gráfica 2D en pantalla de manera clara y de fácil manejo.
    - Realizar la implementación de las gráficas haciendo uso de las estructuras lineales.
    - Establecer pruebas de control para revisar la eficiencia de cada estructura.
- Proveer al usuario de una interfaz interactiva de fácil manejo para su mayor comodidad.
    - Soporte a entornos de escitorio como Linux Windows y Mac.

# Requisitos

Para el desarrollo de este proyecto de hace uso de [Processing](https://processing.org/) el cual está basado en Java, adicional a esto la plataforma en donde se puede hacer uso de esta aplicación está restringida por el momento a entornos de escritorio.

# Trabajo Futuro

Dada la extensión del proyecto, el trabajo futuro se centrará en la corrección de errores respecto a la detección de voz, el mover la aplicación a entornos móviles, así como la implementación de otras funcionalidades tales como las gráficas 3D y otras graficas complejas que en principio no sería posible desarrollar dentro del tiempo disponible del curso.