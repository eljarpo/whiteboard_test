# README

Prueba para Whiteboard

## Versiones:

* Ruby: 2.7.0
* Rails: 6.1.4
* Postgresql 11
## Instrucciones:

* Asegurarse de tener las versiones correspondientes
* Clonar repositiorio: `git clone git@github.com:eljarpo/whiteboard_test.git`
* instalar dependencias: `bundle install`
* Activar cache para stimulus reflex (pense en usarlo pero al final no se uso): `rails dev:cache`
* Crear base de datos: `rails db:create`
* Crear migraciones de BD: `rails db:migrate`
* Iniciar servidor: `rails s`


## Rutas API

`localhost:3000/players/<nombre>.json`