# Practica3C
# Practica3C

Estructura de carpetas correcta:

Practica3C
|
|--DbConfiguration
|         |---docker-compose.yaml
|         |---Dockerfile
|         |---init.sql
|         |---save_data.sql
|
|--acceso2.py



Comandos

1. Redirigirse a la carpeta
@ElyEPC ➜ /workspaces/Practica3C (main) $ cd DbConfiguration

2. Levantar docker dentro la carpeta

@ElyEPC ➜ /workspaces/Practica3C/DbConfiguration (main) $ docker-compose up -d

Veras algo como esto en tu terminal:

[+] Running 4/4
 ✔ dbconfiguration-postgres              Built                                                                                                                             0.0s 
 ✔ Network dbconfiguration_default       Created                                                                                                                           0.2s 
 ✔ Volume dbconfiguration_postgres_data  Created                                                                                                                           0.0s 
 ✔ Container DbConfiguration             Started             

3. Ejecutar la configuración del Docker (Instala PostgreSQL con las configuraciones establecidas en docker-compose.yaml  y Dokerfile)

docker exec -it DbConfiguration bash


@ElyEPC ➜ /workspaces/Practica3C/DbConfiguration (main) $ docker exec -it DbConfiguration bash

Veras algo como esto en tu terminal:
root@ae9d7ad4a2c8:/#

4.Ingresa a psql (Terinal de postgrSQL en el docker (DbConfiguration)

psql -U Admin -d credenciales 

root@ae9d7ad4a2c8:/# psql -U Admin -d credenciales 

Veras algo como esto en tu terminal:
psql (18.4 (Debian 18.4-1.pgdg13+1))
Type "help" for help.

credenciales=# 

Aqui ya ingresaste a la base de datos credenciales dentro del sistema de postgreSQL en docker, configurado en tu archivo docker-compose.yaml en esta seccion:

 environment:
      POSTGRES_USER: Admin # Usuario de la base de datos
      POSTGRES_PASSWORD: p4ssw0rdDB # Contraseña del usuario
      POSTGRES_DB: credenciales # Nombre de la base de datos


5.Ingresa una consulta para coprobar la conexión
SELECT * FROM usuarios;


psql (18.4 (Debian 18.4-1.pgdg13+1))
Type "help" for help.

credenciales=#  SELECT * FROM usuarios;

Lanzará la tabla usuarios de la base de datos credenciales.


 id_usuario |     nombre      |            correo             |  telefono  | fecha_nacimiento | id_departamento 
------------+-----------------+-------------------------------+------------+------------------+-----------------
          1 | Juan Pérez      | juan.perez1@example.com       | 1234567890 | 1985-01-15       |               2
          2 | Ana Gómez       | ana.gomez2@example.com        | 1234567891 | 1990-03-22       |               2
          3 | Luis Martínez   | luis.martinez3@example.com    | 1234567892 | 1988-07-10       |               3
          4 | María López     | maria.lopez4@example.com      | 1234567893 | 1992-11-05       |               3
          5 | Carlos Ruiz     | carlos.ruiz5@example.com      | 1234567894 | 1980-06-25       |               4
          6 | Sofía Castro    | sofia.castro6@example.com     | 1234567895 | 1995-02-18       |               1
          7 | David Ramírez   | david.ramirez7@example.com    | 1234567896 | 1983-09-09       |               2
          8 | Elena Ortega    | elena.ortega8@example.com     | 1234567897 | 1991-05-03       |               3
          9 | Miguel Torres   | miguel.torres9@example.com    | 1234567898 | 1993-12-14       |               5
         10 | Laura Sánchez   | laura.sanchez10@example.com   | 1234567899 | 1987-08-01       |               4
:


6. Sal de la base de datos
credenciales=# \q

7. Sal de la terinal de Docker container:DbConfiguration

root@ae9d7ad4a2c8:/# exit
exit

8. Retrocede a Practica3C
@ElyEPC ➜ /workspaces/Practica3C/DbConfiguration (main) $ cd ..

9.Instala la librería psycopg2

@ElyEPC ➜ /workspaces/Practica3C (main) $ pip install psycopg2

Veras algo como esto en tu terminal:

Collecting psycopg2
  Downloading psycopg2-2.9.12.tar.gz (379 kB)
  Installing build dependencies ... done
  Getting requirements to build wheel ... done
  Preparing metadata (pyproject.toml) ... done
Building wheels for collected packages: psycopg2
  Building wheel for psycopg2 (pyproject.toml) ... done
  Created wheel for psycopg2: filename=psycopg2-2.9.12-cp312-cp312-linux_x86_64.whl size=549445 sha256=a28074c970d09367f9176b04b71a206912aea1558c84a82e45e1bf34115d4822
  Stored in directory: /home/codespace/.cache/pip/wheels/04/74/ff/720d90509a7e28eeecdaf470a74ba12afb31f8857624440482
Successfully built psycopg2
Installing collected packages: psycopg2
Successfully installed psycopg2-2.9.12

[notice] A new release of pip is available: 26.0.1 -> 26.1.2
[notice] To update, run: python3 -m pip install --upgrade pip

10. Accede y ejecuta la aplicación de python 

@ElyEPC ➜ /workspaces/Practica3C (main) $ python acceso2.py

Recuerda respetar la estructura de la carpeta:

Estructura de carpetas correcta:

Practica3C
|
|--DbConfiguration
|         |---docker-compose.yaml
|         |---Dockerfile
|         |---init.sql
|         |---save_data.sql
|
|--acceso2.py

11. Verifica la conexion 

=== MENÚ DE USUARIO ===
1. Registrar nuevo usuario
2. Consultar datos de usuario
3. Salir
Seleccione una opción: 2

== Consulta de usuario ==
Ingrese el username del usuario a consultar: juan.perez1
Ingrese el password del usuario a consultar: hash_juan_perez

🔍 Datos del usuario encontrado:
ID: 1
Nombre: Juan Pérez
Correo: juan.perez1@example.com
Teléfono: 1234567890
Fecha de Nacimiento: 1985-01-15
Departamento: Desarrollo de Software

=== MENÚ DE USUARIO ===
1. Registrar nuevo usuario
2. Consultar datos de usuario
3. Salir
Seleccione una opción: 1

== Registro de nuevo usuario ==

IDs de Departamento disponibles (ejemplo):
1: Recursos Humanos, 2: Desarrollo, 3: Ventas, 4: Finanzas, 5: Soporte
Nombre: Elizabeth Mtz A       
Correo: ely@exaple.co
Teléfono: 5577889922
Fecha de nacimiento (YYYY-MM-DD): 1990-05-12       
ID de Departamento: 2
Username: eli.mtx1
Password: 12345

 Usuario registrado exitosamente.

=== MENÚ DE USUARIO ===
1. Registrar nuevo usuario
2. Consultar datos de usuario
3. Salir
Seleccione una opción: 2

== Consulta de usuario ==
Ingrese el username del usuario a consultar: eli.mtx1
Ingrese el password del usuario a consultar: 12345

🔍 Datos del usuario encontrado:
ID: 21
Nombre: Elizabeth Mtz A
Correo: ely@exaple.co
Teléfono: 5577889922
Fecha de Nacimiento: 1990-05-12
Departamento: Desarrollo de Software

=== MENÚ DE USUARIO ===
1. Registrar nuevo usuario
2. Consultar datos de usuario
3. Salir
Seleccione una opción: 

