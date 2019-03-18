<section class="panel b-red" id="course">
  <article class="panel__wrapper">
    <div class="panel__content">
      <div class="container">
        <div class="row">
          <div class="col-md-8 col-md-offset-2">
            <div class="price-content">
              <div class="heading">
                <h4>
                  Nuestros Cursos
                </h4>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="owl-carousel owl-theme projects-container">
                    <?php
                      $arg = array(
                          'post_type'    => 'curso',
                          'posts_per_page' => 7
                      );
                      $get_arg = new WP_Query( $arg );
                      while ( $get_arg->have_posts() ) {
                      $get_arg->the_post();
                    ?>                   
                      <div class="price-item">
                        <a data-lightbox="image-1" href="">
                          <?php the_post_thumbnail('portfolio-home', array('class' => 'img-fluid mb-3')); ?>
                          
                        </a>
                        <div class="text-content">
                          <h4>
                            <?php the_title(); ?>
                          </h4>
                          <p>
                             <?php the_content(); ?>
                          </p>
                          <div class="primary-button">
                            <a href="<?php the_permalink(); ?>">
                                Ver más
                            </a>
                          </div>
                        </div>
                      </div>
                    <?php } wp_reset_postdata();
                    ?>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </article>
</section>