# ************************************************************
# Sequel Pro SQL dump
# Versión 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.25)
# Base de datos: semana15_2_gym
# Tiempo de Generación: 2019-03-18 18:56:51 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla dl_commentmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dl_commentmeta`;

CREATE TABLE `dl_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Volcado de tabla dl_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dl_comments`;

CREATE TABLE `dl_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `dl_comments` WRITE;
/*!40000 ALTER TABLE `dl_comments` DISABLE KEYS */;

INSERT INTO `dl_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`)
VALUES
	(1,1,'Un Comentarista de WordPress','wapuu@wordpress.example','https://wordpress.org/','','2019-03-05 01:28:01','2019-03-05 04:28:01','Hola, este es un comentario.\nPara empezar con la moderación, edición y eliminación de comentarios, por favor visita la pantalla de comentarios en el panel inicial.\nLos Avatares de los comentaristas provienen de <a href=\"https://gravatar.com\">Gravatar</a>.',0,'1','','',0,0);

/*!40000 ALTER TABLE `dl_comments` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla dl_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dl_links`;

CREATE TABLE `dl_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Volcado de tabla dl_options
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dl_options`;

CREATE TABLE `dl_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `dl_options` WRITE;
/*!40000 ALTER TABLE `dl_options` DISABLE KEYS */;

INSERT INTO `dl_options` (`option_id`, `option_name`, `option_value`, `autoload`)
VALUES
	(1,'siteurl','http://localhost:8080','yes'),
	(2,'home','http://localhost:8080','yes'),
	(3,'blogname','Work Hard, Play Hard | GYM','yes'),
	(4,'blogdescription','Otro sitio de WordPress','yes'),
	(5,'users_can_register','0','yes'),
	(6,'admin_email','maria.bookvoed@gmail.com','yes'),
	(7,'start_of_week','1','yes'),
	(8,'use_balanceTags','0','yes'),
	(9,'use_smilies','1','yes'),
	(10,'require_name_email','1','yes'),
	(11,'comments_notify','1','yes'),
	(12,'posts_per_rss','10','yes'),
	(13,'rss_use_excerpt','0','yes'),
	(14,'mailserver_url','mail.example.com','yes'),
	(15,'mailserver_login','login@example.com','yes'),
	(16,'mailserver_pass','password','yes'),
	(17,'mailserver_port','110','yes'),
	(18,'default_category','1','yes'),
	(19,'default_comment_status','open','yes'),
	(20,'default_ping_status','open','yes'),
	(21,'default_pingback_flag','1','yes'),
	(22,'posts_per_page','10','yes'),
	(23,'date_format','F j, Y','yes'),
	(24,'time_format','g:i a','yes'),
	(25,'links_updated_date_format','F j, Y g:i a','yes'),
	(26,'comment_moderation','0','yes'),
	(27,'moderation_notify','1','yes'),
	(28,'permalink_structure','/%postname%/','yes'),
	(29,'rewrite_rules','a:111:{s:8:\"curso/?$\";s:25:\"index.php?post_type=curso\";s:38:\"curso/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?post_type=curso&feed=$matches[1]\";s:33:\"curso/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?post_type=curso&feed=$matches[1]\";s:25:\"curso/page/([0-9]{1,})/?$\";s:43:\"index.php?post_type=curso&paged=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:33:\"curso/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:43:\"curso/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:63:\"curso/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"curso/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"curso/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:39:\"curso/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:22:\"curso/([^/]+)/embed/?$\";s:38:\"index.php?curso=$matches[1]&embed=true\";s:26:\"curso/([^/]+)/trackback/?$\";s:32:\"index.php?curso=$matches[1]&tb=1\";s:46:\"curso/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?curso=$matches[1]&feed=$matches[2]\";s:41:\"curso/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?curso=$matches[1]&feed=$matches[2]\";s:34:\"curso/([^/]+)/page/?([0-9]{1,})/?$\";s:45:\"index.php?curso=$matches[1]&paged=$matches[2]\";s:41:\"curso/([^/]+)/comment-page-([0-9]{1,})/?$\";s:45:\"index.php?curso=$matches[1]&cpage=$matches[2]\";s:30:\"curso/([^/]+)(?:/([0-9]+))?/?$\";s:44:\"index.php?curso=$matches[1]&page=$matches[2]\";s:22:\"curso/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:32:\"curso/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:52:\"curso/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:47:\"curso/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:47:\"curso/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:28:\"curso/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=7&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}','yes'),
	(30,'hack_file','0','yes'),
	(31,'blog_charset','UTF-8','yes'),
	(32,'moderation_keys','','no'),
	(33,'active_plugins','a:2:{i:0;s:30:\"advanced-custom-fields/acf.php\";i:1;s:36:\"contact-form-7/wp-contact-form-7.php\";}','yes'),
	(34,'category_base','','yes'),
	(35,'ping_sites','http://rpc.pingomatic.com/','yes'),
	(36,'comment_max_links','2','yes'),
	(37,'gmt_offset','-3','yes'),
	(38,'default_email_category','1','yes'),
	(39,'recently_edited','','no'),
	(40,'template','gym_theme','yes'),
	(41,'stylesheet','gym_theme','yes'),
	(42,'comment_whitelist','1','yes'),
	(43,'blacklist_keys','','no'),
	(44,'comment_registration','0','yes'),
	(45,'html_type','text/html','yes'),
	(46,'use_trackback','0','yes'),
	(47,'default_role','subscriber','yes'),
	(48,'db_version','44719','yes'),
	(49,'uploads_use_yearmonth_folders','1','yes'),
	(50,'upload_path','','yes'),
	(51,'blog_public','1','yes'),
	(52,'default_link_category','2','yes'),
	(53,'show_on_front','page','yes'),
	(54,'tag_base','','yes'),
	(55,'show_avatars','1','yes'),
	(56,'avatar_rating','G','yes'),
	(57,'upload_url_path','','yes'),
	(58,'thumbnail_size_w','150','yes'),
	(59,'thumbnail_size_h','150','yes'),
	(60,'thumbnail_crop','1','yes'),
	(61,'medium_size_w','300','yes'),
	(62,'medium_size_h','300','yes'),
	(63,'avatar_default','mystery','yes'),
	(64,'large_size_w','1024','yes'),
	(65,'large_size_h','1024','yes'),
	(66,'image_default_link_type','none','yes'),
	(67,'image_default_size','','yes'),
	(68,'image_default_align','','yes'),
	(69,'close_comments_for_old_posts','0','yes'),
	(70,'close_comments_days_old','14','yes'),
	(71,'thread_comments','1','yes'),
	(72,'thread_comments_depth','5','yes'),
	(73,'page_comments','0','yes'),
	(74,'comments_per_page','50','yes'),
	(75,'default_comments_page','newest','yes'),
	(76,'comment_order','asc','yes'),
	(77,'sticky_posts','a:0:{}','yes'),
	(78,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),
	(79,'widget_text','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),
	(80,'widget_rss','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),
	(81,'uninstall_plugins','a:0:{}','no'),
	(82,'timezone_string','','yes'),
	(83,'page_for_posts','0','yes'),
	(84,'page_on_front','7','yes'),
	(85,'default_post_format','0','yes'),
	(86,'link_manager_enabled','0','yes'),
	(87,'finished_splitting_shared_terms','1','yes'),
	(88,'site_icon','0','yes'),
	(89,'medium_large_size_w','768','yes'),
	(90,'medium_large_size_h','0','yes'),
	(91,'wp_page_for_privacy_policy','3','yes'),
	(92,'show_comments_cookies_opt_in','1','yes'),
	(93,'initial_db_version','44719','yes'),
	(94,'dl_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),
	(95,'fresh_site','0','yes'),
	(96,'WPLANG','es_CL','yes'),
	(97,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),
	(98,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),
	(99,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),
	(100,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),
	(101,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),
	(102,'sidebars_widgets','a:2:{s:19:\"wp_inactive_widgets\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}','yes'),
	(103,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(104,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(105,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(106,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(107,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(108,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(109,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(110,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(111,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(112,'cron','a:5:{i:1552076882;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1552105682;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1552105696;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1552105698;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes'),
	(113,'theme_mods_twentynineteen','a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1551760316;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}','yes'),
	(124,'_site_transient_timeout_browser_c96f9d536ce6a2115111430dd95484a0','1552364897','no'),
	(125,'_site_transient_browser_c96f9d536ce6a2115111430dd95484a0','a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"72.0.3626.121\";s:8:\"platform\";s:9:\"Macintosh\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no'),
	(126,'_site_transient_timeout_php_check_464f4068caea2f8f3edcc5ae59429c65','1552364898','no'),
	(127,'_site_transient_php_check_464f4068caea2f8f3edcc5ae59429c65','a:5:{s:19:\"recommended_version\";s:3:\"7.3\";s:15:\"minimum_version\";s:5:\"5.2.4\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}','no'),
	(135,'can_compress_scripts','1','no'),
	(142,'current_theme','','yes'),
	(143,'theme_mods_gym_theme','a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:11:\"header-menu\";i:2;}s:18:\"custom_css_post_id\";i:-1;}','yes'),
	(144,'theme_switched','','yes'),
	(155,'nav_menu_options','a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}','yes'),
	(169,'recently_activated','a:0:{}','yes'),
	(176,'acf_version','5.7.12','yes'),
	(193,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:57:\"https://downloads.wordpress.org/release/wordpress-5.1.zip\";s:6:\"locale\";s:5:\"es_CL\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:57:\"https://downloads.wordpress.org/release/wordpress-5.1.zip\";s:10:\"no_content\";s:68:\"https://downloads.wordpress.org/release/wordpress-5.1-no-content.zip\";s:11:\"new_bundled\";s:69:\"https://downloads.wordpress.org/release/wordpress-5.1-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:3:\"5.1\";s:7:\"version\";s:3:\"5.1\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1552074868;s:15:\"version_checked\";s:3:\"5.1\";s:12:\"translations\";a:0:{}}','no'),
	(194,'_site_transient_update_plugins','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1552074870;s:7:\"checked\";a:4:{s:30:\"advanced-custom-fields/acf.php\";s:6:\"5.7.12\";s:19:\"akismet/akismet.php\";s:5:\"4.1.1\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:5:\"5.1.1\";s:9:\"hello.php\";s:5:\"1.7.1\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:4:{s:30:\"advanced-custom-fields/acf.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:36:\"w.org/plugins/advanced-custom-fields\";s:4:\"slug\";s:22:\"advanced-custom-fields\";s:6:\"plugin\";s:30:\"advanced-custom-fields/acf.php\";s:11:\"new_version\";s:6:\"5.7.12\";s:3:\"url\";s:53:\"https://wordpress.org/plugins/advanced-custom-fields/\";s:7:\"package\";s:72:\"https://downloads.wordpress.org/plugin/advanced-custom-fields.5.7.12.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png?rev=1082746\";s:2:\"1x\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-128x128.png?rev=1082746\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";s:2:\"1x\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102\";}s:11:\"banners_rtl\";a:0:{}}s:19:\"akismet/akismet.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.1.1\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.1.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}}s:36:\"contact-form-7/wp-contact-form-7.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:28:\"w.org/plugins/contact-form-7\";s:4:\"slug\";s:14:\"contact-form-7\";s:6:\"plugin\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:11:\"new_version\";s:5:\"5.1.1\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/contact-form-7/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/contact-form-7.5.1.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:66:\"https://ps.w.org/contact-form-7/assets/icon-256x256.png?rev=984007\";s:2:\"1x\";s:66:\"https://ps.w.org/contact-form-7/assets/icon-128x128.png?rev=984007\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/contact-form-7/assets/banner-1544x500.png?rev=860901\";s:2:\"1x\";s:68:\"https://ps.w.org/contact-form-7/assets/banner-772x250.png?rev=880427\";}s:11:\"banners_rtl\";a:0:{}}s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907\";s:2:\"1x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=969907\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:65:\"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342\";}s:11:\"banners_rtl\";a:0:{}}}}','no'),
	(195,'_site_transient_update_themes','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1552074870;s:7:\"checked\";a:1:{s:9:\"gym_theme\";s:0:\"\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}','no'),
	(196,'wpcf7','a:2:{s:7:\"version\";s:5:\"5.1.1\";s:13:\"bulk_validate\";a:4:{s:9:\"timestamp\";i:1551825970;s:7:\"version\";s:5:\"5.1.1\";s:11:\"count_valid\";i:1;s:13:\"count_invalid\";i:0;}}','yes'),
	(217,'category_children','a:0:{}','yes'),
	(225,'_site_transient_timeout_theme_roots','1552076669','no'),
	(226,'_site_transient_theme_roots','a:1:{s:9:\"gym_theme\";s:7:\"/themes\";}','no'),
	(227,'_transient_doing_cron','1552935227.9764869213104248046875','yes');

/*!40000 ALTER TABLE `dl_options` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla dl_postmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dl_postmeta`;

