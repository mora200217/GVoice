# Documentation
## `public class Queue<T> implements QueueGen<T>`
Cola Array ( Queue )

Estructura basada en arrays, Consta de 1 array.

## `public T deQueue()`

saca un elemento. Maneja Excepción de espacio.

 * **Parameters:** `{}.` — 
 * **Returns:** {Type} - Éxito del proceso. 

     <p>

## `public void enQueue(T item)`

inserta un elemento. Maneja Excepción de espacio.

 * **Parameters:** `{Type}.` — 
 * **Returns:** {} -Exito del proceso. 

     <p>

## `public boolean empty()`

retorna si la cola esta vacia o no.

 * **Parameters:** `{}.` — 
 * **Returns:** {Boolean} -esta vacia. 

     <p>

## `public boolean full()`

retorna si la cola esta llena o no.

 * **Parameters:** `{}.` — 
 * **Returns:** {Boolean} -esta llena. 

     <p>

## `public int numInside()`

retorna la cantidad de elementos en la cola.

 * **Parameters:** `{}.` — 
 * **Returns:** {Integer} -numero elementos en la cola. 

     <p>
     
     
     ## `public class RefQueue<T> implements QueueGen<T>`

Cola Referencias ( RefQueue )

Estructura basada en Nodos enlazados, por referencias.

## `public T dequeue()`

saca un elemento. Maneja Excepción de espacio.

 * **Parameters:** `{}.` — 
 * **Returns:** {Type} - Éxito del proceso. 

     <p>

## `public void enqueue(T item)`

inserta un elemento.

 * **Parameters:** `{Type}.` — 
 * **Returns:** {} -Exito del proceso. 

     <p>

## `public boolean isEmpty()`

retorna si la cola esta vacia o no.

 * **Parameters:** `{}.` — 
 * **Returns:** {Boolean} -esta vacia. 

     <p>

## `public boolean isFull()`

retorna si la cola esta "llena" al ser por listas nunca se llena.

 * **Parameters:** `{}.` — 
 * **Returns:** {Boolean} -esta llena. 

     <p>

## `public int numInside()`

retorna la cantidad de elementos en la cola.

 * **Parameters:** `{}.` — 
 * **Returns:** {Intiger} -numero elementos en la cola. 

     <p>
## `public class Stack<T> implements StackGen<T>`

Pila Array ( Stack )

Estructura basada en arrays, Consta de 1 array.

## `public T peek()`

Revisa el elemento en top. Maneja Excepción de espacio.

 * **Parameters:** `{}.` — 
 * **Returns:** {Type} - Éxito del proceso. 

     <p>

## `public T pop()`

saca un elemento. Maneja Excepción de espacio.

 * **Parameters:** `{}.` — 
 * **Returns:** {Type} - Éxito del proceso. 

     <p>

## `public void push(T item)`

inserta un elemento. Maneja Excepción de espacio.

 * **Parameters:** `{Type}.` — 
 * **Returns:** {} -Exito del proceso. 

     <p>

## `public boolean full()`

retorna si la pila esta llena o no.

 * **Parameters:** `{}.` — 
 * **Returns:** {Boolean} -esta llena. 

     <p>

## `public boolean empty()`

retorna la cantidad de elementos en la cola.

 * **Parameters:** `{}.` — 
 * **Returns:** {Intiger} -numero elementos en la cola. 

     <p>
     
     ## `public class RefStack<T> implements StackGen<T>`

Pila Ref ( RefStack )

Estructura basada en Nodos enlazados, por referencias.

## `public T pop()`

saca un elemento. Maneja Excepción de espacio.

 * **Parameters:** `{}.` — 
 * **Returns:** {Type} - Éxito del proceso. 

     <p>

## `public void push(T item)`

inserta un elemento.

 * **Parameters:** `{Type}.` — 
 * **Returns:** {} -Exito del proceso. 

     <p>

## `public boolean full()`

