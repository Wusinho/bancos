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
Como un usuario cualquiera debo tener la capacidad de crear, leer, actualizar y eliminar bancos. Adicionalmente debo contar con una vista donde pueda ver la lista de todos los bancos que han sido creados.
Criterios de aceptación:
- El registro de los bancos solo debe contener un campo para el nombre del banco de tipo string con máximo 50 caracteres.
- Criterios técnicos
Hacer la validación por modelo
- Haga uso de I18N para todos los textos que presente aunque solo presente la información en un único idioma.


### [REQ-02](https://github.com/Wusinho/bancos/tree/dev-req_02)
Como un usuario cualquiera debo tener la capacidad de registrar en una misma vista la información del proveedor y de su 
cuenta bancaria, con el objetivo de poder almacenar rápidamente la información de dicho proveedor para posteriores consultas.

Los datos que debe tener el proveedor son los siguientes:
- Nombre del proveedor.
- NIT del proveedor. (ID)
- Nombre de la persona de contactato.
- Número de celular de la persona de contacto.
- 
Los datos que deben presentarse relacionados con el banco banco son los siguientes:
- Nombre del banco.
- Número de cuenta bancaria.

Criterios de aceptación:
- Si al realizar el registro me hace falta uno o más campos obligatorios, el sistema me debe indicar que campos me hacen falta por llenar.
- Si al realizar el registro algún campo no cumple con las características indicadas para los campos en criterios técnicos, el sistema me debe indicar los cambios que debo realizar.
- Si el registro se realizó correctamente el sistema me debe indicar que la información se lleno de forma correcta.
- Para los bancos, en el formulario se debe presentar el nombre de los bancos existentes en un combobox.

Criterios técnicos:
- Hacer las validaciones por módelo, no por vista.
- Nombre del proveedor debe ser tipo string obligatorio.
- NIT del proveedor debe ser tipo string y seguir la estructura 9 dígitos un guión medio (-) y un dígito opcional. Ej de un número válido: 901362343-4. Se debe usar una expresión regular para su definición.
- Nombre de la persona de contactato debe ser un string obligatorio.
- Número de celular de la persona de contacto debe ser un string de màximo 10 caracteres opcional.
- Nombre del banco del proveedor string obligatorio.
- Número de cuenta bancaria string opcional màximo 15 caracteres.
- Haga uso de I18N para todos los textos que presente aunque solo presente la información en un único idioma.


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