CREATE TABLE `dl_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `dl_postmeta` WRITE;
/*!40000 ALTER TABLE `dl_postmeta` DISABLE KEYS */;

INSERT INTO `dl_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`)
VALUES
	(1,2,'_wp_page_template','default'),
	(2,3,'_wp_page_template','default'),
	(3,2,'_wp_trash_meta_status','publish'),
	(4,2,'_wp_trash_meta_time','1551760582'),
	(5,2,'_wp_desired_post_slug','pagina-de-ejemplo'),
	(6,3,'_wp_trash_meta_status','draft'),
	(7,3,'_wp_trash_meta_time','1551760582'),
	(8,3,'_wp_desired_post_slug','politica-de-privacidad'),
	(9,7,'_edit_lock','1551917364:1'),
	(10,7,'_edit_last','1'),
	(11,9,'_menu_item_type','custom'),
	(12,9,'_menu_item_menu_item_parent','0'),
	(13,9,'_menu_item_object_id','9'),
	(14,9,'_menu_item_object','custom'),
	(15,9,'_menu_item_target',''),
	(16,9,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(17,9,'_menu_item_xfn',''),
	(18,9,'_menu_item_url','#header'),
	(20,10,'_menu_item_type','custom'),
	(21,10,'_menu_item_menu_item_parent','0'),
	(22,10,'_menu_item_object_id','10'),
	(23,10,'_menu_item_object','custom'),
	(24,10,'_menu_item_target',''),
	(25,10,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(26,10,'_menu_item_xfn',''),
	(27,10,'_menu_item_url','#about'),
	(29,11,'_menu_item_type','custom'),
	(30,11,'_menu_item_menu_item_parent','0'),
	(31,11,'_menu_item_object_id','11'),
	(32,11,'_menu_item_object','custom'),
	(33,11,'_menu_item_target',''),
	(34,11,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(35,11,'_menu_item_xfn',''),
	(36,11,'_menu_item_url','#course'),
	(38,12,'_menu_item_type','custom'),
	(39,12,'_menu_item_menu_item_parent','0'),
	(40,12,'_menu_item_object_id','12'),
	(41,12,'_menu_item_object','custom'),
	(42,12,'_menu_item_target',''),
	(43,12,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(44,12,'_menu_item_xfn',''),
	(45,12,'_menu_item_url','#contact'),
	(47,13,'_menu_item_type','custom'),
	(48,13,'_menu_item_menu_item_parent','0'),
	(49,13,'_menu_item_object_id','13'),
	(50,13,'_menu_item_object','custom'),
	(51,13,'_menu_item_target',''),
	(52,13,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(53,13,'_menu_item_xfn',''),
	(54,13,'_menu_item_url','http://funciona'),
	(56,15,'_edit_last','1'),
	(57,15,'_edit_lock','1551814284:1'),
	(58,15,'_wp_trash_meta_status','publish'),
	(59,15,'_wp_trash_meta_time','1551814452'),
	(60,15,'_wp_desired_post_slug','group_5c7eced76e870'),
	(61,16,'_wp_trash_meta_status','publish'),
	(62,16,'_wp_trash_meta_time','1551814452'),
	(63,16,'_wp_desired_post_slug','field_5c7ecef39ab6e'),
	(64,17,'_edit_last','1'),
	(65,17,'_edit_lock','1551814373:1'),
	(66,17,'_wp_trash_meta_status','publish'),
	(67,17,'_wp_trash_meta_time','1551814547'),
	(68,17,'_wp_desired_post_slug','group_5c7ecf3a565c9'),
	(69,18,'_wp_trash_meta_status','publish'),
	(70,18,'_wp_trash_meta_time','1551814547'),
	(71,18,'_wp_desired_post_slug','field_5c7ecf59d7935'),
	(72,23,'_edit_last','1'),
	(73,23,'_edit_lock','1551816760:1'),
	(74,7,'title_header_section','algo bla bla'),
	(75,7,'_title_header_section','field_5c7ed1c915b7a'),
	(76,25,'title_header_section',''),
	(77,25,'_title_header_section','field_5c7ed1c915b7a'),
	(78,26,'title_header_section','algo bla bla'),
	(79,26,'_title_header_section','field_5c7ed1c915b7a'),
	(80,7,'title1_header_section','otro bla bla'),
	(81,7,'_title1_header_section','field_5c7ed5b5f22db'),
	(82,28,'title_header_section','algo bla bla'),
	(83,28,'_title_header_section','field_5c7ed1c915b7a'),
	(84,28,'title1_header_section','otro bla bla'),
	(85,28,'_title1_header_section','field_5c7ed5b5f22db'),
	(86,7,'content_header_title','sfdsfs'),
	(87,7,'_content_header_title','field_5c7ed7b74a401'),
	(88,7,'content_header_title1','dfs'),
	(89,7,'_content_header_title1','field_5c7ed7fa6ead6'),
	(90,7,'content_header_title2','fdfsfs'),
	(91,7,'_content_header_title2','field_5c7ed81b67757'),
	(92,7,'content','gsdgfsgs'),
	(93,7,'_content','field_5c7ed835824ac'),
	(94,7,'text_button',''),
	(95,7,'_text_button','field_5c7ed86f714a3'),
	(96,34,'title_header_section','algo bla bla'),
	(97,34,'_title_header_section','field_5c7ed1c915b7a'),
	(98,34,'title1_header_section','otro bla bla'),
	(99,34,'_title1_header_section','field_5c7ed5b5f22db'),
	(100,34,'content_header_title','sfdsfs'),
	(101,34,'_content_header_title','field_5c7ed7b74a401'),
	(102,34,'content_header_title1','dfs'),
	(103,34,'_content_header_title1','field_5c7ed7fa6ead6'),
	(104,34,'content_header_title2','fdfsfs'),
	(105,34,'_content_header_title2','field_5c7ed81b67757'),
	(106,34,'content','gsdgfsgs'),
	(107,34,'_content','field_5c7ed835824ac'),
	(108,34,'text_button','gfgd'),
	(109,34,'_text_button','field_5c7ed86f714a3'),
	(110,35,'title_header_section','algo bla bla'),
	(111,35,'_title_header_section','field_5c7ed1c915b7a'),
	(112,35,'title1_header_section','otro bla bla'),
	(113,35,'_title1_header_section','field_5c7ed5b5f22db'),
	(114,35,'content_header_title','sfdsfs'),
	(115,35,'_content_header_title','field_5c7ed7b74a401'),
	(116,35,'content_header_title1','dfs'),
	(117,35,'_content_header_title1','field_5c7ed7fa6ead6'),
	(118,35,'content_header_title2','fdfsfs'),
	(119,35,'_content_header_title2','field_5c7ed81b67757'),
	(120,35,'content','gsdgfsgs'),
	(121,35,'_content','field_5c7ed835824ac'),
	(122,35,'text_button',''),
	(123,35,'_text_button','field_5c7ed86f714a3'),
	(124,36,'_edit_last','1'),
	(125,36,'_edit_lock','1551833781:1'),
	(126,37,'_edit_last','1'),
	(127,37,'_edit_lock','1551833407:1'),
	(128,38,'_edit_last','1'),
	(129,38,'_edit_lock','1551833355:1'),
	(130,39,'_edit_last','1'),
	(131,39,'_edit_lock','1551833319:1'),
	(132,40,'_edit_last','1'),
	(133,40,'_edit_lock','1551833280:1'),
	(134,41,'_edit_last','1'),
	(135,41,'_edit_lock','1551833244:1'),
	(136,42,'_edit_last','1'),
	(137,42,'_edit_lock','1551917081:1'),
	(138,43,'_wp_attached_file','2019/03/price-item-01.jpg'),
	(139,43,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:320;s:6:\"height\";i:280;s:4:\"file\";s:25:\"2019/03/price-item-01.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"price-item-01-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:25:\"price-item-01-300x263.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:263;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(140,36,'_thumbnail_id','43'),
	(141,1,'_edit_lock','1551917038:1'),
	(142,42,'_thumbnail_id','44'),
	(143,44,'_wp_attached_file','2019/03/price-item-07.jpg'),
	(144,44,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:320;s:6:\"height\";i:280;s:4:\"file\";s:25:\"2019/03/price-item-07.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"price-item-07-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:25:\"price-item-07-300x263.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:263;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(145,45,'_wp_attached_file','2019/03/price-item-06.jpg'),
	(146,45,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:320;s:6:\"height\";i:280;s:4:\"file\";s:25:\"2019/03/price-item-06.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"price-item-06-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:25:\"price-item-06-300x263.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:263;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(147,41,'_thumbnail_id','45'),
	(148,47,'_wp_attached_file','2019/03/price-item-05.jpg'),
	(149,47,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:280;s:6:\"height\";i:280;s:4:\"file\";s:25:\"2019/03/price-item-05.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"price-item-05-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"portfolio-home\";a:4:{s:4:\"file\";s:25:\"price-item-05-280x280.jpg\";s:5:\"width\";i:280;s:6:\"height\";i:280;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(150,40,'_thumbnail_id','47'),
	(151,48,'_wp_attached_file','2019/03/price-item-04.jpg'),
	(152,48,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:320;s:6:\"height\";i:280;s:4:\"file\";s:25:\"2019/03/price-item-04.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"price-item-04-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:25:\"price-item-04-300x263.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:263;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(153,39,'_thumbnail_id','48'),
	(154,49,'_wp_attached_file','2019/03/price-item-03.jpg'),
	(155,49,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:320;s:6:\"height\";i:280;s:4:\"file\";s:25:\"2019/03/price-item-03.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"price-item-03-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:25:\"price-item-03-300x263.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:263;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(156,38,'_thumbnail_id','49'),
	(157,50,'_wp_attached_file','2019/03/price-item-02.jpg'),
	(158,50,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:320;s:6:\"height\";i:280;s:4:\"file\";s:25:\"2019/03/price-item-02.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"price-item-02-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:25:\"price-item-02-300x263.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:263;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(159,37,'_thumbnail_id','50'),
	(160,51,'_form','<form action=\"\" id=\"contact\" method=\"post\">\n <fieldset>\n   [text* nombre id:name class:form-control placeholder\"Tu nombre\"]\n </fieldset>\n <fieldset>\n   [email* email id:email class:form-control placeholder\"Tu correo\"]\n </fieldset>\n <fieldset>\n   [textarea* message id:message class:form-control placeholder\"Tu mensaje\"]\n </fieldset>\n <fieldset>\n   <button  class=\"btn wpcf7-form-control wpcf7-submit\" id=\"form-submit\" type=\"submit\">\n    Enviar\n  </button>\n </fieldset>\n</form>'),
	(161,51,'_mail','a:9:{s:6:\"active\";b:1;s:7:\"subject\";s:43:\"Work Hard, Play Hard | GYM \"[your-subject]\"\";s:6:\"sender\";s:26:\"<maria.bookvoed@gmail.com>\";s:9:\"recipient\";s:24:\"maria.bookvoed@gmail.com\";s:4:\"body\";s:195:\"De: [your-name] <[your-email]>\nAsunto: [your-subject]\n\nCuerpo del Mensaje\n[your-message]\n\n-- \nEste correo fue enviado utilizando contact form en Work Hard, Play Hard | GYM (http://localhost:8080)\";s:18:\"additional_headers\";s:0:\"\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:0;s:13:\"exclude_blank\";b:0;}'),
	(162,51,'_mail_2','a:9:{s:6:\"active\";b:0;s:7:\"subject\";s:43:\"Work Hard, Play Hard | GYM \"[your-subject]\"\";s:6:\"sender\";s:53:\"Work Hard, Play Hard | GYM <maria.bookvoed@gmail.com>\";s:9:\"recipient\";s:12:\"[your-email]\";s:4:\"body\";s:140:\"Cuerpo del Mensaje\n[your-message]\n\n-- \nEste correo fue enviado utilizando contact form en Work Hard, Play Hard | GYM (http://localhost:8080)\";s:18:\"additional_headers\";s:34:\"Reply-To: maria.bookvoed@gmail.com\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:0;s:13:\"exclude_blank\";b:0;}'),
	(163,51,'_messages','a:23:{s:12:\"mail_sent_ok\";s:45:\"Thank you for your message. It has been sent.\";s:12:\"mail_sent_ng\";s:71:\"There was an error trying to send your message. Please try again later.\";s:16:\"validation_error\";s:61:\"One or more fields have an error. Please check and try again.\";s:4:\"spam\";s:71:\"There was an error trying to send your message. Please try again later.\";s:12:\"accept_terms\";s:69:\"You must accept the terms and conditions before sending your message.\";s:16:\"invalid_required\";s:22:\"The field is required.\";s:16:\"invalid_too_long\";s:22:\"The field is too long.\";s:17:\"invalid_too_short\";s:23:\"The field is too short.\";s:12:\"invalid_date\";s:29:\"The date format is incorrect.\";s:14:\"date_too_early\";s:44:\"The date is before the earliest one allowed.\";s:13:\"date_too_late\";s:41:\"The date is after the latest one allowed.\";s:13:\"upload_failed\";s:46:\"There was an unknown error uploading the file.\";s:24:\"upload_file_type_invalid\";s:49:\"You are not allowed to upload files of this type.\";s:21:\"upload_file_too_large\";s:20:\"The file is too big.\";s:23:\"upload_failed_php_error\";s:38:\"There was an error uploading the file.\";s:14:\"invalid_number\";s:29:\"The number format is invalid.\";s:16:\"number_too_small\";s:47:\"The number is smaller than the minimum allowed.\";s:16:\"number_too_large\";s:46:\"The number is larger than the maximum allowed.\";s:23:\"quiz_answer_not_correct\";s:36:\"The answer to the quiz is incorrect.\";s:17:\"captcha_not_match\";s:11:\"El código \";s:13:\"invalid_email\";s:38:\"The e-mail address entered is invalid.\";s:11:\"invalid_url\";s:19:\"The URL is invalid.\";s:11:\"invalid_tel\";s:32:\"The telephone number is invalid.\";}'),
	(164,51,'_additional_settings',''),
	(165,51,'_locale','es_CL'),
	(166,52,'_edit_last','1'),
	(167,52,'_edit_lock','1551840191:1'),
	(168,7,'direction','bfgmdgn'),
	(169,7,'_direction','field_5c7f339959e27'),
	(170,7,'phone','123456789 | 12345678'),
	(171,7,'_phone','field_5c7f340321bed'),
	(172,55,'title_header_section','algo bla bla'),
	(173,55,'_title_header_section','field_5c7ed1c915b7a'),
	(174,55,'title1_header_section','otro bla bla'),
	(175,55,'_title1_header_section','field_5c7ed5b5f22db'),
	(176,55,'content_header_title','sfdsfs'),
	(177,55,'_content_header_title','field_5c7ed7b74a401'),
	(178,55,'content_header_title1','dfs'),
	(179,55,'_content_header_title1','field_5c7ed7fa6ead6'),
	(180,55,'content_header_title2','fdfsfs'),
	(181,55,'_content_header_title2','field_5c7ed81b67757'),
	(182,55,'content','gsdgfsgs'),
	(183,55,'_content','field_5c7ed835824ac'),
	(184,55,'text_button',''),
	(185,55,'_text_button','field_5c7ed86f714a3'),
	(186,55,'direction','nada'),
	(187,55,'_direction','field_5c7f339959e27'),
	(188,55,'phone','nada'),
	(189,55,'_phone','field_5c7f340321bed'),
	(190,56,'title_header_section','algo bla bla'),
	(191,56,'_title_header_section','field_5c7ed1c915b7a'),
	(192,56,'title1_header_section','otro bla bla'),
	(193,56,'_title1_header_section','field_5c7ed5b5f22db'),
	(194,56,'content_header_title','sfdsfs'),
	(195,56,'_content_header_title','field_5c7ed7b74a401'),
	(196,56,'content_header_title1','dfs'),
	(197,56,'_content_header_title1','field_5c7ed7fa6ead6'),
	(198,56,'content_header_title2','fdfsfs'),
	(199,56,'_content_header_title2','field_5c7ed81b67757'),
	(200,56,'content','gsdgfsgs'),
	(201,56,'_content','field_5c7ed835824ac'),
	(202,56,'text_button',''),
	(203,56,'_text_button','field_5c7ed86f714a3'),
	(204,56,'direction',''),
	(205,56,'_direction','field_5c7f339959e27'),
	(206,56,'phone',''),
	(207,56,'_phone','field_5c7f340321bed'),
	(208,57,'title_header_section','algo bla bla'),
	(209,57,'_title_header_section','field_5c7ed1c915b7a'),
	(210,57,'title1_header_section','otro bla bla'),
	(211,57,'_title1_header_section','field_5c7ed5b5f22db'),
	(212,57,'content_header_title','sfdsfs'),
	(213,57,'_content_header_title','field_5c7ed7b74a401'),
	(214,57,'content_header_title1','dfs'),
	(215,57,'_content_header_title1','field_5c7ed7fa6ead6'),
	(216,57,'content_header_title2','fdfsfs'),
	(217,57,'_content_header_title2','field_5c7ed81b67757'),
	(218,57,'content','gsdgfsgs'),
	(219,57,'_content','field_5c7ed835824ac'),
	(220,57,'text_button',''),
	(221,57,'_text_button','field_5c7ed86f714a3'),
	(222,57,'direction','bfgmdgn'),
	(223,57,'_direction','field_5c7f339959e27'),
	(224,57,'phone','123456789'),
	(225,57,'_phone','field_5c7f340321bed'),
	(226,58,'title_header_section','algo bla bla'),
	(227,58,'_title_header_section','field_5c7ed1c915b7a'),
	(228,58,'title1_header_section','otro bla bla'),
	(229,58,'_title1_header_section','field_5c7ed5b5f22db'),
	(230,58,'content_header_title','sfdsfs'),
	(231,58,'_content_header_title','field_5c7ed7b74a401'),
	(232,58,'content_header_title1','dfs'),
	(233,58,'_content_header_title1','field_5c7ed7fa6ead6'),
	(234,58,'content_header_title2','fdfsfs'),
	(235,58,'_content_header_title2','field_5c7ed81b67757'),
	(236,58,'content','gsdgfsgs'),
	(237,58,'_content','field_5c7ed835824ac'),
	(238,58,'text_button',''),
	(239,58,'_text_button','field_5c7ed86f714a3'),
	(240,58,'direction','bfgmdgn'),
	(241,58,'_direction','field_5c7f339959e27'),
	(242,58,'phone','123456789 | 12345678'),
	(243,58,'_phone','field_5c7f340321bed'),
	(244,59,'title_header_section','algo bla bla'),
	(245,59,'_title_header_section','field_5c7ed1c915b7a'),
	(246,59,'title1_header_section','otro bla bla'),
	(247,59,'_title1_header_section','field_5c7ed5b5f22db'),
	(248,59,'content_header_title','sfdsfs'),
	(249,59,'_content_header_title','field_5c7ed7b74a401'),
	(250,59,'content_header_title1','dfs'),
	(251,59,'_content_header_title1','field_5c7ed7fa6ead6'),
	(252,59,'content_header_title2','fdfsfs'),
	(253,59,'_content_header_title2','field_5c7ed81b67757'),
	(254,59,'content','gsdgfsgs'),
	(255,59,'_content','field_5c7ed835824ac'),
	(256,59,'text_button',''),
	(257,59,'_text_button','field_5c7ed86f714a3'),
	(258,59,'direction','bfgmdgn'),
	(259,59,'_direction','field_5c7f339959e27'),
	(260,59,'phone','123456789 | 12345678'),
	(261,59,'_phone','field_5c7f340321bed');

/*!40000 ALTER TABLE `dl_postmeta` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla dl_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dl_posts`;