retorna si la cola esta "llena" al ser por listas nunca se llena.

 * **Parameters:** `{}.` — 
 * **Returns:** {Boolean} -esta llena. 

     <p>

## `public boolean empty()`

retorna si la pila esta vacia o no.

 * **Parameters:** `{}.` — 
 * **Returns:** {Boolean} -esta vacia. 

     <p>
     
## `public class LinkedList<T>`

Lista Enlazada ( LinkedList )

Estructura basada en enlazamiento de instancias de tipo Nodo, por referencias. Consta de dos Nodos principales: - { Node } front: referencia al nodo cabeza de la lista (primero) - { Node } rear: referencia al nodo cola de la lista (último)

## `boolean isEmpty()`

Verifica que no esté vacía la lista.

 * **Returns:** { boolean } - si el front es null, la lista está vacía.

## `boolean pushFront(Node element)`

Agrega un elemento al frente de la lista.

 * **Parameters:** `{` — Node } Element - Nodo a agregar a la lista.
 * **Returns:** { Boolean } - Éxito del proceso. 

     <p>

## `void handleException()`

Maneja Excepción de espacio.

En caso de heredar la clase, implementar este método acorde a la clase creada.

## `Node popFront()`

Devuelve el Nodo de front.

 * **Returns:** { Node } newNode - Nodo frontal de la lista.

## `boolean pushRear(Node nodeToRear)`

Agrega un nodo al final de la lista.

 * **Parameters:** `{` — Node } nodeToRear - Nodo a agregar.
 * **Returns:** { Boolean } Proceso éxitoso.

     <p>

## `Node popRear()`

Hace pop del últmo elemento.

Retorna el último Nodo de la lista y lo elimina.

 * **Returns:** { Node } toReturn - El último nodo. 

     <p>

## `Node getFromPosition(int i)`

Retorna el nodo en la posición dada.

En caso de no encontrar ingresar una posición inválida, se genera un error.

 * **Parameters:** `{` — int } i - Posición a buscar. 

     ®return { Node } walker - Nodo encontrado en la posición.

     <p>

## `void pushAfter(Node node, int i)`

Agrega un nodo después de la posición indicada.

 * **Parameters:**
   * `{` — Node } node - nodo a agregar.
   * `{` — int } i -  posición previa del nodo a agregar.

## `void pushBefore(Node node, int i)`

Agrega un nodo antes de la posición indicada.

 * **Parameters:**
   * `{` — Node } node - nodo a agregar.
   * `{` — int } i -  posición posterior del nodo a agregar. 

     <p>

## `int amountOfElements()`

Devuelve la cantidad de nodos en la lista.

 * **Returns:** {Integer} this.n - cantidad de nodos.

## `void printElements()`

Imprime la lista de todos los elementos de menor a mayor.
<p>
     ## `public class Polinomio implements Element`

Polinomio ( Polinomio ) implementacion para obtener los puntos de un polinomio

## `public float y(float x)`

Retorna el valor de y para cada x.

 * **Parameters:** `{Float}` — X a evaluar.
 * **Returns:** {Float} el punto de Y para el X dado. 

     <p>

## `public float[] getPoints(GraphController h)`

Retorna los puntos de y para el eje coordenado.

 * **Parameters:** `{GraphController}` — sistema grafico donde se va a evaluar.
 * **Returns:** {Float[]} los puntos de Y para el sistema grafico. 

     <p>

## `public int grado()`

Retorna el grado del polinomio.

 * **Parameters:** `{}` — .
 * **Returns:** {int} el grado del polinomio. 

     <p>

## `public float getDelta()`

Retorna el delta evaluado.

 * **Parameters:** `{}` — .
 * **Returns:** {Float} retorna delta. 

     <p>

## `public void suma(Polinomio b)`

permite la suma de un polinimo menor o igual al actual.

 * **Parameters:** `{Polinimio}` — .
 * **Returns:** {} -exito del proceso. 

     <p>
