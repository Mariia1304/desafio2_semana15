<section class="panel b-blue" id="header">
  <article class="panel__wrapper">
    <div class="panel__content">
      <div class="container">
        <div class="row">
          <div class="col-md-8 col-md-offset-2">
            <div class="home-content">
              <div class="home-heading">
                <h1>
                  <em>
                    <?php the_field('title_header_section') ?>
                  </em>
                    <?php the_field('title1_header_section') ?>
                </h1>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="home-box-content">
                    <div class="left-text">
                      <h4>
                        <?php the_field('content_header_title') ?>
                        
                        <em>
                          <?php the_field('content_header_title1') ?>
                            
                        </em>
                        <?php the_field('content_header_title2') ?>
                       
                      </h4>
                      <p>
                        <?php the_field('content') ?>
                        
                      </p>
                      <?php if (get_field('text_button')!= ''){ ?>
                      <div class="primary-button">
                        <a href="#about">
                          <?php the_field('text_button') ?>
                        </a>
                      </div>
                    <?php } ?>
                    </div>
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