CREATE TABLE `dl_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `dl_posts` WRITE;
/*!40000 ALTER TABLE `dl_posts` DISABLE KEYS */;

INSERT INTO `dl_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`)
VALUES
	(1,1,'2019-03-05 01:28:01','2019-03-05 04:28:01','<!-- wp:paragraph -->\n<p>Bienvenido(a) a WordPress. Esta es tu primera entrada. Edítala o bórrala ¡y comienza a publicar!</p>\n<!-- /wp:paragraph -->','¡Hola mundo!','','publish','open','open','','hola-mundo','','','2019-03-05 01:28:01','2019-03-05 04:28:01','',0,'http://localhost:8080/?p=1',0,'post','',1),
	(2,1,'2019-03-05 01:28:01','2019-03-05 04:28:01','<!-- wp:paragraph -->\n<p>Esta es una página de ejemplo. Es diferente de una entrada de blog porque se quedará en ese lugar y se mostrará en la navegación de tu sitio (en la mayoría de los temas). La mayoría de la gente comienza con una página de acerca de que los introduce a los visitantes potenciales del sitio. Podría decir algo como esto:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>¡Hola! Soy un Mensajero en bici durante el día, aspirante a actor de noche, y este es mi sitio Web. Vivo en los Ángeles, tengo un gran perro llamado Jack, y me gustan las piñas coladas. (Y estar atrapados en la lluvia.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>... o algo así:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>La Empresa Cosas XYZ fue fundada en 1971, y ha estado proporcionando cosas de calidad al público desde entonces. Ubicado en la ciudad de Gotham, XYZ emplea a más de 2.000 personas y hace todo tipo de cosas impresionantes para la comunidad gótica.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Como nuevo usuario de WordPress, debes ir a <a href=\"http://localhost:8080/wp-admin/\">tu Dashboard</a> para eliminar esta página, y así crear nuevas páginas para su contenido. ¡Que te diviertas!</p>\n<!-- /wp:paragraph -->','Página de ejemplo','','trash','closed','open','','pagina-de-ejemplo__trashed','','','2019-03-05 01:36:22','2019-03-05 04:36:22','',0,'http://localhost:8080/?page_id=2',0,'page','',0),
	(3,1,'2019-03-05 01:28:01','2019-03-05 04:28:01','<!-- wp:heading --><h2>Quiénes somos</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Nuestra dirección de sitio web es: http://localhost:8080.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Qué datos personales recopilamos y por qué lo recogemos</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Comentarios</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Cuando los visitantes dejan comentarios en el sitio recopilamos los datos mostrados en el formulario de comentarios, y también la dirección IP del visitante y la cadena del agente de usuario del navegador para ayudar a la detección de spam.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Se puede proporcionar una cadena anonimizada creada a partir de su dirección de correo electrónico (también denominada hash) al servicio gravatar para ver si la está utilizando. La política de privacidad del servicio gravar está disponible aquí: https://automattic.com/privacy/. Después de la aprobación de tu comentario, su imagen de perfil es visible para el público en el contexto de tu comentario.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Multimedia</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Si subes imágenes al sitio web, debes evitar cargar imágenes con datos de ubicación incrustados (EXIF GPS). Los visitantes del sitio web pueden descargar y extraer los datos de la ubicación de las imágenes en el sitio Web.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Formularios de Contacto</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Si deja un Comentario en nuestro sitio puedes optar por guardar tu nombre, dirección de correo electrónico y sitio web en cookies. Éstos son para tu conveniencia de modo que no tengas que rellenar tus datos otra vez cuando dejes otro comentario. Estas cookies durarán un año.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Si tienes una cuenta e inicias sesión en este sitio, configuraremos una cookie temporal para determinar si tu navegador acepta cookies. Esta cookie no contiene datos personales y se descarta al cerrar el navegador.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Cuando inicies sesión, también configuraremos varias cookies para guardar tu información de inicio de sesión y sus opciones de visualización en pantalla. Las cookies de inicio de sesión duran dos días y las cookies de opciones de pantalla duran un año. Si selecciona &quot;Recordarme&quot; en tu inicio de sesión se mantendrá durante dos semanas. Si cierra la sesión de tu cuenta, se eliminarán las cookies de inicio de sesión.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Si editas o publicas un artículo, una cookie adicional se guardará en tu navegador. Esta cookie no incluye datos personales y simplemente indica el ID de correo del artículo que acabas de editar. Expira después de 1 día.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Contenido incrustado de otros sitios web</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Los artículos en este sitio pueden incluir contenido incrustado (por ejemplo, videos, imágenes, artículos, etc.). El contenido incrustado de otros sitios web se comporta de la misma manera que si el visitante hubiera visitado el otro sitio web.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Estos sitios web pueden recopilar datos sobre ti, utilizar cookies, incrustar un seguimiento adicional de terceros y supervisar tu interacción con ese contenido incrustado, incluido el seguimiento de tu interacción con el contenido incrustado si tiene una cuenta y está conectado a dicho sitio web.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Analíticas</h3><!-- /wp:heading --><!-- wp:heading --><h2>Con quién compartimos tus datos</h2><!-- /wp:heading --><!-- wp:heading --><h2>Cuánto tiempo conservamos tus datos</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Si dejas un comentario, el comentario y sus metadatos se conservan indefinidamente. Esto es para que podamos reconocer y aprobar automáticamente cualquier comentario de seguimiento en lugar de mantenerlos en una cola de moderación.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Para los usuarios que se registren en nuestro sitio web (si los hay), también almacenamos la información personal que proporcionan en su perfil de usuario. Todos los usuarios pueden ver, editar o borrar su información personal en cualquier momento (excepto que no pueden cambiar su nombre de usuario). Los administradores de sitios web también pueden ver y editar esa información.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Qué derechos tienen sobre sus datos</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Si tienes una cuenta en este sitio, o ha dejado comentarios, puedes solicitar recibir un archivo exportado de los datos personales que tengamos sobre usted, incluyendo cualquier dato que nos haya proporcionado. También puede solicitar que borremos cualquier dato personal que mantengamos sobre usted. Esto no incluye los datos que estamos obligados a mantener para fines administrativos, legales o de seguridad.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Dónde enviamos tus datos</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Los comentarios de los visitantes se pueden verificar a través de un servicio automático de detección de spam.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Tu información de contacto</h2><!-- /wp:heading --><!-- wp:heading --><h2>Información adicional</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cómo protegemos sus datos</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Qué procedimientos de violación de datos tenemos en marcha</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>De qué terceros recibimos datos</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Qué toma de decisiones y/o perfiles automatizados haremos con los datos del usuario</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Requisitos de divulgación regulatoria de la industria</h3><!-- /wp:heading -->','Políticas de Privacidad','','trash','closed','open','','politica-de-privacidad__trashed','','','2019-03-05 01:36:22','2019-03-05 04:36:22','',0,'http://localhost:8080/?page_id=3',0,'page','',0),
	(4,1,'2019-03-05 01:28:18','0000-00-00 00:00:00','','Borrador automático','','auto-draft','open','open','','','','','2019-03-05 01:28:18','0000-00-00 00:00:00','',0,'http://localhost:8080/?p=4',0,'post','',0),
	(5,1,'2019-03-05 01:36:22','2019-03-05 04:36:22','<!-- wp:paragraph -->\n<p>Esta es una página de ejemplo. Es diferente de una entrada de blog porque se quedará en ese lugar y se mostrará en la navegación de tu sitio (en la mayoría de los temas). La mayoría de la gente comienza con una página de acerca de que los introduce a los visitantes potenciales del sitio. Podría decir algo como esto:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>¡Hola! Soy un Mensajero en bici durante el día, aspirante a actor de noche, y este es mi sitio Web. Vivo en los Ángeles, tengo un gran perro llamado Jack, y me gustan las piñas coladas. (Y estar atrapados en la lluvia.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>... o algo así:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>La Empresa Cosas XYZ fue fundada en 1971, y ha estado proporcionando cosas de calidad al público desde entonces. Ubicado en la ciudad de Gotham, XYZ emplea a más de 2.000 personas y hace todo tipo de cosas impresionantes para la comunidad gótica.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Como nuevo usuario de WordPress, debes ir a <a href=\"http://localhost:8080/wp-admin/\">tu Dashboard</a> para eliminar esta página, y así crear nuevas páginas para su contenido. ¡Que te diviertas!</p>\n<!-- /wp:paragraph -->','Página de ejemplo','','inherit','closed','closed','','2-revision-v1','','','2019-03-05 01:36:22','2019-03-05 04:36:22','',2,'http://localhost:8080/2019/03/05/2-revision-v1/',0,'revision','',0),
	(6,1,'2019-03-05 01:36:22','2019-03-05 04:36:22','<!-- wp:heading --><h2>Quiénes somos</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Nuestra dirección de sitio web es: http://localhost:8080.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Qué datos personales recopilamos y por qué lo recogemos</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Comentarios</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Cuando los visitantes dejan comentarios en el sitio recopilamos los datos mostrados en el formulario de comentarios, y también la dirección IP del visitante y la cadena del agente de usuario del navegador para ayudar a la detección de spam.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Se puede proporcionar una cadena anonimizada creada a partir de su dirección de correo electrónico (también denominada hash) al servicio gravatar para ver si la está utilizando. La política de privacidad del servicio gravar está disponible aquí: https://automattic.com/privacy/. Después de la aprobación de tu comentario, su imagen de perfil es visible para el público en el contexto de tu comentario.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Multimedia</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Si subes imágenes al sitio web, debes evitar cargar imágenes con datos de ubicación incrustados (EXIF GPS). Los visitantes del sitio web pueden descargar y extraer los datos de la ubicación de las imágenes en el sitio Web.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Formularios de Contacto</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Si deja un Comentario en nuestro sitio puedes optar por guardar tu nombre, dirección de correo electrónico y sitio web en cookies. Éstos son para tu conveniencia de modo que no tengas que rellenar tus datos otra vez cuando dejes otro comentario. Estas cookies durarán un año.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Si tienes una cuenta e inicias sesión en este sitio, configuraremos una cookie temporal para determinar si tu navegador acepta cookies. Esta cookie no contiene datos personales y se descarta al cerrar el navegador.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Cuando inicies sesión, también configuraremos varias cookies para guardar tu información de inicio de sesión y sus opciones de visualización en pantalla. Las cookies de inicio de sesión duran dos días y las cookies de opciones de pantalla duran un año. Si selecciona &quot;Recordarme&quot; en tu inicio de sesión se mantendrá durante dos semanas. Si cierra la sesión de tu cuenta, se eliminarán las cookies de inicio de sesión.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Si editas o publicas un artículo, una cookie adicional se guardará en tu navegador. Esta cookie no incluye datos personales y simplemente indica el ID de correo del artículo que acabas de editar. Expira después de 1 día.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Contenido incrustado de otros sitios web</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Los artículos en este sitio pueden incluir contenido incrustado (por ejemplo, videos, imágenes, artículos, etc.). El contenido incrustado de otros sitios web se comporta de la misma manera que si el visitante hubiera visitado el otro sitio web.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Estos sitios web pueden recopilar datos sobre ti, utilizar cookies, incrustar un seguimiento adicional de terceros y supervisar tu interacción con ese contenido incrustado, incluido el seguimiento de tu interacción con el contenido incrustado si tiene una cuenta y está conectado a dicho sitio web.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Analíticas</h3><!-- /wp:heading --><!-- wp:heading --><h2>Con quién compartimos tus datos</h2><!-- /wp:heading --><!-- wp:heading --><h2>Cuánto tiempo conservamos tus datos</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Si dejas un comentario, el comentario y sus metadatos se conservan indefinidamente. Esto es para que podamos reconocer y aprobar automáticamente cualquier comentario de seguimiento en lugar de mantenerlos en una cola de moderación.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Para los usuarios que se registren en nuestro sitio web (si los hay), también almacenamos la información personal que proporcionan en su perfil de usuario. Todos los usuarios pueden ver, editar o borrar su información personal en cualquier momento (excepto que no pueden cambiar su nombre de usuario). Los administradores de sitios web también pueden ver y editar esa información.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Qué derechos tienen sobre sus datos</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Si tienes una cuenta en este sitio, o ha dejado comentarios, puedes solicitar recibir un archivo exportado de los datos personales que tengamos sobre usted, incluyendo cualquier dato que nos haya proporcionado. También puede solicitar que borremos cualquier dato personal que mantengamos sobre usted. Esto no incluye los datos que estamos obligados a mantener para fines administrativos, legales o de seguridad.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Dónde enviamos tus datos</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Los comentarios de los visitantes se pueden verificar a través de un servicio automático de detección de spam.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Tu información de contacto</h2><!-- /wp:heading --><!-- wp:heading --><h2>Información adicional</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cómo protegemos sus datos</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Qué procedimientos de violación de datos tenemos en marcha</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>De qué terceros recibimos datos</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Qué toma de decisiones y/o perfiles automatizados haremos con los datos del usuario</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Requisitos de divulgación regulatoria de la industria</h3><!-- /wp:heading -->','Políticas de Privacidad','','inherit','closed','closed','','3-revision-v1','','','2019-03-05 01:36:22','2019-03-05 04:36:22','',3,'http://localhost:8080/2019/03/05/3-revision-v1/',0,'revision','',0),
	(7,1,'2019-03-05 01:36:48','2019-03-05 04:36:48','','Home2','','publish','closed','closed','','home2','','','2019-03-06 21:09:24','2019-03-07 00:09:24','',0,'http://localhost:8080/?page_id=7',0,'page','',0),
	(8,1,'2019-03-05 01:36:48','2019-03-05 04:36:48','','Home','','inherit','closed','closed','','7-revision-v1','','','2019-03-05 01:36:48','2019-03-05 04:36:48','',7,'http://localhost:8080/2019/03/05/7-revision-v1/',0,'revision','',0),
	(9,1,'2019-03-05 15:58:35','2019-03-05 18:58:35','','Inicio','','publish','closed','closed','','inicio','','','2019-03-05 16:21:01','2019-03-05 19:21:01','',0,'http://localhost:8080/?p=9',1,'nav_menu_item','',0),
	(10,1,'2019-03-05 15:58:35','2019-03-05 18:58:35','','Acerca de','','publish','closed','closed','','acerca-de','','','2019-03-05 16:21:01','2019-03-05 19:21:01','',0,'http://localhost:8080/?p=10',2,'nav_menu_item','',0),
	(11,1,'2019-03-05 15:58:35','2019-03-05 18:58:35','','Cursos','','publish','closed','closed','','cursos','','','2019-03-05 16:21:01','2019-03-05 19:21:01','',0,'http://localhost:8080/?p=11',3,'nav_menu_item','',0),
	(12,1,'2019-03-05 15:58:56','2019-03-05 18:58:56','','Contacto','','publish','closed','closed','','contacto','','','2019-03-05 16:21:01','2019-03-05 19:21:01','',0,'http://localhost:8080/?p=12',4,'nav_menu_item','',0),
	(13,1,'2019-03-05 16:21:01','2019-03-05 19:21:01','','funciona!','','publish','closed','closed','','funciona','','','2019-03-05 16:21:01','2019-03-05 19:21:01','',0,'http://localhost:8080/?p=13',5,'nav_menu_item','',0),
	(14,1,'2019-03-05 16:30:13','0000-00-00 00:00:00','','Borrador automático','','auto-draft','closed','closed','','','','','2019-03-05 16:30:13','0000-00-00 00:00:00','',0,'http://localhost:8080/?post_type=acf-field-group&p=14',0,'acf-field-group','',0),
	(15,1,'2019-03-05 16:33:44','2019-03-05 19:33:44','a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"page_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:10:\"front_page\";}}}s:8:\"position\";s:15:\"acf_after_title\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}','Header-section','header-section','trash','closed','closed','','group_5c7eced76e870__trashed','','','2019-03-05 16:34:12','2019-03-05 19:34:12','',0,'http://localhost:8080/?post_type=acf-field-group&#038;p=15',0,'acf-field-group','',0),
	(16,1,'2019-03-05 16:33:44','2019-03-05 19:33:44','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','tiltulo','tiltulo','trash','closed','closed','','field_5c7ecef39ab6e__trashed','','','2019-03-05 16:34:12','2019-03-05 19:34:12','',15,'http://localhost:8080/?post_type=acf-field&#038;p=16',0,'acf-field','',0),
	(17,1,'2019-03-05 16:34:47','2019-03-05 19:34:47','a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"page\";}}}s:8:\"position\";s:15:\"acf_after_title\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";a:14:{i:0;s:9:\"permalink\";i:1;s:11:\"the_content\";i:2;s:7:\"excerpt\";i:3;s:10:\"discussion\";i:4;s:8:\"comments\";i:5;s:9:\"revisions\";i:6;s:4:\"slug\";i:7;s:6:\"author\";i:8;s:6:\"format\";i:9;s:15:\"page_attributes\";i:10;s:14:\"featured_image\";i:11;s:10:\"categories\";i:12;s:4:\"tags\";i:13;s:15:\"send-trackbacks\";}s:11:\"description\";s:0:\"\";}','Header-section','header-section','trash','closed','closed','','group_5c7ecf3a565c9__trashed','','','2019-03-05 16:35:47','2019-03-05 19:35:47','',0,'http://localhost:8080/?post_type=acf-field-group&#038;p=17',0,'acf-field-group','',0),
	(18,1,'2019-03-05 16:35:14','2019-03-05 19:35:14','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','titulo','titulo','trash','closed','closed','','field_5c7ecf59d7935__trashed','','','2019-03-05 16:35:47','2019-03-05 19:35:47','',17,'http://localhost:8080/?post_type=acf-field&#038;p=18',0,'acf-field','',0),
	(19,1,'2019-03-05 16:36:49','2019-03-05 19:36:49','<!-- wp:paragraph -->\n<p>soy home</p>\n<!-- /wp:paragraph -->','Home','','inherit','closed','closed','','7-revision-v1','','','2019-03-05 16:36:49','2019-03-05 19:36:49','',7,'http://localhost:8080/2019/03/05/7-revision-v1/',0,'revision','',0),
	(21,1,'2019-03-05 16:37:54','2019-03-05 19:37:54','<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>soy home</p>\n<!-- /wp:paragraph -->','Home','','inherit','closed','closed','','7-revision-v1','','','2019-03-05 16:37:54','2019-03-05 19:37:54','',7,'http://localhost:8080/2019/03/05/7-revision-v1/',0,'revision','',0),
	(22,1,'2019-03-05 16:39:46','2019-03-05 19:39:46','<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->','Home','','inherit','closed','closed','','7-revision-v1','','','2019-03-05 16:39:46','2019-03-05 19:39:46','',7,'http://localhost:8080/2019/03/05/7-revision-v1/',0,'revision','',0),
	(23,1,'2019-03-05 16:45:10','2019-03-05 19:45:10','a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:4:\"page\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:1:\"7\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}','header-section','header-section','publish','closed','closed','','group_5c7ed188bed36','','','2019-03-05 17:15:00','2019-03-05 20:15:00','',0,'http://localhost:8080/?post_type=acf-field-group&#038;p=23',0,'acf-field-group','',0),
	(24,1,'2019-03-05 16:46:40','2019-03-05 19:46:40','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:43:\"Aqui tkienes que colocar titulo de cabecera\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','titulo de cabecera','title_header_section','publish','closed','closed','','field_5c7ed1c915b7a','','','2019-03-05 16:46:40','2019-03-05 19:46:40','',23,'http://localhost:8080/?post_type=acf-field&p=24',0,'acf-field','',0),
	(25,1,'2019-03-05 16:53:01','2019-03-05 19:53:01','','Home','','inherit','closed','closed','','7-revision-v1','','','2019-03-05 16:53:01','2019-03-05 19:53:01','',7,'http://localhost:8080/2019/03/05/7-revision-v1/',0,'revision','',0),
	(26,1,'2019-03-05 16:55:37','2019-03-05 19:55:37','','Home','','inherit','closed','closed','','7-revision-v1','','','2019-03-05 16:55:37','2019-03-05 19:55:37','',7,'http://localhost:8080/2019/03/05/7-revision-v1/',0,'revision','',0),
	(27,1,'2019-03-05 17:02:42','2019-03-05 20:02:42','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','titulo mas chico jaja','title1_header_section','publish','closed','closed','','field_5c7ed5b5f22db','','','2019-03-05 17:02:42','2019-03-05 20:02:42','',23,'http://localhost:8080/?post_type=acf-field&p=27',1,'acf-field','',0),
	(28,1,'2019-03-05 17:03:47','2019-03-05 20:03:47','','Home','','inherit','closed','closed','','7-revision-v1','','','2019-03-05 17:03:47','2019-03-05 20:03:47','',7,'http://localhost:8080/2019/03/05/7-revision-v1/',0,'revision','',0),
	(29,1,'2019-03-05 17:11:36','2019-03-05 20:11:36','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','titulo de contenido','content_header_title','publish','closed','closed','','field_5c7ed7b74a401','','','2019-03-05 17:11:36','2019-03-05 20:11:36','',23,'http://localhost:8080/?post_type=acf-field&p=29',2,'acf-field','',0),
	(30,1,'2019-03-05 17:12:03','2019-03-05 20:12:03','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','titulo1 de contenido','content_header_title1','publish','closed','closed','','field_5c7ed7fa6ead6','','','2019-03-05 17:12:03','2019-03-05 20:12:03','',23,'http://localhost:8080/?post_type=acf-field&p=30',3,'acf-field','',0),
	(31,1,'2019-03-05 17:12:29','2019-03-05 20:12:29','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','titulo2 de contenido','content_header_title2','publish','closed','closed','','field_5c7ed81b67757','','','2019-03-05 17:12:29','2019-03-05 20:12:29','',23,'http://localhost:8080/?post_type=acf-field&p=31',4,'acf-field','',0),
	(32,1,'2019-03-05 17:12:53','2019-03-05 20:12:53','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','contenido','content','publish','closed','closed','','field_5c7ed835824ac','','','2019-03-05 17:12:53','2019-03-05 20:12:53','',23,'http://localhost:8080/?post_type=acf-field&p=32',5,'acf-field','',0),
	(33,1,'2019-03-05 17:14:16','2019-03-05 20:14:16','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','texto de boton','text_button','publish','closed','closed','','field_5c7ed86f714a3','','','2019-03-05 17:14:16','2019-03-05 20:14:16','',23,'http://localhost:8080/?post_type=acf-field&p=33',6,'acf-field','',0),
	(34,1,'2019-03-05 17:15:41','2019-03-05 20:15:41','','Home','','inherit','closed','closed','','7-revision-v1','','','2019-03-05 17:15:41','2019-03-05 20:15:41','',7,'http://localhost:8080/2019/03/05/7-revision-v1/',0,'revision','',0),
	(35,1,'2019-03-05 18:33:14','2019-03-05 21:33:14','','Home','','inherit','closed','closed','','7-revision-v1','','','2019-03-05 18:33:14','2019-03-05 21:33:14','',7,'http://localhost:8080/2019/03/05/7-revision-v1/',0,'revision','',0),
	(36,1,'2019-03-05 18:53:58','2019-03-05 21:53:58','Se basa en ejercicios de suspensión (las manos o los pies se encuentran sostenidos en un punto de anclaje, mientras la otra parte del cuerpo se apoya en el suelo). Su finalidad es potenciar la fuerza muscular.','TRX','','publish','closed','closed','','trx','','','2019-03-05 21:52:41','2019-03-06 00:52:41','',0,'http://localhost:8080/?post_type=curso&#038;p=36',0,'curso','',0),
	(37,1,'2019-03-05 18:54:29','2019-03-05 21:54:29','Deporte de contacto, el ejercicio realizado es muy completo. Incluye:  resistencia, agilidad, coordinación corporal, fuerza y capacidad aeróbica en los entrenamientos, como saltar la cuerda y correr.','BOXEO','','publish','closed','closed','','boxeo','','','2019-03-05 21:52:29','2019-03-06 00:52:29','',0,'http://localhost:8080/?post_type=curso&#038;p=37',0,'curso','',0),
	(38,1,'2019-03-05 18:54:38','2019-03-05 21:54:38','Se basa en movimientos funcionales que varían constantemente a alta intensidad. No es necesario ser un deportista, cada uno lleva su propio ritmo y exigencia.','CROSSFIT','','publish','closed','closed','','crossfit','','','2019-03-05 21:51:34','2019-03-06 00:51:34','',0,'http://localhost:8080/?post_type=curso&#038;p=38',0,'curso','',0),
	(39,1,'2019-03-05 18:55:15','2019-03-05 21:55:15','Jiu – Jitsu (Brazilian). En general, el brazilian jiu jitsu tiene el objetivo de someter al oponente, centrado en la lucha en el suelo y la defensa personal ocupando la técnica sobre fuerza y tamaño.','JIU-JITSU','','publish','closed','closed','','jiu-jitsu','','','2019-03-05 21:50:56','2019-03-06 00:50:56','',0,'http://localhost:8080/?post_type=curso&#038;p=39',0,'curso','',0),
	(40,1,'2019-03-05 18:55:42','2019-03-05 21:55:42','Es la preparación física de boxeo, sin contacto persona a persona. Se realizan varios ejercicios aeróbicos con un poco de peso e intensidad; esta combinación hace que se marquen los músculos.','FITBOX','','publish','closed','closed','','fitbox','','','2019-03-05 21:50:20','2019-03-06 00:50:20','',0,'http://localhost:8080/?post_type=curso&#038;p=40',0,'curso','',0),
	(41,1,'2019-03-05 18:55:51','2019-03-05 21:55:51','Un entrenamiento increíble, como ningún otro. Baila al ritmo de la mejor música, con personas increíbles y quema muchísimas calorías casi sin darte cuenta.','ZUMBA','','publish','closed','closed','','zumba','','','2019-03-05 21:49:44','2019-03-06 00:49:44','',0,'http://localhost:8080/?post_type=curso&#038;p=41',0,'curso','',0),
	(42,1,'2019-03-05 18:56:20','2019-03-05 21:56:20','El baby fútbol es un deporte derivado del fútbol de once jugadores, similar al fútbol sala. Disfruta con amigos de este increíble pasatiempo','BABY FÚTBOL','','publish','closed','closed','','baby-futbol','','','2019-03-05 21:48:06','2019-03-06 00:48:06','',0,'http://localhost:8080/?post_type=curso&#038;p=42',0,'curso','',0),
	(43,1,'2019-03-05 19:27:57','2019-03-05 22:27:57','','price-item-01','','inherit','open','closed','','price-item-01','','','2019-03-05 19:27:57','2019-03-05 22:27:57','',36,'http://localhost:8080/wp-content/uploads/2019/03/price-item-01.jpg',0,'attachment','image/jpeg',0),
	(44,1,'2019-03-05 21:47:59','2019-03-06 00:47:59','','price-item-07','','inherit','open','closed','','price-item-07','','','2019-03-05 21:47:59','2019-03-06 00:47:59','',42,'http://localhost:8080/wp-content/uploads/2019/03/price-item-07.jpg',0,'attachment','image/jpeg',0),
	(45,1,'2019-03-05 21:48:46','2019-03-06 00:48:46','','price-item-06','','inherit','open','closed','','price-item-06','','','2019-03-05 21:48:46','2019-03-06 00:48:46','',41,'http://localhost:8080/wp-content/uploads/2019/03/price-item-06.jpg',0,'attachment','image/jpeg',0),
	(46,1,'2019-03-05 21:49:13','2019-03-06 00:49:13','Un entrenamiento increíble, como ningún otro. Baila al ritmo de la mejor música, con personas increíbles y quema muchísimas calorías casi sin darte cuenta.','ZUMBA','','inherit','closed','closed','','41-autosave-v1','','','2019-03-05 21:49:13','2019-03-06 00:49:13','',41,'http://localhost:8080/2019/03/05/41-autosave-v1/',0,'revision','',0),
	(47,1,'2019-03-05 21:50:15','2019-03-06 00:50:15','','price-item-05','','inherit','open','closed','','price-item-05','','','2019-03-05 21:50:15','2019-03-06 00:50:15','',40,'http://localhost:8080/wp-content/uploads/2019/03/price-item-05.jpg',0,'attachment','image/jpeg',0),
	(48,1,'2019-03-05 21:50:52','2019-03-06 00:50:52','','price-item-04','','inherit','open','closed','','price-item-04','','','2019-03-05 21:50:52','2019-03-06 00:50:52','',39,'http://localhost:8080/wp-content/uploads/2019/03/price-item-04.jpg',0,'attachment','image/jpeg',0),
	(49,1,'2019-03-05 21:51:25','2019-03-06 00:51:25','','price-item-03','','inherit','open','closed','','price-item-03','','','2019-03-05 21:51:25','2019-03-06 00:51:25','',38,'http://localhost:8080/wp-content/uploads/2019/03/price-item-03.jpg',0,'attachment','image/jpeg',0),
	(50,1,'2019-03-05 21:52:06','2019-03-06 00:52:06','','price-item-02','','inherit','open','closed','','price-item-02','','','2019-03-05 21:52:06','2019-03-06 00:52:06','',37,'http://localhost:8080/wp-content/uploads/2019/03/price-item-02.jpg',0,'attachment','image/jpeg',0),
	(51,1,'2019-03-05 22:46:10','2019-03-06 01:46:10','<form action=\"\" id=\"contact\" method=\"post\">\r\n <fieldset>\r\n   [text* nombre id:name class:form-control placeholder\"Tu nombre\"]\r\n </fieldset>\r\n <fieldset>\r\n   [email* email id:email class:form-control placeholder\"Tu correo\"]\r\n </fieldset>\r\n <fieldset>\r\n   [textarea* message id:message class:form-control placeholder\"Tu mensaje\"]\r\n </fieldset>\r\n <fieldset>\r\n   <button  class=\"btn wpcf7-form-control wpcf7-submit\" id=\"form-submit\" type=\"submit\">\r\n    Enviar\r\n  </button>\r\n </fieldset>\r\n</form>\n1\nWork Hard, Play Hard | GYM \"[your-subject]\"\n<maria.bookvoed@gmail.com>\nmaria.bookvoed@gmail.com\nDe: [your-name] <[your-email]>\r\nAsunto: [your-subject]\r\n\r\nCuerpo del Mensaje\r\n[your-message]\r\n\r\n-- \r\nEste correo fue enviado utilizando contact form en Work Hard, Play Hard | GYM (http://localhost:8080)\n\n\n\n\n\nWork Hard, Play Hard | GYM \"[your-subject]\"\nWork Hard, Play Hard | GYM <maria.bookvoed@gmail.com>\n[your-email]\nCuerpo del Mensaje\r\n[your-message]\r\n\r\n-- \r\nEste correo fue enviado utilizando contact form en Work Hard, Play Hard | GYM (http://localhost:8080)\nReply-To: maria.bookvoed@gmail.com\n\n\n\nThank you for your message. It has been sent.\nThere was an error trying to send your message. Please try again later.\nOne or more fields have an error. Please check and try again.\nThere was an error trying to send your message. Please try again later.\nYou must accept the terms and conditions before sending your message.\nThe field is required.\nThe field is too long.\nThe field is too short.\nThe date format is incorrect.\nThe date is before the earliest one allowed.\nThe date is after the latest one allowed.\nThere was an unknown error uploading the file.\nYou are not allowed to upload files of this type.\nThe file is too big.\nThere was an error uploading the file.\nThe number format is invalid.\nThe number is smaller than the minimum allowed.\nThe number is larger than the maximum allowed.\nThe answer to the quiz is incorrect.\nEl código \nThe e-mail address entered is invalid.\nThe URL is invalid.\nThe telephone number is invalid.','Formulario de contacto 1','','publish','closed','closed','','formulario-de-contacto-1','','','2019-03-05 23:39:41','2019-03-06 02:39:41','',0,'http://localhost:8080/?post_type=wpcf7_contact_form&#038;p=51',0,'wpcf7_contact_form','',0),
	(52,1,'2019-03-05 23:42:00','2019-03-06 02:42:00','a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:4:\"page\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:1:\"7\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}','Dirección','direccion','publish','closed','closed','','group_5c7f3359735fa','','','2019-03-05 23:45:27','2019-03-06 02:45:27','',0,'http://localhost:8080/?post_type=acf-field-group&#038;p=52',0,'acf-field-group','',0),
	(53,1,'2019-03-05 23:43:17','2019-03-06 02:43:17','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','dirección','direction','publish','closed','closed','','field_5c7f339959e27','','','2019-03-05 23:45:27','2019-03-06 02:45:27','',52,'http://localhost:8080/?post_type=acf-field&#038;p=53',0,'acf-field','',0),
	(54,1,'2019-03-05 23:45:10','2019-03-06 02:45:10','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','teléfono','phone','publish','closed','closed','','field_5c7f340321bed','','','2019-03-05 23:45:10','2019-03-06 02:45:10','',52,'http://localhost:8080/?post_type=acf-field&p=54',1,'acf-field','',0),
	(55,1,'2019-03-05 23:48:05','2019-03-06 02:48:05','','Home','','inherit','closed','closed','','7-revision-v1','','','2019-03-05 23:48:05','2019-03-06 02:48:05','',7,'http://localhost:8080/2019/03/05/7-revision-v1/',0,'revision','',0),
	(56,1,'2019-03-05 23:51:16','2019-03-06 02:51:16','','Home','','inherit','closed','closed','','7-revision-v1','','','2019-03-05 23:51:16','2019-03-06 02:51:16','',7,'http://localhost:8080/2019/03/05/7-revision-v1/',0,'revision','',0),
	(57,1,'2019-03-05 23:51:56','2019-03-06 02:51:56','','Home','','inherit','closed','closed','','7-revision-v1','','','2019-03-05 23:51:56','2019-03-06 02:51:56','',7,'http://localhost:8080/2019/03/05/7-revision-v1/',0,'revision','',0),
	(58,1,'2019-03-05 23:52:19','2019-03-06 02:52:19','','Home','','inherit','closed','closed','','7-revision-v1','','','2019-03-05 23:52:19','2019-03-06 02:52:19','',7,'http://localhost:8080/2019/03/05/7-revision-v1/',0,'revision','',0),
	(59,1,'2019-03-06 21:09:12','2019-03-07 00:09:12','','Home2','','inherit','closed','closed','','7-revision-v1','','','2019-03-06 21:09:12','2019-03-07 00:09:12','',7,'http://localhost:8080/7-revision-v1/',0,'revision','',0);

/*!40000 ALTER TABLE `dl_posts` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla dl_term_relationships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dl_term_relationships`;

