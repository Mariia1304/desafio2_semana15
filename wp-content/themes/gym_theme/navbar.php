<nav class="nav">
            <div class="burger">
                <div class="burger__patty">
                </div>
            </div>
             <?php if ( has_nav_menu( 'header-menu' ) ) { ?>
                    <?php wp_nav_menu( array( 
                        'theme_location'    => 'header-menu',
                        // 'container_id'      => 'navbarResponsive',
                        // 'container_class'   => 'collapse navbar-collapse',
                        'menu_class'        => 'nav__list'
                        )
                    ); ?>
             <?php } ?>
            <!-- <ul id="mi-menu" class="nav__list">
                <li class="nav__item">
                    <a class="nav__link  scrolly" href="#1">
                        Inicio
                    </a>
                </li>
                <li class="nav__item">
                    <a class="nav__link  scrolly" href="#2">
                        Acerca de
                    </a>
                </li>
                <li class="nav__item">
                    <a class="nav__link  scrolly" href="#3">
                        Cursos
                    </a>
                </li>
                <li class="nav__item">
                    <a class="nav__link  scrolly" href="#4">
                        Contacto
                    </a>
                </li>
            </ul> -->
        </nav>



               