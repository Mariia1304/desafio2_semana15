
<?php get_header(); ?>

<?php include('navbar.php') ?>
<?php include('header-section.php'); ?>

<?php
                      
  while ( have_posts() ) {
    the_post();
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
          <a href="#contact">
              Inscribirme
          </a>
        </div>
      </div>
    </div>
  <?php } wp_reset_postdata();
  ?>


    
<?php get_footer(); ?>
                  