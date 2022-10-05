<?php

namespace DaVinci\Paginacion;

/**
 * Maneja los datos necesarios para una paginación.
 */
class Paginador
{
    protected int $registrosPorPagina;
    protected int $registroInicial;
    protected int $registrosTotales;
    protected int $pagina;
    protected int $paginas;
    protected string $url;

    public function __construct(int $registrosPorPagina)
    {
        $this->registrosPorPagina = $registrosPorPagina;
        $this->pagina = (int) ($_GET['p'] ?? 1);
        $this->registroInicial = ($this->registrosPorPagina * $this->pagina) - $this->registrosPorPagina;
    }

    /**
     * Renderiza una navegación de paginación.
     * @return void
     */
    public function links()
    {
        new PaginadorLinks($this);
    }

    /**
     * @param int $registrosTotales
     */
    public function setRegistrosTotales(int $registrosTotales): void
    {
        $this->registrosTotales = $registrosTotales;
        $this->paginas = ceil($this->registrosTotales / $this->registrosPorPagina);
    }

    /**
     * @return int
     */
    public function getRegistrosPorPagina(): int
    {
        return $this->registrosPorPagina;
    }

    /**
     * @return int
     */
    public function getRegistroInicial(): int
    {
        return $this->registroInicial;
    }

    /**
     * @return int
     */
    public function getRegistrosTotales(): int
    {
        return $this->registrosTotales;
    }

    /**
     * @return int
     */
    public function getPagina(): int
    {
        return $this->pagina;
    }

    /**
     * @return int
     */
    public function getPaginas(): int
    {
        return $this->paginas;
    }

    /**
     * @return string
     */
    public function getUrl(): string
    {
        return $this->url;
    }

    /**
     * @param string $url
     * @return Paginador
     */
    public function setUrl(string $url): self
    {
        $this->url = $url;
        return $this;
    }
}
