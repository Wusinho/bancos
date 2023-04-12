# Proyecto Bancos

El objetivo de esta prueba es evaluar la fluidez del candidato en el desarrollo de una  aplicación monolito Ruby on 
Rails con una estructura de estilos que haga uso del Framework Tailwind, en la medida de los posible.

De igual forma se evaluara la organización del código que se desarrolla. Por lo que se aconseja desarrollar la prueba 
con el objetivo que el código sea lo más elegante posible.

Siga un proceso de TDD que permita identificar como avanzar a lo largo de su proceso de desarrollo, cree commits 
independientes con avances progresivos. Enviar una prueba con un único commit invalida la prueba inmediatamente.

En la medida de lo posible haga uso de Docker para la configuración del proyecto.
Haga uso del README para explicar como poner a correr el proyecto.
Contenido

Se debe crear un producto simple que permita el registro de información de dos modelos diferentes en una misma vista. 
Para el ejercicio los dos modelos seràn proveedores y cuentas bancarias.


### [REQ-05](https://github.com/Wusinho/bancos/tree/dev-req_05)
Criterios de Aceptacion

- Cree una pàgina home, desde donde se pueda dirigir al log-in/sign-up del sistema.
- Si ya tengo una cuenta debo poder realizar en ingreso con mi correo registrado.
- Si ya tengo una cuenta no debo poder realizar un nuevo registro, y el sistema me debe alertar que el correo ya esta siendo usado.
- Si trato de entrar con un correo o password incorrecto el sistema me debe alertar.


### [REQ-01](https://github.com/Wusinho/bancos/tree/dev-req_01)
The user can view all notes, sort them by topic, title, or date, and open a specific note.


## Built With

- Ruby 3.2.0
- Ruby on Rails 7.0.4
- PostgreSQL
- Rspec gem
- Devise gem
- Faker gem
- Tailwind

### Setup

Para ejecutar este proyecto localmente, asegúrese de tener instalado Ruby y Ruby on Rails en su máquina, luego clone este repositorio ejecutando:

```bash
git clone https://github.com/Wusinho/bancos.git
```

Abra su terminal y vaya al directorio donde creó el clon del repositorio.

En la terminal:

```bash
bundle install
```
```bash
rails db:create && rails db:migrate
```

Is super important to populate the app, so now run:

```bash
rails db:seed
```

To set up the server put:

```bash
rails s
```

Después de esto, puede abrir su navegador web favorito y copiar y pegar lo siguiente:

```bash
http://localhost:3000
```

### Author

👤 **Heber Lazo**

- Github: [@Wusinho](https://github.com/Wusinho)
- LinkedIn: [Heber Lazo](https://www.linkedin.com/in/heber-lazo/)

## Show your support

Give a ⭐️ if you like this project!