CREATE TABLE `dl_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `dl_term_relationships` WRITE;
/*!40000 ALTER TABLE `dl_term_relationships` DISABLE KEYS */;

INSERT INTO `dl_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`)
VALUES
	(1,1,0),
	(9,2,0),
	(10,2,0),
	(11,2,0),
	(12,2,0),
	(13,2,0);

/*!40000 ALTER TABLE `dl_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla dl_term_taxonomy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dl_term_taxonomy`;

CREATE TABLE `dl_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `dl_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `dl_term_taxonomy` DISABLE KEYS */;

INSERT INTO `dl_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`)
VALUES
	(1,1,'category','',0,1),
	(2,2,'nav_menu','',0,5);

/*!40000 ALTER TABLE `dl_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla dl_termmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dl_termmeta`;

CREATE TABLE `dl_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Volcado de tabla dl_terms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dl_terms`;

CREATE TABLE `dl_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `dl_terms` WRITE;
/*!40000 ALTER TABLE `dl_terms` DISABLE KEYS */;

INSERT INTO `dl_terms` (`term_id`, `name`, `slug`, `term_group`)
VALUES
	(1,'Sin categoría','sin-categoria',0),
	(2,'mi-menu','mi-menu',0);

/*!40000 ALTER TABLE `dl_terms` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla dl_usermeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dl_usermeta`;

CREATE TABLE `dl_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `dl_usermeta` WRITE;
/*!40000 ALTER TABLE `dl_usermeta` DISABLE KEYS */;

