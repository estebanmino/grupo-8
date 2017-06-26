# Repositorio Proyecto Gestor de Torneos de Fútbol Grupo 8
## Integrantes:

### Esteban Miño

### Cristian Carreño

Link Heroku https://laliga.herokuapp.com/


Usuario Admin en Heroku  y al correr seeds localmente:

  Email: admin@gmail.com
  Password: admin1234

  Para ver el token de admin verlo en la base de datos pues es un atributo que se le asigna al crear el usuario.


## API OFRECIDA:
Se ofrecen distintas funcionalidades de la aplicación a través de una API las que se pueden acceder a través de la ruta `api/v1/metodo`, la api posee métodos que requieren autentificación lo que se realizó mediante un simple token de autorización que va en el header, a continuación se presentan las funcionalidades que se pueden consumir a través de la API:

Comments   | Métodos  y ruta                       | Requiere autentificación
-----------| ------------------------------------- | ----------------
Index      | GET /api/v1/comments(.:format)        | NO
Create     | POST /api/v1/comments(.:format)       | SI
Show       | GET /api/v1/comments/:id(.:format)    | NO
Destroy    | DELETE /api/v1/comments/:id(.:format) | SI

Posts      | Métodos  y ruta                       | Requiere autentificación
-----------| ------------------------------------- | ----------------
Index      | GET /api/v1/posts(.:format)           | NO
Create     | POST /api/v1/posts(.:format)          | SI
Show       | GET /api/v1/posts/:id(.:format)       | NO
Destroy    | DELETE /api/v1/posts/:id(.:format)    | SI

Users      | Métodos  y ruta                       | Requiere autentificación
-----------| ------------------------------------- | ----------------
Index      | GET /api/v1/users(.:format)           | SI
Show       | GET /api/v1/users/:id(.:format)       | SI
Destroy    | DELETE /api/v1/users/:id(.:format)    | SI

Matches    | Métodos  y ruta                       | Requiere autentificación
-----------| ------------------------------------- | ----------------
Index      | GET /api/v1/matches(.:format)         | NO
Create     | POST /api/v1/matches(.:format)        | SI
Show       | GET /api/v1/matches/:id(.:format)     | NO
Destroy    | DELETE /api/v1/matches/:id(.:format)  | SI

Teams      | Métodos  y ruta                       | Requiere autentificación
-----------| ------------------------------------- | ----------------
Index      | GET /api/v1/teams(.:format)           | NO
Create     | POST /api/v1/teams(.:format)          | SI
Show       | GET /api/v1/teams/:id(.:format)       | NO
Destroy    | DELETE /api/v1/teams/:id(.:format)    | SI

Tournaments| Métodos  y ruta                         | Requiere autentificación
-----------| --------------------------------------- | ----------------
Index      | GET /api/v1/tournemants(.:format)       | NO
Create     | POST /api/v1/tournemants(.:format)      | SI
Show       | GET /api/v1/tournemants/:id(.:format)   | NO
Destroy    | DELETE /api/v1/tournemants/:id(.:format)| SI

La api consumida fue [open weather](https://openweathermap.org/api) y los requests se hicieron a través de la gema `HTTPARTY`
