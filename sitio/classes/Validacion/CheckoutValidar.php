<?php

namespace DaVinci\Validacion;

class CheckoutValidar
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
            $this->errores['nombre'] = 'Debes completar tu nombre.';
        }
        if (empty($this->data['apellido'])) {
            $this->errores['apellido'] = 'Debes completar tu apellido.';
        }
        if (empty($this->data['mail'])) {
            $this->errores['mail'] = 'Debes completar tu email.';
        }
        if (empty($this->data['telefono'])) {
            $this->errores['telefono'] = 'Debes completar tu teléfono.';
        }
        if (empty($this->data['numero'])) {
            $this->errores['numero'] = 'Debes completar el número de la tarjeta.';
        }
        if (empty($this->data['vencimiento'])) {
            $this->errores['vencimiento'] = 'Debes completar la fecha de vencimiento.';
        }
        if (empty($this->data['codigo'])) {
            $this->errores['codigo'] = 'Debes completar el codigo de vencimiento.';
        }
        if (empty($this->data['titular'])) {
            $this->errores['titular'] = 'Debes completar el titular.';
        }
        if (empty($this->data['dni'])) {
            $this->errores['dni'] = 'Debes completar el DNI.';
        }
    }
}