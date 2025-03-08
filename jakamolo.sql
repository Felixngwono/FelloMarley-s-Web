-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2025 at 06:14 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jakamolo`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add blog post', 7, 'add_blogpost'),
(26, 'Can change blog post', 7, 'change_blogpost'),
(27, 'Can delete blog post', 7, 'delete_blogpost'),
(28, 'Can view blog post', 7, 'view_blogpost'),
(29, 'Can add contact', 8, 'add_contact'),
(30, 'Can change contact', 8, 'change_contact'),
(31, 'Can delete contact', 8, 'delete_contact'),
(32, 'Can view contact', 8, 'view_contact'),
(33, 'Can add education level', 9, 'add_educationlevel'),
(34, 'Can change education level', 9, 'change_educationlevel'),
(35, 'Can delete education level', 9, 'delete_educationlevel'),
(36, 'Can view education level', 9, 'view_educationlevel'),
(37, 'Can add event category', 10, 'add_eventcategory'),
(38, 'Can change event category', 10, 'change_eventcategory'),
(39, 'Can delete event category', 10, 'delete_eventcategory'),
(40, 'Can view event category', 10, 'view_eventcategory'),
(41, 'Can add event location', 11, 'add_eventlocation'),
(42, 'Can change event location', 11, 'change_eventlocation'),
(43, 'Can delete event location', 11, 'delete_eventlocation'),
(44, 'Can view event location', 11, 'view_eventlocation'),
(45, 'Can add image gallery', 12, 'add_imagegallery'),
(46, 'Can change image gallery', 12, 'change_imagegallery'),
(47, 'Can delete image gallery', 12, 'delete_imagegallery'),
(48, 'Can view image gallery', 12, 'view_imagegallery'),
(49, 'Can add message', 13, 'add_message'),
(50, 'Can change message', 13, 'change_message'),
(51, 'Can delete message', 13, 'delete_message'),
(52, 'Can view message', 13, 'view_message'),
(53, 'Can add user', 14, 'add_myuser'),
(54, 'Can change user', 14, 'change_myuser'),
(55, 'Can delete user', 14, 'delete_myuser'),
(56, 'Can view user', 14, 'view_myuser'),
(57, 'Can add portfolio item', 15, 'add_portfolioitem'),
(58, 'Can change portfolio item', 15, 'change_portfolioitem'),
(59, 'Can delete portfolio item', 15, 'delete_portfolioitem'),
(60, 'Can view portfolio item', 15, 'view_portfolioitem'),
(61, 'Can add sibling', 16, 'add_sibling'),
(62, 'Can change sibling', 16, 'change_sibling'),
(63, 'Can delete sibling', 16, 'delete_sibling'),
(64, 'Can view sibling', 16, 'view_sibling'),
(65, 'Can add task', 17, 'add_task'),
(66, 'Can change task', 17, 'change_task'),
(67, 'Can delete task', 17, 'delete_task'),
(68, 'Can view task', 17, 'view_task'),
(69, 'Can add support', 18, 'add_support'),
(70, 'Can change support', 18, 'change_support'),
(71, 'Can delete support', 18, 'delete_support'),
(72, 'Can view support', 18, 'view_support'),
(73, 'Can add notification', 19, 'add_notification'),
(74, 'Can change notification', 19, 'change_notification'),
(75, 'Can delete notification', 19, 'delete_notification'),
(76, 'Can view notification', 19, 'view_notification'),
(77, 'Can add event', 20, 'add_event'),
(78, 'Can change event', 20, 'change_event'),
(79, 'Can delete event', 20, 'delete_event'),
(80, 'Can view event', 20, 'view_event'),
(81, 'Can add activity', 21, 'add_activity'),
(82, 'Can change activity', 21, 'change_activity'),
(83, 'Can delete activity', 21, 'delete_activity'),
(84, 'Can view activity', 21, 'view_activity'),
(85, 'Can add certification', 22, 'add_certification'),
(86, 'Can change certification', 22, 'change_certification'),
(87, 'Can delete certification', 22, 'delete_certification'),
(88, 'Can view certification', 22, 'view_certification'),
(89, 'Can add contact submission', 23, 'add_contactsubmission'),
(90, 'Can change contact submission', 23, 'change_contactsubmission'),
(91, 'Can delete contact submission', 23, 'delete_contactsubmission'),
(92, 'Can view contact submission', 23, 'view_contactsubmission'),
(93, 'Can add newsletter subscriber', 24, 'add_newslettersubscriber'),
(94, 'Can change newsletter subscriber', 24, 'change_newslettersubscriber'),
(95, 'Can delete newsletter subscriber', 24, 'delete_newslettersubscriber'),
(96, 'Can view newsletter subscriber', 24, 'view_newslettersubscriber'),
(97, 'Can add project', 25, 'add_project'),
(98, 'Can change project', 25, 'change_project'),
(99, 'Can delete project', 25, 'delete_project'),
(100, 'Can view project', 25, 'view_project'),
(101, 'Can add skill', 26, 'add_skill'),
(102, 'Can change skill', 26, 'change_skill'),
(103, 'Can delete skill', 26, 'delete_skill'),
(104, 'Can view skill', 26, 'view_skill'),
(105, 'Can add blog comment', 27, 'add_blogcomment'),
(106, 'Can change blog comment', 27, 'change_blogcomment'),
(107, 'Can delete blog comment', 27, 'delete_blogcomment'),
(108, 'Can view blog comment', 27, 'view_blogcomment');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$R91kWn8igEXz5iycZGZxJr$Y3gKrV3WNRqQcIJAyfXcsKfjqEJAbSRiq7KfoVxBrag=', '2025-02-20 14:18:28.078561', 1, 'StoryTeller', '', '', 'fellomarley@gmail.com', 1, 1, '2025-02-17 15:30:37.955084');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(21, 'StoryTeller', 'activity'),
(27, 'StoryTeller', 'blogcomment'),
(7, 'StoryTeller', 'blogpost'),
(22, 'StoryTeller', 'certification'),
(8, 'StoryTeller', 'contact'),
(23, 'StoryTeller', 'contactsubmission'),
(9, 'StoryTeller', 'educationlevel'),
(20, 'StoryTeller', 'event'),
(10, 'StoryTeller', 'eventcategory'),
(11, 'StoryTeller', 'eventlocation'),
(12, 'StoryTeller', 'imagegallery'),
(13, 'StoryTeller', 'message'),
(14, 'StoryTeller', 'myuser'),
(24, 'StoryTeller', 'newslettersubscriber'),
(19, 'StoryTeller', 'notification'),
(15, 'StoryTeller', 'portfolioitem'),
(25, 'StoryTeller', 'project'),
(16, 'StoryTeller', 'sibling'),
(26, 'StoryTeller', 'skill'),
(18, 'StoryTeller', 'support'),
(17, 'StoryTeller', 'task');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-02-17 15:27:54.342083'),
(2, 'contenttypes', '0002_remove_content_type_name', '2025-02-17 15:27:54.980099'),
(3, 'auth', '0001_initial', '2025-02-17 15:28:05.231178'),
(4, 'auth', '0002_alter_permission_name_max_length', '2025-02-17 15:28:05.906689'),
(5, 'auth', '0003_alter_user_email_max_length', '2025-02-17 15:28:06.032819'),
(6, 'auth', '0004_alter_user_username_opts', '2025-02-17 15:28:06.106930'),
(7, 'auth', '0005_alter_user_last_login_null', '2025-02-17 15:28:06.599553'),
(8, 'auth', '0006_require_contenttypes_0002', '2025-02-17 15:28:06.631536'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2025-02-17 15:28:06.666514'),
(10, 'auth', '0008_alter_user_username_max_length', '2025-02-17 15:28:06.750467'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2025-02-17 15:28:06.849560'),
(12, 'auth', '0010_alter_group_name_max_length', '2025-02-17 15:28:06.933512'),
(13, 'auth', '0011_update_proxy_permissions', '2025-02-17 15:28:06.961496'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2025-02-17 15:28:07.050445'),
(15, 'StoryTeller', '0001_initial', '2025-02-17 15:28:24.727828'),
(16, 'admin', '0001_initial', '2025-02-17 15:28:26.751900'),
(17, 'admin', '0002_logentry_remove_auto_add', '2025-02-17 15:28:26.783402'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2025-02-17 15:28:26.851884'),
(19, 'sessions', '0001_initial', '2025-02-17 15:28:27.564403'),
(20, 'StoryTeller', '0002_blogcomment_certification_contactsubmission_newslettersubscriber_project_skill', '2025-02-19 08:43:53.004292'),
(21, 'StoryTeller', '0003_auto_20250219_1247', '2025-02-19 09:47:44.103030'),
(22, 'StoryTeller', '0004_auto_20250219_2324', '2025-02-19 20:24:13.750844'),
(23, 'StoryTeller', '0005_auto_20250221_0957', '2025-02-21 06:57:34.648986'),
(24, 'StoryTeller', '0006_contact_image', '2025-02-21 11:08:55.162881'),
(25, 'StoryTeller', '0007_auto_20250221_1504', '2025-02-21 12:04:52.050360');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('bsy7zha6n3ik83z1me01ji8wsk9rmk8b', '.eJxVjEEOwiAQRe_C2hCGFgGX7nsGMjNMpWpoUtqV8e7apAvd_vfef6mE21rS1mRJU1YXBer0uxHyQ-oO8h3rbdY813WZSO-KPmjTw5zleT3cv4OCrXzr7uwFHZA1vePQA7ELhnzMzkbmESgIjS6C80ZCxxzQg0GLlG0UQ6DeH9nwN_E:1tl7Nk:HKt7LiDeiBt-BvzTUwoRm6Z9SYctzQl5cBBtriYAiEs', '2025-03-06 14:18:28.204398'),
('mes3zbqcranjv27v2z3ekjgbwfu5byrv', '.eJxVjEEOwiAQRe_C2hCGFgGX7nsGMjNMpWpoUtqV8e7apAvd_vfef6mE21rS1mRJU1YXBer0uxHyQ-oO8h3rbdY813WZSO-KPmjTw5zleT3cv4OCrXzr7uwFHZA1vePQA7ELhnzMzkbmESgIjS6C80ZCxxzQg0GLlG0UQ6DeH9nwN_E:1tkgWU:wFXr-jPeM5ptuPQv1sOkcR_4_XV9PKH-G_pp8TBGeJU', '2025-03-05 09:37:42.564933');

-- --------------------------------------------------------

--
-- Table structure for table `storyteller_activity`
--

CREATE TABLE `storyteller_activity` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storyteller_activity`
--

