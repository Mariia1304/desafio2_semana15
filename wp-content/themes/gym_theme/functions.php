<?php


add_action( 'wp_enqueue_scripts', function() {

    wp_deregister_script('jquery');

    //Enqueue Style
   
    wp_enqueue_style( 'bootstrap', get_template_directory_uri() . '/assets/css/bootstrap.min.css');
    wp_enqueue_style( 'bootstrapTheme', get_template_directory_uri() . '/assets/css/bootstrap-theme.min.css');
    wp_enqueue_style( 'styles', get_template_directory_uri() . '/assets/css/styles.css');

    //Enqueue Scripts
    
    wp_enqueue_script( 'jquery3', get_template_directory_uri() . '/assets/js/vendor/jquery-3.3.1.slim.min.js'
        , null, null, true);
    wp_enqueue_script('jquery1', get_template_directory_uri() . '/assets/js/vendor/jquery-1.11.2.min.js', null, null, true);
    wp_enqueue_script('modernizr', get_template_directory_uri() . '/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js', null, null, true);
    wp_enqueue_script('bootstrap', get_template_directory_uri() . '/assets/js/vendor/bootstrap.min.js', null, null, true);
    wp_enqueue_script('plugins', get_template_directory_uri() . '/assets/js/plugins.js', null, null, true);
    wp_enqueue_script('mainjs', get_template_directory_uri() . '/assets/js/main.js', null, null, true);
    wp_enqueue_script('app', get_template_directory_uri() . '/assets/js/vendor/app.js', ['jquery3'], null, true);


    // wp_enqueue_script( 'script', get_template_directory_uri() . '/js/script.js'));

} );

// registrar menu

function menus_setup() {
  register_nav_menus(
    array(
      'header-menu' => __( 'Header Menu' ),
      'footer-menu' => __( 'Footer Menu' ),
    )
  );
}
add_action( 'after_setup_theme', 'menus_setup' );

//tamaños de imagenes personalizados

 function thumbnails_setup() {
    add_theme_support( 'post-thumbnails' );
  }
  function dl_image_sizes( $sizes ) {
    $add_sizes = array(
      'portfolio-home'		=> __( 'Tamaño de las imágenes del portafolio en el home' ),
      'square'				=> __( 'Tamaño personalizado para hacer cuadradas las imágenes' ),
      'post-custom-size'	=> __( 'Tamaño personalizado para la imagen destada de los post' ),
      'custom-size-blog'	=> __( 'Tamaño personalizado para la imagen destada de los post' )
    );
    return array_merge( $sizes, $add_sizes );
  }
  if ( function_exists( 'add_theme_support' ) ) {
    add_image_size( 'portfolio-home', 320, 280, true );
    add_image_size( 'square', 400, 400, true );
    add_image_size( 'post-custom-size', 800, 600, true );
    add_image_size( 'custom-size-blog', 400, 300, true );
    add_filter( 'image_size_names_choose', 'dl_image_sizes' );
  }
  add_action( 'after_setup_theme', 'thumbnails_setup' );

  // Register Custom Post Type
function course_section() {

	$labels = array(
		'name'                  => _x( 'Cursos', 'Post Type General Name', 'text_domain' ),
		'singular_name'         => _x( 'Curso', 'Post Type Singular Name', 'text_domain' ),
		'menu_name'             => __( 'Cursos', 'text_domain' ),
		'name_admin_bar'        => __( 'Post Type', 'text_domain' ),
		'archives'              => __( 'Item Archives', 'text_domain' ),
		'attributes'            => __( 'Item Attributes', 'text_domain' ),
		'parent_item_colon'     => __( 'Parent Item:', 'text_domain' ),
		'all_items'             => __( 'All Items', 'text_domain' ),
		'add_new_item'          => __( 'Add New Item', 'text_domain' ),
		'add_new'               => __( 'Add New', 'text_domain' ),
		'new_item'              => __( 'New Item', 'text_domain' ),
		'edit_item'             => __( 'Edit Item', 'text_domain' ),
		'update_item'           => __( 'Update Item', 'text_domain' ),
		'view_item'             => __( 'View Item', 'text_domain' ),
		'view_items'            => __( 'View Items', 'text_domain' ),
		'search_items'          => __( 'Search Item', 'text_domain' ),
		'not_found'             => __( 'Not found', 'text_domain' ),
		'not_found_in_trash'    => __( 'Not found in Trash', 'text_domain' ),
		
		'use_featured_image'    => __( 'Use as featured image', 'text_domain' ),
		'insert_into_item'      => __( 'Insert into item', 'text_domain' ),
		'uploaded_to_this_item' => __( 'Uploaded to this item', 'text_domain' ),
		'items_list'            => __( 'Items list', 'text_domain' ),
		'items_list_navigation' => __( 'Items list navigation', 'text_domain' ),
		'filter_items_list'     => __( 'Filter items list', 'text_domain' ),
	);
	$args = array(
		'label'                 => __( 'Curso', 'text_domain' ),
		'description'           => __( 'Post Type Description', 'text_domain' ),
		'labels'                => $labels,
		'supports'              => array( 'title', 'editor', 'thumbnail', 'custom-fields' ),
		'taxonomies'            => array( 'category', 'post_tag' ),
		'hierarchical'          => false,
		'public'                => true,
		'show_ui'               => true,
		'show_in_menu'          => true,
		'menu_position'         => 5,
		'menu_icon'             => 'dashicons-format-aside',
		'show_in_admin_bar'     => true,
		'show_in_nav_menus'     => true,
		'can_export'            => true,
		'has_archive'           => true,
		'exclude_from_search'   => false,
		'publicly_queryable'    => true,
		'capability_type'       => 'page',
	);
	register_post_type( 'curso', $args );

}
add_action( 'init', 'course_section', 0 );