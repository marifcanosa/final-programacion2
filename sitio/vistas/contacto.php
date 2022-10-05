<div id="contacto">
<div class="container">
<h1>Contáctanos</h1>
<p>¿Tenes dudas sobre algun producto o queres consultar cuando vuelve a estar en stock? Dejanos tu consulta aca y te contestaremos en la brevedad!</p>
<form action="#">
  <div>
    <div class="row">
        <label class="text-start" for="nombre">Nombre:</label>
        <input class="form-control" type="text" id="nombre" name="nombre">
    </div>
    <div class="row">
        <label class="text-start" for="mail">Mail:</label>
        <input class="form-control" type="email" id="mail" name="mail">
    </div>
    <div class="row">
        <label class="text-start" for="telefono">Telefono:</label>
        <input class="form-control" type="number" id="telefono" name="prtelefono">
    </div>
    <div class="row">
        <label class="text-start" for="consulta">Tu consulta:</label>
        <textarea class="form-control" name="consulta" id="consulta" cols="50" rows="4"></textarea>
    </div>
    <div>
    <button type="reset" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Enviar</button>
    </div>
    </div>
</form>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          Su consulta ha sido enviada con exito. En la brevedad nos comunicaremos con usted. Saludos!
      </div>
    </div>
  </div>
</div>
</div>
</div>