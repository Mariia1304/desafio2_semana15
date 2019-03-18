<div class="contact-content">
  <div class="heading">
    <h4>
        Contáctanos
    </h4>
    <h5>
        Rellena el siguiente formulario para inscrirte en nuestros cursos.
    </h5>
  </div>
  <div class="row">
    <div class="col-md-8">
      <div class="contat-form">
        <?php echo do_shortcode('[contact-form-7 id="51" title="Formulario de contacto 1"]') ?>
        <!-- <form action="" id="contact" method="post">
          <fieldset>
            <input class="form-control" id="name" name="name" placeholder="Tu nombre" required="" type="text"/>
          </fieldset>
          <fieldset>
            <input class="form-control" id="email" name="email" placeholder="Tu correo" required="" type="email"/>
          </fieldset>
          <fieldset>
            <textarea class="form-control" id="message" name="message" placeholder="Tu mensaje" required="" rows="6">
            </textarea>
          </fieldset>
          <fieldset>
            <button class="btn" id="form-submit" type="submit">
              Enviar
            </button>
          </fieldset>
        </form> -->
      </div>
    </div>
    <?php if (get_field('direction') && get_field('phone') != ''){ ?>
    <div class="col-md-4">
      <div class="more-info">
        <h4>
          ¿Donde estamos ubicados?
        </h4>
        <p>
          <em>
            <?php the_field('direction'); ?>
          </em>
        </p>
        <h4>
          Teléfonos
        </h4>
        <p>
          <?php the_field('phone'); ?>
        </p>
      </div>
    </div>
  <?php } ?>
  </div>
</div>