<?php
namespace DaVinci\Validacion;

class ProductoValidar
{
    protected $data = [];
    protected $errores = [];

    public function __construct(array $data)
    {
        $this->data = $data;
        $this->validar();
    }

    public function hayErrores() :bool
    {
        return !empty($this->errores);
    }

    public function obtenerErrores() : array
    {
        return $this->errores;
    }

    protected function validar()
    {
        if (empty($this->data['nombre'])) {
            $this->errores['nombre'] = 'El producto debe tener un nombre.';
        } else if (strlen($this->data['nombre']) < 3) {
            $this->errores['nombre'] = 'El producto debe tener un nombre de al menos 3 caracteres.';
        }
        if (empty($this->data['descripcion'])) {
            $this->errores['descripcion'] = 'El producto debe tener una descripcion.';
        }
        if (empty($this->data['precio'])) {
            $this->errores['precio'] = 'El producto debe tener un precio.';
        }
        if (empty($this->data['imagen'])) {
            $this->errores['imagen'] = 'El producto debe tener una imagen.';
        }
        if (empty($this->data['imagen_descripcion'])) {
            $this->errores['imagen_descripcion'] = 'La imagen debe tener una descripción.';
        }
    }
}