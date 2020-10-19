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
## `public class Stack<T> implements StackGen<T>``

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