INSERT INTO `storyteller_activity` (`id`, `title`, `description`, `created_at`, `user_id`) VALUES
(1, 'Attending Project Workshop', 'As a project manager, will be attending workshop for further studie', '2025-02-19 09:53:54.444293', 1),
(2, 'sdrtyh', 'zdfgjhmn', '2025-02-19 09:54:11.557828', 1);

-- --------------------------------------------------------

--
-- Table structure for table `storyteller_blogpost`
--

CREATE TABLE `storyteller_blogpost` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storyteller_blogpost`
--

INSERT INTO `storyteller_blogpost` (`id`, `title`, `content`, `created_at`, `updated_at`, `image`) VALUES
(1, 'Waititu crisis', 'Waititu to pay 53.3million or serve 12yrs in prison', '2025-02-18 17:49:54.167512', '2025-02-18 17:49:54.167512', 'blog_images/Buore.JPG'),
(2, 'AU election', 'Come 15th Feb, Raila is voted to be the AU chairman. Its also been announced if Raila doesnt win the election, it will be a calamicious crisis to doc Samoei', '2025-02-18 17:55:26.354138', '2025-02-18 17:55:26.354138', 'blog_images/judiciary_F5nziLd.webp'),
(3, 'FelloMarley the programmer', 'My first website to bulid was about\' youth empowerment\"', '2025-02-18 17:59:51.140891', '2025-02-20 08:48:25.380439', 'blog_images/flag.jpeg'),
(6, 'zxcdfgvb', 'xzxdfgbv', '2025-02-20 13:39:59.277793', '2025-02-20 13:39:59.277793', 'blog_images/carrots_tjrk5F4.jpg'),
(7, 'zxcdfgvb', 'xzxdfgbv', '2025-02-20 13:39:59.273801', '2025-02-20 13:39:59.273801', 'blog_images/carrots.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `storyteller_certification`
--

CREATE TABLE `storyteller_certification` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `issuing_organization` varchar(255) NOT NULL,
  `date_issued` date NOT NULL,
  `credential_url` varchar(200) DEFAULT NULL,
  `certificate_pdf` varchar(100) DEFAULT NULL,
  `certificate_image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storyteller_certification`
--

INSERT INTO `storyteller_certification` (`id`, `title`, `issuing_organization`, `date_issued`, `credential_url`, `certificate_pdf`, `certificate_image`) VALUES
(1, 'ghertyhjk', 'jhgtrfdedtyguijol;', '2025-01-30', 'https://github.com/Felixngwono/FelloMarley', 'certificates/IMG-20240124-WA0033.jpg', 'certificate_images/Architecture-Portfolio-Cover-1024x683.webp'),
(3, 'HJKK', 'bnghbvfgtyui', '2025-01-28', 'https://github.com/Felixngwono/FelloMarley', 'certificates/IMG_20240405_150049_1.jpg', NULL),
(4, 'Django Certification', 'Linked In', '2025-02-05', 'https://github.com/Felixngwono/FelloMarley', 'certificates/Felix_Odhiambos_CV.docx', 'certificate_images/33.png');

-- --------------------------------------------------------

--
-- Table structure for table `storyteller_contact`
--

CREATE TABLE `storyteller_contact` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` int(11) NOT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `message` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storyteller_contact`
--

INSERT INTO `storyteller_contact` (`id`, `name`, `email`, `phone`, `date_created`, `message`) VALUES
(1, 'Salima Amanda', 'salima@gmail.com', 700786452, '2025-02-19 09:00:10.089873', 'Salima is happy with what you are doing'),
(2, 'Assiello Nomar', 'assielo@gmail.com', 78965434, '2025-02-19 12:41:29.223398', 'Impressive Felix');

-- --------------------------------------------------------

--
-- Table structure for table `storyteller_educationlevel`
--

CREATE TABLE `storyteller_educationlevel` (
  `id` bigint(20) NOT NULL,
  `level` varchar(100) NOT NULL,
  `school` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `Year` varchar(10) DEFAULT NULL,
  `Grade` varchar(20) DEFAULT NULL,
  `pdf_proof` varchar(100) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storyteller_educationlevel`
