-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2020 at 05:44 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `courses_enrollment`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(2, 'giangvien'),
(3, 'khoa'),
(4, 'pdt'),
(1, 'sinhvien');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(24, 'Can view session', 6, 'view_session');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$ccO6jZwnu95z$4soWjfZX7wQVP/734bK0HV3bZ95gs6HK+IKUWP7iAoI=', '2020-12-26 16:22:19.243317', 1, 'nhom9', '', '', 'nhom9@gmail.com', 1, 1, '2020-12-24 08:47:20.486152'),
(2, 'pbkdf2_sha256$216000$7nEM04SriwBd$KCj6l2leelbBmUo4Sfnk6nWP8AaHZF5NgFNAS9HFGvQ=', '2020-12-27 04:31:22.181999', 0, 'sinhvien00', '', '', '', 0, 1, '2020-12-24 08:48:51.000000'),
(3, 'pbkdf2_sha256$216000$78NXSnL8CTPS$GcgeDfqFqD3weC1AVleBYp5LoICEwosjIgb+Bgw9Uo0=', '2020-12-25 09:37:55.489906', 0, 'giangvien1', '', '', '', 0, 1, '2020-12-24 08:49:19.000000'),
(4, 'pbkdf2_sha256$216000$8wUts6G2aPvz$fRATEqmk4KJfn0SHbzZhOLMxNqNzgDMQy+I7W+jXX3U=', '2020-12-27 04:06:22.357833', 0, 'khoa1', '', '', '', 0, 1, '2020-12-24 08:49:33.000000'),
(5, 'pbkdf2_sha256$216000$oZ8UNoHDe1JY$VKBKQJghAiFwk5nMs6occh4lQn1/HYsm6cnQ8xEnVtY=', '2020-12-27 03:24:05.265283', 0, 'daotao1', '', '', '', 0, 1, '2020-12-24 08:49:46.000000'),
(6, 'pbkdf2_sha256$216000$Hcig1IcFdedk$rlRdNTmkDxIJjQftuZOz9u3PLm/X4CH5L2t5GcbGlZE=', '2020-12-27 04:30:29.118592', 0, 'giangvien0', '', '', '', 0, 1, '2020-12-26 08:52:24.000000'),
(7, 'pbkdf2_sha256$216000$8I06mcGjYiFN$hmeQbGjOmDh52rIzYtMaokeu9ebSWF3/fjOWF31BW1w=', '2020-12-26 16:24:42.979434', 0, 'sinhvien01', '', '', '', 0, 1, '2020-12-26 16:22:46.000000'),
(8, 'pbkdf2_sha256$216000$T2sAtNxQrUBw$GBQE/D3W0ePvPzBODm/pEIOzL9K1mwkDvVufI5LIosU=', '2020-12-26 16:25:29.497213', 0, 'sinhvien02', '', '', '', 0, 1, '2020-12-26 16:23:03.000000'),
(9, 'pbkdf2_sha256$216000$tKh0Gc82BZ8g$pP20gMPJC8/oOAFSFgHxG0CTmcVRTdNHkxQiYWQohGo=', NULL, 0, 'sinhvien04', '', '', '', 0, 1, '2020-12-26 16:23:21.000000'),
(10, 'pbkdf2_sha256$216000$VblsFRZMYZI9$Q9e0ASiVytEjZq/5qVdNv5FA1Zt3ZPPp+fb3e1MIzC4=', NULL, 0, 'giangvien2', '', '', '', 0, 1, '2020-12-26 16:23:40.000000'),
(11, 'pbkdf2_sha256$216000$13j1Sca6yFZi$Si9DbbnaINaLEWwpQREcqS+nWBlTdOniHpiLLDd2AHo=', NULL, 0, 'khoa2', '', '', '', 0, 1, '2020-12-26 16:24:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 4, 3),
(4, 5, 4),
(5, 6, 2),
(6, 7, 1),
(7, 8, 1),
(8, 9, 1),
(9, 10, 2),
(10, 11, 3);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bang_cap`
--

CREATE TABLE `bang_cap` (
  `MSNV` char(16) NOT NULL,
  `mot_bang_cap` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bien_soan`
--

CREATE TABLE `bien_soan` (
  `ma_tac_gia` varchar(16) NOT NULL,
  `ISBN` varchar(45) NOT NULL,
  `nam_xuat_ban` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chi_dinh`
--

CREATE TABLE `chi_dinh` (
  `MSNV` char(16) NOT NULL,
  `id_lop` int(11) NOT NULL,
  `ISBN` varchar(45) DEFAULT NULL,
  `nam_xuat_ban` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chi_dinh`
--

INSERT INTO `chi_dinh` (`MSNV`, `id_lop`, `ISBN`, `nam_xuat_ban`) VALUES
('G00000', 7, NULL, NULL),
('G00000', 8, NULL, NULL),
('G00000', 9, NULL, NULL),
('G00000', 11, 'ANDS1232', NULL),
('G00000', 12, 'ANDS1232', NULL),
('G00000', 15, 'ANDS1232', NULL),
('G00000', 4, 'KSKS6632', NULL),
('G00000', 5, 'KSKS6632', NULL),
('G00000', 6, 'KSKS6632', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dang_ky`
--

CREATE TABLE `dang_ky` (
  `MSSV` int(11) NOT NULL,
  `id_lop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dang_ky`
--

INSERT INTO `dang_ky` (`MSSV`, `id_lop`) VALUES
(1610001, 5),
(1610001, 11),
(1710001, 5),
(1710001, 9),
(1710001, 12),
(1810001, 4),
(1810001, 7),
(1810001, 12);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-12-24 08:47:59.385192', '1', 'sinhvien', 1, '[{\"added\": {}}]', 3, 1),
(2, '2020-12-24 08:48:03.315792', '2', 'giangvien', 1, '[{\"added\": {}}]', 3, 1),
(3, '2020-12-24 08:48:08.631298', '3', 'khoa', 1, '[{\"added\": {}}]', 3, 1),
(4, '2020-12-24 08:48:11.733820', '4', 'pdt', 1, '[{\"added\": {}}]', 3, 1),
(5, '2020-12-24 08:48:51.926988', '2', 'sinhvien00', 1, '[{\"added\": {}}]', 4, 1),
(6, '2020-12-24 08:48:59.558047', '2', 'sinhvien00', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(7, '2020-12-24 08:49:19.937131', '3', 'giangvien1', 1, '[{\"added\": {}}]', 4, 1),
(8, '2020-12-24 08:49:24.828257', '3', 'giangvien1', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(9, '2020-12-24 08:49:33.928459', '4', 'khoa1', 1, '[{\"added\": {}}]', 4, 1),
(10, '2020-12-24 08:49:39.059500', '4', 'khoa1', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(11, '2020-12-24 08:49:46.437183', '5', 'daotao1', 1, '[{\"added\": {}}]', 4, 1),
(12, '2020-12-24 08:49:50.939431', '5', 'daotao1', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(13, '2020-12-26 08:52:25.219830', '6', 'giangvien0', 1, '[{\"added\": {}}]', 4, 1),
(14, '2020-12-26 08:52:30.459662', '6', 'giangvien0', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(15, '2020-12-26 16:22:46.436207', '7', 'sinhvien01', 1, '[{\"added\": {}}]', 4, 1),
(16, '2020-12-26 16:22:54.012803', '7', 'sinhvien01', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(17, '2020-12-26 16:23:04.070713', '8', 'sinhvien02', 1, '[{\"added\": {}}]', 4, 1),
(18, '2020-12-26 16:23:09.672416', '8', 'sinhvien02', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(19, '2020-12-26 16:23:21.352449', '9', 'sinhvien04', 1, '[{\"added\": {}}]', 4, 1),
(20, '2020-12-26 16:23:26.513503', '9', 'sinhvien04', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(21, '2020-12-26 16:23:40.909443', '10', 'giangvien2', 1, '[{\"added\": {}}]', 4, 1),
(22, '2020-12-26 16:23:46.813526', '10', 'giangvien2', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(23, '2020-12-26 16:24:00.574212', '11', 'khoa2', 1, '[{\"added\": {}}]', 4, 1),
(24, '2020-12-26 16:24:06.166440', '11', 'khoa2', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-12-24 08:46:03.803330'),
(2, 'auth', '0001_initial', '2020-12-24 08:46:03.957545'),
(3, 'admin', '0001_initial', '2020-12-24 08:46:04.797413'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-12-24 08:46:04.971880'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-12-24 08:46:04.978396'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-12-24 08:46:05.068497'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-12-24 08:46:05.156132'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-12-24 08:46:05.240424'),
(9, 'auth', '0004_alter_user_username_opts', '2020-12-24 08:46:05.286198'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-12-24 08:46:05.362976'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-12-24 08:46:05.371608'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-12-24 08:46:05.419478'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-12-24 08:46:05.444521'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-12-24 08:46:05.469615'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-12-24 08:46:05.682485'),
(16, 'auth', '0011_update_proxy_permissions', '2020-12-24 08:46:05.722227'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2020-12-24 08:46:05.761122'),
(18, 'home', '0001_initial', '2020-12-24 08:46:05.803014'),
(19, 'home', '0002_auto_20201206_1123', '2020-12-24 08:46:05.842903'),
(20, 'home', '0003_delete_evaluateform', '2020-12-24 08:46:05.858861'),
(21, 'sessions', '0001_initial', '2020-12-24 08:46:05.893048');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('apm2rppb76nkhuezyarg63xk4p5781ts', '.eJxVjMsOwiAUBf-FtSEIFyQu3fsN5L4qVUOT0q6M_65NutDtmZnzMgXXpZa161xGMWfjzeF3I-SHtg3IHdttsjy1ZR7JbordabfXSfR52d2_g4q9fusTEKNT5ZiHowA6LxmDy5RAIg0EgYJAxoTOiQbQgJQoZmFlEB_N-wMKQDkE:1ktNiE:9jue2cAAi57o5gckA9ofPtrIL8LQaIRbtszIQYLUw-E', '2021-01-10 04:31:22.194911');

-- --------------------------------------------------------

--
-- Table structure for table `ghi_diem`
--

CREATE TABLE `ghi_diem` (
  `MSSV` int(11) DEFAULT NULL,
  `MSNV` char(16) NOT NULL,
  `id_lop` int(11) NOT NULL,
  `diem_so` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ghi_diem`
--

INSERT INTO `ghi_diem` (`MSSV`, `MSNV`, `id_lop`, `diem_so`) VALUES
(NULL, 'G00000', 11, NULL),
(NULL, 'G00001', 7, NULL),
(NULL, 'G00002', 8, NULL),
(NULL, 'G00004', 11, NULL),
(NULL, 'G00005', 6, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `giang_vien`
--

CREATE TABLE `giang_vien` (
  `MSNV` char(16) NOT NULL,
  `MSNV_quan_ly` char(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `giang_vien`
--

INSERT INTO `giang_vien` (`MSNV`, `MSNV_quan_ly`) VALUES
('G00000', 'K00001'),
('G00001', 'K00001'),
('G00002', 'K00001'),
('G00003', 'K00001'),
('G00004', 'K00001'),
('G00005', 'K00001');

-- --------------------------------------------------------

--
-- Table structure for table `giao_trinh`
--

CREATE TABLE `giao_trinh` (
  `ISBN` varchar(45) NOT NULL,
  `nam_xuat_ban` date NOT NULL,
  `ten_giao_trinh` varchar(45) DEFAULT NULL,
  `tenNXB` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `giao_trinh`
--

INSERT INTO `giao_trinh` (`ISBN`, `nam_xuat_ban`, `ten_giao_trinh`, `tenNXB`) VALUES
('ANDS1232', '2006-12-01', 'Nhap mon dien toan', 'ABC'),
('ANDS3534', '2006-02-12', 'Nhap mon lap trinh: C++', 'ABC'),
('KSKS1232', '2012-12-01', 'He co so du lieu', 'DEF'),
('KSKS6632', '2015-12-01', 'He co so du lieu nang cao', 'DEF');

-- --------------------------------------------------------

--
-- Table structure for table `khoa`
--

CREATE TABLE `khoa` (
  `ma_khoa` varchar(16) NOT NULL,
  `ten_khoa` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `khoa`
--

INSERT INTO `khoa` (`ma_khoa`, `ten_khoa`) VALUES
('002', 'Dien Dien tu'),
('003', 'Khoa hoc Ung dung'),
('001', 'Khoa hoc va Ky thuat May tinh'),
('004', 'Quan ly cong nghiep');

-- --------------------------------------------------------

--
-- Table structure for table `lop`
--

CREATE TABLE `lop` (
  `idlop` int(11) NOT NULL,
  `ma_lop_hoc` varchar(16) NOT NULL,
  `hoc_ky` int(11) NOT NULL,
  `ma_mon_hoc` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lop`
--

INSERT INTO `lop` (`idlop`, `ma_lop_hoc`, `hoc_ky`, `ma_mon_hoc`) VALUES
(15, 'L01', 201, 'CO2001'),
(7, 'L01', 201, 'CO2002'),
(4, 'L01', 201, 'CO2013'),
(2, 'L02', 191, 'CO2013'),
(11, 'L02', 201, 'CO2001'),
(8, 'L02', 201, 'CO2002'),
(5, 'L02', 201, 'CO2013'),
(3, 'L03', 191, 'CO2013'),
(12, 'L03', 201, 'CO2001'),
(9, 'L03', 201, 'CO2002'),
(6, 'L03', 201, 'CO2013');

-- --------------------------------------------------------

--
-- Table structure for table `mon_hoc`
--

CREATE TABLE `mon_hoc` (
  `ma_mon_hoc` varchar(16) NOT NULL,
  `ten_mon_hoc` varchar(45) DEFAULT NULL,
  `so_tin_chi` int(11) DEFAULT NULL,
  `ma_khoa` varchar(16) NOT NULL
) ;

--
-- Dumping data for table `mon_hoc`
--

INSERT INTO `mon_hoc` (`ma_mon_hoc`, `ten_mon_hoc`, `so_tin_chi`, `ma_khoa`) VALUES
('CO2001', 'Nhap mon dien toan ', 2, '001'),
('CO2002', 'Ky thuat lap trinh', 3, '001'),
('CO2013', 'He co so du lieu', 3, '001'),
('DD2013', 'Mach dien tu', 3, '002'),
('IM2011', 'Quan ly du an cho ky su', 1, '004'),
('IM2013', 'Quan tri kinh doanh cho ky su', 1, '004'),
('MT1001', 'Giai tich 1', 3, '003');

-- --------------------------------------------------------

--
-- Table structure for table `nguoi_dung`
--

CREATE TABLE `nguoi_dung` (
  `Username` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  `Ho` varchar(45) DEFAULT NULL,
  `Ten` varchar(45) DEFAULT NULL,
  `gioi_tinh` enum('Nam','Nu') DEFAULT NULL,
  `CMND` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `ngay_sinh` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nguoi_dung`
--

INSERT INTO `nguoi_dung` (`Username`, `password`, `Ho`, `Ten`, `gioi_tinh`, `CMND`, `Email`, `ngay_sinh`) VALUES
('daotao1', '1234', 'Phan Hồng', 'Hải', 'Nam', '123456789', 'namphan@hcmut.edu.vn', '0000-00-00'),
('daotao2', '1234', 'Nguyễn ', 'Hạnh', 'Nu', '222645444', 'hanhnguyen@hcmut.edu.vn', '0000-00-00'),
('giangvien0', '1234', 'Tran Nguyen', 'Truong', 'Nam', '222333444', 'truongtran@hcmut.edu.vn', '1888-02-03'),
('giangvien1', '1234', 'Nguyen Hong', 'Thao', 'Nu', '345765344', 'thaonguyen@hcmut.edu.vn', '1993-11-12'),
('giangvien10', '1234', 'Phan Tiến ', 'Khang', 'Nam', '634897789', 'khangphan@hcmut.edu.vn', '1987-06-28'),
('giangvien11', '1234', 'Đỗ ', 'Xuân Trường', 'Nam', '132856744', 'truongdo@hcmut.edu.vn', '1992-02-28'),
('giangvien2', '1234', 'Luong Ha', 'Anh', 'Nu', '556377494', 'anhhuynh@hcmut.edu.vn', '1979-03-04'),
('giangvien3', '1234', 'Luong Ha', 'Anh', 'Nu', '562334987', 'anhluong@hcmut.edu.vn', '1989-02-25'),
('giangvien4', '1234', 'Phan Dang', 'Duong', 'Nam', '644876789', 'duongphan1@hcmut.edu.vn', '1984-01-08'),
('giangvien5', '1234', 'Nguyen Thanh', 'Dat', 'Nam', '153387984', 'datnguyen@hcmut.edu.vn', '1985-07-12'),
('giangvien6', '1234', 'Trần Trung', 'Trực', 'Nam', '667788991', 'tructran@hcmut.edu.vn', '1994-03-06'),
('giangvien7', '1234', 'Nguyễn An', 'Nhiên', 'Nam', '534567567', 'nhiennguyen@hcmut.edu.vn', '1993-12-06'),
('giangvien8', '1234', 'Huỳnh Tường', 'Nguyên', 'Nam', '123645494', 'nguyenhuynh@hcmut.edu.vn', '1980-05-07'),
('giangvien9', '1234', 'Trịnh Minh', 'Hải', 'Nam', '864224553', 'haitrinhg@hcmut.edu.vn', '1988-05-28'),
('khoa1', '1234', 'Trần Nguyên', 'Trường', 'Nam', '222929444', 'truongtran1@hcmut.edu.vn', '0000-00-00'),
('khoa2', '1234', 'Nguyễn Anh', 'Khoa', 'Nam', '222324344', 'khoanguyen@hcmut.edu.vn', '0000-00-00'),
('khoa3', '1234', 'Huỳnh Minh', 'Hương', 'Nu', '234348494', 'huonghuynh@hcmut.edu.vn', '0000-00-00'),
('khoa4', '1234', 'Lương Nguyệt', 'Minh', 'Nu', '266378987', 'minhluong@hcmut.edu.vn', '0000-00-00'),
('sinhvien00', '1234', 'Tran Nguyen', 'Trung', 'Nam', '666333444', 'trungtran@hcmut.edu.vn', '1998-10-03'),
('sinhvien01', '1234', 'Nguyen Hong', 'Tham', 'Nu', '664335344', 'thamnguyen@hcmut.edu.vn', '2000-11-12'),
('sinhvien02', '1234', 'Huynh Nhat', 'Dieu', 'Nu', '556222043', 'dieuhuynh@hcmut.edu.vn', '1999-03-14'),
('sinhvien03', '1234', 'Lương Anh', 'Thư', 'Nu', '978555987', 'thuluong@hcmut.edu.vn', '1999-02-25'),
('sinhvien04', '1234', 'Phan Đăng', 'Minh', 'Nam', '648876009', 'duongphan@hcmut.edu.vn', '2000-10-08'),
('sinhvien05', '1234', 'Nguyễn Thành ', 'Nhật', 'Nam', '808778984', 'nhatnguyen@hcmut.edu.vn', '2001-12-17'),
('sinhvien06', '1234', 'Trần Anh', 'Khoa', 'Nam', '900888991', 'khoatran@hcmut.edu.vn', '2002-03-16'),
('sinhvien07', '1234', 'Nguyễn ', 'Nhân', 'Nam', '777567567', 'nhannguyen@hcmut.edu.vn', '2001-12-06'),
('sinhvien08', '1234', 'Huỳnh ', 'Ngạn', 'Nam', '131234549', 'nganhuynh@hcmut.edu.vn', '2000-07-05'),
('sinhvien09', '1234', 'Trịnh Minh', 'Anh', 'Nam', '867457753', 'anhtrinhg@hcmut.edu.vn', '1998-10-25'),
('sinhvien10', '1234', 'Phan Trung ', 'Khương', 'Nam', '634232089', 'khuongphan@hcmut.edu.vn', '1997-06-08');

-- --------------------------------------------------------

--
-- Table structure for table `nhan_vien`
--

CREATE TABLE `nhan_vien` (
  `MSNV` char(16) NOT NULL,
  `Username` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nhan_vien`
--

INSERT INTO `nhan_vien` (`MSNV`, `Username`) VALUES
('D00001', 'daotao1'),
('D00002', 'daotao2'),
('G00000', 'giangvien0'),
('G00001', 'giangvien1'),
('G00002', 'giangvien2'),
('G00003', 'giangvien3'),
('G00004', 'giangvien4'),
('G00005', 'giangvien5'),
('K00001', 'khoa1'),
('K00002', 'khoa2'),
('K00003', 'khoa3'),
('K00004', 'khoa4');

-- --------------------------------------------------------

--
-- Table structure for table `nha_xuat_ban`
--

CREATE TABLE `nha_xuat_ban` (
  `tenNXB` varchar(16) NOT NULL,
  `dia_chi` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nha_xuat_ban`
--

INSERT INTO `nha_xuat_ban` (`tenNXB`, `dia_chi`) VALUES
('ABC', 'TP Ho Chi Minh'),
('DEF', 'Ha Noi');

-- --------------------------------------------------------

--
-- Table structure for table `ns_khoa_quan_ly`
--

CREATE TABLE `ns_khoa_quan_ly` (
  `MSNV` char(16) NOT NULL,
  `ngay_bat_dau` date DEFAULT NULL,
  `ma_khoa` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ns_khoa_quan_ly`
--

INSERT INTO `ns_khoa_quan_ly` (`MSNV`, `ngay_bat_dau`, `ma_khoa`) VALUES
('K00001', '2018-01-10', '001'),
('K00002', '2018-01-10', '002'),
('K00003', '2018-01-10', '003'),
('K00004', '2018-01-10', '004');

-- --------------------------------------------------------

--
-- Table structure for table `ns_phong_dao_tao`
--

CREATE TABLE `ns_phong_dao_tao` (
  `MSNV` char(16) NOT NULL,
  `ngay_bat_dau` date DEFAULT NULL,
  `chuc_vu` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sinh_vien`
--

CREATE TABLE `sinh_vien` (
  `MSSV` int(11) NOT NULL,
  `GPA` decimal(4,2) DEFAULT NULL,
  `nam_nhap_hoc` date DEFAULT NULL,
  `Username` varchar(16) NOT NULL,
  `ma_khoa` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sinh_vien`
--

INSERT INTO `sinh_vien` (`MSSV`, `GPA`, `nam_nhap_hoc`, `Username`, `ma_khoa`) VALUES
(1610001, '0.00', '2016-08-15', 'sinhvien00', '001'),
(1710001, '0.00', '2017-08-15', 'sinhvien02', '001'),
(1810001, '0.00', '2018-08-15', 'sinhvien01', '001');

-- --------------------------------------------------------

--
-- Table structure for table `sodt`
--

CREATE TABLE `sodt` (
  `Username` varchar(16) NOT NULL,
  `mot_so_DT` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tac_gia`
--

CREATE TABLE `tac_gia` (
  `ma_tac_gia` varchar(16) NOT NULL,
  `ho` varchar(45) DEFAULT NULL,
  `ten` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tac_gia`
--

INSERT INTO `tac_gia` (`ma_tac_gia`, `ho`, `ten`, `Email`) VALUES
('TG0001', 'Tran Giang', 'Son', 'so@gmail.com'),
('TG0002', 'Nguyen Trung', 'Truc', 'truc@gmail.com'),
('TG0003', 'Pham Quang', 'Ha', 'ha@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `thuoc`
--

CREATE TABLE `thuoc` (
  `ISBN` varchar(45) NOT NULL,
  `nam_xuat_ban` date NOT NULL,
  `ma_mon_hoc` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `trang_thai_hoc_tap`
--

CREATE TABLE `trang_thai_hoc_tap` (
  `MSSV` int(11) NOT NULL,
  `hoc_ky` int(11) NOT NULL,
  `trang_thai` enum('Dang hoc','Tam dung','Da thoi họ') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trang_thai_hoc_tap`
--

INSERT INTO `trang_thai_hoc_tap` (`MSSV`, `hoc_ky`, `trang_thai`) VALUES
(1610001, 201, 'Dang hoc'),
(1710001, 201, 'Dang hoc'),
(1810001, 201, 'Dang hoc');

-- --------------------------------------------------------

--
-- Table structure for table `tuan_hoc`
--

CREATE TABLE `tuan_hoc` (
  `thu_tu_tuan` int(11) NOT NULL,
  `id_lop` int(11) NOT NULL,
  `MSNV` char(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vi_tri`
--

CREATE TABLE `vi_tri` (
  `MSNV` char(16) NOT NULL,
  `mot_vi_tri` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Indexes for table `bang_cap`
--
ALTER TABLE `bang_cap`
  ADD PRIMARY KEY (`MSNV`,`mot_bang_cap`);

--
-- Indexes for table `bien_soan`
--
ALTER TABLE `bien_soan`
  ADD PRIMARY KEY (`ma_tac_gia`,`ISBN`,`nam_xuat_ban`),
  ADD KEY `sachbiensoan` (`ISBN`,`nam_xuat_ban`);

--
-- Indexes for table `chi_dinh`
--
ALTER TABLE `chi_dinh`
  ADD PRIMARY KEY (`MSNV`,`id_lop`),
  ADD KEY `lopchidinh` (`id_lop`),
  ADD KEY `sachchidinh` (`ISBN`,`nam_xuat_ban`);

--
-- Indexes for table `dang_ky`
--
ALTER TABLE `dang_ky`
  ADD PRIMARY KEY (`MSSV`,`id_lop`),
  ADD KEY `dknhom_idx` (`id_lop`);

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
-- Indexes for table `ghi_diem`
--
ALTER TABLE `ghi_diem`
  ADD PRIMARY KEY (`MSNV`,`id_lop`),
  ADD KEY `diemsv` (`MSSV`),
  ADD KEY `diemlop` (`id_lop`);

--
-- Indexes for table `giang_vien`
--
ALTER TABLE `giang_vien`
  ADD PRIMARY KEY (`MSNV`),
  ADD KEY `quan_ly` (`MSNV_quan_ly`);

--
-- Indexes for table `giao_trinh`
--
ALTER TABLE `giao_trinh`
  ADD PRIMARY KEY (`ISBN`,`nam_xuat_ban`),
  ADD KEY `xuatban_idx` (`tenNXB`);

--
-- Indexes for table `khoa`
--
ALTER TABLE `khoa`
  ADD PRIMARY KEY (`ma_khoa`),
  ADD UNIQUE KEY `ten_khoa_UNIQUE` (`ten_khoa`);

--
-- Indexes for table `lop`
--
ALTER TABLE `lop`
  ADD PRIMARY KEY (`idlop`),
  ADD UNIQUE KEY `ma_lop_hoc` (`ma_lop_hoc`,`hoc_ky`,`ma_mon_hoc`),
  ADD KEY `lop` (`ma_mon_hoc`);

--
-- Indexes for table `mon_hoc`
--
ALTER TABLE `mon_hoc`
  ADD PRIMARY KEY (`ma_mon_hoc`),
  ADD KEY `mhkhoa_idx` (`ma_khoa`);

--
-- Indexes for table `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  ADD PRIMARY KEY (`Username`),
  ADD UNIQUE KEY `CMND_UNIQUE` (`CMND`),
  ADD UNIQUE KEY `Email_UNIQUE` (`Email`);

--
-- Indexes for table `nhan_vien`
--
ALTER TABLE `nhan_vien`
  ADD PRIMARY KEY (`MSNV`),
  ADD UNIQUE KEY `Username_UNIQUE` (`Username`);

--
-- Indexes for table `nha_xuat_ban`
--
ALTER TABLE `nha_xuat_ban`
  ADD PRIMARY KEY (`tenNXB`);

--
-- Indexes for table `ns_khoa_quan_ly`
--
ALTER TABLE `ns_khoa_quan_ly`
  ADD PRIMARY KEY (`MSNV`),
  ADD KEY `nsqlkhoa_idx` (`ma_khoa`);

--
-- Indexes for table `ns_phong_dao_tao`
--
ALTER TABLE `ns_phong_dao_tao`
  ADD PRIMARY KEY (`MSNV`);

--
-- Indexes for table `sinh_vien`
--
ALTER TABLE `sinh_vien`
  ADD PRIMARY KEY (`MSSV`),
  ADD UNIQUE KEY `Username_UNIQUE` (`Username`),
  ADD KEY `svkhoa_idx` (`ma_khoa`);

--
-- Indexes for table `sodt`
--
ALTER TABLE `sodt`
  ADD PRIMARY KEY (`Username`,`mot_so_DT`);

--
-- Indexes for table `tac_gia`
--
ALTER TABLE `tac_gia`
  ADD PRIMARY KEY (`ma_tac_gia`);

--
-- Indexes for table `thuoc`
--
ALTER TABLE `thuoc`
  ADD PRIMARY KEY (`ISBN`,`nam_xuat_ban`,`ma_mon_hoc`),
  ADD KEY `monhocchua` (`ma_mon_hoc`);

--
-- Indexes for table `trang_thai_hoc_tap`
--
ALTER TABLE `trang_thai_hoc_tap`
  ADD PRIMARY KEY (`MSSV`,`hoc_ky`);

--
-- Indexes for table `tuan_hoc`
--
ALTER TABLE `tuan_hoc`
  ADD PRIMARY KEY (`thu_tu_tuan`,`id_lop`),
  ADD KEY `id_lop` (`id_lop`),
  ADD KEY `gvphutrach_idx` (`MSNV`);

--
-- Indexes for table `vi_tri`
--
ALTER TABLE `vi_tri`
  ADD PRIMARY KEY (`MSNV`,`mot_vi_tri`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `lop`
--
ALTER TABLE `lop`
  MODIFY `idlop` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
-- Constraints for table `bang_cap`
--
ALTER TABLE `bang_cap`
  ADD CONSTRAINT `banggv` FOREIGN KEY (`MSNV`) REFERENCES `giang_vien` (`MSNV`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bien_soan`
--
ALTER TABLE `bien_soan`
  ADD CONSTRAINT `sachbiensoan` FOREIGN KEY (`ISBN`,`nam_xuat_ban`) REFERENCES `giao_trinh` (`ISBN`, `nam_xuat_ban`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tgbiensoan` FOREIGN KEY (`ma_tac_gia`) REFERENCES `tac_gia` (`ma_tac_gia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `chi_dinh`
--
ALTER TABLE `chi_dinh`
  ADD CONSTRAINT `gvchidinh` FOREIGN KEY (`MSNV`) REFERENCES `giang_vien` (`MSNV`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lopchidinh` FOREIGN KEY (`id_lop`) REFERENCES `lop` (`idlop`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sachchidinh` FOREIGN KEY (`ISBN`,`nam_xuat_ban`) REFERENCES `giao_trinh` (`ISBN`, `nam_xuat_ban`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dang_ky`
--
ALTER TABLE `dang_ky`
  ADD CONSTRAINT `dknhom` FOREIGN KEY (`id_lop`) REFERENCES `lop` (`idlop`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dksinhvien` FOREIGN KEY (`MSSV`) REFERENCES `sinh_vien` (`MSSV`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `ghi_diem`
--
ALTER TABLE `ghi_diem`
  ADD CONSTRAINT `diemgv` FOREIGN KEY (`MSNV`) REFERENCES `giang_vien` (`MSNV`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `diemlop` FOREIGN KEY (`id_lop`) REFERENCES `lop` (`idlop`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `diemsv` FOREIGN KEY (`MSSV`) REFERENCES `sinh_vien` (`MSSV`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `giang_vien`
--
ALTER TABLE `giang_vien`
  ADD CONSTRAINT `MSNV` FOREIGN KEY (`MSNV`) REFERENCES `nhan_vien` (`MSNV`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quan_ly` FOREIGN KEY (`MSNV_quan_ly`) REFERENCES `ns_khoa_quan_ly` (`MSNV`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `giao_trinh`
--
ALTER TABLE `giao_trinh`
  ADD CONSTRAINT `xuatban` FOREIGN KEY (`tenNXB`) REFERENCES `nha_xuat_ban` (`tenNXB`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lop`
--
ALTER TABLE `lop`
  ADD CONSTRAINT `lop` FOREIGN KEY (`ma_mon_hoc`) REFERENCES `mon_hoc` (`ma_mon_hoc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mon_hoc`
--
ALTER TABLE `mon_hoc`
  ADD CONSTRAINT `mhkhoa` FOREIGN KEY (`ma_khoa`) REFERENCES `khoa` (`ma_khoa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nhan_vien`
--
ALTER TABLE `nhan_vien`
  ADD CONSTRAINT `Username` FOREIGN KEY (`Username`) REFERENCES `nguoi_dung` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ns_khoa_quan_ly`
--
ALTER TABLE `ns_khoa_quan_ly`
  ADD CONSTRAINT `MSNV_khoa` FOREIGN KEY (`MSNV`) REFERENCES `nhan_vien` (`MSNV`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nsqlkhoa` FOREIGN KEY (`ma_khoa`) REFERENCES `khoa` (`ma_khoa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ns_phong_dao_tao`
--
ALTER TABLE `ns_phong_dao_tao`
  ADD CONSTRAINT `ns_pdt` FOREIGN KEY (`MSNV`) REFERENCES `nhan_vien` (`MSNV`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sinh_vien`
--
ALTER TABLE `sinh_vien`
  ADD CONSTRAINT `sv` FOREIGN KEY (`Username`) REFERENCES `nguoi_dung` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `svkhoa` FOREIGN KEY (`ma_khoa`) REFERENCES `khoa` (`ma_khoa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sodt`
--
ALTER TABLE `sodt`
  ADD CONSTRAINT `sdt` FOREIGN KEY (`Username`) REFERENCES `nguoi_dung` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `thuoc`
--
ALTER TABLE `thuoc`
  ADD CONSTRAINT `monhocchua` FOREIGN KEY (`ma_mon_hoc`) REFERENCES `mon_hoc` (`ma_mon_hoc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sachthuoc` FOREIGN KEY (`ISBN`,`nam_xuat_ban`) REFERENCES `giao_trinh` (`ISBN`, `nam_xuat_ban`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `trang_thai_hoc_tap`
--
ALTER TABLE `trang_thai_hoc_tap`
  ADD CONSTRAINT `trang_thai_sv` FOREIGN KEY (`MSSV`) REFERENCES `sinh_vien` (`MSSV`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tuan_hoc`
--
ALTER TABLE `tuan_hoc`
  ADD CONSTRAINT `gvphutrach` FOREIGN KEY (`MSNV`) REFERENCES `giang_vien` (`MSNV`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tuan_hoc_ibfk_1` FOREIGN KEY (`id_lop`) REFERENCES `lop` (`idlop`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vi_tri`
--
ALTER TABLE `vi_tri`
  ADD CONSTRAINT `vitri` FOREIGN KEY (`MSNV`) REFERENCES `nhan_vien` (`MSNV`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
