import psycopg2
import getpass # Aunque getpass no se usa directamente en este código, se mantiene.

# Configuración de conexión a la base de datos en Docker
DB_HOST = "localhost" 
DB_PORT = "5432"
DB_NAME = "credenciales"
DB_USER = 'Admin'
DB_PASSWORD = "p4ssw0rdDB"

def conectar_db():
    """Conecta a la base de datos PostgreSQL y retorna la conexión."""
    try:
        conn = psycopg2.connect(
            host=DB_HOST,
            port=DB_PORT,
            database=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD
        )
        return conn
    except Exception as e:
        print("Error de conexión a la base de datos:", e)
        return None

# --- FUNCIÓN ADAPTADA: Ahora incluye id_departamento ---
def registrar_usuario(nombre, correo, telefono, fechanac, id_departamento, username, password):
    """Registra un nuevo usuario en la base de datos, incluyendo el departamento."""
    conn = conectar_db()
    if not conn:
        return

    try:
        cursor = conn.cursor()

        # 1. Insertar el nuevo usuario en la tabla usuarios (Añadiendo id_departamento)
        query_usuario = """
            INSERT INTO usuarios (nombre, correo, telefono, fecha_nacimiento, id_departamento)
            VALUES (%s, %s, %s, %s, %s) RETURNING id_usuario;
        """
        # Se incluye el id_departamento en los parámetros de la consulta
        cursor.execute(query_usuario, (nombre, correo, telefono, fechanac, id_departamento))
        id_usuario = cursor.fetchone()[0]

        # 2. Insertar las credenciales del usuario en la tabla credenciales
        query_credenciales = """
            INSERT INTO credenciales (id_usuario, username, password_hash)
            VALUES (%s, %s, %s);
        """
        cursor.execute(query_credenciales, (id_usuario, username, password))

        conn.commit()
        print("\n Usuario registrado exitosamente.")

        cursor.close()
        conn.close()

    except psycopg2.IntegrityError as e:
        # Manejo específico si el id_departamento no existe o el correo/username ya existen
        conn.rollback()
        print(f"Error de integridad (Verifique ID de Departamento, Correo o Username): {e}")
    except Exception as e:
        conn.rollback()
        print(" Error al registrar el usuario:", e)


# --- FUNCIÓN ADAPTADA: Ahora incluye información del departamento ---
def obtener_datos_usuario(username, password):
    """Consulta la base de datos para obtener los datos de un usuario, incluyendo el departamento."""
    conn = conectar_db()
    if not conn:
        return

    try:
        cursor = conn.cursor()

        # Usamos JOIN para obtener el nombre del departamento (d.descripcion)
        query = """
            SELECT
                u.id_usuario, u.nombre, u.correo, u.telefono, u.fecha_nacimiento,
                d.descripcion AS departamento_nombre
            FROM credenciales c
            JOIN usuarios u ON c.id_usuario = u.id_usuario
            JOIN departamentos d ON u.id_departamento = d.id_departamento
            WHERE c.username = %s AND c.password_hash = %s;
        """
        cursor.execute(query, (username, password))
        usuario = cursor.fetchone()

        if usuario:
            print("\n🔍 Datos del usuario encontrado:")
            print(f"ID: {usuario[0]}")
            print(f"Nombre: {usuario[1]}")
            print(f"Correo: {usuario[2]}")
            print(f"Teléfono: {usuario[3]}")
            print(f"Fecha de Nacimiento: {usuario[4]}")
            print(f"Departamento: {usuario[5]}") # Nuevo campo
        else:
            print("\n Usuario o contraseña incorrectos.")

        cursor.close()
        conn.close()

    except Exception as e:
        print(" Error al consultar la base de datos:", e)

def menu():
    print("\n=== MENÚ DE USUARIO ===")
    print("1. Registrar nuevo usuario")
    print("2. Consultar datos de usuario")
    print("3. Salir")

if __name__ == "__main__":
    while True:
        menu()
        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            print("\n== Registro de nuevo usuario ==")
            # Se muestra una referencia para el ID de departamento
            print("\nIDs de Departamento disponibles (ejemplo):")
            print("1: Recursos Humanos, 2: Desarrollo, 3: Ventas, 4: Finanzas, 5: Soporte")
            
            # --- CAMBIOS EN LA RECOLECCIÓN DE DATOS ---
            nombre = input("Nombre: ")
            correo = input("Correo: ")
            telefono = input("Teléfono: ")
            fechanac = input("Fecha de nacimiento (YYYY-MM-DD): ")
            id_departamento = input("ID de Departamento: ") # Nuevo campo
            username = input("Username: ")
            password = input("Password: ")
            
            # Validación simple para el ID del departamento
            try:
                id_departamento = int(id_departamento)
                registrar_usuario(nombre, correo, telefono, fechanac, id_departamento, username, password)
            except ValueError:
                print(" El ID de Departamento debe ser un número entero.")

        elif opcion == "2":
            print("\n== Consulta de usuario ==")
            username = input("Ingrese el username del usuario a consultar: ")
            password = input("Ingrese el password del usuario a consultar: ")
            obtener_datos_usuario(username, password)

        elif opcion == "3":
            print(" Saliendo del programa.")
            break

        else:
            print(" Opción no válida. Intente de nuevo.")