--

INSERT INTO `storyteller_educationlevel` (`id`, `level`, `school`, `description`, `Year`, `Grade`, `pdf_proof`, `date`) VALUES
(1, 'Primary School', 'Ratta Primary School', 'This is where my journey began, laying the foundation for my academic and personal growth. I developed a keen interest in mathematics and science, which later influenced my career choice.', '2003-2012', 'C+', '', '2025-02-18 18:04:50.779406'),
(2, 'Secondary School', 'Ratta Secondary School', 'During these years, I strengthened my passion for technology and problem-solving. I actively participated in STEM competitions and computer science-', '2013- 2018', 'B-', '', '2025-02-18 18:10:18.030951'),
(3, 'Opus Dei', 'Kabarak University', 'At Kabarak University, I pursued a Bachelor\'s degree in Computer Science. I specialized in software development, artificial intelligence, and machine learning, gaining practical experience through projects and internships.', '2019- Date', 'Second class', '', '2025-02-18 18:11:22.184909');

-- --------------------------------------------------------

--
-- Table structure for table `storyteller_event`
--

CREATE TABLE `storyteller_event` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `guests` varchar(255) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `host_id` bigint(20) DEFAULT NULL,
  `location_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storyteller_event`
--

INSERT INTO `storyteller_event` (`id`, `title`, `description`, `image`, `date`, `guests`, `category_id`, `host_id`, `location_id`) VALUES
(1, 'Tech Innovators Conference 2025', 'Join us for the annual Tech Innovators Conference, where industry leaders from around the world gather to discuss the latest trends in technology, innovation, and entrepreneurship. This year’s conference will feature keynote speakers from leading tech companies, panel discussions, and networking opportunities. Don’t miss out on this amazing event that brings together visionaries, entrepreneurs, and tech enthusiasts to explore the future of technology.', 'events_images/1730310059669.jpg', '2025-02-18 18:15:33.658572', 'Vicky Amanda', 1, 1, 2),
(3, 'Arts in the Musoleum Kisumu', 'Different arts are yet to be improvised in kisumu come 18th/08', 'events_images/im.jpg', '2025-02-20 15:45:39.248081', 'lawrence Kosgei', 2, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `storyteller_eventcategory`
--

CREATE TABLE `storyteller_eventcategory` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storyteller_eventcategory`
--

INSERT INTO `storyteller_eventcategory` (`id`, `name`) VALUES
(1, 'Thika'),
(2, 'Arts');

-- --------------------------------------------------------

--
-- Table structure for table `storyteller_eventlocation`
--

CREATE TABLE `storyteller_eventlocation` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storyteller_eventlocation`
--

INSERT INTO `storyteller_eventlocation` (`id`, `name`, `address`) VALUES
(1, 'music', 'Music art'),
(2, 'Thika', '00100, Nairobi'),
(3, 'Kisumu', '71 Maseno');

-- --------------------------------------------------------

--
-- Table structure for table `storyteller_imagegallery`
--

CREATE TABLE `storyteller_imagegallery` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(100) NOT NULL,
  `caption` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storyteller_imagegallery`
--

INSERT INTO `storyteller_imagegallery` (`id`, `title`, `image`, `caption`, `created_at`) VALUES
(1, 'South B', 'gallery_images/IMG_20240404_181640_1_dUiNaD7.jpg', 'Watching FKF games', '2025-02-18 18:18:25.647814'),
(2, 'In Kinoo', 'gallery_images/IMG_20240203_190720_2_3TEzvuH.jpg', 'Metropolitan in Kinoo with my brother Tonny during my attatchment at Anniversary Towers, computer department', '2025-02-18 18:19:38.035690'),
(3, 'Metropolitan in Kinoo with my brother Tonny during my attatchment at Anniversary Towers, computer department', 'gallery_images/IMG_202308225_223618276_UXMIaNB.jpg', 'on my way to Kakures for job purpose', '2025-02-18 18:20:31.957441'),
(4, 'Innovation Day', 'gallery_images/IMG-20231128-WA0006_mgIqM53.jpg', 'Innovation day at Kabarak', '2025-02-18 18:21:28.862004'),
(5, 'Kabarak University', 'gallery_images/IMG-20231206-WA0003_pVXNbXU.jpg', 'I mean business inside these walls', '2025-02-18 18:22:14.961469'),
(6, 'Oloika Lodge', 'gallery_images/Fel14.jpg', 'recreational day', '2025-02-18 18:23:12.973279'),
(7, 'Visiting Ouko Mboya', 'gallery_images/IMG-20240216-WA0005_Dgvxf6l.jpg', 'Paying a visit to our hero the late Tom for the achievements and freedom he gave to our luo community. Tom your name will not rest with us only,  but promise the generation will come to know how great you were to us.\r\n\r\nThanks Tom', '2025-02-18 18:26:37.469995'),
(8, 'KICC event', 'gallery_images/IMG-20240124-WA0048_lCMKbIk.jpg', 'Meeting with the strong delegates from Azimio chairedby Jadwong Raila and Martha Karua', '2025-02-18 18:27:42.478038'),
(9, 'Westgate', 'gallery_images/wst.jpg', 'When duty calls', '2025-02-19 09:50:43.540125');

-- --------------------------------------------------------

--
-- Table structure for table `storyteller_message`
--

CREATE TABLE `storyteller_message` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `messaging` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `storyteller_myuser`
--

CREATE TABLE `storyteller_myuser` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `bio` longtext DEFAULT NULL,
  `profilepic` varchar(100) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `is_enduser` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storyteller_myuser`
--

INSERT INTO `storyteller_myuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `name`, `bio`, `profilepic`, `birthdate`, `gender`, `is_enduser`) VALUES
(1, 'pbkdf2_sha256$260000$C4KivyQkJG0lqrHJ2Q1p92$Gw7LGQT4vifxoj5NuiO2I9hgmjSDUuCtu1L2eVak3AI=', NULL, 0, 'Jakamolo', '', '', 'jakamolo@outlook.com', 0, 1, '2025-02-17 15:32:16.154366', NULL, NULL, 'profile_pics/24.jpg', '1990-10-23', 'male', 1),
(2, 'pbkdf2_sha256$260000$CuYTnIEp3ruiZDqUI6TOfR$IOnzTMpm7J4DsUqA/zjfDoyR0tGQ/1TsBqbLviNJIR0=', NULL, 0, 'Salima', '', '', 'salima@gmail.com', 0, 1, '2025-02-19 10:22:55.502790', NULL, NULL, 'default.png', '1990-10-23', 'female', 1);

-- --------------------------------------------------------

--
-- Table structure for table `storyteller_myuser_groups`
--

CREATE TABLE `storyteller_myuser_groups` (
  `id` bigint(20) NOT NULL,
  `myuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `storyteller_myuser_user_permissions`
--

CREATE TABLE `storyteller_myuser_user_permissions` (
  `id` bigint(20) NOT NULL,
  `myuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `storyteller_newslettersubscriber`
--

CREATE TABLE `storyteller_newslettersubscriber` (
  `id` bigint(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `subscribed_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `storyteller_notification`
--

CREATE TABLE `storyteller_notification` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `read` tinyint(1) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storyteller_notification`
--

INSERT INTO `storyteller_notification` (`id`, `title`, `description`, `created_at`, `read`, `user_id`) VALUES
(1, 'Innovation day at Kabarak University', 'Innovation day at Kabarak University', '2025-02-18 18:29:13.170608', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `storyteller_portfolioitem`
--

CREATE TABLE `storyteller_portfolioitem` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storyteller_portfolioitem`
--

INSERT INTO `storyteller_portfolioitem` (`id`, `title`, `description`, `image`, `date_created`) VALUES
(1, 'Building and shining of Kisumu', 'We dwealt in making Kisumu be a better place where investors and stakeholders can find to invest in.', 'portfolio_images/login.PNG', '2025-02-18 18:32:07.901293'),
(2, 'sewage removal in Dandora', 'There is urgent need to remove the wasres that are poluting environment in Dandora', 'portfolio_images/dandora_9xlf6Cb.jpg', '2025-02-18 18:33:02.106347'),
(4, 'Government Tracking website', 'This website basically creates a platform where citizens can clearly track the following :\r\n\r\ni) All government projects including initiated, upcoming and completed projects\r\n\r\nii) Accountability of every government official \r\n\r\niii) Transpare in all government works', 'portfolio_images/judiciary.webp', '2025-02-18 18:35:47.722485'),
(5, 'cherigat care foundation', 'We visited Cherigat care foundation to se how the kids were doing', 'portfolio_images/images_m5V7xsd.jpeg', '2025-02-18 18:36:49.617802');

-- --------------------------------------------------------

--
-- Table structure for table `storyteller_project`
--

CREATE TABLE `storyteller_project` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `github_link` varchar(200) DEFAULT NULL,
  `live_demo` varchar(200) DEFAULT NULL,
  `technologies_used` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storyteller_project`
--

INSERT INTO `storyteller_project` (`id`, `title`, `description`, `image`, `github_link`, `live_demo`, `technologies_used`) VALUES
(2, 'Government Tracking website', 'The aim of this web was to try the oversee of the following:\r\ni) Tracking projects that th government ae working on\r\nii) Providing the accountability among governmnent officials\r\niii)user involvement in goverment works\r\niv) Providing Transparency in government works', 'project_images/welcoing.PNG', 'https://github.com/Felixngwono/doverment--project.git', 'https://github.com/Felixngwono/FelloMarley.git', 'Python-Django');

-- --------------------------------------------------------

--
-- Table structure for table `storyteller_sibling`
--

CREATE TABLE `storyteller_sibling` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `birthdate` date NOT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `short_description` longtext NOT NULL,
  `full_description` longtext NOT NULL,
  `profile_picture` varchar(100) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `age` int(10) UNSIGNED DEFAULT NULL CHECK (`age` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storyteller_sibling`
--

INSERT INTO `storyteller_sibling` (`id`, `name`, `birthdate`, `occupation`, `short_description`, `full_description`, `profile_picture`, `date`, `age`) VALUES
(1, 'Frankline Omondi', '0019-03-02', 'Pupil', 'Studying at Ratta Primary School.', 'Studying at Ratta Primary School. Wishing to pursue law in th future', 'siblings/avatar.png', '2025-02-19 07:05:18.165468', 7),
(2, 'Millicent Achieng', '1980-07-09', 'Business', 'A business woman in Kayaba-Nairobi', 'A business woman in Kayaba-Nairobi', 'siblings/about_0mlgfQV.jpg', '2025-02-19 07:07:08.685015', 35),
(3, 'Nancy Odhiambo', '2006-09-08', 'Student', 'im a high schooller at Ratta Secondary School', 'im Nancy Odhiambo, passionate in becoming a news anchor and a footballer', 'siblings/3006_JqayHev.webp', '2025-02-19 07:08:29.778632', 19),
(4, 'Kevin Odhiambo', '1990-06-07', 'Farming', 'small scale farming', 'small scale farming and also animal rearing', 'siblings/image_5.jpg', '2025-02-19 07:10:06.113661', 32),
(5, 'Winny Odhiambo', '1996-03-12', 'Business', 'working as a business girl in Kisumu', 'working as a business girl in Kisumu- Nyalenda', 'siblings/maxresdefault_LmrNR9s.jpg', '2025-02-19 07:11:31.300606', 29),
(6, 'Francis dhiambo', '1998-07-08', 'Student', 'Im a teacher by profession', 'A teacher by profession', 'siblings/restatelg.png', '2025-02-19 07:12:56.533488', 27),
(7, 'Tonny Odhiambo', '1994-04-13', 'Engineer', 'Im a full stack software Developer', 'Im a full stack software Developer', 'siblings/person_2_XCk8YMl.jpg', '2025-02-19 07:14:14.135337', 30),
(8, 'Nicole Atieno', '2016-03-25', 'Student', 'student at Ratta primary', 'student at Ratta primary', 'siblings/Buore.JPG', '2025-02-19 07:15:26.034875', 10),
(9, 'Caroline Awuor', '1985-08-02', 'Farming', 'Large scale Farming', 'large scale farming', 'siblings/category-1.jpg', '2025-02-20 10:02:09.377536', 38);

-- --------------------------------------------------------

--
-- Table structure for table `storyteller_skill`
--

CREATE TABLE `storyteller_skill` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `proficiency` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storyteller_skill`
--

INSERT INTO `storyteller_skill` (`id`, `name`, `proficiency`) VALUES
(1, 'music', 60),
(2, 'Programming', 80);

-- --------------------------------------------------------

--
-- Table structure for table `storyteller_support`
--

CREATE TABLE `storyteller_support` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `assignee_id` int(11) DEFAULT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `category` varchar(50) NOT NULL,
  `priority` varchar(10) NOT NULL,
  `status` varchar(15) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `storyteller_task`
--

CREATE TABLE `storyteller_task` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `due_date` datetime(6) NOT NULL,
  `completed` tinyint(1) NOT NULL,
  `completed_at` datetime(6) DEFAULT NULL,
  `assigned_to_id` bigint(20) DEFAULT NULL,
  `created_by_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storyteller_task`
--

INSERT INTO `storyteller_task` (`id`, `title`, `description`, `created_at`, `due_date`, `completed`, `completed_at`, `assigned_to_id`, `created_by_id`) VALUES
(1, 'Design Homepage UI', 'Create a modern and responsive homepage UI using Tailwind CSS.', '2025-02-20 12:40:11.229622', '2025-01-29 00:00:00.000000', 0, '2025-04-10 00:00:00.000000', 1, 2),
(2, 'gftryuijk', 'vcgfuhjnm', '2025-02-21 08:43:18.158702', '2025-02-28 00:00:00.000000', 0, '2025-04-10 00:00:00.000000', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `storyteller_activity`
--
ALTER TABLE `storyteller_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `StoryTeller_activity_user_id_77738afa_fk_StoryTeller_myuser_id` (`user_id`);

--
-- Indexes for table `storyteller_blogpost`
--
ALTER TABLE `storyteller_blogpost`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `storyteller_certification`
--
ALTER TABLE `storyteller_certification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `storyteller_contact`
--
ALTER TABLE `storyteller_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `storyteller_educationlevel`
--
ALTER TABLE `storyteller_educationlevel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `storyteller_event`
--
ALTER TABLE `storyteller_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `StoryTeller_event_category_id_9b792a20_fk_StoryTell` (`category_id`),
  ADD KEY `StoryTeller_event_host_id_645f85b2_fk_StoryTeller_myuser_id` (`host_id`),
  ADD KEY `StoryTeller_event_location_id_8e3dba41_fk_StoryTell` (`location_id`);

--
-- Indexes for table `storyteller_eventcategory`
--
ALTER TABLE `storyteller_eventcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `storyteller_eventlocation`
--
ALTER TABLE `storyteller_eventlocation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `storyteller_imagegallery`
--
ALTER TABLE `storyteller_imagegallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `storyteller_message`
--
ALTER TABLE `storyteller_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `storyteller_myuser`
--
ALTER TABLE `storyteller_myuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `storyteller_myuser_groups`
--
ALTER TABLE `storyteller_myuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `StoryTeller_myuser_groups_myuser_id_group_id_179a3366_uniq` (`myuser_id`,`group_id`),
  ADD KEY `StoryTeller_myuser_groups_group_id_bd2ecf50_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `storyteller_myuser_user_permissions`
--
ALTER TABLE `storyteller_myuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `StoryTeller_myuser_user__myuser_id_permission_id_1eced865_uniq` (`myuser_id`,`permission_id`),
  ADD KEY `StoryTeller_myuser_u_permission_id_7727afc4_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `storyteller_newslettersubscriber`
--
ALTER TABLE `storyteller_newslettersubscriber`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `storyteller_notification`
--
ALTER TABLE `storyteller_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `StoryTeller_notifica_user_id_a521535c_fk_StoryTell` (`user_id`);

--
-- Indexes for table `storyteller_portfolioitem`
--
ALTER TABLE `storyteller_portfolioitem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `storyteller_project`
--
ALTER TABLE `storyteller_project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `storyteller_sibling`
--
ALTER TABLE `storyteller_sibling`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `storyteller_skill`
--
ALTER TABLE `storyteller_skill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `storyteller_support`
--
ALTER TABLE `storyteller_support`
  ADD PRIMARY KEY (`id`),
  ADD KEY `StoryTeller_support_assignee_id_3e17786c_fk_auth_user_id` (`assignee_id`),
  ADD KEY `StoryTeller_support_user_id_7a170f6e_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `storyteller_task`
--
ALTER TABLE `storyteller_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `StoryTeller_task_assigned_to_id_a96d8bc8_fk_StoryTell` (`assigned_to_id`),
  ADD KEY `StoryTeller_task_created_by_id_0d4966b1_fk_StoryTeller_myuser_id` (`created_by_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `storyteller_activity`
--
ALTER TABLE `storyteller_activity`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `storyteller_blogpost`
--
ALTER TABLE `storyteller_blogpost`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `storyteller_certification`
--
ALTER TABLE `storyteller_certification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `storyteller_contact`
--
ALTER TABLE `storyteller_contact`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `storyteller_educationlevel`
--
ALTER TABLE `storyteller_educationlevel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `storyteller_event`
--
ALTER TABLE `storyteller_event`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `storyteller_eventcategory`
--
ALTER TABLE `storyteller_eventcategory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `storyteller_eventlocation`
--
ALTER TABLE `storyteller_eventlocation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `storyteller_imagegallery`
--
ALTER TABLE `storyteller_imagegallery`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `storyteller_message`
--
ALTER TABLE `storyteller_message`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `storyteller_myuser`
--
ALTER TABLE `storyteller_myuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `storyteller_myuser_groups`
--
ALTER TABLE `storyteller_myuser_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `storyteller_myuser_user_permissions`
--
ALTER TABLE `storyteller_myuser_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `storyteller_newslettersubscriber`
--
ALTER TABLE `storyteller_newslettersubscriber`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `storyteller_notification`
--
ALTER TABLE `storyteller_notification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `storyteller_portfolioitem`
--
ALTER TABLE `storyteller_portfolioitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `storyteller_project`
--
ALTER TABLE `storyteller_project`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `storyteller_sibling`
--
ALTER TABLE `storyteller_sibling`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `storyteller_skill`
--
ALTER TABLE `storyteller_skill`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `storyteller_support`
--
ALTER TABLE `storyteller_support`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `storyteller_task`
--
ALTER TABLE `storyteller_task`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `storyteller_activity`
--
ALTER TABLE `storyteller_activity`
  ADD CONSTRAINT `StoryTeller_activity_user_id_77738afa_fk_StoryTeller_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `storyteller_myuser` (`id`);

--
-- Constraints for table `storyteller_event`
--
ALTER TABLE `storyteller_event`
  ADD CONSTRAINT `StoryTeller_event_category_id_9b792a20_fk_StoryTell` FOREIGN KEY (`category_id`) REFERENCES `storyteller_eventcategory` (`id`),
  ADD CONSTRAINT `StoryTeller_event_host_id_645f85b2_fk_StoryTeller_myuser_id` FOREIGN KEY (`host_id`) REFERENCES `storyteller_myuser` (`id`),
  ADD CONSTRAINT `StoryTeller_event_location_id_8e3dba41_fk_StoryTell` FOREIGN KEY (`location_id`) REFERENCES `storyteller_eventlocation` (`id`);

--
-- Constraints for table `storyteller_myuser_groups`
--
ALTER TABLE `storyteller_myuser_groups`
  ADD CONSTRAINT `StoryTeller_myuser_g_myuser_id_8ccd8420_fk_StoryTell` FOREIGN KEY (`myuser_id`) REFERENCES `storyteller_myuser` (`id`),
  ADD CONSTRAINT `StoryTeller_myuser_groups_group_id_bd2ecf50_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `storyteller_myuser_user_permissions`
--
ALTER TABLE `storyteller_myuser_user_permissions`
  ADD CONSTRAINT `StoryTeller_myuser_u_myuser_id_fa5b802f_fk_StoryTell` FOREIGN KEY (`myuser_id`) REFERENCES `storyteller_myuser` (`id`),
  ADD CONSTRAINT `StoryTeller_myuser_u_permission_id_7727afc4_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `storyteller_notification`
--
ALTER TABLE `storyteller_notification`
  ADD CONSTRAINT `StoryTeller_notifica_user_id_a521535c_fk_StoryTell` FOREIGN KEY (`user_id`) REFERENCES `storyteller_myuser` (`id`);

--
-- Constraints for table `storyteller_support`
--
ALTER TABLE `storyteller_support`
  ADD CONSTRAINT `StoryTeller_support_assignee_id_3e17786c_fk_auth_user_id` FOREIGN KEY (`assignee_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `StoryTeller_support_user_id_7a170f6e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `storyteller_task`
--
ALTER TABLE `storyteller_task`
  ADD CONSTRAINT `StoryTeller_task_assigned_to_id_a96d8bc8_fk_StoryTell` FOREIGN KEY (`assigned_to_id`) REFERENCES `storyteller_myuser` (`id`),
  ADD CONSTRAINT `StoryTeller_task_created_by_id_0d4966b1_fk_StoryTeller_myuser_id` FOREIGN KEY (`created_by_id`) REFERENCES `storyteller_myuser` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
