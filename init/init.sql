
CREATE DATABASE IF NOT EXISTS Supermercado;
USE Supermercado;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE,
    telefono VARCHAR(15)
);


-- Tabla de Categorías de Productos
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla de Productos
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- Tabla de Ventas
CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha DATE NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Tabla de Detalle de Ventas
CREATE TABLE detalle_ventas (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    id_producto INT,
    cantidad INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Inserción de datos en Clientes
INSERT INTO clientes (nombre, correo, telefono) VALUES
('Juan Pérez', 'juan@example.com', '1234567890'),
('Ana Gómez', 'ana@example.com', '0987654321'),
('Carlos Rodríguez', 'carlos@example.com', '1122334455');

-- Inserción de datos en Categorías
INSERT INTO categorias (nombre) VALUES
('Lácteos'),
('Bebidas'),
('Snacks');

-- Inserción de datos en Productos
INSERT INTO productos (nombre, precio, stock, id_categoria) VALUES
('Leche Entera', 3.50, 50, 1),
('Jugo de Naranja', 2.00, 30, 2),
('Papas Fritas', 1.50, 100, 3);

-- Inserción de datos en Ventas
INSERT INTO ventas (id_cliente, fecha, total) VALUES
(1, '2025-03-23', 7.00),
(2, '2025-03-23', 5.50);

-- Inserción de datos en Detalle de Ventas
INSERT INTO detalle_ventas (id_venta, id_producto, cantidad, subtotal) VALUES
(1, 1, 2, 7.00),
(2, 3, 3, 4.50),
(2, 2, 1, 2.00);
