Ventas Tech DB – Proyecto SQL

Descripción del proyecto

Este proyecto consiste en el diseño y creación de una base de datos relacional para TechStore, una cadena de tiendas de tecnología.

La base de datos fue desarrollada en SQL Server utilizando SQL Server Management Studio (SSMS).

Su objetivo es almacenar información de clientes, productos, categorías y ventas, permitiendo realizar consultas y análisis comerciales.

Estructura de la base de datos

La base Ventas_Tech_DB contiene cuatro tablas:

* categorias: contiene 4 categorías de productos.
* clientes: contiene información de 5 clientes.
* productos: contiene 6 productos relacionados con sus categorías.
* ventas: contiene 10 operaciones de venta relacionadas con clientes y productos.

Las tablas se vinculan mediante claves primarias (PRIMARY KEY) y claves foráneas (FOREIGN KEY).



Cómo ejecutar el proyecto

1. Abrir SQL Server Management Studio (SSMS).
2. Conectarse al servidor SQL Server.
3. Abrir el archivo VENTAS_TECH_DB.SQL y ejecutarlo para crear la base de datos, las tablas y cargar los registros.
4. Ejecutar m4_consultas_negocio.sql para realizar las consultas comerciales del módulo 4.
5. Ejecutar m5_consultas_joins.sql para realizar las consultas del módulo 5 utilizando INNER JOIN, LEFT JOIN y UNION ALL.
6. Verificar los resultados obtenidos.

Nota: Las consultas de clientes y productos sin ventas pueden devolver resultados vacíos porque todos los registros de ejemplo tienen ventas asociadas.

Contenido del script

El archivo SQL está organizado en cuatro secciones:

1. DROP TABLES: elimina las tablas existentes respetando sus dependencias.
2. CREATE TABLES: crea las cuatro tablas con sus restricciones.
3. INSERT DATA: incorpora los 25 registros solicitados.
4. VALIDACIÓN: consulta el contenido de las cuatro tablas.

Validación

Los resultados esperados son:

* 4 categorías.
* 5 clientes.
* 6 productos.
* 10 ventas.

El script permite recrear las tablas y volver a cargar los datos para repetir las pruebas.
