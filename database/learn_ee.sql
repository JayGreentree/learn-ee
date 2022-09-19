-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 19, 2022 at 03:42 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eedev`
--

-- --------------------------------------------------------

--
-- Table structure for table `exp_actions`
--

CREATE TABLE `exp_actions` (
  `action_id` int(4) UNSIGNED NOT NULL,
  `class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `csrf_exempt` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_actions`
--

INSERT INTO `exp_actions` (`action_id`, `class`, `method`, `csrf_exempt`) VALUES
(1, 'Channel', 'submit_entry', 0),
(2, 'Channel', 'smiley_pop', 0),
(3, 'Channel', 'combo_loader', 0),
(4, 'Channel', 'live_preview', 1),
(5, 'Comment', 'insert_new_comment', 0),
(6, 'Comment_mcp', 'delete_comment_notification', 0),
(7, 'Comment', 'comment_subscribe', 0),
(8, 'Comment', 'edit_comment', 0),
(9, 'Consent', 'grantConsent', 0),
(10, 'Consent', 'submitConsent', 0),
(11, 'Consent', 'withdrawConsent', 0),
(12, 'Member', 'registration_form', 0),
(13, 'Member', 'register_member', 0),
(14, 'Member', 'activate_member', 0),
(15, 'Member', 'member_login', 0),
(16, 'Member', 'member_logout', 0),
(17, 'Member', 'send_reset_token', 0),
(18, 'Member', 'process_reset_password', 0),
(19, 'Member', 'send_member_email', 0),
(20, 'Member', 'update_un_pw', 0),
(21, 'Member', 'member_search', 0),
(22, 'Member', 'member_delete', 0),
(23, 'Member', 'send_username', 0),
(24, 'Member', 'update_profile', 0),
(25, 'Member', 'upload_avatar', 0),
(26, 'Rte', 'pages_autocomplete', 0),
(27, 'File', 'addonIcon', 1),
(28, 'Relationship', 'entryList', 0),
(29, 'Search', 'do_search', 1),
(31, 'Email', 'send_email', 0),
(32, 'Member', 'recaptcha_check', 1),
(33, 'Member', 'validate', 0),
(34, 'Pro', 'setCookie', 0),
(35, 'Pro', 'qrCode', 0),
(36, 'Pro', 'validateMfa', 0),
(37, 'Pro', 'invokeMfa', 0),
(38, 'Pro', 'enableMfa', 0),
(39, 'Pro', 'disableMfa', 0),
(40, 'Pro', 'resetMfa', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_captcha`
--

CREATE TABLE `exp_captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL,
  `date` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `word` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_categories`
--