INSERT INTO `dl_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`)
VALUES
	(1,1,'nickname','masha'),
	(2,1,'first_name',''),
	(3,1,'last_name',''),
	(4,1,'description',''),
	(5,1,'rich_editing','true'),
	(6,1,'syntax_highlighting','true'),
	(7,1,'comment_shortcuts','false'),
	(8,1,'admin_color','fresh'),
	(9,1,'use_ssl','0'),
	(10,1,'show_admin_bar_front','true'),
	(11,1,'locale',''),
	(12,1,'dl_capabilities','a:1:{s:13:\"administrator\";b:1;}'),
	(13,1,'dl_user_level','10'),
	(14,1,'dismissed_wp_pointers','wp496_privacy'),
	(15,1,'show_welcome_panel','1'),
	(16,1,'session_tokens','a:2:{s:64:\"96944ec065a9814af2a3f95016079abc87029421ae28ea27632f8fd0367a45e3\";a:4:{s:10:\"expiration\";i:1551932896;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36\";s:5:\"login\";i:1551760096;}s:64:\"2df57bca0c3d17e15635f43d8fc793a0d1f8f371965b53bbd516c1307ef3e84d\";a:4:{s:10:\"expiration\";i:1552087731;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36\";s:5:\"login\";i:1551914931;}}'),
	(17,1,'dl_user-settings','libraryContent=browse&editor=html'),
	(18,1,'dl_user-settings-time','1551760093'),
	(19,1,'dl_dashboard_quick_press_last_post_id','4'),
	(20,1,'managenav-menuscolumnshidden','a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
	(21,1,'metaboxhidden_nav-menus','a:1:{i:0;s:12:\"add-post_tag\";}'),
	(22,1,'nav_menu_recently_edited','2'),
	(23,1,'closedpostboxes_curso','a:0:{}'),
	(24,1,'metaboxhidden_curso','a:1:{i:0;s:7:\"slugdiv\";}'),
	(25,1,'closedpostboxes_page','a:0:{}'),
	(26,1,'metaboxhidden_page','a:0:{}');

/*!40000 ALTER TABLE `dl_usermeta` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla dl_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dl_users`;

CREATE TABLE `dl_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `dl_users` WRITE;
/*!40000 ALTER TABLE `dl_users` DISABLE KEYS */;

INSERT INTO `dl_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`)
VALUES
	(1,'masha','$P$BTZtcjbOh/hlq1PIMCwftLuyYHTUSB0','masha','maria.bookvoed@gmail.com','','2019-03-05 04:28:01','',0,'masha');

/*!40000 ALTER TABLE `dl_users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
