## Filosofía de desarrollo
El proyecto sigue la base de gitflow workflow. Consta de cinco (5) ramas principales:

### Ramas

* __master__: Rama princpal del repo. Únicamente contiene commits funcionales de las versiones del proyecto
* __develop__: Marca el progreso en el desarrollo de la app. _Nunca_ se modifica directamente.
* __feature/{name}__: Surge desde _develop_ y se enfoca en agregar una característica al proyecto
* __hotfix/{name}__: Se usa para resolver errores en cualquier rama.
* __release__: Prioriza los cambios referentes a los avances de documentación o archivos de entrega/informativos.


Cada cambio agregado al proyecto se efectua en una rama generada particularmente para la función a agregar (feature). La nomeclatura de la rama matiene el formato 'feature/{change-name}', que se despliega desde el commit más reciente de develop