CREATE TABLE `exp_categories` (
  `cat_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int(6) UNSIGNED NOT NULL,
  `parent_id` int(4) UNSIGNED NOT NULL,
  `cat_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_url_title` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_description` text COLLATE utf8mb4_unicode_ci,
  `cat_image` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_order` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_categories`
--

INSERT INTO `exp_categories` (`cat_id`, `site_id`, `group_id`, `parent_id`, `cat_name`, `cat_url_title`, `cat_description`, `cat_image`, `cat_order`) VALUES
(1, 1, 1, 0, 'Awesome', 'awesome', 'This content is awesome', '', 1),
(2, 1, 1, 0, 'Cats', 'cats', '', '', 2),
(3, 1, 1, 0, 'Under Construction', 'under-construction', '', '', 3),
(4, 1, 1, 0, 'Great Content', 'great-content', '', '', 4),
(5, 1, 1, 2, 'Gray Cats', 'gray-cats', '', NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_fields`
--

CREATE TABLE `exp_category_fields` (
  `field_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int(4) UNSIGNED NOT NULL,
  `field_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `field_label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `field_type` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `field_list_items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_maxl` smallint(3) NOT NULL DEFAULT '128',
  `field_ta_rows` tinyint(2) NOT NULL DEFAULT '8',
  `field_default_fmt` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `field_show_fmt` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `field_text_direction` char(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `field_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_order` int(3) UNSIGNED NOT NULL,
  `field_settings` text COLLATE utf8mb4_unicode_ci,
  `legacy_field_data` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_field_data`
--

CREATE TABLE `exp_category_field_data` (
  `cat_id` int(4) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_category_field_data`
--

INSERT INTO `exp_category_field_data` (`cat_id`, `site_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_groups`
--

CREATE TABLE `exp_category_groups` (
  `group_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'a',
  `exclude_group` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `field_html_formatting` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `can_edit_categories` text COLLATE utf8mb4_unicode_ci,
  `can_delete_categories` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_category_groups`
--

INSERT INTO `exp_category_groups` (`group_id`, `site_id`, `group_name`, `sort_order`, `exclude_group`, `field_html_formatting`, `can_edit_categories`, `can_delete_categories`) VALUES
(1, 1, 'Blog Group', 'a', 0, 'all', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_posts`
--

CREATE TABLE `exp_category_posts` (
  `entry_id` int(10) UNSIGNED NOT NULL,
  `cat_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_category_posts`
--

INSERT INTO `exp_category_posts` (`entry_id`, `cat_id`) VALUES
(3, 1),
(3, 4),
(4, 3),
(5, 1),
(5, 2),
(5, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channels`
--

CREATE TABLE `exp_channels` (
  `channel_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `channel_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_lang` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_records` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_comment_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cat_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deft_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `search_excerpt` int(4) UNSIGNED DEFAULT NULL,
  `deft_category` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deft_comments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `channel_require_membership` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `channel_max_chars` int(5) UNSIGNED DEFAULT NULL,
  `channel_html_formatting` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `channel_allow_img_urls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `channel_auto_link_urls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `channel_notify` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `channel_notify_emails` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sticky_enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_url` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_system_enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `comment_require_membership` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_moderate` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_max_chars` int(5) UNSIGNED DEFAULT '5000',
  `comment_timelock` int(5) UNSIGNED NOT NULL DEFAULT '0',
  `comment_require_email` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `comment_text_formatting` char(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'xhtml',
  `comment_html_formatting` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'safe',
  `comment_allow_img_urls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_auto_link_urls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `comment_notify` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_notify_authors` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_notify_emails` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_expiration` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `search_results_url` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rss_url` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_versioning` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `max_revisions` smallint(4) UNSIGNED NOT NULL DEFAULT '10',
  `default_entry_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_field_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Title',
  `url_title_prefix` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preview_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_entries` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `allow_preview` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `enable_entry_cloning` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `conditional_sync_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channels`
--

INSERT INTO `exp_channels` (`channel_id`, `site_id`, `channel_name`, `channel_title`, `channel_url`, `channel_description`, `channel_lang`, `total_entries`, `total_records`, `total_comments`, `last_entry_date`, `last_comment_date`, `cat_group`, `deft_status`, `search_excerpt`, `deft_category`, `deft_comments`, `channel_require_membership`, `channel_max_chars`, `channel_html_formatting`, `channel_allow_img_urls`, `channel_auto_link_urls`, `channel_notify`, `channel_notify_emails`, `sticky_enabled`, `comment_url`, `comment_system_enabled`, `comment_require_membership`, `comment_moderate`, `comment_max_chars`, `comment_timelock`, `comment_require_email`, `comment_text_formatting`, `comment_html_formatting`, `comment_allow_img_urls`, `comment_auto_link_urls`, `comment_notify`, `comment_notify_authors`, `comment_notify_emails`, `comment_expiration`, `search_results_url`, `rss_url`, `enable_versioning`, `max_revisions`, `default_entry_title`, `title_field_label`, `url_title_prefix`, `preview_url`, `max_entries`, `allow_preview`, `enable_entry_cloning`, `conditional_sync_required`) VALUES
(1, 1, 'page', 'Page', 'http://learn-ee.test/index.php', '', 'en', 2, 2, 0, 1604842080, 0, '', 'open', NULL, '', 'y', 'y', NULL, 'all', 'y', 'n', 'n', '', 'n', '', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '', '', 'n', 10, '', 'Title', '', '', 0, 'y', 'y', 'n'),
(2, 1, 'blog', 'Blog', 'https://learn-ee.test/index.php', '', 'en', 3, 3, 0, 1605724440, 0, '1', 'open', 3, '', 'y', 'y', NULL, 'all', 'y', 'n', 'n', '', 'n', '', 'y', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '', '', 'n', 10, '', 'Title', '', '', 0, 'y', 'y', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channels_channel_fields`
--

CREATE TABLE `exp_channels_channel_fields` (
  `channel_id` int(4) UNSIGNED NOT NULL,
  `field_id` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channels_channel_field_groups`
--

CREATE TABLE `exp_channels_channel_field_groups` (
  `channel_id` int(4) UNSIGNED NOT NULL,
  `group_id` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channels_channel_field_groups`
--

INSERT INTO `exp_channels_channel_field_groups` (`channel_id`, `group_id`) VALUES
(1, 1),
(2, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channels_statuses`
--

CREATE TABLE `exp_channels_statuses` (
  `channel_id` int(4) UNSIGNED NOT NULL,
  `status_id` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channels_statuses`
--

INSERT INTO `exp_channels_statuses` (`channel_id`, `status_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data`
--

CREATE TABLE `exp_channel_data` (
  `entry_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `channel_id` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_data`
--

INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 2),
(4, 1, 2),
(5, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data_field_1`
--

CREATE TABLE `exp_channel_data_field_1` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_1` text COLLATE utf8mb4_unicode_ci,
  `field_ft_1` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_data_field_1`
--

INSERT INTO `exp_channel_data_field_1` (`id`, `entry_id`, `field_id_1`, `field_ft_1`) VALUES
(1, 1, 'Welcome to our site!', 'none'),
(2, 2, 'Give Us a Ring!', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data_field_2`
--

CREATE TABLE `exp_channel_data_field_2` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_2` text COLLATE utf8mb4_unicode_ci,
  `field_ft_2` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_data_field_2`
--

INSERT INTO `exp_channel_data_field_2` (`id`, `entry_id`, `field_id_2`, `field_ft_2`) VALUES
(1, 1, '<p>This site is created with <a href=\"https://expressionengine.com/\" target=\"_blank\" rel=\"noopener noreferrer\"><strong>ExpressionEngine</strong></a>! It\'s <i>awesom</i>e!</p><p>This site is going to be amazing! You can\'t wait to read all of the things.</p>', 'none'),
(2, 2, '<p>We would love to hear from you!</p>', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data_field_3`
--

CREATE TABLE `exp_channel_data_field_3` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_3` text COLLATE utf8mb4_unicode_ci,
  `field_ft_3` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_data_field_3`
--

INSERT INTO `exp_channel_data_field_3` (`id`, `entry_id`, `field_id_3`, `field_ft_3`) VALUES
(1, 3, '<p style=\"text-align:justify;\">I don\'t want to talk to you no more, you empty-headed animal food trough wiper! I fart in your general direction! Your mother was a hamster and your father smelt of elderberries!</p><p style=\"text-align:justify;\">Listen, strange women lyin\' in ponds distributin\' swords is no basis for a system of government. Supreme executive power derives from a mandate from the masses, not from some farcical aquatic ceremony. You don\'t frighten us, English pig dogs. Go and boil your bottoms, you sons of a silly person. I blow my nose at you, so-called \"Arthur King,\" you and all your silly English K-nig-hts.</p>', 'none'),
(2, 4, '<p><span style=\"color:rgb(0,0,0);\">Come and see the violence inherent in the system. Help! Help! I\'m being repressed! Are you suggesting coconuts migrate? Oh, oh, I see! Running away, eh? You yellow bastards! Come back here and take what\'s coming to you! I\'ll bite your legs off! You don\'t frighten us, English pig dogs. Go and boil your bottoms, you sons of a silly person. I blow my nose at you, so-called \"Arthur King,\" you and all your silly English K-nig-hts. What is the capital of Assyria?</span></p>', 'none'),
(3, 5, '<p><span style=\"color:rgb(0,0,0);\">Are you suggesting coconuts migrate? I\'m Brian, and so\'s my wife! Listen, strange women lyin\' in ponds distributin\' swords is no basis for a system of government. Supreme executive power derives from a mandate from the masses, not from some farcical aquatic ceremony. Oh, oh, I see! Running away, eh? You yellow bastards! Come back here and take what\'s coming to you! I\'ll bite your legs off! What is the capital of Assyria?</span></p>', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data_field_4`
--

CREATE TABLE `exp_channel_data_field_4` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_4` text COLLATE utf8mb4_unicode_ci,
  `field_ft_4` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_data_field_4`
--

INSERT INTO `exp_channel_data_field_4` (`id`, `entry_id`, `field_id_4`, `field_ft_4`) VALUES
(1, 3, '{filedir_5}pexels-mike-3820181.jpg', 'none'),
(2, 4, '{filedir_5}pexels-katarzyna-modrzejewska-1314550.jpg', 'none'),
(3, 5, '{filedir_5}pexels-marko-blazevic-774731.jpg', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data_field_5`
--

CREATE TABLE `exp_channel_data_field_5` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_5` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_ft_5` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_data_field_5`
--

INSERT INTO `exp_channel_data_field_5` (`id`, `entry_id`, `field_id_5`, `field_ft_5`) VALUES
(1, 5, NULL, 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data_field_6`
--

CREATE TABLE `exp_channel_data_field_6` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_6` text COLLATE utf8mb4_unicode_ci,
  `field_ft_6` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_data_field_6`
--

INSERT INTO `exp_channel_data_field_6` (`id`, `entry_id`, `field_id_6`, `field_ft_6`) VALUES
(1, 5, 'WELL HAVE YOU SEEN THIS CAT?!?!?!?', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data_field_7`
--

CREATE TABLE `exp_channel_data_field_7` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_7` text COLLATE utf8mb4_unicode_ci,
  `field_ft_7` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_data_field_7`
--

INSERT INTO `exp_channel_data_field_7` (`id`, `entry_id`, `field_id_7`, `field_ft_7`) VALUES
(1, 5, 'This cat is AMAZING!!', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data_field_8`
--

CREATE TABLE `exp_channel_data_field_8` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_8` tinyint(4) NOT NULL DEFAULT '0',
  `field_ft_8` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_data_field_8`
--

INSERT INTO `exp_channel_data_field_8` (`id`, `entry_id`, `field_id_8`, `field_ft_8`) VALUES
(1, 5, 0, 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_entries_autosave`
--

CREATE TABLE `exp_channel_entries_autosave` (
  `entry_id` int(10) UNSIGNED NOT NULL,
  `original_entry_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `channel_id` int(4) UNSIGNED NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `versioning_enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `view_count_one` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `view_count_two` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `view_count_three` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `view_count_four` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `sticky` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `entry_data` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_entry_hidden_fields`
--

CREATE TABLE `exp_channel_entry_hidden_fields` (
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_fields`
--

CREATE TABLE `exp_channel_fields` (
  `field_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED DEFAULT '1',
  `field_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_instructions` text COLLATE utf8mb4_unicode_ci,
  `field_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `field_list_items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_pre_populate` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_pre_channel_id` int(6) UNSIGNED DEFAULT NULL,
  `field_pre_field_id` int(6) UNSIGNED DEFAULT NULL,
  `field_ta_rows` tinyint(2) DEFAULT '8',
  `field_maxl` smallint(3) DEFAULT NULL,
  `field_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_text_direction` char(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `field_search` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_is_hidden` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_fmt` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'xhtml',
  `field_show_fmt` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `field_order` int(3) UNSIGNED NOT NULL,
  `field_content_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'any',
  `field_settings` text COLLATE utf8mb4_unicode_ci,
  `legacy_field_data` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `enable_frontedit` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `field_is_conditional` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_fields`
--

INSERT INTO `exp_channel_fields` (`field_id`, `site_id`, `field_name`, `field_label`, `field_instructions`, `field_type`, `field_list_items`, `field_pre_populate`, `field_pre_channel_id`, `field_pre_field_id`, `field_ta_rows`, `field_maxl`, `field_required`, `field_text_direction`, `field_search`, `field_is_hidden`, `field_fmt`, `field_show_fmt`, `field_order`, `field_content_type`, `field_settings`, `legacy_field_data`, `enable_frontedit`, `field_is_conditional`) VALUES
(1, 0, 'subtitle', 'Subtitle', '', 'text', '', 'n', NULL, NULL, 8, 256, 'n', 'ltr', 'y', 'n', 'none', 'n', 1, 'all', 'YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtzOjM6IjI1NiI7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czowOiIiO30=', 'n', 'y', 'n'),
(2, 0, 'page_content', 'Page Content', '', 'rte', '', 'n', NULL, NULL, 8, NULL, 'y', 'ltr', 'n', 'n', 'none', 'n', 2, 'any', 'YTo2OntzOjEwOiJ0b29sc2V0X2lkIjtzOjE6IjEiO3M6NToiZGVmZXIiO3M6MToibiI7czoxNDoiZGJfY29sdW1uX3R5cGUiO3M6NDoidGV4dCI7czoxMDoiZmllbGRfd2lkZSI7YjoxO3M6OToiZmllbGRfZm10IjtzOjQ6Im5vbmUiO3M6MTQ6ImZpZWxkX3Nob3dfZm10IjtzOjE6Im4iO30=', 'n', 'y', 'n'),
(3, 0, 'blog_content', 'Blog Content', '', 'rte', '', 'n', NULL, NULL, 8, NULL, 'n', 'ltr', 'n', 'n', 'none', 'n', 3, 'any', 'YTo2OntzOjEwOiJ0b29sc2V0X2lkIjtzOjE6IjEiO3M6NToiZGVmZXIiO3M6MToibiI7czoxNDoiZGJfY29sdW1uX3R5cGUiO3M6NDoidGV4dCI7czoxMDoiZmllbGRfd2lkZSI7YjoxO3M6OToiZmllbGRfZm10IjtzOjQ6Im5vbmUiO3M6MTQ6ImZpZWxkX3Nob3dfZm10IjtzOjE6Im4iO30=', 'n', 'y', 'n'),
(4, 0, 'featured_image', 'Featured Image', '', 'file', '', 'n', NULL, NULL, 8, NULL, 'y', 'ltr', 'n', 'n', 'none', 'y', 4, 'image', 'YTo1OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MToiNSI7czoxMzoic2hvd19leGlzdGluZyI7czoxOiJ5IjtzOjEyOiJudW1fZXhpc3RpbmciO3M6MjoiNTAiO3M6OToiZmllbGRfZm10IjtzOjQ6Im5vbmUiO30=', 'n', 'y', 'n'),
(5, 0, 'related_blogs', 'Related Blogs', '', 'relationship', '', 'n', NULL, NULL, 8, NULL, 'n', 'ltr', 'n', 'n', 'xhtml', 'y', 5, 'any', 'YToxMDp7czo4OiJjaGFubmVscyI7YToxOntpOjA7czoxOiIyIjt9czo3OiJleHBpcmVkIjtzOjA6IiI7czo2OiJmdXR1cmUiO3M6MDoiIjtzOjEwOiJjYXRlZ29yaWVzIjthOjA6e31zOjc6ImF1dGhvcnMiO2E6MDp7fXM6ODoic3RhdHVzZXMiO2E6MDp7fXM6NToibGltaXQiO3M6MzoiMTAwIjtzOjExOiJvcmRlcl9maWVsZCI7czo1OiJ0aXRsZSI7czo5OiJvcmRlcl9kaXIiO3M6MzoiYXNjIjtzOjE0OiJhbGxvd19tdWx0aXBsZSI7YjoxO30=', 'n', 'y', 'n'),
(6, 0, 'seo_title', 'SEO Title', '', 'text', '', 'n', NULL, NULL, 8, 256, 'n', 'ltr', 'n', 'n', 'none', 'n', 6, 'all', 'YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtzOjM6IjI1NiI7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czowOiIiO30=', 'n', 'y', 'n'),
(7, 0, 'seo_description', 'SEO Description', '', 'text', '', 'n', NULL, NULL, 8, 256, 'n', 'ltr', 'n', 'n', 'none', 'n', 7, 'all', 'YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtzOjM6IjI1NiI7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czowOiIiO30=', 'n', 'y', 'n'),
(8, 0, 'no_robots', 'No Robots', '', 'toggle', '', 'n', NULL, NULL, 8, NULL, 'n', 'ltr', 'n', 'n', 'xhtml', 'y', 8, 'any', 'YToxOntzOjE5OiJmaWVsZF9kZWZhdWx0X3ZhbHVlIjtzOjE6IjAiO30=', 'n', 'y', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_field_groups_fields`
--

CREATE TABLE `exp_channel_field_groups_fields` (
  `field_id` int(6) UNSIGNED NOT NULL,
  `group_id` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_field_groups_fields`
--

INSERT INTO `exp_channel_field_groups_fields` (`field_id`, `group_id`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 2),
(6, 3),
(7, 3),
(8, 3);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_form_settings`
--

CREATE TABLE `exp_channel_form_settings` (
  `channel_form_settings_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `channel_id` int(6) UNSIGNED NOT NULL DEFAULT '0',
  `default_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `allow_guest_posts` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `default_author` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_form_settings`
--

INSERT INTO `exp_channel_form_settings` (`channel_form_settings_id`, `site_id`, `channel_id`, `default_status`, `allow_guest_posts`, `default_author`) VALUES
(1, 1, 1, '', 'n', 1),
(2, 1, 2, '', 'n', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_member_roles`
--

CREATE TABLE `exp_channel_member_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_titles`
--

CREATE TABLE `exp_channel_titles` (
  `entry_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `channel_id` int(4) UNSIGNED NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(4) UNSIGNED NOT NULL,
  `versioning_enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `view_count_one` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `view_count_two` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `view_count_three` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `view_count_four` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `sticky` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_titles`
--

INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `status_id`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`) VALUES
(1, 1, 1, 1, NULL, '127.0.0.1', 'Homepage', 'homepage', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1604840820, '2020', '11', '08', 0, 0, 1604842666, NULL, 0),
(2, 1, 1, 1, NULL, '127.0.0.1', 'Contact', 'contact', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1604842080, '2020', '11', '08', 0, 0, 1604842150, NULL, 0),
(3, 1, 2, 1, NULL, '127.0.0.1', 'Our Very First Blog', 'our-very-first-blog', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1605722220, '2020', '11', '18', 0, 0, 1606064484, NULL, 0),
(4, 1, 2, 1, NULL, '127.0.0.1', 'Blog #2', 'blog-2', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1605724380, '2020', '11', '18', 0, 0, 1606064479, NULL, 0),
(5, 1, 2, 1, NULL, '127.0.0.1', 'Have You Seen This Cat?', 'have-you-seen-this-cat', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1605724440, '2020', '11', '18', 0, 0, 1606069799, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_comments`
--

CREATE TABLE `exp_comments` (
  `comment_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) DEFAULT '1',
  `entry_id` int(10) UNSIGNED DEFAULT '0',
  `channel_id` int(4) UNSIGNED DEFAULT '1',
  `author_id` int(10) UNSIGNED DEFAULT '0',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_date` int(10) DEFAULT NULL,
  `edit_date` int(10) DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_comment_subscriptions`
--

CREATE TABLE `exp_comment_subscriptions` (
  `subscription_id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED DEFAULT NULL,
  `member_id` int(10) DEFAULT '0',
  `email` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_date` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_sent` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'n',
  `hash` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_config`
--

CREATE TABLE `exp_config` (
  `config_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(5) UNSIGNED NOT NULL DEFAULT '0',
  `key` varchar(64) NOT NULL DEFAULT '',
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exp_config`
--

INSERT INTO `exp_config` (`config_id`, `site_id`, `key`, `value`) VALUES
(1, 1, 'is_site_on', 'y'),
(2, 1, 'base_url', 'http://lab.jaygreentree.xyz/'),
(3, 1, 'base_path', 'E:/MAMP/htdocs'),
(4, 1, 'site_index', 'index.php'),
(5, 1, 'site_url', '{base_url}'),
(6, 1, 'cp_url', '{base_url}admin.php'),
(7, 1, 'theme_folder_url', '{base_url}themes/'),
(8, 1, 'theme_folder_path', 'E:/MAMP/htdocs/public/themes'),
(9, 1, 'webmaster_email', 'doug@triplenerdscore.net'),
(10, 1, 'webmaster_name', 'Doug Black'),
(11, 1, 'channel_nomenclature', 'channel'),
(12, 1, 'max_caches', '150'),
(13, 1, 'captcha_url', '{base_url}images/captchas/'),
(14, 1, 'captcha_path', '{base_path}images/captchas/'),
(15, 1, 'captcha_font', 'y'),
(16, 1, 'captcha_rand', 'y'),
(17, 1, 'captcha_require_members', 'n'),
(18, 1, 'require_captcha', 'n'),
(19, 1, 'enable_sql_caching', 'n'),
(20, 1, 'force_query_string', 'n'),
(21, 1, 'show_profiler', 'n'),
(22, 1, 'include_seconds', 'n'),
(23, 1, 'cookie_domain', ''),
(24, 1, 'cookie_path', '/'),
(25, 1, 'cookie_httponly', 'y'),
(26, 1, 'website_session_type', 'c'),
(27, 1, 'cp_session_type', 'c'),
(28, 1, 'allow_username_change', 'y'),
(29, 1, 'allow_multi_logins', 'y'),
(30, 1, 'password_lockout', 'y'),
(31, 1, 'password_lockout_interval', '1'),
(32, 1, 'require_ip_for_login', 'y'),
(33, 1, 'require_ip_for_posting', 'y'),
(34, 1, 'require_secure_passwords', 'n'),
(35, 1, 'allow_dictionary_pw', 'y'),
(36, 1, 'name_of_dictionary_file', ''),
(37, 1, 'xss_clean_uploads', 'y'),
(38, 1, 'redirect_method', 'redirect'),
(39, 1, 'deft_lang', 'english'),
(40, 1, 'xml_lang', 'en'),
(41, 1, 'send_headers', 'y'),
(42, 1, 'gzip_output', 'n'),
(43, 1, 'default_site_timezone', 'America/New_York'),
(44, 1, 'date_format', '%n/%j/%Y'),
(45, 1, 'time_format', '12'),
(46, 1, 'mail_protocol', 'smtp'),
(47, 1, 'email_newline', '\\r\\n'),
(48, 1, 'smtp_server', 'smtp.mailtrap.io'),
(49, 1, 'smtp_username', '3501866fbe0377'),
(50, 1, 'smtp_password', '4179a65c205ba0'),
(51, 1, 'email_smtp_crypto', 'tls'),
(52, 1, 'email_debug', 'n'),
(53, 1, 'email_charset', 'utf-8'),
(54, 1, 'email_batchmode', 'n'),
(55, 1, 'email_batch_size', ''),
(56, 1, 'mail_format', 'plain'),
(57, 1, 'word_wrap', 'y'),
(58, 1, 'email_console_timelock', '5'),
(59, 1, 'log_email_console_msgs', 'y'),
(60, 1, 'log_search_terms', 'y'),
(61, 1, 'deny_duplicate_data', 'y'),
(62, 1, 'redirect_submitted_links', 'n'),
(63, 1, 'enable_censoring', 'n'),
(64, 1, 'censored_words', ''),
(65, 1, 'censor_replacement', ''),
(66, 1, 'banned_ips', ''),
(67, 1, 'banned_emails', ''),
(68, 1, 'banned_usernames', ''),
(69, 1, 'banned_screen_names', ''),
(70, 1, 'ban_action', 'restrict'),
(71, 1, 'ban_message', 'This site is currently unavailable'),
(72, 1, 'ban_destination', 'http://www.yahoo.com/'),
(73, 1, 'enable_emoticons', 'y'),
(74, 1, 'emoticon_url', '{base_url}images/smileys/'),
(75, 1, 'recount_batch_total', '1000'),
(76, 1, 'new_version_check', 'y'),
(77, 1, 'enable_throttling', 'n'),
(78, 1, 'banish_masked_ips', 'y'),
(79, 1, 'max_page_loads', '10'),
(80, 1, 'time_interval', '8'),
(81, 1, 'lockout_time', '30'),
(82, 1, 'banishment_type', 'message'),
(83, 1, 'banishment_url', ''),
(84, 1, 'banishment_message', 'You have exceeded the allowed page load frequency.'),
(85, 1, 'enable_search_log', 'y'),
(86, 1, 'max_logged_searches', '500'),
(87, 1, 'un_min_len', '4'),
(88, 1, 'pw_min_len', '5'),
(89, 1, 'allow_member_registration', 'n'),
(90, 1, 'allow_member_localization', 'y'),
(91, 1, 'req_mbr_activation', 'email'),
(92, 1, 'new_member_notification', 'n'),
(93, 1, 'mbr_notification_emails', ''),
(94, 1, 'require_terms_of_service', 'y'),
(95, 1, 'default_primary_role', '5'),
(96, 1, 'profile_trigger', 'member'),
(97, 1, 'member_theme', 'default'),
(98, 1, 'avatar_url', '{base_url}images/avatars/'),
(99, 1, 'avatar_path', '{base_path}images/avatars/'),
(100, 1, 'avatar_max_width', '100'),
(101, 1, 'avatar_max_height', '100'),
(102, 1, 'avatar_max_kb', '50'),
(103, 1, 'enable_photos', 'n'),
(104, 1, 'photo_url', '{base_url}images/member_photos/'),
(105, 1, 'photo_path', '/'),
(106, 1, 'photo_max_width', '100'),
(107, 1, 'photo_max_height', '100'),
(108, 1, 'photo_max_kb', '50'),
(109, 1, 'allow_signatures', 'y'),
(110, 1, 'sig_maxlength', '500'),
(111, 1, 'sig_allow_img_hotlink', 'n'),
(112, 1, 'sig_allow_img_upload', 'n'),
(113, 1, 'sig_img_url', '{base_url}images/signature_attachments/'),
(114, 1, 'sig_img_path', '{base_path}images/signature_attachments/'),
(115, 1, 'sig_img_max_width', '480'),
(116, 1, 'sig_img_max_height', '80'),
(117, 1, 'sig_img_max_kb', '30'),
(118, 1, 'prv_msg_enabled', 'y'),
(119, 1, 'prv_msg_allow_attachments', 'y'),
(120, 1, 'prv_msg_upload_path', '{base_path}images/pm_attachments/'),
(121, 1, 'prv_msg_max_attachments', '3'),
(122, 1, 'prv_msg_attach_maxsize', '250'),
(123, 1, 'prv_msg_attach_total', '100'),
(124, 1, 'prv_msg_html_format', 'safe'),
(125, 1, 'prv_msg_auto_links', 'y'),
(126, 1, 'prv_msg_max_chars', '6000'),
(127, 1, 'memberlist_order_by', 'member_id'),
(128, 1, 'memberlist_sort_order', 'desc'),
(129, 1, 'memberlist_row_limit', '20'),
(130, 1, 'site_404', 'default/404'),
(131, 1, 'save_tmpl_revisions', 'n'),
(132, 1, 'max_tmpl_revisions', '5'),
(133, 1, 'strict_urls', 'y'),
(134, 1, 'enable_template_routes', 'y'),
(135, 1, 'image_resize_protocol', 'gd2'),
(136, 1, 'image_library_path', ''),
(137, 1, 'thumbnail_prefix', 'thumb'),
(138, 1, 'word_separator', 'underscore'),
(139, 1, 'use_category_name', 'n'),
(140, 1, 'reserved_category_word', 'category'),
(141, 1, 'auto_convert_high_ascii', 'n'),
(142, 1, 'new_posts_clear_caches', 'y'),
(143, 1, 'auto_assign_cat_parents', 'y'),
(144, 0, 'cache_driver', 'file'),
(145, 0, 'cookie_prefix', ''),
(146, 0, 'debug', '1'),
(147, 0, 'is_system_on', 'y'),
(148, 0, 'multiple_sites_enabled', 'n'),
(149, 1, 'smtp_port', '2525'),
(150, 0, 'cli_enabled', 'y'),
(151, 1, 'password_security_policy', 'none'),
(152, 0, 'legacy_member_data', 'n'),
(153, 0, 'legacy_channel_data', 'n'),
(154, 0, 'legacy_category_field_data', 'n'),
(155, 0, 'file_manager_compatibility_mode', 'y'),
(157, 0, 'enable_dock', 'n'),
(158, 0, 'enable_frontedit', 'y'),
(159, 0, 'automatic_frontedit_links', 'y'),
(160, 0, 'enable_mfa', 'y'),
(161, 0, 'autosave_interval_seconds', '10');

-- --------------------------------------------------------

--
-- Table structure for table `exp_consents`
--

CREATE TABLE `exp_consents` (
  `consent_id` int(10) UNSIGNED NOT NULL,
  `consent_request_id` int(10) UNSIGNED NOT NULL,
  `consent_request_version_id` int(10) UNSIGNED NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `request_copy` mediumtext COLLATE utf8mb4_unicode_ci,
  `request_format` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `consent_given` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `consent_given_via` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiration_date` int(10) DEFAULT NULL,
  `response_date` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_consent_audit_log`
--

CREATE TABLE `exp_consent_audit_log` (
  `consent_audit_id` int(10) UNSIGNED NOT NULL,
  `consent_request_id` int(10) UNSIGNED NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `action` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_date` int(10) NOT NULL DEFAULT '0',
  `consent_request_version_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_consent_requests`
--

CREATE TABLE `exp_consent_requests` (
  `consent_request_id` int(10) UNSIGNED NOT NULL,
  `consent_request_version_id` int(10) UNSIGNED DEFAULT NULL,
  `user_created` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consent_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `double_opt_in` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `retention_period` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_consent_requests`
--

INSERT INTO `exp_consent_requests` (`consent_request_id`, `consent_request_version_id`, `user_created`, `title`, `consent_name`, `double_opt_in`, `retention_period`) VALUES
(1, 1, 'n', 'Functionality Cookies', 'ee:cookies_functionality', 'n', NULL),
(2, 2, 'n', 'Performance Cookies', 'ee:cookies_performance', 'n', NULL),
(3, 3, 'n', 'Targeting Cookies', 'ee:cookies_targeting', 'n', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exp_consent_request_versions`
--

CREATE TABLE `exp_consent_request_versions` (
  `consent_request_version_id` int(10) UNSIGNED NOT NULL,
  `consent_request_id` int(10) UNSIGNED NOT NULL,
  `request` mediumtext COLLATE utf8mb4_unicode_ci,
  `request_format` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `create_date` int(10) NOT NULL DEFAULT '0',
  `author_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_consent_request_versions`
--

INSERT INTO `exp_consent_request_versions` (`consent_request_version_id`, `consent_request_id`, `request`, `request_format`, `create_date`, `author_id`) VALUES
(1, 1, 'These cookies help us personalize content and functionality for you, including remembering changes you have made to parts of the website that you can customize, or selections for services made on previous visits. If you do not allow these cookies, some portions of our website may be less friendly and easy to use, forcing you to enter content or set your preferences on each visit.', 'none', 1604839755, 0),
(2, 2, 'These cookies allow us measure how visitors use our website, which pages are popular, and what our traffic sources are. This helps us improve how our website works and make it easier for all visitors to find what they are looking for. The information is aggregated and anonymous, and cannot be used to identify you. If you do not allow these cookies, we will be unable to use your visits to our website to help make improvements.', 'none', 1604839755, 0),
(3, 3, 'These cookies are usually placed by third-party advertising networks, which may use information about your website visits to develop a profile of your interests. This information may be shared with other advertisers and/or websites to deliver more relevant advertising to you across multiple websites. If you do not allow these cookies, visits to this website will not be shared with advertising partners and will not contribute to targeted advertising on other websites.', 'none', 1604839755, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_consent_request_version_cookies`
--

CREATE TABLE `exp_consent_request_version_cookies` (
  `consent_request_version_id` int(10) UNSIGNED NOT NULL,
  `cookie_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_content_types`
--

CREATE TABLE `exp_content_types` (
  `content_type_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_content_types`
--

INSERT INTO `exp_content_types` (`content_type_id`, `name`) VALUES
(2, 'channel'),
(1, 'grid');

-- --------------------------------------------------------

--
-- Table structure for table `exp_cookie_settings`
--

CREATE TABLE `exp_cookie_settings` (
  `cookie_id` int(10) UNSIGNED NOT NULL,
  `cookie_provider` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie_lifetime` int(10) UNSIGNED DEFAULT NULL,
  `cookie_enforced_lifetime` int(10) UNSIGNED DEFAULT NULL,
  `cookie_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie_description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_cookie_settings`
--

INSERT INTO `exp_cookie_settings` (`cookie_id`, `cookie_provider`, `cookie_name`, `cookie_lifetime`, `cookie_enforced_lifetime`, `cookie_title`, `cookie_description`) VALUES
(1, 'ee', 'csrf_token', 7200, NULL, 'CSRF Token', 'A security cookie used to identify the user and prevent Cross Site Request Forgery attacks.'),
(2, 'ee', 'flash', 0, NULL, 'Flash data', 'User feedback messages, encrypted for security.'),
(3, 'ee', 'remember', NULL, NULL, 'Remember Me', 'Determines whether a user is automatically logged in upon visiting the site.'),
(4, 'ee', 'sessionid', 3600, NULL, 'Session ID', 'Session id, used to associate a logged in user with their data.'),
(5, 'ee', 'visitor_consents', NULL, NULL, 'Visitor Consents', 'Saves responses to Consent requests for non-logged in visitors'),
(6, 'ee', 'last_activity', NULL, NULL, 'Last Activity', 'Records the time of the last page load. Used in in calculating active sessions.'),
(7, 'ee', 'last_visit', NULL, NULL, 'Last Visit', 'Date of the user’s last visit, based on the last_activity cookie. Can be shown as a statistic for members and used by forum and comments to show unread topics for both members and guests.'),
(8, 'ee', 'anon', NULL, NULL, 'Anonymize', 'Determines whether the user’s username is displayed in the list of currently logged in members.'),
(9, 'ee', 'tracker', 0, NULL, 'Tracker', 'Contains the last 5 pages viewed, encrypted for security. Typically used for form or error message returns.'),
(10, 'cp', 'viewtype', NULL, NULL, 'Filemanager View Type', 'Determines View Type to be used in Filemanager (table or thumbs view)'),
(11, 'cp', 'cp_last_site_id', NULL, NULL, 'CP Last Site ID', 'MSM cookie indicating the last site accessed in the control panel.'),
(12, 'cp', 'ee_cp_viewmode', NULL, NULL, 'CP View Mode', 'Determines view mode for control panel.'),
(13, 'cp', 'collapsed_nav', NULL, NULL, 'Collapsed Navigation', 'Determines whether navigation sidebar is control panel should be collapsed.'),
(14, 'comment', 'my_email', NULL, NULL, 'My email', 'Email address specified when posting a comment.'),
(15, 'comment', 'my_location', NULL, NULL, 'My location', 'Location specified when posting a comment.'),
(16, 'comment', 'my_name', NULL, NULL, 'My name', 'Name specified when posting a comment.'),
(17, 'comment', 'my_url', NULL, NULL, 'My URL', 'URL specified when posting a comment.'),
(18, 'comment', 'notify_me', NULL, NULL, 'Notify me', 'If set to ‘yes’, notifications will be sent to the saved email address when new comments are made.'),
(19, 'comment', 'save_info', NULL, NULL, 'Save info', 'If set to ‘yes’, allows additional cookies (my_email, my_location, my_name, my_url) to store guest user information for use when filling out comment forms. This cookie is only set if you submit a comment.'),
(20, 'cp', 'secondary_sidebar', NULL, NULL, 'Secondary Sidebar State', 'Determines whether secondary navigation sidebar in the Control Panel should be collapsed for each corresponding section.'),
(21, 'pro', 'frontedit', NULL, NULL, 'Front-end editing', 'Determines whether ExpressioEngine front-end editing features should be enabled.');

-- --------------------------------------------------------

--
-- Table structure for table `exp_cp_log`
--

CREATE TABLE `exp_cp_log` (
  `id` int(10) NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `member_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `act_date` int(10) NOT NULL,
  `action` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_cp_log`
--

INSERT INTO `exp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`) VALUES
(1, 1, 1, 'doug', '127.0.0.1', 1604839791, 'Logged in'),
(2, 1, 1, 'doug', '127.0.0.1', 1604840801, 'Channel Created&nbsp;&nbsp;Page'),
(3, 1, 1, 'doug', '127.0.0.1', 1604916954, 'Logged in'),
(4, 1, 1, 'doug', '127.0.0.1', 1604920529, 'Logged in'),
(5, 1, 1, 'doug', '127.0.0.1', 1604925171, 'Logged in'),
(6, 1, 1, 'doug', '127.0.0.1', 1605721150, 'Logged in'),
(7, 1, 1, 'doug', '127.0.0.1', 1605722249, 'Channel Created&nbsp;&nbsp;Blog'),
(8, 1, 1, 'doug', '127.0.0.1', 1605747172, 'Logged in'),
(9, 1, 1, 'doug', '127.0.0.1', 1605804020, 'Logged in'),
(10, 1, 1, 'doug', '127.0.0.1', 1606063735, 'Logged in'),
(11, 1, 1, 'doug', '127.0.0.1', 1606078455, 'Logged in'),
(12, 1, 1, 'doug', '127.0.0.1', 1606158165, 'Logged in'),
(13, 1, 1, 'doug', '::1', 1663575742, 'Logged in');

-- --------------------------------------------------------

--
-- Table structure for table `exp_dashboard_layouts`
--

CREATE TABLE `exp_dashboard_layouts` (
  `layout_id` int(10) UNSIGNED NOT NULL,
  `member_id` int(10) UNSIGNED DEFAULT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `order` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_dashboard_layout_widgets`
--

CREATE TABLE `exp_dashboard_layout_widgets` (
  `layout_id` int(10) UNSIGNED NOT NULL,
  `widget_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_dashboard_widgets`
--

CREATE TABLE `exp_dashboard_widgets` (
  `widget_id` int(10) UNSIGNED NOT NULL,
  `widget_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `widget_data` mediumtext COLLATE utf8mb4_unicode_ci,
  `widget_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `widget_source` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `widget_file` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_dashboard_widgets`
--

INSERT INTO `exp_dashboard_widgets` (`widget_id`, `widget_name`, `widget_data`, `widget_type`, `widget_source`, `widget_file`) VALUES
(1, NULL, NULL, 'php', 'pro', 'comments'),
(2, NULL, NULL, 'php', 'pro', 'eecms_news'),
(3, NULL, NULL, 'php', 'pro', 'members'),
(4, NULL, NULL, 'php', 'pro', 'recent_entries'),
(5, NULL, NULL, 'php', 'pro', 'recent_templates'),
(6, NULL, NULL, 'html', 'pro', 'support');

-- --------------------------------------------------------

--
-- Table structure for table `exp_developer_log`
--

CREATE TABLE `exp_developer_log` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL,
  `viewed` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `description` text COLLATE utf8mb4_unicode_ci,
  `function` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line` int(10) UNSIGNED DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deprecated_since` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `use_instead` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `template_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_group` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addon_module` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addon_method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snippets` text COLLATE utf8mb4_unicode_ci,
  `hash` char(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_docks`
--

CREATE TABLE `exp_docks` (
  `dock_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_docks`
--

INSERT INTO `exp_docks` (`dock_id`, `site_id`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_dock_prolets`
--

CREATE TABLE `exp_dock_prolets` (
  `dock_id` int(10) UNSIGNED NOT NULL,
  `prolet_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_dock_prolets`
--

INSERT INTO `exp_dock_prolets` (`dock_id`, `prolet_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache`
--

CREATE TABLE `exp_email_cache` (
  `cache_id` int(6) UNSIGNED NOT NULL,
  `cache_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_sent` int(6) UNSIGNED NOT NULL,
  `from_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_email` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bcc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient_array` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `plaintext_alt` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `mailtype` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_fmt` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wordwrap` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `attachments` mediumtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_email_cache`
--

INSERT INTO `exp_email_cache` (`cache_id`, `cache_date`, `total_sent`, `from_name`, `from_email`, `recipient`, `cc`, `bcc`, `recipient_array`, `subject`, `message`, `plaintext_alt`, `mailtype`, `text_fmt`, `wordwrap`, `attachments`) VALUES
(2, 1606160487, 1, 'doug', 'doug@triplenerdscore.net', 'doug@triplenerdscore.net', '', '', 'a:0:{}', 'Testing from Learn EE', 'Testing from Learn EE', '', 'text', 'none', 'n', 'a:0:{}'),
(3, 1606160688, 1, 'doug', 'doug@triplenerdscore.net', 'doug@triplenerdscore.net', '', '', 'a:0:{}', 'WE\'re Sending a Test Email', 'With a test body!', '', 'text', 'none', 'y', 'a:0:{}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache_mg`
--

CREATE TABLE `exp_email_cache_mg` (
  `cache_id` int(6) UNSIGNED NOT NULL,
  `role_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache_ml`
--

CREATE TABLE `exp_email_cache_ml` (
  `cache_id` int(6) UNSIGNED NOT NULL,
  `list_id` smallint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_console_cache`
--

CREATE TABLE `exp_email_console_cache` (
  `cache_id` int(6) UNSIGNED NOT NULL,
  `cache_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `member_id` int(10) UNSIGNED NOT NULL,
  `member_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `recipient` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_tracker`
--

CREATE TABLE `exp_email_tracker` (
  `email_id` int(10) UNSIGNED NOT NULL,
  `email_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sender_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_email` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_recipients` int(4) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_email_tracker`
--

INSERT INTO `exp_email_tracker` (`email_id`, `email_date`, `sender_ip`, `sender_email`, `sender_username`, `number_recipients`) VALUES
(1, 1606162098, '127.0.0.1', 'dougblackjr@gmail.com', 'doug', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exp_entry_manager_views`
--

CREATE TABLE `exp_entry_manager_views` (
  `view_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(6) UNSIGNED NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `columns` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exp_entry_manager_views`
--

INSERT INTO `exp_entry_manager_views` (`view_id`, `channel_id`, `member_id`, `name`, `columns`) VALUES
(1, 0, 1, '', '[\"entry_id\",\"title\",\"entry_date\",\"author\",\"status\",\"comments\"]');

-- --------------------------------------------------------

--
-- Table structure for table `exp_entry_versioning`
--

CREATE TABLE `exp_entry_versioning` (
  `version_id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(4) UNSIGNED NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL,
  `version_date` int(10) NOT NULL,
  `version_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_extensions`
--

CREATE TABLE `exp_extensions` (
  `extension_id` int(10) UNSIGNED NOT NULL,
  `class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `method` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hook` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `settings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '10',
  `version` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_extensions`
--

INSERT INTO `exp_extensions` (`extension_id`, `class`, `method`, `hook`, `settings`, `priority`, `version`, `enabled`) VALUES
(1, 'Comment_ext', 'addCommentMenu', 'cp_custom_menu', 'a:0:{}', 10, '2.3.3', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_fieldtypes`
--

CREATE TABLE `exp_fieldtypes` (
  `fieldtype_id` int(4) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `has_global_settings` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_fieldtypes`
--

INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`) VALUES
(1, 'select', '1.0.0', 'YTowOnt9', 'n'),
(2, 'text', '1.0.0', 'YTowOnt9', 'n'),
(3, 'textarea', '1.0.0', 'YTowOnt9', 'n'),
(4, 'date', '1.0.0', 'YTowOnt9', 'n'),
(5, 'duration', '1.0.0', 'YTowOnt9', 'n'),
(6, 'email_address', '1.0.0', 'YTowOnt9', 'n'),
(7, 'file', '1.1.0', 'YTowOnt9', 'n'),
(8, 'fluid_field', '1.0.0', 'YTowOnt9', 'n'),
(9, 'grid', '1.0.0', 'YTowOnt9', 'n'),
(10, 'file_grid', '1.0.0', 'YTowOnt9', 'n'),
(11, 'multi_select', '1.0.0', 'YTowOnt9', 'n'),
(12, 'checkboxes', '1.0.0', 'YTowOnt9', 'n'),
(13, 'radio', '1.0.0', 'YTowOnt9', 'n'),
(14, 'relationship', '1.0.0', 'YTowOnt9', 'n'),
(15, 'rte', '2.1.0', 'YTowOnt9', 'n'),
(16, 'toggle', '1.0.0', 'YTowOnt9', 'n'),
(17, 'url', '1.0.0', 'YTowOnt9', 'n'),
(18, 'colorpicker', '1.0.0', 'YTowOnt9', 'n'),
(19, 'slider', '1.0.0', 'YTowOnt9', 'n'),
(20, 'range_slider', '1.0.0', 'YTowOnt9', 'n'),
(21, 'selectable_buttons', '1.0.0', 'YTowOnt9', 'n'),
(22, 'number', '1.0.0', 'YTowOnt9', 'n'),
(23, 'notes', '1.0.0', 'YTowOnt9', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_field_conditions`
--

CREATE TABLE `exp_field_conditions` (
  `condition_id` int(10) UNSIGNED NOT NULL,
  `condition_set_id` int(10) UNSIGNED NOT NULL,
  `condition_field_id` int(10) UNSIGNED NOT NULL,
  `evaluation_rule` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_field_condition_sets`
--

CREATE TABLE `exp_field_condition_sets` (
  `condition_set_id` int(10) UNSIGNED NOT NULL,
  `match` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `order` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_field_condition_sets_channel_fields`
--

CREATE TABLE `exp_field_condition_sets_channel_fields` (
  `condition_set_id` int(10) UNSIGNED NOT NULL,
  `field_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_field_groups`
--

CREATE TABLE `exp_field_groups` (
  `group_id` int(4) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_field_groups`
--

INSERT INTO `exp_field_groups` (`group_id`, `site_id`, `group_name`) VALUES
(1, 0, 'Page Group'),
(2, 0, 'Blog Group'),
(3, 0, 'SEO Group');

-- --------------------------------------------------------

--
-- Table structure for table `exp_files`
--

CREATE TABLE `exp_files` (
  `file_id` int(10) UNSIGNED NOT NULL,
  `model_type` enum('File','Directory') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'File',
  `site_id` int(4) UNSIGNED DEFAULT '1',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_location_id` int(4) UNSIGNED DEFAULT '0',
  `directory_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` int(10) DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `credit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uploaded_by_member_id` int(10) UNSIGNED DEFAULT '0',
  `upload_date` int(10) DEFAULT NULL,
  `modified_by_member_id` int(10) UNSIGNED DEFAULT '0',
  `modified_date` int(10) DEFAULT NULL,
  `file_hw_original` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `total_records` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_files`
--

INSERT INTO `exp_files` (`file_id`, `model_type`, `site_id`, `title`, `upload_location_id`, `directory_id`, `mime_type`, `file_type`, `file_name`, `file_size`, `description`, `credit`, `location`, `uploaded_by_member_id`, `upload_date`, `modified_by_member_id`, `modified_date`, `file_hw_original`, `total_records`) VALUES
(1, 'File', 1, 'pexels-mike-3820181.jpg', 5, 0, 'image/jpeg', NULL, 'pexels-mike-3820181.jpg', 221123, NULL, NULL, NULL, 1, 1605722409, 1, 1605722409, '1280 1920', 0),
(2, 'File', 1, 'pexels-katarzyna-modrzejewska-1314550.jpg', 5, 0, 'image/jpeg', NULL, 'pexels-katarzyna-modrzejewska-1314550.jpg', 429066, NULL, NULL, NULL, 1, 1605724441, 1, 1605724441, '2874 1920', 0),
(3, 'File', 1, 'Cat Standing Up', 5, 0, 'image/jpeg', NULL, 'pexels-marko-blazevic-774731.jpg', 218481, '', '', '', 1, 1605724467, 1, 1605725961, '1280 1920', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_categories`
--

CREATE TABLE `exp_file_categories` (
  `file_id` int(10) UNSIGNED NOT NULL,
  `cat_id` int(10) UNSIGNED NOT NULL,
  `sort` int(10) UNSIGNED DEFAULT '0',
  `is_cover` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_data`
--

CREATE TABLE `exp_file_data` (
  `file_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_file_data`
--

INSERT INTO `exp_file_data` (`file_id`) VALUES
(1),
(2),
(3);

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_dimensions`
--

CREATE TABLE `exp_file_dimensions` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `upload_location_id` int(4) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `resize_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `width` int(10) DEFAULT '0',
  `height` int(10) DEFAULT '0',
  `quality` tinyint(1) UNSIGNED DEFAULT '90',
  `watermark_id` int(4) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_manager_views`
--

CREATE TABLE `exp_file_manager_views` (
  `view_id` int(10) UNSIGNED NOT NULL,
  `viewtype` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'list',
  `upload_id` int(6) UNSIGNED NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `columns` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_usage`
--

CREATE TABLE `exp_file_usage` (
  `file_id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cat_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_watermarks`
--

CREATE TABLE `exp_file_watermarks` (
  `wm_id` int(4) UNSIGNED NOT NULL,
  `wm_name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `wm_image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_test_image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_use_font` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'y',
  `wm_font` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_font_size` int(3) UNSIGNED DEFAULT NULL,
  `wm_text` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_vrt_alignment` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'top',
  `wm_hor_alignment` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'left',
  `wm_padding` int(3) UNSIGNED DEFAULT NULL,
  `wm_opacity` int(3) UNSIGNED DEFAULT NULL,
  `wm_hor_offset` int(4) UNSIGNED DEFAULT NULL,
  `wm_vrt_offset` int(4) UNSIGNED DEFAULT NULL,
  `wm_x_transp` int(4) DEFAULT NULL,
  `wm_y_transp` int(4) DEFAULT NULL,
  `wm_font_color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_use_drop_shadow` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'y',
  `wm_shadow_distance` int(3) UNSIGNED DEFAULT NULL,
  `wm_shadow_color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_fluid_field_data`
--

CREATE TABLE `exp_fluid_field_data` (
  `id` int(11) UNSIGNED NOT NULL,
  `fluid_field_id` int(11) UNSIGNED NOT NULL,
  `entry_id` int(11) UNSIGNED NOT NULL,
  `field_id` int(11) UNSIGNED NOT NULL,
  `field_data_id` int(11) UNSIGNED NOT NULL,
  `order` int(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_global_variables`
--

CREATE TABLE `exp_global_variables` (
  `variable_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `variable_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variable_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `edit_date` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_global_variables`
--

INSERT INTO `exp_global_variables` (`variable_id`, `site_id`, `variable_name`, `variable_data`, `edit_date`) VALUES
(1, 1, 'facebook', 'https://www.facebook.com/triplenerdscore', 1663371939);

-- --------------------------------------------------------

--
-- Table structure for table `exp_grid_columns`
--

CREATE TABLE `exp_grid_columns` (
  `col_id` int(10) UNSIGNED NOT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `content_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_order` int(3) UNSIGNED DEFAULT NULL,
  `col_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_instructions` text COLLATE utf8mb4_unicode_ci,
  `col_required` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_search` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_width` int(3) UNSIGNED DEFAULT NULL,
  `col_settings` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_html_buttons`
--

CREATE TABLE `exp_html_buttons` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `tag_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_open` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_close` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accesskey` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_order` int(3) UNSIGNED NOT NULL,
  `tag_row` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `classname` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_html_buttons`
--

INSERT INTO `exp_html_buttons` (`id`, `site_id`, `member_id`, `tag_name`, `tag_open`, `tag_close`, `accesskey`, `tag_order`, `tag_row`, `classname`) VALUES
(1, 1, 0, 'html_btn_bold', '<strong>', '</strong>', 'b', 1, '1', 'html-bold'),
(2, 1, 0, 'html_btn_italic', '<em>', '</em>', 'i', 2, '1', 'html-italic'),
(3, 1, 0, 'html_btn_blockquote', '<blockquote>', '</blockquote>', 'q', 3, '1', 'html-quote'),
(4, 1, 0, 'html_btn_anchor', '<a href=\"[![Link:!:http://]!]\"(!( title=\"[![Title]!]\")!)>', '</a>', 'a', 4, '1', 'html-link'),
(5, 1, 0, 'html_btn_picture', '<img src=\"[![Link:!:http://]!]\" alt=\"[![Alternative text]!]\" />', '', '', 5, '1', 'html-upload');

-- --------------------------------------------------------

--
-- Table structure for table `exp_layout_publish`
--

CREATE TABLE `exp_layout_publish` (
  `layout_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `channel_id` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `layout_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_layout` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_layout_publish`
--

INSERT INTO `exp_layout_publish` (`layout_id`, `site_id`, `channel_id`, `layout_name`, `field_layout`) VALUES
(1, 1, 2, 'Blog Layout', 'a:5:{i:0;a:4:{s:2:\"id\";s:7:\"publish\";s:4:\"name\";s:7:\"publish\";s:7:\"visible\";b:1;s:6:\"fields\";a:5:{i:0;a:3:{s:5:\"field\";s:5:\"title\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}i:1;a:3:{s:5:\"field\";s:9:\"url_title\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}i:2;a:3:{s:5:\"field\";s:10:\"field_id_3\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}i:3;a:3:{s:5:\"field\";s:10:\"field_id_4\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}i:4;a:3:{s:5:\"field\";s:10:\"field_id_5\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}}}i:1;a:4:{s:2:\"id\";s:11:\"custom__seo\";s:4:\"name\";s:3:\"SEO\";s:7:\"visible\";b:1;s:6:\"fields\";a:3:{i:0;a:3:{s:5:\"field\";s:10:\"field_id_6\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}i:1;a:3:{s:5:\"field\";s:10:\"field_id_7\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}i:2;a:3:{s:5:\"field\";s:10:\"field_id_8\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}}}i:2;a:4:{s:2:\"id\";s:4:\"date\";s:4:\"name\";s:4:\"date\";s:7:\"visible\";b:1;s:6:\"fields\";a:2:{i:0;a:3:{s:5:\"field\";s:10:\"entry_date\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}i:1;a:3:{s:5:\"field\";s:15:\"expiration_date\";s:7:\"visible\";b:0;s:9:\"collapsed\";b:0;}}}i:3;a:4:{s:2:\"id\";s:10:\"categories\";s:4:\"name\";s:10:\"categories\";s:7:\"visible\";b:1;s:6:\"fields\";a:1:{i:0;a:3:{s:5:\"field\";s:26:\"categories[cat_group_id_1]\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}}}i:4;a:4:{s:2:\"id\";s:7:\"options\";s:4:\"name\";s:7:\"options\";s:7:\"visible\";b:1;s:6:\"fields\";a:3:{i:0;a:3:{s:5:\"field\";s:10:\"channel_id\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}i:1;a:3:{s:5:\"field\";s:6:\"status\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}i:2;a:3:{s:5:\"field\";s:9:\"author_id\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}}}}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_layout_publish_member_roles`
--

CREATE TABLE `exp_layout_publish_member_roles` (
  `layout_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_layout_publish_member_roles`
--

INSERT INTO `exp_layout_publish_member_roles` (`layout_id`, `role_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `exp_members`
--

CREATE TABLE `exp_members` (
  `member_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) NOT NULL DEFAULT '0',
  `username` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `screen_name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `unique_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `crypt_key` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signature` text COLLATE utf8mb4_unicode_ci,
  `avatar_filename` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_width` int(4) UNSIGNED DEFAULT NULL,
  `avatar_height` int(4) UNSIGNED DEFAULT NULL,
  `photo_filename` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_width` int(4) UNSIGNED DEFAULT NULL,
  `photo_height` int(4) UNSIGNED DEFAULT NULL,
  `sig_img_filename` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sig_img_width` int(4) UNSIGNED DEFAULT NULL,
  `sig_img_height` int(4) UNSIGNED DEFAULT NULL,
  `ignore_list` text COLLATE utf8mb4_unicode_ci,
  `private_messages` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `accept_messages` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `last_view_bulletins` int(10) NOT NULL DEFAULT '0',
  `last_bulletin_date` int(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `join_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_visit` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_entries` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_comment_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_email_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `in_authorlist` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `accept_admin_email` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `accept_user_email` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `notify_by_default` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `notify_of_pm` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `display_signatures` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `parse_smileys` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `smart_notifications` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `language` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_format` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `include_seconds` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_theme` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forum_theme` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracker` text COLLATE utf8mb4_unicode_ci,
  `template_size` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '28',
  `notepad` text COLLATE utf8mb4_unicode_ci,
  `notepad_size` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '18',
  `bookmarklets` text COLLATE utf8mb4_unicode_ci,
  `quick_links` text COLLATE utf8mb4_unicode_ci,
  `quick_tabs` text COLLATE utf8mb4_unicode_ci,
  `show_sidebar` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `pmember_id` int(10) NOT NULL DEFAULT '0',
  `cp_homepage` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_homepage_channel` text COLLATE utf8mb4_unicode_ci,
  `cp_homepage_custom` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dismissed_pro_banner` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `pending_role_id` int(10) NOT NULL DEFAULT '0',
  `enable_mfa` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `backup_mfa_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dismissed_banner` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_members`
--

INSERT INTO `exp_members` (`member_id`, `role_id`, `username`, `screen_name`, `password`, `salt`, `unique_id`, `crypt_key`, `authcode`, `email`, `signature`, `avatar_filename`, `avatar_width`, `avatar_height`, `photo_filename`, `photo_width`, `photo_height`, `sig_img_filename`, `sig_img_width`, `sig_img_height`, `ignore_list`, `private_messages`, `accept_messages`, `last_view_bulletins`, `last_bulletin_date`, `ip_address`, `join_date`, `last_visit`, `last_activity`, `total_entries`, `total_comments`, `total_forum_topics`, `total_forum_posts`, `last_entry_date`, `last_comment_date`, `last_forum_post_date`, `last_email_date`, `in_authorlist`, `accept_admin_email`, `accept_user_email`, `notify_by_default`, `notify_of_pm`, `display_signatures`, `parse_smileys`, `smart_notifications`, `language`, `timezone`, `time_format`, `date_format`, `include_seconds`, `profile_theme`, `forum_theme`, `tracker`, `template_size`, `notepad`, `notepad_size`, `bookmarklets`, `quick_links`, `quick_tabs`, `show_sidebar`, `pmember_id`, `cp_homepage`, `cp_homepage_channel`, `cp_homepage_custom`, `dismissed_pro_banner`, `pending_role_id`, `enable_mfa`, `backup_mfa_code`, `dismissed_banner`) VALUES
(1, 1, 'doug', 'doug', '$2y$10$yHbcRwghrLuuyJPdNIB7g.tHXwQfSGT2FbOFNldUDl0VxWHZCg.bC', '', 'd32eaadca3a44981ce316218ee85bf605138fd8c', '123e8e8814afb6ad85331c55017161fa0bafcd61', NULL, 'doug@triplenerdscore.net', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '127.0.0.1', 1604839755, 1606162406, 1663576962, 5, 0, 0, 0, 1605724440, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'America/New_York', NULL, NULL, NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, '', NULL, 'n', 0, NULL, NULL, NULL, 'n', 0, 'n', NULL, 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_members_roles`
--

CREATE TABLE `exp_members_roles` (
  `member_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_members_roles`
--

INSERT INTO `exp_members_roles` (`member_id`, `role_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `exp_members_role_groups`
--

CREATE TABLE `exp_members_role_groups` (
  `member_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_bulletin_board`
--

CREATE TABLE `exp_member_bulletin_board` (
  `bulletin_id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(10) UNSIGNED NOT NULL,
  `bulletin_group` int(8) UNSIGNED NOT NULL,
  `bulletin_date` int(10) UNSIGNED NOT NULL,
  `hash` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bulletin_expires` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `bulletin_message` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_data`
--

CREATE TABLE `exp_member_data` (
  `member_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_member_data`
--

INSERT INTO `exp_member_data` (`member_id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_fields`
--

CREATE TABLE `exp_member_fields` (
  `m_field_id` int(4) UNSIGNED NOT NULL,
  `m_field_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_type` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `m_field_list_items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_ta_rows` tinyint(2) DEFAULT '8',
  `m_field_maxl` smallint(3) DEFAULT NULL,
  `m_field_width` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `m_field_search` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_public` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_reg` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_cp_reg` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_fmt` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `m_field_show_fmt` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_exclude_from_anon` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_order` int(3) UNSIGNED DEFAULT NULL,
  `m_field_text_direction` char(3) COLLATE utf8mb4_unicode_ci DEFAULT 'ltr',
  `m_field_settings` text COLLATE utf8mb4_unicode_ci,
  `m_legacy_field_data` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_news_views`
--

CREATE TABLE `exp_member_news_views` (
  `news_id` int(10) UNSIGNED NOT NULL,
  `version` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_member_news_views`
--

INSERT INTO `exp_member_news_views` (`news_id`, `version`, `member_id`) VALUES
(1, '6.0.0-b.3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_search`
--

CREATE TABLE `exp_member_search` (
  `search_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `search_date` int(10) UNSIGNED NOT NULL,
  `keywords` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fields` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `total_results` int(8) UNSIGNED NOT NULL,
  `query` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_menu_items`
--

CREATE TABLE `exp_menu_items` (
  `item_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) NOT NULL DEFAULT '0',
  `set_id` int(10) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_menu_sets`
--

CREATE TABLE `exp_menu_sets` (
  `set_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_menu_sets`
--

INSERT INTO `exp_menu_sets` (`set_id`, `name`) VALUES
(1, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_attachments`
--

CREATE TABLE `exp_message_attachments` (
  `attachment_id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `message_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `attachment_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_hash` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_extension` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_location` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `attachment_size` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `is_temp` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_copies`
--

CREATE TABLE `exp_message_copies` (
  `copy_id` int(10) UNSIGNED NOT NULL,
  `message_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sender_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `recipient_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `message_received` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_read` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_time_read` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `attachment_downloaded` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_folder` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `message_authcode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_deleted` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_data`
--

CREATE TABLE `exp_message_data` (
  `message_id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `message_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `message_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_tracking` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `message_attachments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_recipients` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_cc` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_hide_cc` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_sent_copy` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `total_recipients` int(5) UNSIGNED NOT NULL DEFAULT '0',
  `message_status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_folders`
--

CREATE TABLE `exp_message_folders` (
  `member_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `folder1_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'InBox',
  `folder2_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Sent',
  `folder3_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder4_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder5_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder6_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder7_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder8_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder9_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder10_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_listed`
--

CREATE TABLE `exp_message_listed` (
  `listed_id` int(10) UNSIGNED NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `listed_member` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `listed_description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `listed_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'blocked'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_migrations`
--

CREATE TABLE `exp_migrations` (
  `migration_id` int(10) UNSIGNED NOT NULL,
  `migration` text COLLATE utf8mb4_unicode_ci,
  `migration_location` text COLLATE utf8mb4_unicode_ci,
  `migration_group` int(10) UNSIGNED DEFAULT NULL,
  `migration_run_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_modules`
--

CREATE TABLE `exp_modules` (
  `module_id` int(4) UNSIGNED NOT NULL,
  `module_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_version` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_cp_backend` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `has_publish_fields` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_modules`
--

INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`) VALUES
(1, 'Channel', '2.1.0', 'n', 'n'),
(2, 'Comment', '2.3.3', 'y', 'n'),
(3, 'Consent', '1.0.0', 'n', 'n'),
(4, 'Member', '2.2.0', 'n', 'n'),
(5, 'Stats', '2.1.0', 'n', 'n'),
(6, 'Rte', '2.1.0', 'y', 'n'),
(7, 'File', '1.1.0', 'n', 'n'),
(8, 'Filepicker', '1.0', 'y', 'n'),
(9, 'Relationship', '1.0.0', 'n', 'n'),
(10, 'Search', '2.3.0', 'n', 'n'),
(12, 'Email', '2.1.0', 'n', 'n'),
(13, 'Pro', '2.0.0', 'n', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_module_member_roles`
--

CREATE TABLE `exp_module_member_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `module_id` mediumint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_online_users`
--

CREATE TABLE `exp_online_users` (
  `online_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `in_forum` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `anon` char(1) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_password_lockout`
--

CREATE TABLE `exp_password_lockout` (
  `lockout_id` int(10) UNSIGNED NOT NULL,
  `login_date` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_password_lockout`
--

INSERT INTO `exp_password_lockout` (`lockout_id`, `login_date`, `ip_address`, `user_agent`, `username`) VALUES
(1, 1605721074, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', 'ee-admin'),
(2, 1605721105, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', 'eeadmin'),
(3, 1605721122, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', 'admin'),
(4, 1605721124, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', 'admin'),
(5, 1605721129, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', 'ee_admin');

-- --------------------------------------------------------

--
-- Table structure for table `exp_permissions`
--

CREATE TABLE `exp_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(5) UNSIGNED NOT NULL,
  `permission` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_permissions`
--

INSERT INTO `exp_permissions` (`permission_id`, `role_id`, `site_id`, `permission`) VALUES
(1, 1, 1, 'can_view_offline_system'),
(2, 1, 1, 'can_access_cp'),
(3, 1, 1, 'can_access_footer_report_bug'),
(4, 1, 1, 'can_access_footer_new_ticket'),
(5, 1, 1, 'can_access_footer_user_guide'),
(6, 1, 1, 'can_view_homepage_news'),
(7, 1, 1, 'can_upload_new_files'),
(8, 1, 1, 'can_edit_files'),
(9, 1, 1, 'can_delete_files'),
(10, 1, 1, 'can_upload_new_toolsets'),
(11, 1, 1, 'can_edit_toolsets'),
(12, 1, 1, 'can_delete_toolsets'),
(13, 1, 1, 'can_create_upload_directories'),
(14, 1, 1, 'can_edit_upload_directories'),
(15, 1, 1, 'can_delete_upload_directories'),
(16, 1, 1, 'can_access_files'),
(17, 1, 1, 'can_access_design'),
(18, 1, 1, 'can_access_addons'),
(19, 1, 1, 'can_access_members'),
(20, 1, 1, 'can_access_sys_prefs'),
(21, 1, 1, 'can_access_comm'),
(22, 1, 1, 'can_access_utilities'),
(23, 1, 1, 'can_access_data'),
(24, 1, 1, 'can_access_logs'),
(25, 1, 1, 'can_admin_channels'),
(26, 1, 1, 'can_create_channels'),
(27, 1, 1, 'can_edit_channels'),
(28, 1, 1, 'can_delete_channels'),
(29, 1, 1, 'can_create_channel_fields'),
(30, 1, 1, 'can_edit_channel_fields'),
(31, 1, 1, 'can_delete_channel_fields'),
(32, 1, 1, 'can_create_statuses'),
(33, 1, 1, 'can_delete_statuses'),
(34, 1, 1, 'can_edit_statuses'),
(35, 1, 1, 'can_create_categories'),
(36, 1, 1, 'can_create_roles'),
(37, 1, 1, 'can_delete_roles'),
(38, 1, 1, 'can_edit_roles'),
(39, 1, 1, 'can_admin_design'),
(40, 1, 1, 'can_create_members'),
(41, 1, 1, 'can_edit_members'),
(42, 1, 1, 'can_delete_members'),
(43, 1, 1, 'can_admin_roles'),
(44, 1, 1, 'can_admin_mbr_templates'),
(45, 1, 1, 'can_ban_users'),
(46, 1, 1, 'can_admin_addons'),
(47, 1, 1, 'can_create_new_templates'),
(48, 1, 1, 'can_edit_templates'),
(49, 1, 1, 'can_delete_templates'),
(50, 1, 1, 'can_create_template_groups'),
(51, 1, 1, 'can_edit_template_groups'),
(52, 1, 1, 'can_delete_template_groups'),
(53, 1, 1, 'can_create_template_partials'),
(54, 1, 1, 'can_edit_template_partials'),
(55, 1, 1, 'can_delete_template_partials'),
(56, 1, 1, 'can_create_template_variables'),
(57, 1, 1, 'can_delete_template_variables'),
(58, 1, 1, 'can_edit_template_variables'),
(59, 1, 1, 'can_edit_categories'),
(60, 1, 1, 'can_delete_categories'),
(61, 1, 1, 'can_view_other_entries'),
(62, 1, 1, 'can_edit_other_entries'),
(63, 1, 1, 'can_assign_post_authors'),
(64, 1, 1, 'can_delete_self_entries'),
(65, 1, 1, 'can_delete_all_entries'),
(66, 1, 1, 'can_view_other_comments'),
(67, 1, 1, 'can_edit_own_comments'),
(68, 1, 1, 'can_delete_own_comments'),
(69, 1, 1, 'can_edit_all_comments'),
(70, 1, 1, 'can_delete_all_comments'),
(71, 1, 1, 'can_moderate_comments'),
(72, 1, 1, 'can_send_cached_email'),
(73, 1, 1, 'can_email_roles'),
(74, 1, 1, 'can_email_from_profile'),
(75, 1, 1, 'can_view_profiles'),
(76, 1, 1, 'can_edit_html_buttons'),
(77, 1, 1, 'can_post_comments'),
(78, 1, 1, 'can_delete_self'),
(79, 1, 1, 'can_send_private_messages'),
(80, 1, 1, 'can_attach_in_private_messages'),
(81, 1, 1, 'can_send_bulletins'),
(82, 1, 1, 'can_search'),
(83, 1, 1, 'can_create_entries'),
(84, 1, 1, 'can_edit_self_entries'),
(85, 1, 1, 'can_access_security_settings'),
(86, 1, 1, 'can_access_translate'),
(87, 1, 1, 'can_access_import'),
(88, 1, 1, 'can_access_sql_manager'),
(89, 1, 1, 'can_moderate_spam'),
(90, 1, 1, 'can_manage_consents'),
(91, 3, 1, 'can_view_online_system'),
(92, 4, 1, 'can_view_online_system'),
(93, 5, 1, 'can_view_online_system'),
(94, 5, 1, 'can_email_from_profile'),
(95, 5, 1, 'can_view_profiles'),
(96, 5, 1, 'can_edit_html_buttons'),
(97, 5, 1, 'can_delete_self'),
(98, 5, 1, 'can_send_private_messages'),
(99, 5, 1, 'can_attach_in_private_messages'),
(100, 1, 1, 'can_access_dock');

-- --------------------------------------------------------

--
-- Table structure for table `exp_plugins`
--

CREATE TABLE `exp_plugins` (
  `plugin_id` int(10) UNSIGNED NOT NULL,
  `plugin_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plugin_package` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plugin_version` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_typography_related` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_prolets`
--

CREATE TABLE `exp_prolets` (
  `prolet_id` int(10) UNSIGNED NOT NULL,
  `source` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_prolets`
--

INSERT INTO `exp_prolets` (`prolet_id`, `source`, `class`) VALUES
(1, 'pro', 'Entries_pro');

-- --------------------------------------------------------

--
-- Table structure for table `exp_relationships`
--

CREATE TABLE `exp_relationships` (
  `relationship_id` int(6) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `child_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `field_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `fluid_field_data_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `grid_field_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `grid_col_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `grid_row_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `order` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_relationships`
--

INSERT INTO `exp_relationships` (`relationship_id`, `parent_id`, `child_id`, `field_id`, `fluid_field_data_id`, `grid_field_id`, `grid_col_id`, `grid_row_id`, `order`) VALUES
(3, 5, 4, 5, 0, 0, 0, 0, 1),
(4, 5, 3, 5, 0, 0, 0, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `exp_remember_me`
--

CREATE TABLE `exp_remember_me` (
  `remember_me_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `member_id` int(10) DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `admin_sess` tinyint(1) DEFAULT '0',
  `site_id` int(4) DEFAULT '1',
  `expiration` int(10) DEFAULT '0',
  `last_refresh` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_reset_password`
--

CREATE TABLE `exp_reset_password` (
  `reset_id` int(10) UNSIGNED NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `resetcode` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_revision_tracker`
--

CREATE TABLE `exp_revision_tracker` (
  `tracker_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `item_table` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_field` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_date` int(10) NOT NULL,
  `item_author_id` int(10) UNSIGNED NOT NULL,
  `item_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_roles`
--

CREATE TABLE `exp_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_locked` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `total_members` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_roles`
--

INSERT INTO `exp_roles` (`role_id`, `name`, `short_name`, `description`, `is_locked`, `total_members`) VALUES
(1, 'Super Admin', 'super_admin', NULL, 'y', 1),
(2, 'Banned', 'banned', NULL, 'n', 0),
(3, 'Guests', 'guests', NULL, 'n', 0),
(4, 'Pending', 'pending', NULL, 'n', 0),
(5, 'Members', 'members', NULL, 'n', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_roles_role_groups`
--

CREATE TABLE `exp_roles_role_groups` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_role_groups`
--

CREATE TABLE `exp_role_groups` (
  `group_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_role_settings`
--

CREATE TABLE `exp_role_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `menu_set_id` int(5) UNSIGNED NOT NULL DEFAULT '1',
  `mbr_delete_notify_emails` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exclude_from_moderation` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `search_flood_control` mediumint(5) UNSIGNED NOT NULL,
  `prv_msg_send_limit` smallint(5) UNSIGNED NOT NULL DEFAULT '20',
  `prv_msg_storage_limit` smallint(5) UNSIGNED NOT NULL DEFAULT '60',
  `include_in_authorlist` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `include_in_memberlist` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `cp_homepage` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_homepage_channel` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cp_homepage_custom` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `require_mfa` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_role_settings`
--

INSERT INTO `exp_role_settings` (`id`, `role_id`, `site_id`, `menu_set_id`, `mbr_delete_notify_emails`, `exclude_from_moderation`, `search_flood_control`, `prv_msg_send_limit`, `prv_msg_storage_limit`, `include_in_authorlist`, `include_in_memberlist`, `cp_homepage`, `cp_homepage_channel`, `cp_homepage_custom`, `require_mfa`) VALUES
(1, 1, 1, 1, NULL, 'y', 0, 20, 60, 'y', 'y', NULL, 0, NULL, 'n'),
(2, 2, 1, 1, NULL, 'n', 60, 20, 60, 'n', 'n', NULL, 0, NULL, 'n'),
(3, 3, 1, 1, NULL, 'n', 10, 20, 60, 'n', 'y', NULL, 0, NULL, 'n'),
(4, 4, 1, 1, NULL, 'n', 10, 20, 60, 'n', 'y', NULL, 0, NULL, 'n'),
(5, 5, 1, 1, NULL, 'n', 10, 20, 60, 'n', 'y', NULL, 0, NULL, 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_rte_toolsets`
--

CREATE TABLE `exp_rte_toolsets` (
  `toolset_id` int(6) UNSIGNED NOT NULL,
  `toolset_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `toolset_type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_rte_toolsets`
--

INSERT INTO `exp_rte_toolsets` (`toolset_id`, `toolset_name`, `settings`, `toolset_type`) VALUES
(1, 'Basic', 'YTozOntzOjc6InRvb2xiYXIiO2E6Njp7aTowO3M6NDoiYm9sZCI7aToxO3M6NjoiaXRhbGljIjtpOjI7czo5OiJ1bmRlcmxpbmUiO2k6MztzOjEyOiJudW1iZXJlZExpc3QiO2k6NDtzOjEyOiJidWxsZXRlZExpc3QiO2k6NTtzOjQ6ImxpbmsiO31zOjY6ImhlaWdodCI7czozOiIyMDAiO3M6MTA6InVwbG9hZF9kaXIiO3M6MzoiYWxsIjt9', 'ckeditor'),
(2, 'Full', 'YTozOntzOjc6InRvb2xiYXIiO2E6Mjk6e2k6MDtzOjQ6ImJvbGQiO2k6MTtzOjY6Iml0YWxpYyI7aToyO3M6MTM6InN0cmlrZXRocm91Z2giO2k6MztzOjk6InVuZGVybGluZSI7aTo0O3M6OToic3Vic2NyaXB0IjtpOjU7czoxMToic3VwZXJzY3JpcHQiO2k6NjtzOjEwOiJibG9ja3F1b3RlIjtpOjc7czo0OiJjb2RlIjtpOjg7czo3OiJoZWFkaW5nIjtpOjk7czoxMjoicmVtb3ZlRm9ybWF0IjtpOjEwO3M6NDoidW5kbyI7aToxMTtzOjQ6InJlZG8iO2k6MTI7czoxMjoibnVtYmVyZWRMaXN0IjtpOjEzO3M6MTI6ImJ1bGxldGVkTGlzdCI7aToxNDtzOjc6Im91dGRlbnQiO2k6MTU7czo2OiJpbmRlbnQiO2k6MTY7czo0OiJsaW5rIjtpOjE3O3M6MTE6ImZpbGVtYW5hZ2VyIjtpOjE4O3M6MTE6Imluc2VydFRhYmxlIjtpOjE5O3M6MTA6Im1lZGlhRW1iZWQiO2k6MjA7czoxNDoiYWxpZ25tZW50OmxlZnQiO2k6MjE7czoxNToiYWxpZ25tZW50OnJpZ2h0IjtpOjIyO3M6MTY6ImFsaWdubWVudDpjZW50ZXIiO2k6MjM7czoxNzoiYWxpZ25tZW50Omp1c3RpZnkiO2k6MjQ7czoxNDoiaG9yaXpvbnRhbExpbmUiO2k6MjU7czoxNzoic3BlY2lhbENoYXJhY3RlcnMiO2k6MjY7czo4OiJyZWFkTW9yZSI7aToyNztzOjk6ImZvbnRDb2xvciI7aToyODtzOjE5OiJmb250QmFja2dyb3VuZENvbG9yIjt9czo2OiJoZWlnaHQiO3M6MzoiMjAwIjtzOjEwOiJ1cGxvYWRfZGlyIjtzOjM6ImFsbCI7fQ==', 'ckeditor'),
(3, 'Redactor Basic', 'YTo0OntzOjQ6InR5cGUiO3M6ODoicmVkYWN0b3IiO3M6NzoidG9vbGJhciI7YToyOntzOjc6ImJ1dHRvbnMiO2E6Njp7aTowO3M6NDoiYm9sZCI7aToxO3M6NjoiaXRhbGljIjtpOjI7czo5OiJ1bmRlcmxpbmUiO2k6MztzOjI6Im9sIjtpOjQ7czoyOiJ1bCI7aTo1O3M6NDoibGluayI7fXM6NzoicGx1Z2lucyI7YTowOnt9fXM6NjoiaGVpZ2h0IjtzOjM6IjIwMCI7czoxMDoidXBsb2FkX2RpciI7czozOiJhbGwiO30=', 'redactor'),
(4, 'Redactor Full', 'YTo0OntzOjQ6InR5cGUiO3M6ODoicmVkYWN0b3IiO3M6NzoidG9vbGJhciI7YToyOntzOjc6ImJ1dHRvbnMiO2E6MTY6e2k6MDtzOjQ6Imh0bWwiO2k6MTtzOjY6ImZvcm1hdCI7aToyO3M6NDoiYm9sZCI7aTozO3M6NjoiaXRhbGljIjtpOjQ7czo3OiJkZWxldGVkIjtpOjU7czo5OiJ1bmRlcmxpbmUiO2k6NjtzOjQ6InJlZG8iO2k6NztzOjQ6InVuZG8iO2k6ODtzOjI6Im9sIjtpOjk7czoyOiJ1bCI7aToxMDtzOjY6ImluZGVudCI7aToxMTtzOjc6Im91dGRlbnQiO2k6MTI7czozOiJzdXAiO2k6MTM7czozOiJzdWIiO2k6MTQ7czo0OiJsaW5rIjtpOjE1O3M6NDoibGluZSI7fXM6NzoicGx1Z2lucyI7YToxNTp7aTowO3M6OToiYWxpZ25tZW50IjtpOjE7czoxNjoicnRlX2RlZmluZWRsaW5rcyI7aToyO3M6MTE6ImZpbGVicm93c2VyIjtpOjM7czo1OiJwYWdlcyI7aTo0O3M6MTE6ImlubGluZXN0eWxlIjtpOjU7czo5OiJmb250Y29sb3IiO2k6NjtzOjc6ImxpbWl0ZXIiO2k6NztzOjc6ImNvdW50ZXIiO2k6ODtzOjEwOiJwcm9wZXJ0aWVzIjtpOjk7czoxMjoic3BlY2lhbGNoYXJzIjtpOjEwO3M6NToidGFibGUiO2k6MTE7czo1OiJ2aWRlbyI7aToxMjtzOjY6IndpZGdldCI7aToxMztzOjg6InJlYWRtb3JlIjtpOjE0O3M6MTA6ImZ1bGxzY3JlZW4iO319czo2OiJoZWlnaHQiO3M6MzoiMjAwIjtzOjEwOiJ1cGxvYWRfZGlyIjtzOjM6ImFsbCI7fQ==', 'redactor');

-- --------------------------------------------------------

--
-- Table structure for table `exp_search`
--

CREATE TABLE `exp_search` (
  `search_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int(4) NOT NULL DEFAULT '1',
  `search_date` int(10) NOT NULL,
  `keywords` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_results` int(6) NOT NULL,
  `per_page` tinyint(3) UNSIGNED NOT NULL,
  `query` mediumtext COLLATE utf8mb4_unicode_ci,
  `custom_fields` mediumtext COLLATE utf8mb4_unicode_ci,
  `result_page` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_result_page` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_search_log`
--

CREATE TABLE `exp_search_log` (
  `id` int(10) NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `member_id` int(10) UNSIGNED NOT NULL,
  `screen_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `search_date` int(10) NOT NULL,
  `search_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `search_terms` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_security_hashes`
--

CREATE TABLE `exp_security_hashes` (
  `hash_id` int(10) UNSIGNED NOT NULL,
  `date` int(10) UNSIGNED NOT NULL,
  `session_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `hash` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_security_hashes`
--

INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `session_id`, `hash`) VALUES
(13, 1663575743, 'fe362de9c9a8f6b9fad8213217331534c6bbdf17', '586968895a9c92ea0baa2690a5579a9c48fc4d93');

-- --------------------------------------------------------

--
-- Table structure for table `exp_sessions`
--

CREATE TABLE `exp_sessions` (
  `session_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `admin_sess` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login_state` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fingerprint` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sess_start` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `auth_timeout` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `can_debug` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `mfa_flag` enum('skip','show','required') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'skip',
  `pro_banner_seen` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_sessions`
--

INSERT INTO `exp_sessions` (`session_id`, `member_id`, `admin_sess`, `ip_address`, `user_agent`, `login_state`, `fingerprint`, `sess_start`, `auth_timeout`, `last_activity`, `can_debug`, `mfa_flag`, `pro_banner_seen`) VALUES
('fe362de9c9a8f6b9fad8213217331534c6bbdf17', 1, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', NULL, 'af6d36a76d8d039c66dd605e77e2dc98', 1663575742, 0, 1663576966, '0', 'skip', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_sites`
--

CREATE TABLE `exp_sites` (
  `site_id` int(5) UNSIGNED NOT NULL,
  `site_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `site_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `site_description` text COLLATE utf8mb4_unicode_ci,
  `site_bootstrap_checksums` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_pages` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_color` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_sites`
--

INSERT INTO `exp_sites` (`site_id`, `site_label`, `site_name`, `site_description`, `site_bootstrap_checksums`, `site_pages`, `site_color`) VALUES
(1, 'Our New EE Site', 'default_site', NULL, 'YToyOntzOjc6ImVtYWlsZWQiO2E6MDp7fXM6MzE6IkU6XE1BTVBcaHRkb2NzXHB1YmxpYy9pbmRleC5waHAiO3M6MzI6ImRjZTNkODEwNTBiYTA0NzNjYjJiMjI0YzhjZWIzODcwIjt9', 'YToxOntpOjE7YToxOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjt9fQ==', '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_snippets`
--

CREATE TABLE `exp_snippets` (
  `snippet_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) NOT NULL,
  `snippet_name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `snippet_contents` text COLLATE utf8mb4_unicode_ci,
  `edit_date` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_snippets`
--

INSERT INTO `exp_snippets` (`snippet_id`, `site_id`, `snippet_name`, `snippet_contents`, `edit_date`) VALUES
(1, 1, 'top-nav', '<div class=\"\">\r\n   <div class=\"relative bg-white overflow-hidden\">\r\n      <div class=\"max-w-screen-xl mx-auto\">\r\n         <div class=\"relative z-10 pb-8 bg-white sm:pb-16 md:pb-20 lg:max-w-2xl lg:w-full lg:pb-28 xl:pb-32\">\r\n            <svg class=\"hidden lg:block absolute right-0 inset-y-0 h-full w-48 text-white transform translate-x-1/2\" fill=\"currentColor\" viewbox=\"0 0 100 100\" preserveaspectratio=\"none\">\r\n               <polygon points=\"50,0 100,0 50,100 0,100\"></polygon>\r\n            </svg>\r\n            <div class=\"relative pt-6 px-4 sm:px-6 lg:px-8\">\r\n               <nav class=\"relative flex items-center justify-between sm:h-10 lg:justify-start\">\r\n                  <div class=\"flex items-center flex-grow flex-shrink-0 lg:flex-grow-0\">\r\n                     <div class=\"flex items-center justify-between w-full md:w-auto\">\r\n                        <a href=\"#\" aria-label=\"Home\"><img class=\"h-8 w-auto sm:h-10\" src=\"https://tailwindui.com/img/logos/workflow-mark-on-white.svg\" alt=\"\"></a>\r\n                        <div class=\"-mr-2 flex items-center md:hidden\">\r\n                           <button class=\"inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 focus:text-gray-500 transition duration-150 ease-in-out\" id=\"main-menu\" type=\"button\" aria-label=\"Main menu\" aria-haspopup=\"true\">\r\n                              <svg class=\"h-6 w-6\" stroke=\"currentColor\" fill=\"none\" viewbox=\"0 0 24 24\">\r\n                                 <path stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" d=\"M4 6h16M4 12h16M4 18h16\"></path>\r\n                              </svg>\r\n                           </button>\r\n                        </div>\r\n                     </div>\r\n                  </div>\r\n                  <div class=\"hidden md:block md:ml-10 md:pr-4\">\r\n                    <a class=\"font-medium text-gray-500 hover:text-gray-900 transition duration-150 ease-in-out\" href=\"/\">Home</a>\r\n                    <a class=\"ml-8 font-medium text-gray-500 hover:text-gray-900 transition duration-150 ease-in-out\" href=\"/blog\">Blog</a>\r\n                    <a class=\"ml-8 font-medium text-indigo-600 hover:text-indigo-900 transition duration-150 ease-in-out\" href=\"/contact\">Contact</a></div>\r\n               </nav>\r\n            </div>\r\n            <div class=\"hidden absolute top-0 inset-x-0 p-2 transition transform origin-top-right\">\r\n               <div class=\"rounded-lg shadow-md\">\r\n                  <div class=\"rounded-lg bg-white shadow-xs overflow-hidden\" role=\"menu\" aria-orientation=\"vertical\" aria-labelledby=\"main-menu\">\r\n                     <div class=\"px-5 pt-4 flex items-center justify-between\">\r\n                        <div><img class=\"h-8 w-auto\" src=\"https://tailwindui.com/img/logos/workflow-mark-on-white.svg\" alt=\"\"></div>\r\n                        <div class=\"-mr-2\">\r\n                           <button class=\"inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 focus:text-gray-500 transition duration-150 ease-in-out\" type=\"button\" aria-label=\"Close menu\">\r\n                              <svg class=\"h-6 w-6\" stroke=\"currentColor\" fill=\"none\" viewbox=\"0 0 24 24\">\r\n                                 <path stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" d=\"M6 18L18 6M6 6l12 12\"></path>\r\n                              </svg>\r\n                           </button>\r\n                        </div>\r\n                     </div>\r\n                     <div class=\"px-2 pt-2 pb-3\">\r\n                        <a class=\"block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-50 focus:outline-none focus:text-gray-900 focus:bg-gray-50 transition duration-150 ease-in-out\" href=\"/\" role=\"menuitem\">Home</a><a class=\"mt-1 block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-50 focus:outline-none focus:text-gray-900 focus:bg-gray-50 transition duration-150 ease-in-out\" href=\"/blog\" role=\"menuitem\">Blog</a></div>\r\n                     <div><a class=\"block w-full px-5 py-3 text-center font-medium text-indigo-600 bg-gray-50 hover:bg-gray-100 hover:text-indigo-700 focus:outline-none focus:bg-gray-100 focus:text-indigo-700 transition duration-150 ease-in-out\" href=\"/contact\" role=\"menuitem\">Contact</a></div>\r\n                  </div>\r\n               </div>\r\n            </div>', 1663371939),
(2, 1, 'footer', '   {!-- Footer --}\r\n   <div class=\"relative bg-purple-800\">\r\n      <div class=\"absolute inset-0\">\r\n         <div class=\"absolute inset-y-0 left-0 w-1/2 bg-purple-800\"></div>\r\n      </div>\r\n      <div class=\"relative max-w-7xl mx-auto lg:grid lg:grid-cols-5\">\r\n         <div class=\"bg-purple-800 py-16 px-4 sm:px-6 lg:col-span-2 lg:px-8 lg:py-24 xl:pr-12\">\r\n            <div class=\"max-w-lg mx-auto\">\r\n               <h2 class=\"text-2xl leading-8 font-extrabold tracking-tight text-gray-100 sm:text-3xl sm:leading-9\">Get in touch</h2>\r\n               <p class=\"mt-3 text-lg leading-6 text-gray-300\">Let us know what you think</p>\r\n               <dl class=\"mt-8 text-base leading-6 text-gray-300\">\r\n                  <div>\r\n                     <dt class=\"sr-only\">Postal address</dt>\r\n                     <dd>\r\n                        <p>742 Evergreen Terrace</p>\r\n                        <p>Springfield, OR 12345</p>\r\n                     </dd>\r\n                  </div>\r\n                  <div class=\"mt-6\">\r\n                     <dt class=\"sr-only\">Phone number</dt>\r\n                     <dd class=\"flex\">\r\n                        <svg class=\"flex-shrink-0 h-6 w-6 text-gray-300\" fill=\"none\" viewbox=\"0 0 24 24\" stroke=\"currentColor\">\r\n                           <path stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" d=\"M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z\"></path>\r\n                        </svg>\r\n                        <span class=\"ml-3\">+1 (555) 123-4567</span>\r\n                     </dd>\r\n                  </div>\r\n                  <div class=\"mt-3\">\r\n                     <dt class=\"sr-only\">Email</dt>\r\n                     <dd class=\"flex\">\r\n                        <svg class=\"flex-shrink-0 h-6 w-6 text-gray-400\" fill=\"none\" viewbox=\"0 0 24 24\" stroke=\"currentColor\">\r\n                           <path stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" d=\"M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z\"></path>\r\n                        </svg>\r\n                        <span class=\"ml-3\">support@example.com</span>\r\n                     </dd>\r\n                  </div>\r\n               </dl>\r\n            </div>\r\n         </div>\r\n         <div class=\"bg-purple-800 py-16 px-4 sm:px-6 lg:col-span-3 lg:py-24 lg:px-8 xl:pl-12\">\r\n            <div class=\"max-w-lg mx-auto lg:max-w-none\">\r\n               <form class=\"grid grid-cols-1 row-gap-6\" action=\"#\" method=\"POST\">\r\n                  <div>\r\n                     <label class=\"sr-only\" for=\"full_name\">Full name</label>\r\n                     <div class=\"relative rounded-md shadow-sm\">\r\n                        <input class=\"form-input block w-full py-3 px-4 placeholder-gray-500 transition ease-in-out duration-150\" id=\"full_name\" placeholder=\"Full name\">\r\n                     </div>\r\n                  </div>\r\n                  <div>\r\n                     <label class=\"sr-only\" for=\"email\">Email</label>\r\n                     <div class=\"relative rounded-md shadow-sm\">\r\n                        <input class=\"form-input block w-full py-3 px-4 placeholder-gray-500 transition ease-in-out duration-150\" id=\"email\" type=\"email\" placeholder=\"Email\">\r\n                     </div>\r\n                  </div>\r\n                  <div>\r\n                     <label class=\"sr-only\" for=\"phone\">Phone</label>\r\n                     <div class=\"relative rounded-md shadow-sm\">\r\n                        <input class=\"form-input block w-full py-3 px-4 placeholder-gray-500 transition ease-in-out duration-150\" id=\"phone\" placeholder=\"Phone\">\r\n                     </div>\r\n                  </div>\r\n                  <div>\r\n                     <label class=\"sr-only\" for=\"message\">Message</label>\r\n                     <div class=\"relative rounded-md shadow-sm\"><textarea class=\"form-input block w-full py-3 px-4 placeholder-gray-500 transition ease-in-out duration-150\" id=\"message\" rows=\"4\" placeholder=\"Message\"></textarea></div>\r\n                  </div>\r\n                  <div>\r\n                     <span class=\"inline-flex rounded-md shadow-sm\">\r\n                     <button class=\"inline-flex justify-center py-3 px-6 border border-transparent text-base leading-6 font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition duration-150 ease-in-out\" type=\"submit\">Submit</button>\r\n                     </span>\r\n                  </div>\r\n               </form>\r\n            </div>\r\n         </div>\r\n      </div>\r\n   </div>\r\n   <div class=\"bg-white\">\r\n      <div class=\"max-w-screen-xl mx-auto py-12 px-4 overflow-hidden sm:px-6 lg:px-8\">\r\n         <nav class=\"-mx-5 -my-2 flex flex-wrap justify-center\">\r\n            <div class=\"px-5 py-2\"><a class=\"text-base leading-6 text-gray-500 hover:text-gray-900\" href=\"#\">About</a></div>\r\n            <div class=\"px-5 py-2\"><a class=\"text-base leading-6 text-gray-500 hover:text-gray-900\" href=\"#\">Blog</a></div>\r\n            <div class=\"px-5 py-2\"><a class=\"text-base leading-6 text-gray-500 hover:text-gray-900\" href=\"#\">Jobs</a></div>\r\n            <div class=\"px-5 py-2\"><a class=\"text-base leading-6 text-gray-500 hover:text-gray-900\" href=\"#\">Press</a></div>\r\n            <div class=\"px-5 py-2\"><a class=\"text-base leading-6 text-gray-500 hover:text-gray-900\" href=\"#\">Accessibility</a></div>\r\n            <div class=\"px-5 py-2\"><a class=\"text-base leading-6 text-gray-500 hover:text-gray-900\" href=\"#\">Partners</a></div>\r\n         </nav>\r\n         <div class=\"mt-8 flex justify-center\">\r\n            {!-- Facebook --}\r\n            <a class=\"text-gray-400 hover:text-gray-500\" href=\"{facebook}\">\r\n               <span class=\"sr-only\">Facebook</span>\r\n               <svg class=\"h-6 w-6\" fill=\"currentColor\" viewbox=\"0 0 24 24\">\r\n                  <path fill-rule=\"evenodd\" d=\"M22 12c0-5.523-4.477-10-10-10S2 6.477 2 12c0 4.991 3.657 9.128 8.438 9.878v-6.987h-2.54V12h2.54V9.797c0-2.506 1.492-3.89 3.777-3.89 1.094 0 2.238.195 2.238.195v2.46h-1.26c-1.243 0-1.63.771-1.63 1.562V12h2.773l-.443 2.89h-2.33v6.988C18.343 21.128 22 16.991 22 12z\" clip-rule=\"evenodd\"></path>\r\n               </svg>\r\n            </a>\r\n            {!-- END Facebook --}\r\n            <a class=\"ml-6 text-gray-400 hover:text-gray-500\" href=\"#\">\r\n               <span class=\"sr-only\">Instagram</span>\r\n               <svg class=\"h-6 w-6\" fill=\"currentColor\" viewbox=\"0 0 24 24\">\r\n                  <path fill-rule=\"evenodd\" d=\"M12.315 2c2.43 0 2.784.013 3.808.06 1.064.049 1.791.218 2.427.465a4.902 4.902 0 011.772 1.153 4.902 4.902 0 011.153 1.772c.247.636.416 1.363.465 2.427.048 1.067.06 1.407.06 4.123v.08c0 2.643-.012 2.987-.06 4.043-.049 1.064-.218 1.791-.465 2.427a4.902 4.902 0 01-1.153 1.772 4.902 4.902 0 01-1.772 1.153c-.636.247-1.363.416-2.427.465-1.067.048-1.407.06-4.123.06h-.08c-2.643 0-2.987-.012-4.043-.06-1.064-.049-1.791-.218-2.427-.465a4.902 4.902 0 01-1.772-1.153 4.902 4.902 0 01-1.153-1.772c-.247-.636-.416-1.363-.465-2.427-.047-1.024-.06-1.379-.06-3.808v-.63c0-2.43.013-2.784.06-3.808.049-1.064.218-1.791.465-2.427a4.902 4.902 0 011.153-1.772A4.902 4.902 0 015.45 2.525c.636-.247 1.363-.416 2.427-.465C8.901 2.013 9.256 2 11.685 2h.63zm-.081 1.802h-.468c-2.456 0-2.784.011-3.807.058-.975.045-1.504.207-1.857.344-.467.182-.8.398-1.15.748-.35.35-.566.683-.748 1.15-.137.353-.3.882-.344 1.857-.047 1.023-.058 1.351-.058 3.807v.468c0 2.456.011 2.784.058 3.807.045.975.207 1.504.344 1.857.182.466.399.8.748 1.15.35.35.683.566 1.15.748.353.137.882.3 1.857.344 1.054.048 1.37.058 4.041.058h.08c2.597 0 2.917-.01 3.96-.058.976-.045 1.505-.207 1.858-.344.466-.182.8-.398 1.15-.748.35-.35.566-.683.748-1.15.137-.353.3-.882.344-1.857.048-1.055.058-1.37.058-4.041v-.08c0-2.597-.01-2.917-.058-3.96-.045-.976-.207-1.505-.344-1.858a3.097 3.097 0 00-.748-1.15 3.098 3.098 0 00-1.15-.748c-.353-.137-.882-.3-1.857-.344-1.023-.047-1.351-.058-3.807-.058zM12 6.865a5.135 5.135 0 110 10.27 5.135 5.135 0 010-10.27zm0 1.802a3.333 3.333 0 100 6.666 3.333 3.333 0 000-6.666zm5.338-3.205a1.2 1.2 0 110 2.4 1.2 1.2 0 010-2.4z\" clip-rule=\"evenodd\"></path>\r\n               </svg>\r\n            </a>\r\n            <a class=\"ml-6 text-gray-400 hover:text-gray-500\" href=\"#\">\r\n               <span class=\"sr-only\">Twitter</span>\r\n               <svg class=\"h-6 w-6\" fill=\"currentColor\" viewbox=\"0 0 24 24\">\r\n                  <path d=\"M8.29 20.251c7.547 0 11.675-6.253 11.675-11.675 0-.178 0-.355-.012-.53A8.348 8.348 0 0022 5.92a8.19 8.19 0 01-2.357.646 4.118 4.118 0 001.804-2.27 8.224 8.224 0 01-2.605.996 4.107 4.107 0 00-6.993 3.743 11.65 11.65 0 01-8.457-4.287 4.106 4.106 0 001.27 5.477A4.072 4.072 0 012.8 9.713v.052a4.105 4.105 0 003.292 4.022 4.095 4.095 0 01-1.853.07 4.108 4.108 0 003.834 2.85A8.233 8.233 0 012 18.407a11.616 11.616 0 006.29 1.84\"></path>\r\n               </svg>\r\n            </a>\r\n            <a class=\"ml-6 text-gray-400 hover:text-gray-500\" href=\"#\">\r\n               <span class=\"sr-only\">GitHub</span>\r\n               <svg class=\"h-6 w-6\" fill=\"currentColor\" viewbox=\"0 0 24 24\">\r\n                  <path fill-rule=\"evenodd\" d=\"M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z\" clip-rule=\"evenodd\"></path>\r\n               </svg>\r\n            </a>\r\n            <a class=\"ml-6 text-gray-400 hover:text-gray-500\" href=\"#\">\r\n               <span class=\"sr-only\">Dribbble</span>\r\n               <svg class=\"h-6 w-6\" fill=\"currentColor\" viewbox=\"0 0 24 24\">\r\n                  <path fill-rule=\"evenodd\" d=\"M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10c5.51 0 10-4.48 10-10S17.51 2 12 2zm6.605 4.61a8.502 8.502 0 011.93 5.314c-.281-.054-3.101-.629-5.943-.271-.065-.141-.12-.293-.184-.445a25.416 25.416 0 00-.564-1.236c3.145-1.28 4.577-3.124 4.761-3.362zM12 3.475c2.17 0 4.154.813 5.662 2.148-.152.216-1.443 1.941-4.48 3.08-1.399-2.57-2.95-4.675-3.189-5A8.687 8.687 0 0112 3.475zm-3.633.803a53.896 53.896 0 013.167 4.935c-3.992 1.063-7.517 1.04-7.896 1.04a8.581 8.581 0 014.729-5.975zM3.453 12.01v-.26c.37.01 4.512.065 8.775-1.215.25.477.477.965.694 1.453-.109.033-.228.065-.336.098-4.404 1.42-6.747 5.303-6.942 5.629a8.522 8.522 0 01-2.19-5.705zM12 20.547a8.482 8.482 0 01-5.239-1.8c.152-.315 1.888-3.656 6.703-5.337.022-.01.033-.01.054-.022a35.318 35.318 0 011.823 6.475 8.4 8.4 0 01-3.341.684zm4.761-1.465c-.086-.52-.542-3.015-1.659-6.084 2.679-.423 5.022.271 5.314.369a8.468 8.468 0 01-3.655 5.715z\" clip-rule=\"evenodd\"></path>\r\n               </svg>\r\n            </a>\r\n         </div>\r\n         <div class=\"mt-8\">\r\n            <p class=\"text-center text-base leading-6 text-gray-400\">&copy; 2020 tripleNERDscore, Inc. All rights reserved.</p>\r\n         </div>\r\n      </div>\r\n   </div>\r\n</div>', 1663371939),
(3, 1, 'seo', '<!-- Google / Search Engine Tags -->\r\n<meta itemprop=\"name\" content=\"{if seo_title}{seo_title}{if:else}{title}{/if}\">\r\n<meta itemprop=\"description\" content=\"{if seo_description}{seo_description}{if:else}{subtitle}{/if}\">\r\n<meta itemprop=\"image\" content=\"{featured_image}\">\r\n\r\n<!-- Facebook Meta Tags -->\r\n<meta property=\"og:url\" content=\"{site_url}/blog/{url_title}\">\r\n<meta property=\"og:type\" content=\"website\">\r\n<meta property=\"og:title\" content=\"{if seo_title}{seo_title}{if:else}{title}{/if}\">\r\n<meta property=\"og:description\" content=\"{if seo_description}{seo_description}{if:else}{subtitle}{/if}\">\r\n<meta property=\"og:image\" content=\"{featured_image}\">\r\n\r\n<!-- Twitter Meta Tags -->\r\n<meta name=\"twitter:card\" content=\"summary_large_image\">\r\n<meta name=\"twitter:title\" content=\"{if seo_title}{seo_title}{if:else}{title}{/if}\">\r\n<meta name=\"twitter:description\" content=\"{if seo_description}{seo_description}{if:else}{subtitle}{/if}\">\r\n<meta name=\"twitter:image\" content=\"{featured_image}\">\r\n\r\n<!-- No Robots -->\r\n{if no_robots}\r\n	<meta name=\"robots\" content=\"noindex\" />\r\n{/if}', 1663371939),
(4, 1, 'contact-form', '<div class=\"relative bg-white\">\r\n	<div class=\"absolute inset-0\">\r\n		<div class=\"absolute inset-y-0 left-0 w-1/2 bg-gray-50\"></div>\r\n	</div>\r\n	<div class=\"relative max-w-7xl mx-auto lg:grid lg:grid-cols-5\">\r\n		<div class=\"bg-gray-50 py-16 px-4 sm:px-6 lg:col-span-2 lg:px-8 lg:py-24 xl:pr-12\">\r\n			<div class=\"max-w-lg mx-auto\">\r\n				<h2 class=\"text-2xl leading-8 font-extrabold tracking-tight text-gray-900 sm:text-3xl sm:leading-9\">Get in touch</h2>\r\n				<dl class=\"mt-8 text-base leading-6 text-gray-500\">\r\n					<div>\r\n						<dt class=\"sr-only\">Postal address</dt>\r\n						<dd>\r\n							<p>742 Evergreen Terrace</p>\r\n							<p>Springfield, OR 12345</p>\r\n						</dd>\r\n					</div>\r\n					<div class=\"mt-6\">\r\n						<dt class=\"sr-only\">Phone number</dt>\r\n						<dd class=\"flex\">\r\n							<svg class=\"flex-shrink-0 h-6 w-6 text-gray-400\" fill=\"none\" viewBox=\"0 0 24 24\" stroke=\"currentColor\">\r\n								<path stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" d=\"M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z\"></path>\r\n							</svg>\r\n							<span class=\"ml-3\">+1 (555) 123-4567</span>\r\n						</dd>\r\n					</div>\r\n					<div class=\"mt-3\">\r\n						<dt class=\"sr-only\">Email</dt>\r\n						<dd class=\"flex\">\r\n							<svg class=\"flex-shrink-0 h-6 w-6 text-gray-400\" fill=\"none\" viewBox=\"0 0 24 24\" stroke=\"currentColor\">\r\n								<path stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" d=\"M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z\"></path>\r\n							</svg>\r\n							<span class=\"ml-3\">support@example.com</span>\r\n						</dd>\r\n					</div>\r\n				</dl>\r\n			</div>\r\n		</div>\r\n		<div class=\"bg-white py-16 px-4 sm:px-6 lg:col-span-3 lg:py-24 lg:px-8 xl:pl-12\">\r\n			<div class=\"max-w-lg mx-auto lg:max-w-none\">\r\n				{exp:email:contact_form\r\n					user_recipients=\"no\"\r\n					recipients=\"doug@triplenerdscore.net\"\r\n					charset=\"utf-8\"\r\n					form_class=\"grid grid-cols-1 row-gap-6\"\r\n				}\r\n					<div>\r\n						<label class=\"sr-only\" for=\"name\">Name</label>\r\n						<div class=\"relative rounded-md shadow-sm\">\r\n							<input class=\"form-input block w-full py-3 px-4 placeholder-gray-500 transition ease-in-out duration-150\" id=\"name\" name=\"name\" placeholder=\"Full name\">\r\n						</div>\r\n					</div>\r\n					<div>\r\n						<label class=\"sr-only\" for=\"from\">Email</label>\r\n						<div class=\"relative rounded-md shadow-sm\">\r\n							<input class=\"form-input block w-full py-3 px-4 placeholder-gray-500 transition ease-in-out duration-150\" id=\"from\" type=\"email\" name=\"from\" placeholder=\"Email\">\r\n						</div>\r\n					</div>\r\n					<div>\r\n						<label class=\"sr-only\">Phone</label>\r\n						<div class=\"relative rounded-md shadow-sm\">\r\n							<input class=\"form-input block w-full py-3 px-4 placeholder-gray-500 transition ease-in-out duration-150\" id=\"phone\" type=\"text\" name=\"required[]\" placeholder=\"Phone\">\r\n						</div>\r\n					</div>\r\n					<div>\r\n						<label class=\"sr-only\" for=\"message\">Message</label>\r\n						<div class=\"relative rounded-md shadow-sm\"><textarea class=\"form-input block w-full py-3 px-4 placeholder-gray-500 transition ease-in-out duration-150\" id=\"message\" name=\"message\" rows=\"4\" placeholder=\"Message\"></textarea></div>\r\n					</div>\r\n					<div>\r\n						<span class=\"inline-flex rounded-md shadow-sm\">\r\n							<button class=\"inline-flex justify-center py-3 px-6 border border-transparent text-base leading-6 font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition duration-150 ease-in-out\" type=\"submit\">Submit</button>\r\n						</span>\r\n					</div>\r\n				{/exp:email:contact_form}\r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>', 1663371939),
(5, 1, '404', '<section class=\"py-8 px-4 text-center\">\r\n  <h2 class=\"text-5xl font-semibold font-heading\">Error 404</h2>\r\n  <p class=\"text-gray-400\">Page not found</p>\r\n  <img class=\"max-w-auto md:max-w-sm my-12 mx-auto\" src=\"https://media.giphy.com/media/5nmobhwPiNsKELWk69/giphy.gif\" alt=\"\" />\r\n</section>', 1663371939),
(6, 1, 'partial-404', '<section class=\"py-8 px-4 text-center\">\r\n  <h2 class=\"text-5xl font-semibold font-heading\">Error 404</h2>\r\n  <p class=\"text-gray-400\">Page not found</p>\r\n  <img class=\"max-w-auto md:max-w-sm my-12 mx-auto\" src=\"https://media.giphy.com/media/5nmobhwPiNsKELWk69/giphy.gif\" alt=\"\" />\r\n</section>', 1663371939);

-- --------------------------------------------------------

--
-- Table structure for table `exp_specialty_templates`
--

CREATE TABLE `exp_specialty_templates` (
  `template_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `enable_template` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `template_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_title` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_type` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_subtype` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_notes` text COLLATE utf8mb4_unicode_ci,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_specialty_templates`
--

INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_type`, `template_subtype`, `template_data`, `template_notes`, `edit_date`, `last_author_id`) VALUES
(1, 1, 'y', 'offline_template', '', 'system', NULL, '<!doctype html>\n<html dir=\"ltr\">\n    <head>\n        <title>System Offline</title>\n        <meta content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\"  name=\"viewport\">\n\n        <style type=\"text/css\">\n:root, body {\n    --ee-panel-bg: #fff;\n    --ee-panel-border: #dfe0ef;\n    --ee-text-normal: #0d0d19;\n    --ee-main-bg: #f7f7fb;\n    --ee-link: #5D63F1;\n    --ee-link-hover: #171feb;\n}\n\n*, :after, :before {\n    box-sizing: inherit;\n}\n\nhtml {\n    box-sizing: border-box;\n    font-size: 15px;\n    height: 100%;\n    line-height: 1.15;\n}\n\nbody {\n    font-family: Roboto,system-ui,-apple-system,BlinkMacSystemFont,\"Segoe UI\",Roboto,Ubuntu,\"Helvetica Neue\",Oxygen,Cantarell,sans-serif;\n    height: 100%;\n    font-size: 1rem;\n    line-height: 1.6;\n    color: var(--ee-text-normal);\n    background: var(--ee-main-bg);\n    -webkit-font-smoothing: antialiased;\n    margin: 0;\n}\n\n.panel {\n    margin-bottom: 20px;\n    background-color: var(--ee-panel-bg);\n    border: 1px solid var(--ee-panel-border);\n    border-radius: 6px;\n}\n.redirect {\n	max-width: 700px;\n	min-width: 350px;\n    position: absolute;\n    top: 50%;\n    left: 50%;\n    transform: translate(-50%,-50%);\n}\n\n.panel-heading {\n    padding: 20px 25px;\n    position: relative;\n}\n\n.panel-body {\n    padding: 20px 25px;\n}\n\n.panel-body:after, .panel-body:before {\n    content: \" \";\n    display: table;\n}\n\n.redirect p {\n    margin-bottom: 20px;\n}\np {\n    line-height: 1.6;\n}\na, blockquote, code, h1, h2, h3, h4, h5, h6, ol, p, pre, ul {\n    color: inherit;\n    margin: 0;\n    padding: 0;\n    font-weight: inherit;\n}\n\na {\n    color: var(--ee-link);\n    text-decoration: none;\n    -webkit-transition: color .15s ease-in-out;\n    -moz-transition: color .15s ease-in-out;\n    -o-transition: color .15s ease-in-out;\n}\n\na:hover {\n    color: var(--ee-link-hover);\n}\n\nh3 {\n    font-size: 1.35em;\n    font-weight: 500;\n}\n\nol, ul {\n    padding-left: 0;\n}\n\nol li, ul li {\n    list-style-position: inside;\n}\n\n.panel-footer {\n    padding: 20px 25px;\n    position: relative;\n}\n\n\n        </style>\n    </head>\n    <body>\n        <section class=\"flex-wrap\">\n            <section class=\"wrap\">\n                <div class=\"panel redirect\">\n                    <div class=\"panel-heading\">\n                        <h3>System Offline</h3>\n                    </div>\n					<div class=\"panel-body\">\n					This site is currently offline\n                    </div>\n                </div>\n            </section>\n        </section>\n    </body>\n</html>', NULL, 1604839755, 0),
(2, 1, 'y', 'message_template', '', 'system', NULL, '<!doctype html>\n<html dir=\"ltr\">\n    <head>\n        <title>{title}</title>\n        <meta http-equiv=\"content-type\" content=\"text/html; charset={charset}\">\n        <meta content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\"  name=\"viewport\">\n        <meta name=\"referrer\" content=\"no-referrer\">\n        {meta_refresh}\n        <style type=\"text/css\">\n:root, body {\n    --ee-panel-bg: #fff;\n    --ee-panel-border: #dfe0ef;\n    --ee-text-normal: #0d0d19;\n    --ee-main-bg: #f7f7fb;\n    --ee-link: #5D63F1;\n    --ee-link-hover: #171feb;\n}\n\n*, :after, :before {\n    box-sizing: inherit;\n}\n\nhtml {\n    box-sizing: border-box;\n    font-size: 15px;\n    height: 100%;\n    line-height: 1.15;\n}\n\nbody {\n    font-family: Roboto,system-ui,-apple-system,BlinkMacSystemFont,\"Segoe UI\",Roboto,Ubuntu,\"Helvetica Neue\",Oxygen,Cantarell,sans-serif;\n    height: 100%;\n    font-size: 1rem;\n    line-height: 1.6;\n    color: var(--ee-text-normal);\n    background: var(--ee-main-bg);\n    -webkit-font-smoothing: antialiased;\n    margin: 0;\n}\n\n.panel {\n    margin-bottom: 20px;\n    background-color: var(--ee-panel-bg);\n    border: 1px solid var(--ee-panel-border);\n    border-radius: 6px;\n}\n.redirect {\n	max-width: 700px;\n	min-width: 350px;\n    position: absolute;\n    top: 50%;\n    left: 50%;\n    transform: translate(-50%,-50%);\n}\n\n.panel-heading {\n    padding: 20px 25px;\n    position: relative;\n}\n\n.panel-body {\n    padding: 20px 25px;\n}\n\n.panel-body:after, .panel-body:before {\n    content: \" \";\n    display: table;\n}\n\n.redirect p {\n    margin-bottom: 20px;\n}\np {\n    line-height: 1.6;\n}\na, blockquote, code, h1, h2, h3, h4, h5, h6, ol, p, pre, ul {\n    color: inherit;\n    margin: 0;\n    padding: 0;\n    font-weight: inherit;\n}\n\na {\n    color: var(--ee-link);\n    text-decoration: none;\n    -webkit-transition: color .15s ease-in-out;\n    -moz-transition: color .15s ease-in-out;\n    -o-transition: color .15s ease-in-out;\n}\n\na:hover {\n    color: var(--ee-link-hover);\n}\n\nh3 {\n    font-size: 1.35em;\n    font-weight: 500;\n}\n\nol, ul {\n    padding-left: 0;\n}\n\nol li, ul li {\n    list-style-position: inside;\n}\n\n.panel-footer {\n    padding: 20px 25px;\n    position: relative;\n}\n\n\n        </style>\n    </head>\n    <body>\n        <section class=\"flex-wrap\">\n            <section class=\"wrap\">\n                <div class=\"panel redirect\">\n                    <div class=\"panel-heading\">\n                        <h3>{heading}</h3>\n                    </div>\n                    <div class=\"panel-body\">\n                        {content}\n\n\n                    </div>\n                    <div class=\"panel-footer\">\n                        {link}\n                    </div>\n                </div>\n            </section>\n        </section>\n    </body>\n</html>', NULL, 1604839755, 0),
(3, 1, 'y', 'admin_notify_reg', 'Notification of new member registration', 'email', 'members', 'New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}', NULL, 1604839755, 0),
(4, 1, 'y', 'admin_notify_entry', 'A new channel entry has been posted', 'email', 'content', 'A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit:\n{entry_url}\n', NULL, 1604839755, 0),
(5, 1, 'y', 'admin_notify_comment', 'You have just received a comment', 'email', 'comments', 'You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at:\n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}', NULL, 1604839755, 0),
(6, 1, 'y', 'mbr_activation_instructions', 'Enclosed is your activation code', 'email', 'members', 'Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}', NULL, 1604839755, 0),
(7, 1, 'y', 'forgot_password_instructions', 'Login information', 'email', 'members', '{name},\n\nTo reset your password, please go to the following page:\n\n{reset_url}\n\nThen log in with your username: {username}\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}', NULL, 1604839755, 0),
(8, 1, 'y', 'password_changed_notification', 'Password changed', 'email', 'members', '{name},\n\nYour password was just changed.\n\nIf you didn\'t make this change yourself, please contact an administrator right away.\n\n{site_name}\n{site_url}', NULL, 1604839755, 0),
(9, 1, 'y', 'email_changed_notification', 'Email address changed', 'email', 'members', '{name},\n\nYour email address has been changed, and this email address is no longer associated with your account.\n\nIf you didn\'t make this change yourself, please contact an administrator right away.\n\n{site_name}\n{site_url}', NULL, 1604839755, 0),
(10, 1, 'y', 'validated_member_notify', 'Your membership account has been activated', 'email', 'members', '{name},\n\nYour membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}', NULL, 1604839755, 0),
(11, 1, 'y', 'decline_member_validation', 'Your membership account has been declined', 'email', 'members', '{name},\n\nWe\'re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}', NULL, 1604839755, 0),
(12, 1, 'y', 'comment_notification', 'Someone just responded to your comment', 'email', 'comments', '{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}', NULL, 1604839755, 0),
(13, 1, 'y', 'comments_opened_notification', 'New comments have been added', 'email', 'comments', 'Responses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment}\n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}', NULL, 1604839755, 0),
(14, 1, 'y', 'private_message_notification', 'Someone has sent you a Private Message', 'email', 'private_messages', '\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}', NULL, 1604839755, 0),
(15, 1, 'y', 'pm_inbox_full', 'Your private message mailbox is full', 'email', 'private_messages', '{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}', NULL, 1604839755, 0),
(16, 1, 'y', 'post_install_message_template', '', 'system', NULL, '<!doctype html>\n<html>\n	<head>\n		<title>Welcome to ExpressionEngine!</title>\n		<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" lang=\"en-us\" dir=\"ltr\">\n		<meta content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\"  name=\"viewport\">\n		<link href=\"{theme_folder_url}cp/css/common.min.css\" rel=\"stylesheet\">\n			</head>\n	<body class=\"installer-page\">\n		<section class=\"flex-wrap\">\n			<section class=\"wrap\">\n				<div class=\"login__logo\">\n  <svg width=\"281px\" height=\"36px\" viewBox=\"0 0 281 36\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\">\n  <title>ExpressionEngine</title>\n  <defs>\n      <polygon id=\"path-1\" points=\"0.3862 0.1747 18.6557 0.1747 18.6557 21.5 0.3862 21.5\"></polygon>\n      <polygon id=\"path-3\" points=\"0.3926 0.17455 13.9915 0.17455 13.9915 15.43755 0.3926 15.43755\"></polygon>\n      <polygon id=\"path-5\" points=\"0 0.06905 25.8202 0.06905 25.8202 31.6178513 0 31.6178513\"></polygon>\n      <polygon id=\"path-7\" points=\"0.10635 0.204 25.9268587 0.204 25.9268587 31.7517 0.10635 31.7517\"></polygon>\n  </defs>\n  <g id=\"logo\" stroke=\"none\" stroke-width=\"1\" fill=\"none\" fill-rule=\"evenodd\">\n      <g id=\"expressionengine\">\n          <path d=\"M92.88015,27.0665 L89.28865,20.955 L94.66665,14.6405 L94.77265,13.9 L91.11315,13.9 L87.86765,17.95 C87.76015,18.0845 87.57265,18.353 87.30415,19.2645 C87.33065,18.353 87.14315,18.0845 87.08965,17.9775 L84.80915,13.9 L80.59815,13.9 L84.62115,20.8475 L78.21065,28.3045 L82.42165,28.3045 L86.04315,23.905 C86.23065,23.664 86.52565,23.154 86.66065,22.5915 C86.66065,23.154 86.79465,23.6905 86.92865,23.905 L89.42265,28.3045 L92.70265,28.3045 L92.88015,27.0665 Z\" id=\"Fill-1\"></path>\n          <path d=\"M80.2395,11.9686 L70.9585,11.9686 L70.288,16.6091 L78.7645,16.6091 L77.4495,19.6141 L69.751,19.6141 C69.805,19.8011 69.805,20.0156 69.778,20.1231 L69.027,25.3011 L78.3345,25.3011 L77.9055,28.3046 L65.003,28.3046 L67.7925,8.9651 L80.6685,8.9651 L80.2395,11.9686 Z\" id=\"Fill-3\"></path>\n          <path d=\"M102.3328,16.20735 C101.5283,16.20735 100.5628,16.34085 99.3558,17.11935 L98.1493,25.46185 C98.8998,25.83735 99.9723,25.99835 100.8848,25.99835 C103.0573,25.99835 104.2378,24.60235 104.7478,20.98085 C104.8548,20.28385 104.9083,19.69385 104.9083,19.18485 C104.9083,17.03835 104.0508,16.20735 102.3328,16.20735 M108.3418,20.98085 C107.6718,25.70235 105.5783,28.73385 100.5093,28.73385 C99.5708,28.73385 98.4978,28.54635 97.5313,28.08985 C97.6128,28.38435 97.6933,28.73385 97.6393,29.02935 L96.8073,34.79585 L93.2133,34.79585 L96.2178,13.89985 L98.7928,13.89985 L99.0878,15.08085 C100.3213,14.00685 101.7703,13.47035 103.1113,13.47035 C106.9473,13.47035 108.5023,15.69685 108.5023,19.05035 C108.5023,19.66735 108.4483,20.31135 108.3418,20.98085\" id=\"Fill-5\"></path>\n          <path d=\"M119.33865,16.69 C118.74815,16.609 118.13215,16.555 117.48715,16.555 C116.46815,16.555 115.39515,16.716 114.45615,17.28 L112.87415,28.3045 L109.27965,28.3045 L111.34515,13.8995 L114.29515,13.8995 L114.51115,15.0535 C115.71715,13.8995 116.92465,13.4705 118.21215,13.4705 C118.72265,13.4705 119.25865,13.5515 119.79515,13.659 L119.33865,16.69 Z\" id=\"Fill-7\"></path>\n          <path d=\"M127.43385,16.31455 C125.39585,16.31455 124.40285,17.09155 123.81285,19.61405 L129.71435,19.61405 C129.76785,19.29205 129.79435,18.99655 129.79435,18.72855 C129.79435,17.14555 129.01685,16.31455 127.43385,16.31455 M133.03985,22.13505 L123.35635,22.13505 C123.30235,22.56405 123.27685,22.93955 123.27685,23.28855 C123.27685,25.05905 124.08085,25.89105 126.06585,25.89105 C127.91685,25.89105 128.96335,25.08605 129.74035,23.90505 L132.44985,25.00505 C131.18885,27.41855 128.82885,28.73355 125.66385,28.73355 C121.58635,28.73355 119.73535,26.56055 119.73535,22.93955 C119.73535,22.34955 119.78885,21.73305 119.86985,21.08855 C120.64685,15.80405 122.95485,13.47055 127.86285,13.47055 C132.31635,13.47055 133.33585,16.60905 133.33585,19.29205 C133.33585,20.09655 133.17435,21.16955 133.03985,22.13505\" id=\"Fill-9\"></path>\n          <path d=\"M144.11795,17.70905 C143.60895,16.79705 142.66995,16.28705 141.19395,16.28705 C140.04145,16.28705 138.64595,16.52905 138.64595,17.97755 C138.64595,18.48755 138.88745,18.91655 139.53145,19.02405 L142.64245,19.58655 C144.60095,19.93605 146.20995,21.03455 146.20995,23.12755 C146.20995,27.23155 142.80295,28.73355 139.23545,28.73355 C136.71445,28.73355 134.73045,27.87555 133.76445,25.62255 L136.76845,24.52255 C137.33245,25.54155 138.24395,25.99805 139.61245,25.99805 C140.95345,25.99805 142.61595,25.59505 142.61595,23.93255 C142.61595,23.34255 142.34795,22.91355 141.56945,22.77855 L138.21645,22.16255 C136.66095,21.86655 135.13145,20.68655 135.13145,18.46005 C135.13145,14.65055 138.27045,13.47055 141.59695,13.47055 C144.57445,13.47055 146.20995,14.67805 146.93445,16.39455 L144.11795,17.70905 Z\" id=\"Fill-11\"></path>\n          <path d=\"M157.28835,17.70905 C156.77935,16.79705 155.84135,16.28705 154.36435,16.28705 C153.21235,16.28705 151.81785,16.52905 151.81785,17.97755 C151.81785,18.48755 152.05935,18.91655 152.70335,19.02405 L155.81435,19.58655 C157.77285,19.93605 159.38185,21.03455 159.38185,23.12755 C159.38185,27.23155 155.97385,28.73355 152.40635,28.73355 C149.88635,28.73355 147.90085,27.87555 146.93585,25.62255 L149.93885,24.52255 C150.50285,25.54155 151.41585,25.99805 152.78285,25.99805 C154.12535,25.99805 155.78685,25.59505 155.78685,23.93255 C155.78685,23.34255 155.51985,22.91355 154.74135,22.77855 L151.38835,22.16255 C149.83185,21.86655 148.30235,20.68655 148.30235,18.46005 C148.30235,14.65055 151.44085,13.47055 154.76885,13.47055 C157.74485,13.47055 159.38185,14.67805 160.10535,16.39455 L157.28835,17.70905 Z\" id=\"Fill-13\"></path>\n          <path d=\"M168.0188,11.0294 C167.9908,11.2714 167.9908,11.2714 167.7768,11.2714 L164.2888,11.2714 C164.0743,11.2714 164.0743,11.2714 164.1018,11.0294 L164.5858,7.7039 C164.6108,7.4359 164.6108,7.4084 164.8253,7.4084 L168.3133,7.4084 C168.5278,7.4084 168.5278,7.4359 168.5003,7.7039 L168.0188,11.0294 Z M167.2953,28.5464 L165.4688,28.5464 C163.3783,28.5464 162.3583,27.6334 162.3583,25.7564 C162.3583,25.4619 162.3853,25.1659 162.4378,24.8169 L163.5128,17.3874 C163.5378,17.1729 163.6728,16.8509 163.8873,16.6089 L161.2853,16.6089 L161.6618,13.8999 L167.5898,13.8999 L166.0328,24.8169 C166.0083,24.9514 166.0083,25.0864 166.0083,25.1934 C166.0083,25.5154 166.1398,25.6229 166.5443,25.6229 L167.6968,25.6229 L167.2953,28.5464 Z\" id=\"Fill-15\"></path>\n          <path d=\"M176.8977,16.31455 C174.6972,16.31455 173.6242,17.44105 173.0882,21.08855 C172.9807,21.81305 172.9262,22.45705 172.9262,22.99305 C172.9262,25.16605 173.7837,25.89105 175.5282,25.89105 C177.7007,25.89105 178.8562,24.76305 179.3922,21.08855 C179.4997,20.39105 179.5522,19.77455 179.5522,19.23855 C179.5522,17.03805 178.6662,16.31455 176.8977,16.31455 M182.9852,21.08855 C182.2617,26.07805 180.0887,28.73355 175.1262,28.73355 C170.8872,28.73355 169.3582,26.13155 169.3582,22.85955 C169.3582,22.29555 169.4132,21.67955 169.4927,21.08855 C170.2167,16.01905 172.3647,13.47055 177.3267,13.47055 C181.5377,13.47055 183.1197,15.93905 183.1197,19.26455 C183.1197,19.85455 183.0672,20.44455 182.9852,21.08855\" id=\"Fill-17\"></path>\n          <path d=\"M197.21265,19.23835 L195.89815,28.30435 L192.33015,28.30435 L193.64515,19.23835 C193.70015,18.91635 193.72465,18.59485 193.72465,18.29935 C193.72465,17.06535 193.24365,16.26085 191.90115,16.26085 C190.80115,16.26085 189.51415,16.87685 188.46865,17.52085 L186.91165,28.30435 L183.34415,28.30435 L185.41015,13.89985 L188.36115,13.89985 L188.60315,15.21435 C190.26465,13.89985 191.60665,13.47035 193.10865,13.47035 C196.11265,13.47035 197.32015,15.37535 197.32015,17.92385 C197.32015,18.35285 197.26715,18.78185 197.21265,19.23835\" id=\"Fill-19\"></path>\n          <path d=\"M214.45925,11.9686 L205.17825,11.9686 L204.51025,16.6091 L212.98475,16.6091 L211.67025,19.6141 L203.97075,19.6141 C204.02625,19.8011 204.02625,20.0156 203.99875,20.1231 L203.24775,25.3011 L212.55525,25.3011 L212.12675,28.3046 L199.22325,28.3046 L202.01525,8.9651 L214.89075,8.9651 L214.45925,11.9686 Z\" id=\"Fill-21\"></path>\n          <path d=\"M227.8411,19.23835 L226.5266,28.30435 L222.9586,28.30435 L224.2736,19.23835 C224.3261,18.91635 224.3531,18.59485 224.3531,18.29935 C224.3531,17.06535 223.8696,16.26085 222.5301,16.26085 C221.4296,16.26085 220.1426,16.87685 219.0946,17.52085 L217.5401,28.30435 L213.9726,28.30435 L216.0386,13.89985 L218.9871,13.89985 L219.2291,15.21435 C220.8931,13.89985 222.2331,13.47035 223.7371,13.47035 C226.7411,13.47035 227.9486,15.37535 227.9486,17.92385 C227.9486,18.35285 227.8936,18.78185 227.8411,19.23835\" id=\"Fill-23\"></path>\n          <g id=\"Group-27\" transform=\"translate(227.500000, 13.296000)\">\n              <mask id=\"mask-2\" fill=\"white\">\n                  <use xlink:href=\"#path-1\"></use>\n              </mask>\n              <g id=\"Clip-26\"></g>\n              <path d=\"M9.7742,2.9912 C7.7607,2.9912 6.6082,4.1452 6.6082,6.1297 C6.6082,7.4702 7.4667,8.0342 9.0232,8.0342 C11.0342,8.0342 12.1612,6.9617 12.1612,4.9772 C12.1612,3.6622 11.3832,2.9912 9.7742,2.9912 L9.7742,2.9912 Z M10.1207,15.0622 L5.0787,14.1227 C4.2757,14.9812 3.9262,15.5447 3.9262,16.7522 C3.9262,18.1197 4.8917,18.7372 7.4667,18.7372 C9.1557,18.7372 11.4907,18.4687 11.4907,16.2957 C11.4907,15.6262 11.1412,15.2507 10.1207,15.0622 L10.1207,15.0622 Z M18.3312,3.3132 L16.5872,3.3132 C16.3457,3.3132 15.7542,3.2867 15.3002,3.0722 C15.5672,3.7157 15.6742,4.4392 15.6742,5.0307 C15.6742,9.2142 12.3482,10.8237 8.6187,10.8237 C7.7882,10.8237 6.9852,10.7437 6.2862,10.5827 C6.1792,10.5552 6.0717,10.5292 5.9372,10.5292 C5.5352,10.5292 5.2932,10.7437 5.2932,11.1452 C5.2932,11.4137 5.4282,11.6017 6.0167,11.7092 L11.1962,12.6747 C14.0652,13.2112 15.0577,14.4447 15.0577,16.0277 C15.0577,20.6682 10.7122,21.5002 7.0647,21.5002 C4.1682,21.5002 0.3862,20.7217 0.3862,17.1002 C0.3862,15.2232 1.3767,13.6142 2.9857,12.6482 C2.6637,12.2457 2.5042,11.7902 2.5042,11.3597 C2.5042,10.3947 3.2007,9.6437 4.0062,9.2142 C3.4972,8.5707 3.0682,7.5517 3.0682,6.3717 C3.0682,2.1602 6.3387,0.1747 10.1757,0.1747 C11.5177,0.1747 12.9372,0.4167 13.9852,1.0862 L16.0537,0.6212 L18.6557,0.6212 L18.3312,3.3132 Z\" id=\"Fill-25\" mask=\"url(#mask-2)\"></path>\n          </g>\n          <path d=\"M251.54175,11.0294 C251.51675,11.2714 251.51675,11.2714 251.30225,11.2714 L247.81475,11.2714 C247.59975,11.2714 247.59975,11.2714 247.62725,11.0294 L248.10925,7.7039 C248.13625,7.4359 248.13625,7.4084 248.35075,7.4084 L251.83875,7.4084 C252.05275,7.4084 252.05275,7.4359 252.02575,7.7039 L251.54175,11.0294 Z M250.81825,28.5464 L248.99425,28.5464 C246.90175,28.5464 245.88375,27.6334 245.88375,25.7564 C245.88375,25.4619 245.91075,25.1659 245.96375,24.8169 L247.03575,17.3874 C247.06375,17.1729 247.19825,16.8509 247.41275,16.6089 L244.81075,16.6089 L245.18475,13.8999 L251.11275,13.8999 L249.55825,24.8169 C249.53125,24.9514 249.53125,25.0864 249.53125,25.1934 C249.53125,25.5154 249.66575,25.6229 250.06725,25.6229 L251.21975,25.6229 L250.81825,28.5464 Z\" id=\"Fill-28\"></path>\n          <path d=\"M266.32595,19.23835 L265.01095,28.30435 L261.44345,28.30435 L262.75845,19.23835 C262.81345,18.91635 262.83795,18.59485 262.83795,18.29935 C262.83795,17.06535 262.35695,16.26085 261.01445,16.26085 C259.91445,16.26085 258.62695,16.87685 257.58195,17.52085 L256.02445,28.30435 L252.45745,28.30435 L254.52345,13.89985 L257.47445,13.89985 L257.71645,15.21435 C259.37795,13.89985 260.71995,13.47035 262.22195,13.47035 C265.22595,13.47035 266.43345,15.37535 266.43345,17.92385 C266.43345,18.35285 266.38045,18.78185 266.32595,19.23835\" id=\"Fill-30\"></path>\n          <g id=\"Group-34\" transform=\"translate(267.000000, 13.296000)\">\n              <mask id=\"mask-4\" fill=\"white\">\n                  <use xlink:href=\"#path-3\"></use>\n              </mask>\n              <g id=\"Clip-33\"></g>\n              <path d=\"M8.0916,3.01855 C6.0531,3.01855 5.0606,3.79555 4.4691,6.31805 L10.3716,6.31805 C10.4241,5.99605 10.4516,5.70055 10.4516,5.43255 C10.4516,3.84955 9.6731,3.01855 8.0916,3.01855 M13.6971,8.83905 L4.0126,8.83905 C3.9596,9.26805 3.9326,9.64355 3.9326,9.99255 C3.9326,11.76305 4.7381,12.59505 6.7216,12.59505 C8.5731,12.59505 9.6211,11.79005 10.3961,10.60905 L13.1056,11.70905 C11.8461,14.12255 9.4861,15.43755 6.3201,15.43755 C2.2436,15.43755 0.3926,13.26455 0.3926,9.64355 C0.3926,9.05355 0.4446,8.43705 0.5271,7.79255 C1.3031,2.50805 3.6106,0.17455 8.5201,0.17455 C12.9736,0.17455 13.9916,3.31305 13.9916,5.99605 C13.9916,6.80055 13.8316,7.87355 13.6971,8.83905\" id=\"Fill-32\" mask=\"url(#mask-4)\"></path>\n          </g>\n          <path d=\"M20.60205,17.64605 C21.11355,14.75605 22.01655,12.45255 23.28405,10.79305 C24.18105,9.60555 25.17405,9.00405 26.23755,9.00405 C26.80055,9.00405 27.27705,9.22055 27.65305,9.64955 C28.01805,10.06905 28.20405,10.64605 28.20405,11.36305 C28.20405,13.02405 27.45705,14.53555 25.98455,15.86155 C24.91705,16.81355 23.20305,17.51055 20.89205,17.93305 L20.53855,17.99805 L20.60205,17.64605 Z M30.67305,21.68355 C29.37505,22.92855 28.23905,23.80705 27.31805,24.24655 C26.34905,24.70655 25.34805,24.93855 24.34355,24.93855 C23.11755,24.93855 22.12155,24.54805 21.38655,23.77655 C20.65105,23.00705 20.27805,21.90355 20.27805,20.49455 L20.37305,19.08355 L20.56855,19.05005 C24.00755,18.47005 26.60155,17.80655 28.27555,17.07555 C29.93155,16.35405 31.14005,15.49505 31.86855,14.52405 C32.59155,13.56105 32.95655,12.59155 32.95655,11.65055 C32.95655,10.50805 32.52355,9.59355 31.63105,8.84705 C30.73555,8.10155 29.44355,7.72455 27.79455,7.72455 C25.50305,7.72455 23.33455,8.25905 21.34955,9.31405 C19.36805,10.36805 17.78305,11.82905 16.64005,13.65605 C15.50005,15.48105 14.92155,17.41555 14.92155,19.40105 C14.92155,21.61755 15.60505,23.39505 16.95205,24.68005 C18.30455,25.96905 20.19355,26.62005 22.56705,26.62005 C24.25255,26.62005 25.84755,26.28155 27.30805,25.61355 C28.70455,24.97455 30.14905,23.86705 31.60805,22.37255 C31.33005,22.16805 30.87005,21.82855 30.67305,21.68355 L30.67305,21.68355 Z\" id=\"Fill-35\"></path>\n          <g id=\"Group-39\" transform=\"translate(0.000000, 2.796000)\">\n              <mask id=\"mask-6\" fill=\"white\">\n                  <use xlink:href=\"#path-5\"></use>\n              </mask>\n              <g id=\"Clip-38\"></g>\n              <path d=\"M7.2737,19.35005 C5.3202,11.70605 9.9462,3.71505 17.8897,0.06905 C17.6907,0.14055 17.5042,0.22255 17.3077,0.29605 C17.5087,0.20005 17.6882,0.11955 17.8272,0.07205 L2.9432,3.91255 L6.9112,6.26005 C1.7147,10.66105 -0.9663,16.11555 0.3187,21.14505 C2.3302,29.02005 13.3457,33.12605 25.8202,31.10805 C17.1117,31.75655 9.2257,26.99355 7.2737,19.35005\" id=\"Fill-37\" mask=\"url(#mask-6)\"></path>\n          </g>\n          <g id=\"Group-42\" transform=\"translate(23.500000, 0.296000)\">\n              <mask id=\"mask-8\" fill=\"white\">\n                  <use xlink:href=\"#path-7\"></use>\n              </mask>\n              <g id=\"Clip-41\"></g>\n              <path d=\"M18.65285,12.4697 C20.60635,20.1147 15.98135,28.1052 8.03735,31.7517 C8.23585,31.6797 8.42235,31.5977 8.61885,31.5232 C8.41785,31.6212 8.23835,31.7002 8.09935,31.7482 L22.98335,27.9087 L19.01585,25.5612 C24.21185,21.1597 26.89285,15.7042 25.60835,10.6747 C23.59635,2.8027 12.58085,-1.3053 0.10635,0.7142 C8.81435,0.0637 16.70135,4.8267 18.65285,12.4697\" id=\"Fill-40\" mask=\"url(#mask-8)\"></path>\n          </g>\n      </g>\n    </g>\n  </svg>\n</div>\n				<div class=\"panel warn\">\n  <div class=\"panel-heading\" style=\"text-align: center;\">\n    <h3>ExpressionEngine has been installed!</h3>\n  </div>\n  <div class=\"panel-body\">\n    <div class=\"updater-msg\">\n  		<p style=\"margin-bottom: 20px;\">If you see this message, then everything went well.</p>\n\n  		<div class=\"alert alert--attention\">\n            <div class=\"alert__icon\">\n              <i class=\"fas fa-info-circle fa-fw\"></i>\n            </div>\n            <div class=\"alert__content\">\n    			<p>If you are site owner, please login into your Control Panel and create your first template.</p>\n    		</div>\n  		</div>\n  		<div class=\"alert alert--attention\">\n            <div class=\"alert__icon\">\n              <i class=\"fas fa-info-circle fa-fw\"></i>\n            </div>\n            <div class=\"alert__content\">\n    			<p>If this is your first time using ExpressionEngine CMS, make sure to <a href=\"https://docs.expressionengine.com/latest/getting-started/the-big-picture.html\">check out the documentation</a> to get started.</p>\n    		</div>\n  		</div>\n  	</div>\n  </div>\n  <div class=\"panel-footer\">\n\n  </div>\n</div>\n			</div>\n			<section class=\"bar\">\n				<p style=\"float: left;\"><a href=\"https://expressionengine.com/\" rel=\"external\"><b>ExpressionEngine</b></a></p>\n				<p style=\"float: right;\">&copy;2021 <a href=\"https://packettide.com/\" rel=\"external\">Packet Tide</a>, LLC</p>\n			</section>\n		</section>\n\n	</body>\n</html>', NULL, 1663576667, 0),
(17, 1, 'y', 'forgot_username_instructions', 'Username information', 'email', 'members', 'Your username is: {username}\n\nIf you didn\\\'t request your username yourself, please contact an administrator right away.\n\n{site_name}\n{site_url}', NULL, 1663576672, 0),
(18, 1, 'y', 'mfa_template', '', 'system', NULL, '<!doctype html>\n        <html dir=\"ltr\">\n            <head>\n                <title>{title}</title>\n                <meta http-equiv=\"content-type\" content=\"text/html; charset={charset}\">\n                <meta content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\"  name=\"viewport\">\n                <meta name=\"referrer\" content=\"no-referrer\">\n                {meta_refresh}\n                <style type=\"text/css\">\n        :root, body {\n            --ee-panel-bg: #fff;\n            --ee-panel-border: #dfe0ef;\n            --ee-text-normal: #0d0d19;\n            --ee-text-secondary: #8f90b0;\n            --ee-main-bg: #f7f7fb;\n            --ee-link: #5D63F1;\n            --ee-link-hover: #171feb;\n            --ee-bg-blank: #fff;\n            --ee-code-border: #dfe0ef;\n        \n            --ee-input-color: #0d0d19;\n            --ee-input-bg: #fff;\n            --ee-input-placeholder: #adaec5;\n            --ee-input-border: #cbcbda;\n            --ee-input-border-accent: #ecedf5;\n            --ee-input-focus-border: #5D63F1;\n            --ee-input-focus-shadow: 0 3px 6px -3px rgba(174,151,255,0.14),0 5px 10px -3px rgba(97,114,242,0.05);\n            --ee-button-primary-color: #fff;\n            --ee-button-primary-bg: #5D63F1;\n            --ee-button-primary-border: #5D63F1;\n        \n            --ee-bg-0: #f7f7fb;\n            --ee-border: #dfe0ef;\n            --ee-error: #FA5252;\n            --ee-error-light: #fee7e7;\n            --ee-warning: #FFB40B;\n            --ee-warning-light: #fff6e1;\n        }\n\n        @font-face{font-family:Roboto;font-style:normal;font-weight:400;src:url({url_themes}webfonts/roboto-v20-latin-regular.eot);src:local(\"Roboto\"),local(\"Roboto-Regular\"),url({url_themes}webfonts/roboto-v20-latin-regular.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-regular.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-regular.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-regular.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-regular.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:italic;font-weight:400;src:url({url_themes}webfonts/roboto-v20-latin-italic.eot);src:local(\"Roboto Italic\"),local(\"Roboto-Italic\"),url({url_themes}webfonts/roboto-v20-latin-italic.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-italic.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-italic.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-italic.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-italic.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:normal;font-weight:500;src:url({url_themes}webfonts/roboto-v20-latin-500.eot);src:local(\"Roboto Medium\"),local(\"Roboto-Medium\"),url({url_themes}webfonts/roboto-v20-latin-500.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-500.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-500.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-500.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-500.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:italic;font-weight:500;src:url({url_themes}webfonts/roboto-v20-latin-500italic.eot);src:local(\"Roboto Medium Italic\"),local(\"Roboto-MediumItalic\"),url({url_themes}webfonts/roboto-v20-latin-500italic.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-500italic.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-500italic.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-500italic.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-500italic.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:normal;font-weight:700;src:url({url_themes}webfonts/roboto-v20-latin-700.eot);src:local(\"Roboto Bold\"),local(\"Roboto-Bold\"),url({url_themes}webfonts/roboto-v20-latin-700.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-700.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-700.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-700.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-700.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:italic;font-weight:700;src:url({url_themes}webfonts/roboto-v20-latin-700italic.eot);src:local(\"Roboto Bold Italic\"),local(\"Roboto-BoldItalic\"),url({url_themes}webfonts/roboto-v20-latin-700italic.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-700italic.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-700italic.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-700italic.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-700italic.svg#Roboto) format(\"svg\")}\n        @font-face{font-family:\'Font Awesome 5 Free\';font-style:normal;font-weight:900;font-display:auto;src:url({url_themes}webfonts/fa-solid-900.eot);src:url({url_themes}webfonts/fa-solid-900.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/fa-solid-900.woff2) format(\"woff2\"),url({url_themes}webfonts/fa-solid-900.woff) format(\"woff\"),url({url_themes}webfonts/fa-solid-900.ttf) format(\"truetype\"),url({url_themes}webfonts/fa-solid-900.svg#fontawesome) format(\"svg\")}\n        \n        *, :after, :before {\n            box-sizing: inherit;\n        }\n        \n        html {\n            box-sizing: border-box;\n            font-size: 15px;\n            height: 100%;\n            line-height: 1.15;\n        }\n        \n        body {\n            font-family: Roboto,system-ui,-apple-system,BlinkMacSystemFont,\"Segoe UI\",Roboto,Ubuntu,\"Helvetica Neue\",Oxygen,Cantarell,sans-serif;\n            height: 100%;\n            font-size: 1rem;\n            line-height: 1.6;\n            color: var(--ee-text-normal);\n            background: var(--ee-main-bg);\n            -webkit-font-smoothing: antialiased;\n            margin: 0;\n        }\n        \n        .panel {\n            margin-bottom: 20px;\n            background-color: var(--ee-panel-bg);\n            border: 1px solid var(--ee-panel-border);\n            border-radius: 6px;\n        }\n        .redirect {\n            max-width: 700px;\n            min-width: 350px;\n            position: absolute;\n            left: 50%;\n            top: 0;\n            transform: translate(-50%);\n            height: 100vh;\n            overflow-y: auto;\n            background: transparent;\n            border: none;\n            border-radius: 0;\n            display: flex;\n        }\n        \n        .redirect-inner {\n          background-color: var(--ee-panel-bg);\n          border: 1px solid var(--ee-panel-border);\n          border-radius: 6px;\n          height: auto;\n          margin-top: auto;\n          margin-bottom: auto;\n        }\n\n        .redirect-inner .qr-code-wrap {\n            text-align: center;\n        }\n        \n        .panel-heading {\n            padding: 20px 25px;\n            position: relative;\n        }\n        \n        .panel-body {\n            padding: 20px 25px;\n        }\n        \n        .panel-body:after, .panel-body:before {\n            content: \" \";\n            display: table;\n        }\n        \n        .redirect p {\n            margin-bottom: 20px;\n        }\n        p {\n            line-height: 1.6;\n        }\n        a, blockquote, code, h1, h2, h3, h4, h5, h6, ol, p, pre, ul {\n            color: inherit;\n            margin: 0;\n            padding: 0;\n            font-weight: inherit;\n        }\n\n        code {\n            font-size: inherit;\n            margin: 0 2px;\n            padding: 3px 6px;\n            border-radius: 5px;\n            border: 1px solid var(--ee-code-border);\n            background-color: var(--ee-bg-blank);\n            font-size: .96em;\n            white-space: normal;\n        }\n        \n        a {\n            color: var(--ee-link);\n            text-decoration: none;\n            -webkit-transition: color .15s ease-in-out;\n            -moz-transition: color .15s ease-in-out;\n            -o-transition: color .15s ease-in-out;\n        }\n        \n        a:hover {\n            color: var(--ee-link-hover);\n        }\n        \n        h3 {\n            font-size: 1.35em;\n            font-weight: 500;\n        }\n        \n        ol, ul {\n            padding-left: 0;\n        }\n        \n        ol li, ul li {\n            list-style-position: inside;\n        }\n        \n        .panel-footer {\n            padding: 20px 25px;\n            position: relative;\n        }\n        \n        fieldset {\n            margin: 0;\n            padding: 0;\n            margin-bottom: 20px;\n            border: 0;\n        }\n        \n        fieldset.last {\n            margin-bottom: 0;\n        }\n        \n        .field-instruct {\n            margin-bottom: 5px;\n        }\n        \n        .field-instruct label {\n            display: block;\n            color: var(--ee-text-normal);\n            margin-bottom: 5px;\n            font-weight: 500;\n        }\n        \n        .field-instruct :last-child {\n            margin-bottom: 0;\n        }\n\n        .field-instruct em {\n            color: var(--ee-text-secondary);\n            display: block;\n            font-size: .8rem;\n            font-style: normal;\n            margin-bottom: 10px;\n        }\n\n        .field-instruct label+em {\n            margin-top: -5px;\n        }\n        \n        button, input, optgroup, select, textarea {\n            font-family: inherit;\n            font-size: 100%;\n            line-height: 1.15;\n            margin: 0;\n        }\n        \n        input[type=text], input[type=password] {\n            display: block;\n            width: 100%;\n            padding: 8px 15px;\n            font-size: 1rem;\n            line-height: 1.6;\n            color: var(--ee-input-color);\n            background-color: var(--ee-input-bg);\n            background-image: none;\n            transition: border-color .2s ease,box-shadow .2s ease;\n            -webkit-appearance: none;\n            border: 1px solid var(--ee-input-border);\n            border-radius: 5px;\n        }\n        \n        input[type=text]:focus, input[type=password]:focus {\n            border-color: var(--ee-input-focus-border);\n        }\n        \n        input:focus {\n            outline: 0;\n        }\n        \n        .button {\n            -webkit-appearance: none;\n            display: inline-block;\n            font-weight: 500;\n            text-align: center;\n            vertical-align: middle;\n            touch-action: manipulation;\n            background-image: none;\n            cursor: pointer;\n            border: 1px solid transparent;\n            white-space: nowrap;\n            -webkit-transition: background-color .15s ease-in-out;\n            -moz-transition: background-color .15s ease-in-out;\n            -o-transition: background-color .15s ease-in-out;\n            -webkit-user-select: none;\n            -moz-user-select: none;\n            -ms-user-select: none;\n            user-select: none;\n            padding: 8px 20px!important;\n            font-size: 1rem;\n            line-height: 1.6;\n            border-radius: 5px;\n        }\n        \n        .button--wide {\n            display: block;\n            width: 100%;\n        }\n        \n        .button--large {\n            padding: 10px 25px!important;\n            font-size: 1.2rem;\n            line-height: 1.7;\n            border-radius: 6px;\n        }\n        \n        .button--primary {\n            color: var(--ee-button-primary-color);\n            background-color: var(--ee-button-primary-bg);\n            border-color: var(--ee-button-primary-border);\n        }\n        \n        .button.disabled {\n            cursor: not-allowed;\n            opacity: .55;\n            box-shadow: none;\n        }\n        \n        .app-notice {\n            border: 1px solid var(--ee-border);\n            overflow: hidden;\n            background-color: var(--ee-bg-0);\n            border-radius: 5px;\n            display: flex;\n            margin-bottom: 20px;\n        }\n        \n        .app-notice---error {\n            border-color: var(--ee-error);\n            background-color: var(--ee-error-light);\n        }\n        \n        .app-notice---error .app-notice__tag {\n            color: var(--ee-error);\n        }\n\n        .app-notice---important {\n            border-color: var(--ee-warning);\n            background-color: var(--ee-warning-light);\n        }\n\n        .app-notice---important .app-notice__tag {\n            color: var(--ee-warning);\n        }\n        \n        .app-notice__tag {\n            padding: 15px 20px;\n            display: flex;\n            align-items: center;\n            justify-content: center;\n            font-size: 16px;\n        }\n        \n        .app-notice__icon {\n            position: relative;\n        }\n\n        .app-notice__icon::before {\n            font-family: \'Font Awesome 5 Free\';\n            font-weight: 900;\n            content: \"\\\\f06a\";\n            position: relative;\n            z-index: 2;\n        }\n        \n        .app-notice---error .app-notice__icon::after {\n            background: var(--ee-error-light);\n        }\n        \n        .app-notice__tag+.app-notice__content {\n            padding-left: 0;\n        }\n        \n        .app-notice__content {\n            flex: 1 1;\n            padding: 15px 20px;\n        }\n\n        .app-notice__content p {\n            margin: 0;\n            color: var(--ee-text-primary);\n            opacity: .6;\n        }\n        \n                </style>\n            </head>\n            <body>\n                <section class=\"flex-wrap\">\n                    <section class=\"wrap\">\n                        <div class=\"panel redirect\">\n                            <div class=\"redirect-inner\">\n                                <div class=\"panel-heading\">\n                                    <h3>{heading}</h3>\n                                </div>\n                                <div class=\"panel-body\">\n                                    {content}\n                                </div>\n                                <div class=\"panel-footer\">\n                                    {link}\n                                </div>\n                            </div>\n                        </div>\n                    </section>\n                </section>\n            </body>\n        </html>', NULL, 1663576672, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_stats`
--

CREATE TABLE `exp_stats` (
  `stat_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `total_members` mediumint(7) NOT NULL DEFAULT '0',
  `recent_member_id` int(10) NOT NULL DEFAULT '0',
  `recent_member` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_comment_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_visitor_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `most_visitors` mediumint(7) NOT NULL DEFAULT '0',
  `most_visitor_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_cache_clear` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_stats`
--

INSERT INTO `exp_stats` (`stat_id`, `site_id`, `total_members`, `recent_member_id`, `recent_member`, `total_entries`, `total_forum_topics`, `total_forum_posts`, `total_comments`, `last_entry_date`, `last_forum_post_date`, `last_comment_date`, `last_visitor_date`, `most_visitors`, `most_visitor_date`, `last_cache_clear`) VALUES
(1, 1, 1, 1, 'doug', 5, 0, 0, 0, 1605724440, 0, 0, 0, 0, 0, 1664180480);

-- --------------------------------------------------------

--
-- Table structure for table `exp_statuses`
--

CREATE TABLE `exp_statuses` (
  `status_id` int(6) UNSIGNED NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_order` int(3) UNSIGNED NOT NULL,
  `highlight` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_statuses`
--

INSERT INTO `exp_statuses` (`status_id`, `status`, `status_order`, `highlight`) VALUES
(1, 'open', 1, '009933'),
(2, 'closed', 2, '990000');

-- --------------------------------------------------------

--
-- Table structure for table `exp_statuses_roles`
--

CREATE TABLE `exp_statuses_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `status_id` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_statuses_roles`
--

INSERT INTO `exp_statuses_roles` (`role_id`, `status_id`) VALUES
(5, 1),
(5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `exp_templates`
--

CREATE TABLE `exp_templates` (
  `template_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int(6) UNSIGNED NOT NULL,
  `template_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'webpage',
  `template_data` mediumtext COLLATE utf8mb4_unicode_ci,
  `template_notes` text COLLATE utf8mb4_unicode_ci,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cache` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `refresh` int(6) UNSIGNED NOT NULL DEFAULT '0',
  `no_auth_bounce` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enable_http_auth` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `allow_php` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `php_parse_location` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'o',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `protect_javascript` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `enable_frontedit` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_templates`
--

INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`, `protect_javascript`, `enable_frontedit`) VALUES
(1, 1, 1, 'index', 'webpage', '{layout=\"layouts/main\"}\r\n            {exp:channel:entries channel=\"page\" url_title=\"homepage\"}\r\n                     <main class=\"mt-10 mx-auto max-w-screen-xl px-4 sm:mt-12 sm:px-6 md:mt-16 lg:mt-20 lg:px-8 xl:mt-28\">\r\n                        <div class=\"sm:text-center lg:text-left\">\r\n                           <h2 class=\"text-4xl tracking-tight leading-10 font-extrabold text-gray-900 sm:text-5xl sm:leading-none md:text-6xl\">\r\n                              <span class=\"mr-1\">{title}</span>\r\n                           </h2>\r\n                           <p class=\"mt-3 text-base text-gray-500 sm:mt-5 sm:text-lg sm:max-w-xl sm:mx-auto md:mt-5 md:text-xl lg:mx-0\">{subtitle}</p>\r\n                        </div>\r\n                     </main>\r\n                  </div>\r\n               </div>\r\n               <div class=\"lg:absolute lg:inset-y-0 lg:right-0 lg:w-1/2\"><img class=\"h-56 w-full object-cover sm:h-72 md:h-96 lg:w-full lg:h-full\" src=\"https://images.unsplash.com/photo-1551434678-e076c223a692?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=crop&amp;w=2850&amp;q=80\" alt=\"\"></div>\r\n            </div>\r\n            <section class=\"py-12 bg-gray-50 overflow-hidden md:py-20 lg:py-24\">\r\n               <div class=\"relative max-w-screen-xl mx-auto px-4 sm:px-6 lg:px-8\">\r\n                  <svg class=\"absolute top-full right-full transform translate-x-1/3 -translate-y-1/4 lg:translate-x-1/2 xl:-translate-y-1/2\" width=\"404\" height=\"404\" fill=\"none\" viewbox=\"0 0 404 404\" role=\"img\" aria-labelledby=\"svg-workcation\">\r\n                     <defs>\r\n                        <pattern id=\"ad119f34-7694-4c31-947f-5c9d249b21f3\" x=\"0\" y=\"0\" width=\"20\" height=\"20\" patternunits=\"userSpaceOnUse\">\r\n                           <rect class=\"text-gray-200\" x=\"0\" y=\"0\" width=\"4\" height=\"4\" fill=\"currentColor\"></rect>\r\n                        </pattern>\r\n                     </defs>\r\n                     <rect width=\"404\" height=\"404\" fill=\"url(#ad119f34-7694-4c31-947f-5c9d249b21f3)\"></rect>\r\n                  </svg>\r\n                  <div class=\"relative\">\r\n                  	{page_content}\r\n                  </div>\r\n               </div>\r\n            </section>\r\n         {/exp:channel:entries}\r\n         <div class=\"relative bg-gray-50 pt-16 pb-20 px-4 sm:px-6 lg:pt-24 lg:pb-28 lg:px-8\">\r\n            <div class=\"absolute inset-0\">\r\n               <div class=\"bg-white h-1/3 sm:h-2/3\"></div>\r\n            </div>\r\n            <div class=\"relative max-w-7xl mx-auto\">\r\n               <div class=\"text-center\">\r\n                  <h2 class=\"text-3xl leading-9 tracking-tight font-extrabold text-gray-900 sm:text-4xl sm:leading-10\">From the blog</h2>\r\n                  <p class=\"mt-3 max-w-2xl mx-auto text-xl leading-7 text-gray-500 sm:mt-4\">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsa libero labore natus atque, ducimus sed.</p>\r\n               </div>\r\n               <!-- Blog container -->\r\n               <div class=\"mt-12 grid gap-5 max-w-lg mx-auto lg:grid-cols-3 lg:max-w-none\">\r\n                  <!-- Blog card -->\r\n                  {exp:channel:entries channel=\"blog\" limit=\"3\" dynamic=\"no\"}\r\n                     {embed=\"embeds/blog-card\"\r\n                        url_title=\"{url_title}\"\r\n                        featured_image=\"{featured_image}\"\r\n                        categories=\'{if has_categories}{categories backspace=\"2\"}<a class=\"hover:underline\" href=\"/blog/entry/{url_title}\">{category_name}</a>, {/categories}{/if}\'\r\n                        title=\"{title}\"\r\n                        blog_content=\'{blog_content:attr_safe limit=\"150\"}\'\r\n                        author=\"{author}\"\r\n                        time_date=\"{entry_date format=\'%Y-%m-%d\'}\"\r\n                        pretty_date=\'{entry_date format=\"%M %d, %Y\"}\'\r\n                     }\r\n                  {/exp:channel:entries}\r\n               </div>\r\n            </div>\r\n         </div>', NULL, 1663371939, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(2, 1, 2, 'index', 'webpage', '{layout=\"layouts/main\"}\r\n				<main class=\"mt-10 mx-auto max-w-screen-xl px-4 sm:mt-12 sm:px-6 md:mt-16 lg:mt-20 lg:px-8 xl:mt-28\">\r\n                        <div class=\"sm:text-center lg:text-left\">\r\n                           <h2 class=\"text-4xl tracking-tight leading-10 font-extrabold text-gray-900 sm:text-5xl sm:leading-none md:text-6xl\">\r\n                              <span class=\"mr-1\">From the blog</span>\r\n                           </h2>\r\n                           <p class=\"mt-3 text-base text-gray-500 sm:mt-5 sm:text-lg sm:max-w-xl sm:mx-auto md:mt-5 md:text-xl lg:mx-0\">Sooooo good.</p>\r\n                        </div>\r\n                     </main>\r\n                  </div>\r\n               </div>\r\n\r\n               <div class=\"lg:absolute lg:inset-y-0 lg:right-0 lg:w-1/2\">\r\n               	<img class=\"absolute inset-0 object-cover\" src=\"https://images.unsplash.com/photo-1520333789090-1afc82db536a?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=center&amp;w=2102&amp;q=80\" alt=\"\"></div>\r\n		\r\n			<div class=\"relative bg-gray-50 pt-16 pb-20 px-4 sm:px-6 lg:pt-24 lg:pb-28 lg:px-8\">\r\n				<div class=\"absolute inset-0\">\r\n					<div class=\"bg-white h-1/3 sm:h-2/3\"></div>\r\n				</div>\r\n				<div class=\"relative max-w-7xl mx-auto\">\r\n					<div class=\"text-center\">\r\n						<h2 class=\"text-3xl leading-9 tracking-tight font-extrabold text-gray-900 sm:text-4xl sm:leading-10\">From the blog</h2>\r\n						<p class=\"mt-3 max-w-2xl mx-auto text-xl leading-7 text-gray-500 sm:mt-4\">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsa libero labore natus atque, ducimus sed.</p>\r\n					</div>\r\n					<!-- blog grid -->\r\n					<div class=\"mt-12 grid gap-5 max-w-lg mx-auto lg:grid-cols-3 lg:max-w-none\">\r\n						{exp:channel:entries channel=\"blog\" dynamic=\"no\"}\r\n						   <div class=\"flex flex-col rounded-lg shadow-lg overflow-hidden\">\r\n						      <div class=\"flex-shrink-0\">\r\n						         {featured_image}\r\n						            <img class=\"h-48 w-full object-cover\" src=\"{url}\" alt=\"{title}\" />\r\n						         {/featured_image}\r\n						      </div>\r\n						      <div class=\"flex-1 bg-white p-6 flex flex-col justify-between\">\r\n						         <div class=\"flex-1\">\r\n						            {!-- Categories --}\r\n						            <p class=\"text-sm leading-5 font-medium text-indigo-600\">\r\n						               {if has_categories}\r\n						                  {categories backspace=\"2\"}<a class=\"hover:underline\" href=\"/blog/entry/{url_title}\">{category_name}</a>, {/categories}\r\n						               {/if}\r\n						            </p>\r\n						            <a class=\"block\" href=\"/blog/entry/{url_title}\">\r\n						               <h3 class=\"mt-2 text-xl leading-7 font-semibold text-gray-900\">\r\n						                  {title}\r\n						               </h3>\r\n						               <p class=\"mt-3 text-base leading-6 text-gray-500\">{blog_content:attr_safe limit=\"150\"}</p>\r\n						            </a>\r\n						         </div>\r\n						         <div class=\"mt-6 flex items-center\">\r\n						            <div class=\"flex-shrink-0\">\r\n						               <a href=\"#\"><img class=\"h-10 w-10 rounded-full\" src=\"https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=facearea&amp;facepad=2&amp;w=256&amp;h=256&amp;q=80\" alt=\"\"></a></div>\r\n						            <div class=\"ml-3\">\r\n						               <p class=\"text-sm leading-5 font-medium text-gray-900\"><a class=\"hover:underline\" href=\"#\">{author}</a></p>\r\n						               <div class=\"flex text-sm leading-5 text-gray-500\">\r\n						                  <time datetime=\"{entry_date format=\'%Y-%m-%d\'}\">{entry_date format=\"%M %d, %Y\"}</time>\r\n						                  <span class=\"mx-1\">&middot;</span>\r\n						                  <span>6 min read</span>\r\n						               </div>\r\n						            </div>\r\n						         </div>\r\n						      </div>\r\n						   </div>\r\n						{/exp:channel:entries}\r\n					</div>\r\n				</div>\r\n			</div>', NULL, 1663371939, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(3, 1, 2, 'entry', 'webpage', '{layout=\"layouts/main\"}\r\n	{exp:channel:entries channel=\"blog\" url_title=\"{segment_3}\"}\r\n\r\n		{if no_results}\r\n			{redirect=\"404\"}\r\n		{/if}\r\n\r\n		{layout:set name=\"title\"}{title}{/layout:set}\r\n		{layout:set name=\"head_extra\"}\r\n			{seo}\r\n		{/layout:set}\r\n			<main class=\"mt-10 mx-auto max-w-screen-xl px-4 sm:mt-12 sm:px-6 md:mt-16 lg:mt-20 lg:px-8 xl:mt-28\">\r\n				<div class=\"sm:text-center lg:text-left\">\r\n					<h2 class=\"text-4xl tracking-tight leading-10 font-extrabold text-gray-900 sm:text-5xl sm:leading-none md:text-6xl\">\r\n						<span class=\"mr-1\">{title}</span>\r\n					</h2>\r\n				</div>\r\n			</main>\r\n		</div>\r\n	</div>\r\n\r\n	<div class=\"lg:absolute lg:inset-y-0 lg:right-0 lg:w-1/2\">\r\n		<img class=\"absolute inset-0 object-cover\" src=\"{featured_image}\" alt=\"\"></div>\r\n			<div class=\"relative py-16 bg-white overflow-hidden\">\r\n				<div class=\"hidden lg:block lg:absolute lg:inset-y-0 lg:h-full lg:w-full\">\r\n					<div class=\"relative h-full text-lg max-w-prose mx-auto\">\r\n						<svg class=\"absolute top-12 left-full transform translate-x-32\" width=\"404\" height=\"384\" fill=\"none\" viewbox=\"0 0 404 384\"><defs><pattern id=\"74b3fd99-0a6f-4271-bef2-e80eeafdf357\" x=\"0\" y=\"0\" width=\"20\" height=\"20\" patternunits=\"userSpaceOnUse\"><rect class=\"text-gray-200\" x=\"0\" y=\"0\" width=\"4\" height=\"4\" fill=\"currentColor\"></rect></pattern></defs><rect width=\"404\" height=\"384\" fill=\"url(#74b3fd99-0a6f-4271-bef2-e80eeafdf357)\"></rect></svg>\r\n						<svg class=\"absolute top-1/2 right-full transform -translate-y-1/2 -translate-x-32\" width=\"404\" height=\"384\" fill=\"none\" viewbox=\"0 0 404 384\"><defs><pattern id=\"f210dbf6-a58d-4871-961e-36d5016a0f49\" x=\"0\" y=\"0\" width=\"20\" height=\"20\" patternunits=\"userSpaceOnUse\"><rect class=\"text-gray-200\" x=\"0\" y=\"0\" width=\"4\" height=\"4\" fill=\"currentColor\"></rect></pattern></defs><rect width=\"404\" height=\"384\" fill=\"url(#f210dbf6-a58d-4871-961e-36d5016a0f49)\"></rect></svg>\r\n						<svg class=\"absolute bottom-12 left-full transform translate-x-32\" width=\"404\" height=\"384\" fill=\"none\" viewbox=\"0 0 404 384\"><defs><pattern id=\"d3eb07ae-5182-43e6-857d-35c643af9034\" x=\"0\" y=\"0\" width=\"20\" height=\"20\" patternunits=\"userSpaceOnUse\"><rect class=\"text-gray-200\" x=\"0\" y=\"0\" width=\"4\" height=\"4\" fill=\"currentColor\"></rect></pattern></defs><rect width=\"404\" height=\"384\" fill=\"url(#d3eb07ae-5182-43e6-857d-35c643af9034)\"></rect></svg>\r\n					</div>\r\n				</div>\r\n				<div class=\"relative px-4 sm:px-6 lg:px-8\">\r\n					{blog_content}\r\n				</div>\r\n			</div>\r\n			<div class=\"relative max-w-7xl mx-auto\">\r\n			   <div class=\"text-center\">\r\n			      <h2 class=\"text-3xl leading-9 tracking-tight font-extrabold text-gray-900 sm:text-4xl sm:leading-10\">Related Blogs</h2>\r\n			   </div>\r\n			   <!-- Blog container -->\r\n			   <div class=\"mt-12 grid gap-5 max-w-lg mx-auto lg:grid-cols-3 lg:max-w-none\">\r\n			      <!-- Blog card -->\r\n			      {related_blogs}\r\n			         <div class=\"flex flex-col rounded-lg shadow-lg overflow-hidden\">\r\n			            <div class=\"flex-shrink-0\">\r\n			               {related_blogs:featured_image}\r\n			                  <img class=\"h-48 w-full object-cover\" src=\"{url}\" alt=\"{title}\" />\r\n			               {/related_blogs:featured_image}\r\n			            </div>\r\n			            <div class=\"flex-1 bg-white p-6 flex flex-col justify-between\">\r\n			               <div class=\"flex-1\">\r\n			                  {!-- Categories --}\r\n			                  <p class=\"text-sm leading-5 font-medium text-indigo-600\">\r\n			                     {if related_blogs:has_categories}\r\n			                        {related_blogs:categories backspace=\"2\"}<a class=\"hover:underline\" href=\"/blog/entry/{url_title}\">{category_name}</a>, {/related_blogs:categories}\r\n			                     {/if}\r\n			                  </p>\r\n			                  {!-- End categories --}\r\n			                  <a class=\"block\" href=\"/blog/entry/{related_blogs:url_title}\">\r\n			                     <h3 class=\"mt-2 text-xl leading-7 font-semibold text-gray-900\">\r\n			                        {related_blogs:title}\r\n			                     </h3>\r\n			                     <p class=\"mt-3 text-base leading-6 text-gray-500\">{related_blogs:blog_content:attr_safe limit=\"150\"}</p>\r\n			                  </a>\r\n			               </div>\r\n			               <div class=\"mt-6 flex items-center\">\r\n			                  <div class=\"flex-shrink-0\">\r\n			                     <a href=\"#\"><img class=\"h-10 w-10 rounded-full\" src=\"https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=facearea&amp;facepad=2&amp;w=256&amp;h=256&amp;q=80\" alt=\"\"></a></div>\r\n			                  <div class=\"ml-3\">\r\n			                     <p class=\"text-sm leading-5 font-medium text-gray-900\"><a class=\"hover:underline\" href=\"#\">{related_blogs:author}</a></p>\r\n			                     <div class=\"flex text-sm leading-5 text-gray-500\">\r\n			                        <time datetime=\"{related_blogs:entry_date format=\'%Y-%m-%d\'}\">{related_blogs:entry_date format=\"%M %d, %Y\"}</time>\r\n			                        <span class=\"mx-1\">&middot;</span>\r\n			                        <span>6 min read</span>\r\n			                     </div>\r\n			                  </div>\r\n			               </div>\r\n			            </div>\r\n			         </div>\r\n			      {/related_blogs}\r\n			   </div>\r\n			</div>\r\n	{/exp:channel:entries}\r\n		\r\n<div class=\"bg-gray-800\">\r\n	<div class=\"max-w-screen-xl mx-auto py-12 px-4 sm:px-6 lg:py-16 lg:px-8 lg:flex lg:items-center\">\r\n		<div class=\"lg:w-0 lg:flex-1\">\r\n			<h2 class=\"text-3xl leading-9 font-extrabold tracking-tight text-white sm:text-4xl sm:leading-10\" id=\"newsletter-headline\">Sign up for our newsletter</h2>\r\n			<p class=\"mt-3 max-w-3xl text-lg leading-6 text-gray-300\">Anim aute id magna aliqua ad ad non deserunt sunt. Qui irure qui Lorem cupidatat commodo. Elit sunt amet fugiat veniam occaecat fugiat.</p>\r\n		</div>\r\n		<div class=\"mt-8 lg:mt-0 lg:ml-8\">\r\n			<form class=\"sm:flex\" aria-labelledby=\"newsletter-headline\">\r\n				<input class=\"appearance-none w-full px-5 py-3 border border-transparent text-base leading-6 rounded-md text-gray-900 bg-white placeholder-gray-500 focus:outline-none focus:placeholder-gray-400 transition duration-150 ease-in-out sm:max-w-xs\" aria-label=\"Email address\" type=\"email\" required=\"\" placeholder=\"Enter your email\">\r\n				<div class=\"mt-3 rounded-md shadow sm:mt-0 sm:ml-3 sm:flex-shrink-0\">\r\n					<button class=\"w-full flex items-center justify-center px-5 py-3 border border-transparent text-base leading-6 font-medium rounded-md text-white bg-indigo-500 hover:bg-indigo-400 focus:outline-none focus:bg-indigo-400 transition duration-150 ease-in-out\">Notify me</button>\r\n				</div>\r\n			</form>\r\n			<p class=\"mt-3 text-sm leading-5 text-gray-300\">We care about the protection of your data. Read our <a class=\"text-white font-medium underline\" href=\"#\">Privacy Policy.</a></p>\r\n		</div>\r\n	</div>\r\n</div>', NULL, 1663371939, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(4, 1, 3, 'main', 'webpage', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n   <head>\r\n      <title>{if layout:title}{layout:title}{if:else}Welcome to Our Site!{/if}</title>\r\n      <meta charset=\"utf-8\">\r\n      <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\r\n      <meta name=\"description\" content=\"\">\r\n      <meta name=\"author\" content=\"\">\r\n      <link rel=\"stylesheet\" href=\"https://rsms.me/inter/inter.css\">\r\n      <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/@tailwindcss/ui@latest/dist/tailwind-ui.min.css\">\r\n      <link rel=\"icon\" type=\"image/png\" sizes=\"16x16\" href=\"favicon-tailwind.png\">\r\n      <style type=\"text/css\">\r\n         html, .font-sans{font-family:\"Inter var\",system-ui,-apple-system,BlinkMacSystemFont,\"Segoe UI\",Roboto,\"Helvetica Neue\",Arial,\"Noto Sans\",sans-serif,\"Apple Color Emoji\",\"Segoe UI Emoji\",\"Segoe UI Symbol\",\"Noto Color Emoji\"}\r\n         .sm:font-sans{font-family:\"Inter var\",system-ui,-apple-system,BlinkMacSystemFont,\"Segoe UI\",Roboto,\"Helvetica Neue\",Arial,\"Noto Sans\",sans-serif,\"Apple Color Emoji\",\"Segoe UI Emoji\",\"Segoe UI Symbol\",\"Noto Color Emoji\"}\r\n         .md:font-sans{font-family:\"Inter var\",system-ui,-apple-system,BlinkMacSystemFont,\"Segoe UI\",Roboto,\"Helvetica Neue\",Arial,\"Noto Sans\",sans-serif,\"Apple Color Emoji\",\"Segoe UI Emoji\",\"Segoe UI Symbol\",\"Noto Color Emoji\"}\r\n         .lg:font-sans{font-family:\"Inter var\",system-ui,-apple-system,BlinkMacSystemFont,\"Segoe UI\",Roboto,\"Helvetica Neue\",Arial,\"Noto Sans\",sans-serif,\"Apple Color Emoji\",\"Segoe UI Emoji\",\"Segoe UI Symbol\",\"Noto Color Emoji\"}\r\n         .xl:font-sans{font-family:\"Inter var\",system-ui,-apple-system,BlinkMacSystemFont,\"Segoe UI\",Roboto,\"Helvetica Neue\",Arial,\"Noto Sans\",sans-serif,\"Apple Color Emoji\",\"Segoe UI Emoji\",\"Segoe UI Symbol\",\"Noto Color Emoji\"}\r\n      </style>\r\n      {layout:head_extra}\r\n   </head>\r\n   <body class=\"\">\r\n      {!-- Let\'s begin our layout --}\r\n      {top-nav}\r\n      {!-- THIS IS WHERE THE CONTENT WILL GO --}\r\n      {layout:contents}\r\n      {!-- THIS IS WHERE THE CONTENT ENDS --}\r\n      {footer}\r\n   </body>\r\n</html>', NULL, 1663371939, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(5, 1, 3, 'index', 'webpage', '', NULL, 1663371939, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(6, 1, 4, 'blog-card', 'webpage', '<div class=\"flex flex-col rounded-lg shadow-lg overflow-hidden\">\r\n   <div class=\"flex-shrink-0\">\r\n      <img class=\"h-48 w-full object-cover\" src=\"{embed:featured_image}\" />\r\n   </div>\r\n   <div class=\"flex-1 bg-white p-6 flex flex-col justify-between\">\r\n      <div class=\"flex-1\">\r\n         {!-- Categories --}\r\n         <p class=\"text-sm leading-5 font-medium text-indigo-600\">\r\n            {embed:categories}\r\n         </p>\r\n         {!-- End categories --}\r\n         <a class=\"block\" href=\"{route=\'blog/entry\' url_title=\'{embed:url_title}\'}\">\r\n            <h3 class=\"mt-2 text-xl leading-7 font-semibold text-gray-900\">\r\n               {embed:title}\r\n            </h3>\r\n            <p class=\"mt-3 text-base leading-6 text-gray-500\">{embed:blog_content}</p>\r\n         </a>\r\n      </div>\r\n      <div class=\"mt-6 flex items-center\">\r\n         <div class=\"flex-shrink-0\">\r\n            <a href=\"#\"><img class=\"h-10 w-10 rounded-full\" src=\"https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=facearea&amp;facepad=2&amp;w=256&amp;h=256&amp;q=80\" alt=\"\"></a></div>\r\n         <div class=\"ml-3\">\r\n            <p class=\"text-sm leading-5 font-medium text-gray-900\"><a class=\"hover:underline\" href=\"#\">{embed:author}</a></p>\r\n            <div class=\"flex text-sm leading-5 text-gray-500\">\r\n               <time datetime=\"{embed:time_date}\">{embed:pretty_date}</time>\r\n               <span class=\"mx-1\">&middot;</span>\r\n               <span>6 min read</span>\r\n            </div>\r\n         </div>\r\n      </div>\r\n   </div>\r\n</div>', NULL, 1663371939, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(7, 1, 4, 'index', 'webpage', '', NULL, 1663371939, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(8, 1, 5, 'index', 'webpage', '{layout=\"layouts/main\"}\r\n		<main class=\"mt-10 mx-auto max-w-screen-xl px-4 sm:mt-12 sm:px-6 md:mt-16 lg:mt-20 lg:px-8 xl:mt-28\">\r\n			<div class=\"sm:text-center lg:text-left\">\r\n				<h2 class=\"text-4xl tracking-tight leading-10 font-extrabold text-gray-900 sm:text-5xl sm:leading-none md:text-6xl\">\r\n					<span class=\"mr-1\">Contact Us</span>\r\n				</h2>\r\n			</div>\r\n		</main>\r\n	</div>\r\n</div>\r\n<div class=\"lg:absolute lg:inset-y-0 lg:right-0 lg:w-1/2\"><img class=\"h-56 w-full object-cover sm:h-72 md:h-96 lg:w-full lg:h-full\" src=\"https://images.unsplash.com/photo-1551434678-e076c223a692?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=crop&amp;w=2850&amp;q=80\" alt=\"\"></div>\r\n</div>\r\n<section class=\"py-12 bg-gray-50 overflow-hidden md:py-20 lg:py-24\">\r\n	<div class=\"relative max-w-screen-xl mx-auto px-4 sm:px-6 lg:px-8\">\r\n		<svg class=\"absolute top-full right-full transform translate-x-1/3 -translate-y-1/4 lg:translate-x-1/2 xl:-translate-y-1/2\" width=\"404\" height=\"404\" fill=\"none\" viewbox=\"0 0 404 404\" role=\"img\" aria-labelledby=\"svg-workcation\">\r\n			<defs>\r\n				<pattern id=\"ad119f34-7694-4c31-947f-5c9d249b21f3\" x=\"0\" y=\"0\" width=\"20\" height=\"20\" patternunits=\"userSpaceOnUse\">\r\n					<rect class=\"text-gray-200\" x=\"0\" y=\"0\" width=\"4\" height=\"4\" fill=\"currentColor\"></rect>\r\n				</pattern>\r\n			</defs>\r\n			<rect width=\"404\" height=\"404\" fill=\"url(#ad119f34-7694-4c31-947f-5c9d249b21f3)\"></rect>\r\n		</svg>\r\n		<div class=\"relative\">\r\n			{contact-form}\r\n		</div>\r\n	</div>\r\n</section>', NULL, 1663371939, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(9, 1, 1, '404', 'webpage', '{layout=\"layouts/main\"}\r\n		<main class=\"mt-10 mx-auto max-w-screen-xl px-4 sm:mt-12 sm:px-6 md:mt-16 lg:mt-20 lg:px-8 xl:mt-28\">\r\n			<div class=\"sm:text-center lg:text-left\">\r\n				<h2 class=\"text-4xl tracking-tight leading-10 font-extrabold text-gray-900 sm:text-5xl sm:leading-none md:text-6xl\">\r\n					<span class=\"mr-1\">Uh Oh</span>\r\n				</h2>\r\n			</div>\r\n		</main>\r\n	</div>\r\n</div>\r\n{partial-404}', NULL, 1663371939, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(10, 1, 6, 'sample-widget', 'webpage', '{widget title=\"Demo dashboard widget\" width=\"half\"}\n\n<p>Random entry: {exp:channel:entries dynamic=\"no\" orderby=\"random\" limit=\"1\"}<a href=\"{cp_url}?/cp/publish/edit/entry/{entry_id}&S={cp_session_id}\">{title}</a>{/exp:channel:entries}</p>\n\n<p>To see this code please visit the template <a href=\"{cp_url}?/cp/design/template/edit/10&S={cp_session_id}\">pro-dashboard-widgets/sample-widget</a>.</p>\n', NULL, 1663576772, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(11, 1, 6, 'index', 'webpage', '', NULL, 1663576776, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_templates_roles`
--

CREATE TABLE `exp_templates_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `template_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_templates_roles`
--

INSERT INTO `exp_templates_roles` (`role_id`, `template_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(5, 4),
(1, 5),
(2, 5),
(3, 5),
(4, 5),
(5, 5),
(1, 6),
(2, 6),
(3, 6),
(4, 6),
(5, 6),
(1, 7),
(2, 7),
(3, 7),
(4, 7),
(5, 7),
(1, 8),
(2, 8),
(3, 8),
(4, 8),
(5, 8),
(1, 9),
(2, 9),
(3, 9),
(4, 9),
(5, 9),
(1, 10),
(2, 10),
(3, 10),
(4, 10),
(5, 10),
(1, 11),
(2, 11),
(3, 11),
(4, 11),
(5, 11);

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_groups`
--

CREATE TABLE `exp_template_groups` (
  `group_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_order` int(3) UNSIGNED NOT NULL,
  `is_site_default` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_template_groups`
--

INSERT INTO `exp_template_groups` (`group_id`, `site_id`, `group_name`, `group_order`, `is_site_default`) VALUES
(1, 1, 'default', 1, 'y'),
(2, 1, 'blog', 2, 'n'),
(3, 1, 'layouts', 3, 'n'),
(4, 1, 'embeds', 4, 'n'),
(5, 1, 'contact', 5, 'n'),
(6, 1, 'pro-dashboard-widgets', 6, 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_groups_roles`
--

CREATE TABLE `exp_template_groups_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `template_group_id` mediumint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_routes`
--

CREATE TABLE `exp_template_routes` (
  `route_id` int(10) UNSIGNED NOT NULL,
  `template_id` int(10) UNSIGNED NOT NULL,
  `order` int(10) UNSIGNED DEFAULT NULL,
  `route` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_parsed` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_template_routes`
--

INSERT INTO `exp_template_routes` (`route_id`, `template_id`, `order`, `route`, `route_parsed`, `route_required`) VALUES
(4, 3, 0, '/blog/{url_title:regex[(((?!(P\\d+|category\\/)).)+?)]}', '^(blog)\\/((?P<e9cmtbr2ai884sw0o084cgc48cs888cs>(((?=\\b(((?!(P\\d+|category\\/)).)+?)\\b)([^\\/]*)))))?\\/?$', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_throttle`
--

CREATE TABLE `exp_throttle` (
  `throttle_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hits` int(10) UNSIGNED NOT NULL,
  `locked_out` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_update_log`
--

CREATE TABLE `exp_update_log` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `timestamp` int(10) UNSIGNED DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line` int(10) UNSIGNED DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_update_log`
--

INSERT INTO `exp_update_log` (`log_id`, `timestamp`, `message`, `method`, `line`, `file`) VALUES
(1, 1604839755, 'Smartforge::add_key failed. Table \'exp_comments\' does not exist.', 'Smartforge::add_key', 106, '/home/doug/sites/learn-ee/system/ee/ExpressionEngine/Addons/comment/upd.comment.php'),
(2, 1663576667, 'Running database update step: runUpdateFile[ud_6_00_00_rc_1.php]', NULL, NULL, NULL),
(3, 1663576667, 'Running database update step: runUpdateFile[ud_6_00_00.php]', NULL, NULL, NULL),
(4, 1663576668, 'Running database update step: runUpdateFile[ud_6_00_01.php]', NULL, NULL, NULL),
(5, 1663576668, 'Running database update step: runUpdateFile[ud_6_00_02.php]', NULL, NULL, NULL),
(6, 1663576668, 'Running database update step: runUpdateFile[ud_6_00_03.php]', NULL, NULL, NULL),
(7, 1663576669, 'Running database update step: runUpdateFile[ud_6_00_04.php]', NULL, NULL, NULL),
(8, 1663576669, 'Running database update step: runUpdateFile[ud_6_00_05.php]', NULL, NULL, NULL),
(9, 1663576669, 'Running database update step: runUpdateFile[ud_6_00_06.php]', NULL, NULL, NULL),
(10, 1663576669, 'Running database update step: runUpdateFile[ud_6_01_00_rc_1.php]', NULL, NULL, NULL),
(11, 1663576671, 'Running database update step: runUpdateFile[ud_6_01_00_rc_2.php]', NULL, NULL, NULL),
(12, 1663576671, 'Running database update step: runUpdateFile[ud_6_01_00.php]', NULL, NULL, NULL),
(13, 1663576671, 'Running database update step: runUpdateFile[ud_6_01_01.php]', NULL, NULL, NULL),
(14, 1663576671, 'Running database update step: runUpdateFile[ud_6_01_02.php]', NULL, NULL, NULL),
(15, 1663576672, 'Running database update step: runUpdateFile[ud_6_01_03.php]', NULL, NULL, NULL),
(16, 1663576672, 'Running database update step: runUpdateFile[ud_6_01_04.php]', NULL, NULL, NULL),
(17, 1663576672, 'Running database update step: runUpdateFile[ud_6_01_05.php]', NULL, NULL, NULL),
(18, 1663576672, 'Running database update step: runUpdateFile[ud_6_01_06.php]', NULL, NULL, NULL),
(19, 1663576672, 'Running database update step: runUpdateFile[ud_6_02_00.php]', NULL, NULL, NULL),
(20, 1663576674, 'Running database update step: runUpdateFile[ud_6_02_01.php]', NULL, NULL, NULL),
(21, 1663576674, 'Running database update step: runUpdateFile[ud_6_02_02.php]', NULL, NULL, NULL),
(22, 1663576674, 'Running database update step: runUpdateFile[ud_6_02_03.php]', NULL, NULL, NULL),
(23, 1663576674, 'Running database update step: runUpdateFile[ud_6_02_04.php]', NULL, NULL, NULL),
(24, 1663576674, 'Running database update step: runUpdateFile[ud_6_02_05.php]', NULL, NULL, NULL),
(25, 1663576675, 'Running database update step: runUpdateFile[ud_6_02_06.php]', NULL, NULL, NULL),
(26, 1663576675, 'Running database update step: runUpdateFile[ud_6_02_07.php]', NULL, NULL, NULL),
(27, 1663576675, 'Running database update step: runUpdateFile[ud_6_03_00.php]', NULL, NULL, NULL),
(28, 1663576676, 'Running database update step: runUpdateFile[ud_6_03_01.php]', NULL, NULL, NULL),
(29, 1663576676, 'Running database update step: runUpdateFile[ud_6_03_02.php]', NULL, NULL, NULL),
(30, 1663576676, 'Running database update step: runUpdateFile[ud_6_03_03.php]', NULL, NULL, NULL),
(31, 1663576676, 'Running database update step: runUpdateFile[ud_6_03_04.php]', NULL, NULL, NULL),
(32, 1663576676, 'Running database update step: runUpdateFile[ud_6_03_05.php]', NULL, NULL, NULL),
(33, 1663576677, 'Update complete. Now running version 6.3.5', NULL, NULL, NULL),
(34, 1663576770, 'Running database update step: runUpdateFile[ud_7_00_00_rc_1.php]', NULL, NULL, NULL),
(35, 1663576770, 'Smartforge::add_key failed. Table \'exp_dock_prolets\' does not exist.', 'Smartforge::add_key', 202, 'E:\\MAMP\\htdocs\\system\\ee\\ExpressionEngine\\Addons\\pro\\upd.pro.php'),
(36, 1663576773, 'Running database update step: runUpdateFile[ud_7_00_00_rc_2.php]', NULL, NULL, NULL),
(37, 1663576773, 'Running database update step: runUpdateFile[ud_7_00_00_rc_3.php]', NULL, NULL, NULL),
(38, 1663576773, 'Running database update step: runUpdateFile[ud_7_00_00_rc_4.php]', NULL, NULL, NULL),
(39, 1663576773, 'Running database update step: runUpdateFile[ud_7_00_00.php]', NULL, NULL, NULL),
(40, 1663576773, 'Running database update step: runUpdateFile[ud_7_00_01.php]', NULL, NULL, NULL),
(41, 1663576773, 'Running database update step: runUpdateFile[ud_7_00_02.php]', NULL, NULL, NULL),
(42, 1663576774, 'Running database update step: runUpdateFile[ud_7_00_03.php]', NULL, NULL, NULL),
(43, 1663576774, 'Running database update step: runUpdateFile[ud_7_01_00.php]', NULL, NULL, NULL),
(44, 1663576774, 'Running database update step: runUpdateFile[ud_7_01_01.php]', NULL, NULL, NULL),
(45, 1663576774, 'Running database update step: runUpdateFile[ud_7_01_02.php]', NULL, NULL, NULL),
(46, 1663576774, 'Running database update step: runUpdateFile[ud_7_01_03.php]', NULL, NULL, NULL),
(47, 1663576774, 'Running database update step: runUpdateFile[ud_7_01_04.php]', NULL, NULL, NULL),
(48, 1663576774, 'Running database update step: runUpdateFile[ud_7_01_05.php]', NULL, NULL, NULL),
(49, 1663576775, 'Update complete. Now running version 7.1.5', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exp_upload_prefs`
--

CREATE TABLE `exp_upload_prefs` (
  `id` int(4) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adapter` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `adapter_settings` text COLLATE utf8mb4_unicode_ci,
  `server_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed_types` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'img',
  `allow_subfolders` enum('y','n') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `subfolders_on_top` enum('y','n') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `default_modal_view` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'list',
  `max_size` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_height` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_width` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pre_format` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_format` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_properties` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_pre_format` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_post_format` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `batch_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_id` int(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_upload_prefs`
--

INSERT INTO `exp_upload_prefs` (`id`, `site_id`, `name`, `adapter`, `adapter_settings`, `server_path`, `url`, `allowed_types`, `allow_subfolders`, `subfolders_on_top`, `default_modal_view`, `max_size`, `max_height`, `max_width`, `properties`, `pre_format`, `post_format`, `file_properties`, `file_pre_format`, `file_post_format`, `cat_group`, `batch_location`, `module_id`) VALUES
(1, 1, 'Avatars', 'local', NULL, '{base_path}images/avatars/', '{base_url}images/avatars/', 'img', 'n', 'y', 'list', '50', '100', '100', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(2, 1, 'Member Photos', 'local', NULL, '/', '{base_url}images/member_photos/', 'img', 'n', 'y', 'list', '50', '100', '100', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(3, 1, 'Signature Attachments', 'local', NULL, '{base_path}images/signature_attachments/', '{base_url}images/signature_attachments/', 'img', 'n', 'y', 'list', '30', '80', '480', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(4, 1, 'PM Attachments', 'local', NULL, '{base_path}images/pm_attachments/', '{base_url}images/pm_attachments/', 'img', 'n', 'y', 'list', '250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(5, 1, 'Blog Images', 'local', NULL, '{base_path}/public/images/', '{base_url}/images/', 'img', 'n', 'y', 'list', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_upload_prefs_roles`
--

CREATE TABLE `exp_upload_prefs_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `upload_id` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_upload_prefs_roles`
--

INSERT INTO `exp_upload_prefs_roles` (`role_id`, `upload_id`) VALUES
(5, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `exp_actions`
--
ALTER TABLE `exp_actions`
  ADD PRIMARY KEY (`action_id`);

--
-- Indexes for table `exp_captcha`
--
ALTER TABLE `exp_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indexes for table `exp_categories`
--
ALTER TABLE `exp_categories`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `cat_name` (`cat_name`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `exp_category_fields`
--
ALTER TABLE `exp_category_fields`
  ADD PRIMARY KEY (`field_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `exp_category_field_data`
--
ALTER TABLE `exp_category_field_data`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `exp_category_groups`
--
ALTER TABLE `exp_category_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_category_posts`
--
ALTER TABLE `exp_category_posts`
  ADD PRIMARY KEY (`entry_id`,`cat_id`);

--
-- Indexes for table `exp_channels`
--
ALTER TABLE `exp_channels`
  ADD PRIMARY KEY (`channel_id`),
  ADD KEY `cat_group` (`cat_group`(191)),
  ADD KEY `channel_name` (`channel_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_channels_channel_fields`
--
ALTER TABLE `exp_channels_channel_fields`
  ADD PRIMARY KEY (`channel_id`,`field_id`);

--
-- Indexes for table `exp_channels_channel_field_groups`
--
ALTER TABLE `exp_channels_channel_field_groups`
  ADD PRIMARY KEY (`channel_id`,`group_id`);

--
-- Indexes for table `exp_channels_statuses`
--
ALTER TABLE `exp_channels_statuses`
  ADD PRIMARY KEY (`channel_id`,`status_id`);

--
-- Indexes for table `exp_channel_data`
--
ALTER TABLE `exp_channel_data`
  ADD PRIMARY KEY (`entry_id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_channel_data_field_1`
--
ALTER TABLE `exp_channel_data_field_1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_data_field_2`
--
ALTER TABLE `exp_channel_data_field_2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_data_field_3`
--
ALTER TABLE `exp_channel_data_field_3`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_data_field_4`
--
ALTER TABLE `exp_channel_data_field_4`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_data_field_5`
--
ALTER TABLE `exp_channel_data_field_5`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_data_field_6`
--
ALTER TABLE `exp_channel_data_field_6`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_data_field_7`
--
ALTER TABLE `exp_channel_data_field_7`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_data_field_8`
--
ALTER TABLE `exp_channel_data_field_8`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_entries_autosave`
--
ALTER TABLE `exp_channel_entries_autosave`
  ADD PRIMARY KEY (`entry_id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `url_title` (`url_title`(191)),
  ADD KEY `status` (`status`),
  ADD KEY `entry_date` (`entry_date`),
  ADD KEY `expiration_date` (`expiration_date`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_channel_entry_hidden_fields`
--
ALTER TABLE `exp_channel_entry_hidden_fields`
  ADD KEY `entry_id_field_id` (`entry_id`,`field_id`);

--
-- Indexes for table `exp_channel_fields`
--
ALTER TABLE `exp_channel_fields`
  ADD PRIMARY KEY (`field_id`),
  ADD KEY `field_type` (`field_type`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_channel_field_groups_fields`
--
ALTER TABLE `exp_channel_field_groups_fields`
  ADD PRIMARY KEY (`field_id`,`group_id`);

--
-- Indexes for table `exp_channel_form_settings`
--
ALTER TABLE `exp_channel_form_settings`
  ADD PRIMARY KEY (`channel_form_settings_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Indexes for table `exp_channel_member_roles`
--
ALTER TABLE `exp_channel_member_roles`
  ADD PRIMARY KEY (`role_id`,`channel_id`);

--
-- Indexes for table `exp_channel_titles`
--
ALTER TABLE `exp_channel_titles`
  ADD PRIMARY KEY (`entry_id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `url_title` (`url_title`(191)),
  ADD KEY `status` (`status`),
  ADD KEY `entry_date` (`entry_date`),
  ADD KEY `expiration_date` (`expiration_date`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `sticky_date_id_idx` (`sticky`,`entry_date`,`entry_id`);

--
-- Indexes for table `exp_comments`
--
ALTER TABLE `exp_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `entry_id_channel_id_author_id_status_site_id` (`entry_id`,`channel_id`,`author_id`,`status`,`site_id`);

--
-- Indexes for table `exp_comment_subscriptions`
--
ALTER TABLE `exp_comment_subscriptions`
  ADD PRIMARY KEY (`subscription_id`),
  ADD KEY `entry_id_member_id` (`entry_id`,`member_id`);

--
-- Indexes for table `exp_config`
--
ALTER TABLE `exp_config`
  ADD PRIMARY KEY (`config_id`),
  ADD KEY `site_key` (`site_id`,`key`);

--
-- Indexes for table `exp_consents`
--
ALTER TABLE `exp_consents`
  ADD PRIMARY KEY (`consent_id`),
  ADD KEY `consent_request_version_id` (`consent_request_version_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `exp_consent_audit_log`
--
ALTER TABLE `exp_consent_audit_log`
  ADD PRIMARY KEY (`consent_audit_id`),
  ADD KEY `consent_request_id` (`consent_request_id`);

--
-- Indexes for table `exp_consent_requests`
--
ALTER TABLE `exp_consent_requests`
  ADD PRIMARY KEY (`consent_request_id`);

--
-- Indexes for table `exp_consent_request_versions`
--
ALTER TABLE `exp_consent_request_versions`
  ADD PRIMARY KEY (`consent_request_version_id`),
  ADD KEY `consent_request_id` (`consent_request_id`);

--
-- Indexes for table `exp_consent_request_version_cookies`
--
ALTER TABLE `exp_consent_request_version_cookies`
  ADD KEY `consent_request_version_cookies` (`consent_request_version_id`,`cookie_id`);

--
-- Indexes for table `exp_content_types`
--
ALTER TABLE `exp_content_types`
  ADD PRIMARY KEY (`content_type_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `exp_cookie_settings`
--
ALTER TABLE `exp_cookie_settings`
  ADD PRIMARY KEY (`cookie_id`);

--
-- Indexes for table `exp_cp_log`
--
ALTER TABLE `exp_cp_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_dashboard_layouts`
--
ALTER TABLE `exp_dashboard_layouts`
  ADD PRIMARY KEY (`layout_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `exp_dashboard_layout_widgets`
--
ALTER TABLE `exp_dashboard_layout_widgets`
  ADD KEY `layouts_widgets` (`layout_id`,`widget_id`);

--
-- Indexes for table `exp_dashboard_widgets`
--
ALTER TABLE `exp_dashboard_widgets`
  ADD PRIMARY KEY (`widget_id`);

--
-- Indexes for table `exp_developer_log`
--
ALTER TABLE `exp_developer_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `exp_docks`
--
ALTER TABLE `exp_docks`
  ADD PRIMARY KEY (`dock_id`);

--
-- Indexes for table `exp_email_cache`
--
ALTER TABLE `exp_email_cache`
  ADD PRIMARY KEY (`cache_id`);

--
-- Indexes for table `exp_email_cache_mg`
--
ALTER TABLE `exp_email_cache_mg`
  ADD PRIMARY KEY (`cache_id`,`role_id`);

--
-- Indexes for table `exp_email_cache_ml`
--
ALTER TABLE `exp_email_cache_ml`
  ADD PRIMARY KEY (`cache_id`,`list_id`);

--
-- Indexes for table `exp_email_console_cache`
--
ALTER TABLE `exp_email_console_cache`
  ADD PRIMARY KEY (`cache_id`);

--
-- Indexes for table `exp_email_tracker`
--
ALTER TABLE `exp_email_tracker`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `exp_entry_manager_views`
--
ALTER TABLE `exp_entry_manager_views`
  ADD PRIMARY KEY (`view_id`),
  ADD KEY `channel_id` (`channel_id`,`member_id`),
  ADD KEY `channel_id_2` (`channel_id`,`member_id`);

--
-- Indexes for table `exp_entry_versioning`
--
ALTER TABLE `exp_entry_versioning`
  ADD PRIMARY KEY (`version_id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_extensions`
--
ALTER TABLE `exp_extensions`
  ADD PRIMARY KEY (`extension_id`),
  ADD KEY `enabled` (`enabled`);

--
-- Indexes for table `exp_fieldtypes`
--
ALTER TABLE `exp_fieldtypes`
  ADD PRIMARY KEY (`fieldtype_id`);

--
-- Indexes for table `exp_field_conditions`
--
ALTER TABLE `exp_field_conditions`
  ADD PRIMARY KEY (`condition_id`),
  ADD KEY `condition_set_id` (`condition_set_id`),
  ADD KEY `condition_field_id` (`condition_field_id`);

--
-- Indexes for table `exp_field_condition_sets`
--
ALTER TABLE `exp_field_condition_sets`
  ADD PRIMARY KEY (`condition_set_id`);

--
-- Indexes for table `exp_field_condition_sets_channel_fields`
--
ALTER TABLE `exp_field_condition_sets_channel_fields`
  ADD KEY `condition_set_id_field_id` (`condition_set_id`,`field_id`);

--
-- Indexes for table `exp_field_groups`
--
ALTER TABLE `exp_field_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_files`
--
ALTER TABLE `exp_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `upload_location_id` (`upload_location_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `model_type` (`model_type`),
  ADD KEY `file_type` (`file_type`),
  ADD KEY `directory_id` (`directory_id`);

--
-- Indexes for table `exp_file_categories`
--
ALTER TABLE `exp_file_categories`
  ADD PRIMARY KEY (`file_id`,`cat_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `exp_file_data`
--
ALTER TABLE `exp_file_data`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `exp_file_dimensions`
--
ALTER TABLE `exp_file_dimensions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upload_location_id` (`upload_location_id`);

--
-- Indexes for table `exp_file_manager_views`
--
ALTER TABLE `exp_file_manager_views`
  ADD PRIMARY KEY (`view_id`),
  ADD KEY `viewtype_upload_id_member_id` (`viewtype`,`upload_id`,`member_id`);

--
-- Indexes for table `exp_file_usage`
--
ALTER TABLE `exp_file_usage`
  ADD KEY `file_id` (`file_id`),
  ADD KEY `entry_id` (`entry_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `exp_file_watermarks`
--
ALTER TABLE `exp_file_watermarks`
  ADD PRIMARY KEY (`wm_id`);

--
-- Indexes for table `exp_fluid_field_data`
--
ALTER TABLE `exp_fluid_field_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fluid_field_id_entry_id` (`fluid_field_id`,`entry_id`);

--
-- Indexes for table `exp_global_variables`
--
ALTER TABLE `exp_global_variables`
  ADD PRIMARY KEY (`variable_id`),
  ADD KEY `variable_name` (`variable_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_grid_columns`
--
ALTER TABLE `exp_grid_columns`
  ADD PRIMARY KEY (`col_id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indexes for table `exp_html_buttons`
--
ALTER TABLE `exp_html_buttons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_layout_publish`
--
ALTER TABLE `exp_layout_publish`
  ADD PRIMARY KEY (`layout_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Indexes for table `exp_layout_publish_member_roles`
--
ALTER TABLE `exp_layout_publish_member_roles`
  ADD PRIMARY KEY (`layout_id`,`role_id`);

--
-- Indexes for table `exp_members`
--
ALTER TABLE `exp_members`
  ADD PRIMARY KEY (`member_id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `unique_id` (`unique_id`),
  ADD KEY `password` (`password`);

--
-- Indexes for table `exp_members_roles`
--
ALTER TABLE `exp_members_roles`
  ADD PRIMARY KEY (`member_id`,`role_id`);

--
-- Indexes for table `exp_members_role_groups`
--
ALTER TABLE `exp_members_role_groups`
  ADD PRIMARY KEY (`member_id`,`group_id`);

--
-- Indexes for table `exp_member_bulletin_board`
--
ALTER TABLE `exp_member_bulletin_board`
  ADD PRIMARY KEY (`bulletin_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `hash` (`hash`);

--
-- Indexes for table `exp_member_data`
--
ALTER TABLE `exp_member_data`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `exp_member_fields`
--
ALTER TABLE `exp_member_fields`
  ADD PRIMARY KEY (`m_field_id`);

--
-- Indexes for table `exp_member_news_views`
--
ALTER TABLE `exp_member_news_views`
  ADD PRIMARY KEY (`news_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `exp_member_search`
--
ALTER TABLE `exp_member_search`
  ADD PRIMARY KEY (`search_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_menu_items`
--
ALTER TABLE `exp_menu_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `set_id` (`set_id`);

--
-- Indexes for table `exp_menu_sets`
--
ALTER TABLE `exp_menu_sets`
  ADD PRIMARY KEY (`set_id`);

--
-- Indexes for table `exp_message_attachments`
--
ALTER TABLE `exp_message_attachments`
  ADD PRIMARY KEY (`attachment_id`);

--
-- Indexes for table `exp_message_copies`
--
ALTER TABLE `exp_message_copies`
  ADD PRIMARY KEY (`copy_id`),
  ADD KEY `message_id` (`message_id`),
  ADD KEY `recipient_id` (`recipient_id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexes for table `exp_message_data`
--
ALTER TABLE `exp_message_data`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexes for table `exp_message_folders`
--
ALTER TABLE `exp_message_folders`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `exp_message_listed`
--
ALTER TABLE `exp_message_listed`
  ADD PRIMARY KEY (`listed_id`);

--
-- Indexes for table `exp_migrations`
--
ALTER TABLE `exp_migrations`
  ADD PRIMARY KEY (`migration_id`);

--
-- Indexes for table `exp_modules`
--
ALTER TABLE `exp_modules`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `exp_module_member_roles`
--
ALTER TABLE `exp_module_member_roles`
  ADD PRIMARY KEY (`role_id`,`module_id`);

--
-- Indexes for table `exp_online_users`
--
ALTER TABLE `exp_online_users`
  ADD PRIMARY KEY (`online_id`),
  ADD KEY `date` (`date`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_password_lockout`
--
ALTER TABLE `exp_password_lockout`
  ADD PRIMARY KEY (`lockout_id`),
  ADD KEY `login_date` (`login_date`),
  ADD KEY `ip_address` (`ip_address`),
  ADD KEY `user_agent` (`user_agent`);

--
-- Indexes for table `exp_permissions`
--
ALTER TABLE `exp_permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD KEY `role_id_site_id` (`role_id`,`site_id`);

--
-- Indexes for table `exp_plugins`
--
ALTER TABLE `exp_plugins`
  ADD PRIMARY KEY (`plugin_id`);

--
-- Indexes for table `exp_prolets`
--
ALTER TABLE `exp_prolets`
  ADD PRIMARY KEY (`prolet_id`);

--
-- Indexes for table `exp_relationships`
--
ALTER TABLE `exp_relationships`
  ADD PRIMARY KEY (`relationship_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `child_id` (`child_id`),
  ADD KEY `field_id` (`field_id`),
  ADD KEY `fluid_field_data_id` (`fluid_field_data_id`),
  ADD KEY `grid_row_id` (`grid_row_id`);

--
-- Indexes for table `exp_remember_me`
--
ALTER TABLE `exp_remember_me`
  ADD PRIMARY KEY (`remember_me_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `exp_reset_password`
--
ALTER TABLE `exp_reset_password`
  ADD PRIMARY KEY (`reset_id`);

--
-- Indexes for table `exp_revision_tracker`
--
ALTER TABLE `exp_revision_tracker`
  ADD PRIMARY KEY (`tracker_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `exp_roles`
--
ALTER TABLE `exp_roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `exp_roles_role_groups`
--
ALTER TABLE `exp_roles_role_groups`
  ADD PRIMARY KEY (`role_id`,`group_id`);

--
-- Indexes for table `exp_role_groups`
--
ALTER TABLE `exp_role_groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `exp_role_settings`
--
ALTER TABLE `exp_role_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id_site_id` (`role_id`,`site_id`);

--
-- Indexes for table `exp_rte_toolsets`
--
ALTER TABLE `exp_rte_toolsets`
  ADD PRIMARY KEY (`toolset_id`);

--
-- Indexes for table `exp_search`
--
ALTER TABLE `exp_search`
  ADD PRIMARY KEY (`search_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_search_log`
--
ALTER TABLE `exp_search_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_security_hashes`
--
ALTER TABLE `exp_security_hashes`
  ADD PRIMARY KEY (`hash_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `exp_sessions`
--
ALTER TABLE `exp_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `exp_sites`
--
ALTER TABLE `exp_sites`
  ADD PRIMARY KEY (`site_id`),
  ADD KEY `site_name` (`site_name`);

--
-- Indexes for table `exp_snippets`
--
ALTER TABLE `exp_snippets`
  ADD PRIMARY KEY (`snippet_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_specialty_templates`
--
ALTER TABLE `exp_specialty_templates`
  ADD PRIMARY KEY (`template_id`),
  ADD KEY `template_name` (`template_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_stats`
--
ALTER TABLE `exp_stats`
  ADD PRIMARY KEY (`stat_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_statuses`
--
ALTER TABLE `exp_statuses`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `exp_statuses_roles`
--
ALTER TABLE `exp_statuses_roles`
  ADD PRIMARY KEY (`status_id`,`role_id`);

--
-- Indexes for table `exp_templates`
--
ALTER TABLE `exp_templates`
  ADD PRIMARY KEY (`template_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `template_name` (`template_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_templates_roles`
--
ALTER TABLE `exp_templates_roles`
  ADD PRIMARY KEY (`template_id`,`role_id`);

--
-- Indexes for table `exp_template_groups`
--
ALTER TABLE `exp_template_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `group_name_idx` (`group_name`),
  ADD KEY `group_order_idx` (`group_order`);

--
-- Indexes for table `exp_template_groups_roles`
--
ALTER TABLE `exp_template_groups_roles`
  ADD PRIMARY KEY (`role_id`,`template_group_id`);

--
-- Indexes for table `exp_template_routes`
--
ALTER TABLE `exp_template_routes`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `template_id` (`template_id`);

--
-- Indexes for table `exp_throttle`
--
ALTER TABLE `exp_throttle`
  ADD PRIMARY KEY (`throttle_id`),
  ADD KEY `ip_address` (`ip_address`),
  ADD KEY `last_activity` (`last_activity`);

--
-- Indexes for table `exp_update_log`
--
ALTER TABLE `exp_update_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `exp_upload_prefs`
--
ALTER TABLE `exp_upload_prefs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_upload_prefs_roles`
--
ALTER TABLE `exp_upload_prefs_roles`
  ADD PRIMARY KEY (`upload_id`,`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `exp_actions`
--
ALTER TABLE `exp_actions`
  MODIFY `action_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `exp_captcha`
--
ALTER TABLE `exp_captcha`
  MODIFY `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_categories`
--
ALTER TABLE `exp_categories`
  MODIFY `cat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `exp_category_fields`
--
ALTER TABLE `exp_category_fields`
  MODIFY `field_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_category_groups`
--
ALTER TABLE `exp_category_groups`
  MODIFY `group_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_channels`
--
ALTER TABLE `exp_channels`
  MODIFY `channel_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exp_channel_data_field_1`
--
ALTER TABLE `exp_channel_data_field_1`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exp_channel_data_field_2`
--
ALTER TABLE `exp_channel_data_field_2`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exp_channel_data_field_3`
--
ALTER TABLE `exp_channel_data_field_3`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exp_channel_data_field_4`
--
ALTER TABLE `exp_channel_data_field_4`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exp_channel_data_field_5`
--
ALTER TABLE `exp_channel_data_field_5`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_channel_data_field_6`
--
ALTER TABLE `exp_channel_data_field_6`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_channel_data_field_7`
--
ALTER TABLE `exp_channel_data_field_7`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_channel_data_field_8`
--
ALTER TABLE `exp_channel_data_field_8`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_channel_entries_autosave`
--
ALTER TABLE `exp_channel_entries_autosave`
  MODIFY `entry_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_channel_fields`
--
ALTER TABLE `exp_channel_fields`
  MODIFY `field_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `exp_channel_form_settings`
--
ALTER TABLE `exp_channel_form_settings`
  MODIFY `channel_form_settings_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exp_channel_titles`
--
ALTER TABLE `exp_channel_titles`
  MODIFY `entry_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `exp_comments`
--
ALTER TABLE `exp_comments`
  MODIFY `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_comment_subscriptions`
--
ALTER TABLE `exp_comment_subscriptions`
  MODIFY `subscription_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_config`
--
ALTER TABLE `exp_config`
  MODIFY `config_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `exp_consents`
--
ALTER TABLE `exp_consents`
  MODIFY `consent_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_consent_audit_log`
--
ALTER TABLE `exp_consent_audit_log`
  MODIFY `consent_audit_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_consent_requests`
--
ALTER TABLE `exp_consent_requests`
  MODIFY `consent_request_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exp_consent_request_versions`
--
ALTER TABLE `exp_consent_request_versions`
  MODIFY `consent_request_version_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exp_content_types`
--
ALTER TABLE `exp_content_types`
  MODIFY `content_type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exp_cookie_settings`
--
ALTER TABLE `exp_cookie_settings`
  MODIFY `cookie_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `exp_cp_log`
--
ALTER TABLE `exp_cp_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `exp_dashboard_layouts`
--
ALTER TABLE `exp_dashboard_layouts`
  MODIFY `layout_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_dashboard_widgets`
--
ALTER TABLE `exp_dashboard_widgets`
  MODIFY `widget_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `exp_developer_log`
--
ALTER TABLE `exp_developer_log`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_docks`
--
ALTER TABLE `exp_docks`
  MODIFY `dock_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_email_cache`
--
ALTER TABLE `exp_email_cache`
  MODIFY `cache_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exp_email_console_cache`
--
ALTER TABLE `exp_email_console_cache`
  MODIFY `cache_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_email_tracker`
--
ALTER TABLE `exp_email_tracker`
  MODIFY `email_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_entry_manager_views`
--
ALTER TABLE `exp_entry_manager_views`
  MODIFY `view_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_entry_versioning`
--
ALTER TABLE `exp_entry_versioning`
  MODIFY `version_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_extensions`
--
ALTER TABLE `exp_extensions`
  MODIFY `extension_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_fieldtypes`
--
ALTER TABLE `exp_fieldtypes`
  MODIFY `fieldtype_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `exp_field_conditions`
--
ALTER TABLE `exp_field_conditions`
  MODIFY `condition_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_field_condition_sets`
--
ALTER TABLE `exp_field_condition_sets`
  MODIFY `condition_set_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_field_groups`
--
ALTER TABLE `exp_field_groups`
  MODIFY `group_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exp_files`
--
ALTER TABLE `exp_files`
  MODIFY `file_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exp_file_dimensions`
--
ALTER TABLE `exp_file_dimensions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_file_manager_views`
--
ALTER TABLE `exp_file_manager_views`
  MODIFY `view_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_file_watermarks`
--
ALTER TABLE `exp_file_watermarks`
  MODIFY `wm_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_fluid_field_data`
--
ALTER TABLE `exp_fluid_field_data`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_global_variables`
--
ALTER TABLE `exp_global_variables`
  MODIFY `variable_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_grid_columns`
--
ALTER TABLE `exp_grid_columns`
  MODIFY `col_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_html_buttons`
--
ALTER TABLE `exp_html_buttons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `exp_layout_publish`
--
ALTER TABLE `exp_layout_publish`
  MODIFY `layout_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_members`
--
ALTER TABLE `exp_members`
  MODIFY `member_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_member_bulletin_board`
--
ALTER TABLE `exp_member_bulletin_board`
  MODIFY `bulletin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_member_fields`
--
ALTER TABLE `exp_member_fields`
  MODIFY `m_field_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_member_news_views`
--
ALTER TABLE `exp_member_news_views`
  MODIFY `news_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_menu_items`
--
ALTER TABLE `exp_menu_items`
  MODIFY `item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_menu_sets`
--
ALTER TABLE `exp_menu_sets`
  MODIFY `set_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_message_attachments`
--
ALTER TABLE `exp_message_attachments`
  MODIFY `attachment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_message_copies`
--
ALTER TABLE `exp_message_copies`
  MODIFY `copy_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_message_data`
--
ALTER TABLE `exp_message_data`
  MODIFY `message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_message_listed`
--
ALTER TABLE `exp_message_listed`
  MODIFY `listed_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_migrations`
--
ALTER TABLE `exp_migrations`
  MODIFY `migration_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_modules`
--
ALTER TABLE `exp_modules`
  MODIFY `module_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `exp_online_users`
--
ALTER TABLE `exp_online_users`
  MODIFY `online_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_password_lockout`
--
ALTER TABLE `exp_password_lockout`
  MODIFY `lockout_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `exp_permissions`
--
ALTER TABLE `exp_permissions`
  MODIFY `permission_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `exp_plugins`
--
ALTER TABLE `exp_plugins`
  MODIFY `plugin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_prolets`
--
ALTER TABLE `exp_prolets`
  MODIFY `prolet_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_relationships`
--
ALTER TABLE `exp_relationships`
  MODIFY `relationship_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `exp_reset_password`
--
ALTER TABLE `exp_reset_password`
  MODIFY `reset_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_revision_tracker`
--
ALTER TABLE `exp_revision_tracker`
  MODIFY `tracker_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_roles`
--
ALTER TABLE `exp_roles`
  MODIFY `role_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `exp_role_groups`
--
ALTER TABLE `exp_role_groups`
  MODIFY `group_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_role_settings`
--
ALTER TABLE `exp_role_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `exp_rte_toolsets`
--
ALTER TABLE `exp_rte_toolsets`
  MODIFY `toolset_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `exp_search_log`
--
ALTER TABLE `exp_search_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_security_hashes`
--
ALTER TABLE `exp_security_hashes`
  MODIFY `hash_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `exp_sites`
--
ALTER TABLE `exp_sites`
  MODIFY `site_id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_snippets`
--
ALTER TABLE `exp_snippets`
  MODIFY `snippet_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `exp_specialty_templates`
--
ALTER TABLE `exp_specialty_templates`
  MODIFY `template_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `exp_stats`
--
ALTER TABLE `exp_stats`
  MODIFY `stat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_statuses`
--
ALTER TABLE `exp_statuses`
  MODIFY `status_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exp_templates`
--
ALTER TABLE `exp_templates`
  MODIFY `template_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `exp_template_groups`
--
ALTER TABLE `exp_template_groups`
  MODIFY `group_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `exp_template_routes`
--
ALTER TABLE `exp_template_routes`
  MODIFY `route_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `exp_throttle`
--
ALTER TABLE `exp_throttle`
  MODIFY `throttle_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_update_log`
--
ALTER TABLE `exp_update_log`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `exp_upload_prefs`
--
ALTER TABLE `exp_upload_prefs`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
