<?php

namespace DaVinci\Validacion;

class RegistroValidar
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
        if (empty($this->data['email'])) {
            $this->errores['email'] = 'Debes ingresar un email.';
        }
        if (empty($this->data['nombre'])) {
            $this->errores['nombre'] = 'Debes ingresar un nombre.';
        }
        if (empty($this->data['apellido'])) {
            $this->errores['apellido'] = 'Debes ingresar un apellido.';
        }
        if (empty($this->data['password'])) {
            $this->errores['password'] = 'Debes ingresar una contraseña.';
        }
        if ($this->data['password'] !== $this->data['password_confirmar']) {
            $this->errores['password_confirmar'] = 'Las contraseñas no coindicen.';
        }
    }
}