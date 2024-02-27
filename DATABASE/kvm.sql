-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 23, 2024 at 10:13 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kvm`
--

-- --------------------------------------------------------
--
-- Table structure for table `board`
--

CREATE TABLE `board` (
  `id` int(11) NOT NULL,
  `device` varchar(30) NOT NULL,
  `encoder_name` varchar(30) NOT NULL,
  `ip_address` text NOT NULL,
  `netmask` varchar(50) NOT NULL,
  `broadcast` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `board`
--

INSERT INTO `board` (`id`, `device`, `encoder_name`, `ip_address`, `netmask`, `broadcast`) VALUES
(1, '', '10.1.1.1', '192.168.1.1', '', ''),
(2, '', '20.1.1.1', '170.1.1.2', '', ''),
(3, '', '30.1.1.1', '160.1.1.1', '', ''),
(4, '', '40.1.1.1', '150.1.1.1', '', ''),
(5, '', '50.1.1.1', '140.1.1.1', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `decoder`
--

CREATE TABLE `decoder` (
  `decoder_count` int(11) NOT NULL,
  `ip_address` text NOT NULL,
  `encoder_id` int(11) NOT NULL,
  `decoder_name` varchar(30) NOT NULL,
  `decoder_type` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mac_address` varchar(50) DEFAULT NULL,
  `banner` varchar(30) DEFAULT NULL,
  `thumbnailview` varchar(30) DEFAULT NULL,
  `lastupdatedby` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_authority` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `decoder`
--

INSERT INTO `decoder` (`decoder_count`, `ip_address`, `encoder_id`, `decoder_name`, `decoder_type`, `user_id`, `mac_address`, `banner`, `thumbnailview`, `lastupdatedby`, `user_authority`) VALUES
(1, '172.1681.220', 3, 'decoder1', 'remote', 2, '03:42:4e:d1:03:2H', 'OFF', 'OFF', '2024-02-02 07:33:58', ''),
(2, '192.158.2.100', 2, 'decoder2', 'remote', 9, '04:42:4e:d1:03:7H', 'ON', 'OFF', '2023-12-19 10:16:19', 'Share'),
(3, '168.1.1.3', 3, 'decoder3', 'local', 2, '02:42:2e:d1:03:2H', 'ON', 'OFF', '2023-12-19 10:16:30', ''),
(4, '162.1681.22', 24, 'decoder4', 'remote', 0, '01:12:4sd:d1:03:8d', 'OFF', 'ON', '2023-12-11 07:13:25', ''),
(5, '19.1681.224', 13, 'oct1', 'remote', 0, '09:42:7e:d1:03:2q', 'ON', 'ON', '2024-01-09 09:56:52', '');

-- --------------------------------------------------------

--
-- Table structure for table `decoder_log`
--

CREATE TABLE `decoder_log` (
  `decoder_id` int(11) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `column_name` varchar(50) NOT NULL,
  `new_value` text NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `encoder_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `decoder_log`
--

INSERT INTO `decoder_log` (`decoder_id`, `table_name`, `column_name`, `new_value`, `updated_at`, `encoder_id`, `id`) VALUES
(4, 'decoder', 'decoder_name', 'decoder4', '2023-11-24 05:34:00', 10, 1),
(2, 'decoder', 'decoder_type', 'local', '2023-11-24 06:11:06', 11, 2),
(4, 'decoder', 'thumbnailview', 'ON', '2023-11-24 06:11:27', 10, 3),
(4, 'decoder', 'mac_address', '01:12:4sd:d1:03:8d', '2023-11-24 06:12:28', 10, 4),
(2, 'decoder', 'decoder_type', 'remote', '2023-11-24 06:13:03', 11, 5),
(2, 'decoder', 'thumbnailview', 'OFF', '2023-11-24 06:49:01', 11, 6),
(1, 'decoder', 'thumbnailview', 'OFF', '2023-11-24 06:55:53', 2, 7),
(4, 'decoder', 'decoder_type', 'local', '2023-11-24 11:03:07', 10, 8),
(5, 'decoder', 'encoder_id', '13', '2023-11-26 06:15:12', 13, 9),
(4, 'decoder', 'encoder_id', '24', '2023-11-26 06:15:12', 24, 10),
(1, 'decoder', 'encoder_id', '1', '2023-11-27 04:56:47', 1, 11),
(1, 'decoder', 'encoder_id', '2', '2023-11-27 05:03:36', 2, 12),
(1, 'decoder', 'encoder_id', '3', '2023-11-27 05:41:12', 3, 13),
(1, 'decoder', 'encoder_id', '4', '2023-11-27 05:41:45', 4, 14),
(1, 'decoder', 'encoder_id', '5', '2023-11-27 05:57:08', 5, 15),
(1, 'decoder', 'encoder_id', '6', '2023-11-27 06:08:05', 6, 16),
(1, 'decoder', 'encoder_id', '1', '2023-12-11 05:39:26', 1, 17),
(3, 'decoder', 'ip_address', '168.1.1.3', '2023-12-11 07:12:22', 21, 18),
(4, 'decoder', 'decoder_type', 'remote', '2023-12-11 07:13:25', 24, 19),
(1, 'decoder', 'encoder_id', '2', '2023-12-15 05:01:07', 2, 20),
(2, 'decoder', 'encoder_id', '3', '2023-12-15 06:26:51', 3, 21),
(1, 'decoder', 'encoder_id', '3', '2023-12-15 06:27:30', 3, 22),
(1, 'decoder', 'encoder_id', '1', '2023-12-15 07:02:56', 1, 23),
(2, 'decoder', 'encoder_id', '4', '2023-12-15 07:03:11', 4, 24),
(2, 'decoder', 'encoder_id', '2', '2023-12-15 07:10:35', 2, 25);

-- --------------------------------------------------------

--
-- Table structure for table `kvmname`
--

CREATE TABLE `kvmname` (
  `id` int(10) NOT NULL,
  `kvmname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `language` varchar(20) NOT NULL,
  `banner` varchar(10) NOT NULL,
  `encryption` varchar(20) NOT NULL,
  `hotkey` varchar(100) NOT NULL,
  `time` text NOT NULL,
  `path` text NOT NULL,
  `lastUpdatedBy` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `bannertime` int(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kvmname`
--

INSERT INTO `kvmname` (`id`, `kvmname`, `language`, `banner`, `encryption`, `hotkey`, `time`, `path`, `lastUpdatedBy`, `bannertime`) VALUES
(1, 'RACK1_KVM2023', 'English', 'ALWAYS ON', '3DES', '< Ctrl>', '2024 / 13 / 02 13 : 15', 'C:/xampp1/htdocs/user1 (2).sql', '2024-02-13 06:20:29', 7);

--
-- Triggers `kvmname`
--
DELIMITER $$
CREATE TRIGGER `kvm_trigger` AFTER UPDATE ON `kvmname` FOR EACH ROW BEGIN
    DECLARE column_name VARCHAR(255);
    DECLARE new_value VARCHAR(255);
    DECLARE trigger_name VARCHAR(255);

 SET trigger_name='kvm_trigger';
    IF NEW.kvmname <> OLD.kvmname THEN
        SET column_name = 'kvmname';
        SET new_value = NEW.kvmname;
        INSERT INTO kvm_log (kvm_id, table_name, column_name, new_value) VALUES (OLD.id, 'kvmname', column_name, new_value);
        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.language <> OLD.language THEN
        SET column_name = 'language';
        SET new_value = NEW.language;
        INSERT INTO kvm_log (kvm_id, table_name, column_name, new_value) VALUES (OLD.id, 'kvmname', column_name, new_value);
        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.banner <> OLD.banner THEN
        SET column_name = 'banner';
        SET new_value = NEW.banner;
        INSERT INTO kvm_log (kvm_id, table_name, column_name, new_value) VALUES (OLD.id, 'kvmname', column_name, new_value);
        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.encryption <> OLD.encryption THEN
        SET column_name = 'encryption';
        SET new_value = NEW.encryption;
        INSERT INTO kvm_log (kvm_id, table_name, column_name, new_value) VALUES (OLD.id, 'kvmname', column_name, new_value);
        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.hotkey <> OLD.hotkey THEN
        SET column_name = 'hotkey';
        SET new_value = NEW.hotkey;
        INSERT INTO kvm_log (kvm_id, table_name, column_name, new_value) VALUES (OLD.id, 'kvmname', column_name, new_value);
        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.time <> OLD.time THEN
        SET column_name = 'time';
        SET new_value = NEW.time;
        INSERT INTO kvm_log (kvm_id, table_name, column_name, new_value) VALUES (OLD.id, 'kvmname', column_name, new_value);
        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.path <> OLD.path THEN
        SET column_name = 'path';
        SET new_value = NEW.path;
        INSERT INTO kvm_log (kvm_id, table_name, column_name, new_value) VALUES (OLD.id, 'kvmname', column_name, new_value);
        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.bannertime <> OLD.bannertime THEN
        SET column_name = 'bannertime';
        SET new_value = NEW.bannertime;
        INSERT INTO kvm_log (kvm_id, table_name, column_name, new_value) VALUES (OLD.id, 'kvmname', column_name, new_value);
        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `kvm_log`
--

CREATE TABLE `kvm_log` (
  `kvm_id` int(11) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `column_name` varchar(50) NOT NULL,
  `new_value` text NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kvm_log`
--

INSERT INTO `kvm_log` (`kvm_id`, `table_name`, `column_name`, `new_value`, `updated_at`) VALUES
(1, 'kvmname1', 'name', 'KVM_RACK2111', '2023-05-29 07:56:46'),
(1, 'kvmname1', 'time', '2023 / 26 / 05 14:  29', '2023-05-29 07:57:04'),
(1, 'kvmname1', 'language', 'French', '2023-05-29 07:57:16'),
(1, 'kvmname1', 'language', 'English', '2023-05-29 07:57:27'),
(1, 'kvmname1', 'hotkey', '< Scroll Lock >', '2023-05-29 07:57:33'),
(1, 'kvmname1', 'banner', 'OFF', '2023-05-29 07:58:14'),
(1, 'kvmname1', 'encryp', 'Disable', '2023-05-29 08:00:54'),
(1, 'kvmname1', 'encryp', 'AES', '2023-05-29 08:01:05'),
(1, 'kvmname1', 'encryp', 'DES', '2023-05-29 08:01:14'),
(1, 'kvmname1', 'encryp', '3DES', '2023-05-29 08:01:20'),
(1, 'kvmname', 'time', '2023 / 06 / 10 12 :35', '2023-10-06 06:47:58'),
(1, 'kvmname', 'time', '2023 / 11 / 10 12 :35', '2023-10-11 04:55:13'),
(1, 'kvmname', 'time', '2023 / 12 / 10 17 :15', '2023-10-12 11:19:08'),
(1, 'kvmname', 'time', '2023 / 13 / 10 17 :15', '2023-10-13 09:17:17'),
(1, 'kvmname', 'time', '2023 / 16 / 10 12 :15', '2023-10-16 05:23:03'),
(1, 'kvmname', 'time', '2023 / 16 / 10 14 :15', '2023-10-16 07:14:43'),
(1, 'kvmname', 'time', '2023 / 16 / 10 15 :15', '2023-10-16 09:06:17'),
(1, 'kvmname', 'time', '2023 / 17 / 10 12 :15', '2023-10-17 05:18:20'),
(1, 'kvmname', 'time', '2023 / 17 / 10 16 :15', '2023-10-17 09:22:00'),
(1, 'kvmname', 'time', '2023 / 18 / 10 14 :15', '2023-10-18 07:32:17'),
(1, 'kvmname', 'time', '2023 / 19 / 10 13 :15', '2023-10-19 06:17:02'),
(1, 'kvmname', 'time', '2023 / 20 / 10 12 :15', '2023-10-20 04:26:04'),
(1, 'kvmname', 'time', '2023 / 23 / 10 12 :15', '2023-10-23 07:08:22'),
(1, 'kvmname', 'time', '2023 / 23 / 10 14 :15', '2023-10-23 07:08:28'),
(1, 'kvmname', 'language', 'French', '2023-10-25 07:34:34');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` int(30) NOT NULL,
  `action_made` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `event` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `action_made`, `date_created`, `event`) VALUES
(1, 11, 'Logged out.', '2023-02-26 21:31:29', 'Access Logout'),
(2, 11, 'Logged in', '2023-02-26 21:32:19', 'Access Login'),
(3, 3, 'Logged in', '2023-02-28 01:57:59', 'Access Login'),
(4, 3, 'Logged out.', '2023-02-28 01:58:07', 'Access Logout'),
(5, 5, 'Logged in', '2023-02-28 01:58:31', 'Access Login'),
(6, 16, 'Logged in', '2023-02-28 02:09:16', 'Access Login'),
(7, 16, 'Logged out.', '2023-02-28 02:09:20', 'Access Logout'),
(8, 5, 'Logged in', '2023-02-28 02:09:38', 'Access Login'),
(9, 8, 'Logged in', '2023-02-28 02:13:53', 'Access Login'),
(10, 8, 'Logged out.', '2023-02-28 03:50:38', 'Access Logout'),
(11, 5, 'Logged in', '2023-02-28 05:14:40', 'Access Login'),
(12, 5, 'Logged out.', '2023-02-28 05:55:55', 'Access Logout'),
(13, 11, 'Logged in', '2023-02-28 05:56:15', 'Access Login'),
(14, 11, 'Logged out.', '2023-02-28 05:59:21', 'Access Logout'),
(15, 4, 'Logged in', '2023-02-28 06:00:08', 'Access Login'),
(16, 4, 'Logged out.', '2023-02-28 06:00:16', 'Access Logout'),
(17, 15, 'Logged in', '2023-02-28 06:00:23', 'Access Login'),
(18, 15, 'Logged out.', '2023-02-28 06:00:25', 'Access Logout'),
(19, 5, 'Logged in', '2023-02-28 06:00:31', 'Access Login'),
(20, 5, 'Logged out.', '2023-02-28 19:24:25', 'Access Logout'),
(21, 12, 'Logged in', '2023-02-28 19:24:40', 'Access Login'),
(22, 12, 'Logged out.', '2023-02-28 19:24:46', 'Access Logout'),
(23, 6, 'Logged in', '2023-02-28 19:24:55', 'Access Login'),
(24, 6, 'Logged out.', '2023-02-28 19:24:58', 'Access Logout'),
(25, 11, 'Logged in', '2023-02-28 19:25:22', 'Access Login'),
(26, 1, 'Logged in', '2024-02-23 00:11:27', 'Access Login');

-- --------------------------------------------------------

--
-- Table structure for table `portname`
--

CREATE TABLE `portname` (
  `id` int(11) NOT NULL,
  `portname` varchar(30) NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `macaddr` text NOT NULL,
  `type` varchar(30) NOT NULL,
  `pc_online` varchar(30) NOT NULL,
  `linktype` varchar(20) NOT NULL,
  `audio` varchar(50) NOT NULL,
  `version` varchar(100) NOT NULL,
  `media` text NOT NULL,
  `format` text NOT NULL,
  `resolution` text DEFAULT NULL,
  `framerate` varchar(30) NOT NULL,
  `connect` int(11) NOT NULL,
  `decoder_name` text NOT NULL,
  `status` varchar(30) NOT NULL,
  `lastupdatedby` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `upgrade` int(11) NOT NULL,
  `path` text NOT NULL,
  `enable1` varchar(30) NOT NULL,
  `enable2` varchar(30) NOT NULL,
  `enable3` varchar(30) NOT NULL,
  `enable4` varchar(30) NOT NULL,
  `enable5` varchar(30) NOT NULL,
  `enable6` varchar(30) NOT NULL,
  `enable7` varchar(30) NOT NULL,
  `enable8` varchar(30) NOT NULL,
  `enable9` varchar(30) NOT NULL,
  `enable10` varchar(30) NOT NULL,
  `enable11` varchar(30) NOT NULL,
  `enable12` varchar(30) NOT NULL,
  `enable13` varchar(30) NOT NULL,
  `enable14` varchar(30) NOT NULL,
  `enable15` varchar(30) NOT NULL,
  `enable16` varchar(30) NOT NULL,
  `scan1` text NOT NULL,
  `scan2` text NOT NULL,
  `scan3` text NOT NULL,
  `scan4` text NOT NULL,
  `scan5` text NOT NULL,
  `scan6` text NOT NULL,
  `scan7` text NOT NULL,
  `scan8` text NOT NULL,
  `scan9` text NOT NULL,
  `scan10` text NOT NULL,
  `scan11` text NOT NULL,
  `scan12` text NOT NULL,
  `scan13` text NOT NULL,
  `scan14` text NOT NULL,
  `scan15` text NOT NULL,
  `scan16` text NOT NULL,
  `a1` varchar(30) NOT NULL,
  `a2` varchar(30) NOT NULL,
  `a3` varchar(30) NOT NULL,
  `a4` varchar(30) NOT NULL,
  `a5` varchar(30) NOT NULL,
  `a6` varchar(30) NOT NULL,
  `a7` varchar(30) NOT NULL,
  `a8` varchar(30) NOT NULL,
  `a9` varchar(30) NOT NULL,
  `a10` varchar(30) NOT NULL,
  `a11` varchar(30) NOT NULL,
  `a12` varchar(30) NOT NULL,
  `a13` varchar(30) NOT NULL,
  `a14` varchar(30) NOT NULL,
  `a15` varchar(30) NOT NULL,
  `a16` varchar(30) NOT NULL,
  `switch_id` int(11) DEFAULT NULL,
  `decoder_count` int(11) DEFAULT NULL,
  `image_data` blob DEFAULT NULL,
  `image_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `portname`
--

INSERT INTO `portname` (`id`, `portname`, `ip_address`, `macaddr`, `type`, `pc_online`, `linktype`, `audio`, `version`, `media`, `format`, `resolution`, `framerate`, `connect`, `decoder_name`, `status`, `lastupdatedby`, `upgrade`, `path`, `enable1`, `enable2`, `enable3`, `enable4`, `enable5`, `enable6`, `enable7`, `enable8`, `enable9`, `enable10`, `enable11`, `enable12`, `enable13`, `enable14`, `enable15`, `enable16`, `scan1`, `scan2`, `scan3`, `scan4`, `scan5`, `scan6`, `scan7`, `scan8`, `scan9`, `scan10`, `scan11`, `scan12`, `scan13`, `scan14`, `scan15`, `scan16`, `a1`, `a2`, `a3`, `a4`, `a5`, `a6`, `a7`, `a8`, `a9`, `a10`, `a11`, `a12`, `a13`, `a14`, `a15`, `a16`, `switch_id`, `decoder_count`, `image_data`, `image_name`) VALUES
(1, 'encoder1', '192.168.1.1', '06:42:4e:d1:03:2l', 'HDMI-CIM', 'Yes', 'KvmSwitch', 'Analog', '2.0.0.2010', '/opt/lampp/htdocs/default.json', 'Stereo, 96KHz', '3840 * 2160', '60 fps', 1, 'decoder1', 'busy', '2024-02-23 09:06:48', 1, 'C:/xampp1/htdocs/', 'on', '', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 's', '', '', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 'Share', 'Private', 'Private', 'Share', '', '', '', '', 'Share', 'View', 'Private', '', 'View', 'Private', '', '', 32, NULL, NULL, 'port1.jpg'),
(2, 'encoder2', '170.1.1.2', '06:42:4e:d1:03:2g', 'DP-CIM', 'Yes', 'KvmSwitch', 'Digital', '2.0.0.2010', '/opt/lampp/htdocs/index.js', 'Mono, 48KHz', '1920 * 1080', '15 fps', 1, 'decoder1', 'busy', '2024-02-23 09:12:38', 1, 'C:/xampp1/htdocs/index.js', 'on', 'on', 'on', 'on', 'on', '', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', '', '', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 'View', 'Private', 'Share', 'Private', 'View', 'Private', 'View', 'View', 'Share', 'Private', '', '', '', 'Share', '', '', 31, NULL, NULL, 'port2.jpg'),
(3, 'encoder3', '160.1.1.1', '01:42:4e:d1:03:2d', 'HDMI-CIM', 'Yes', 'Standard Port', 'Analog', '2.0', '/opt/lampp/var/', 'Mono, 48KHz', '1920 * 1080', '30 fps', 1, 'decoder1', 'busy', '2024-02-23 09:00:42', 0, '', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 's', 's', 's', 's', '', 's', 's', 's', 's', 's', 's', 's', 's', 's', '', '', '', '', 'Share', 'Share', '', 'Private', '', 'Private', '', '', '', '', '', 'View', '', '', 30, 3, NULL, 'port3.jpg'),
(4, 'encoder4', '150.1.1.1', '09:42:4e:d1:03:2w', 'HDMI-CIM', 'Yes', 'KvmSwitch', 'Analog', '2.0.0.2010', '/opt/lampp/htdocs/', 'Stereo, 48KHz', '640 * 480', '15 fps', 0, 'decoder1', 'busy', '2024-02-23 09:10:51', 1, 'C:/xampp1/htdocs/Order_ID_5030927518.pdf', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 29, NULL, NULL, 'port4.jpg'),
(5, 'encoder5', '140.1.1.1', '16:42:4e:d7:03:2f', 'DP-CIM', 'Yes', 'KvmSwitch', 'Analog', '2.0.0.2010', '/opt/lampp/var/', 'Mono, 44.1KHz', '1920 * 1080', '30 fps', 0, 'decoder1', 'busy', '2024-02-23 09:12:47', 0, '', 'on', 'on', 'on', 'on', 'on', 'on', '', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', '', '', '', '', '', 'Private', '', '', '', '', '', '', '', '', '', '', 28, NULL, NULL, 'port5.jpg'),
(6, 'encoder6', '10.5.5.2', '06:42:4e:d1:03:2a', 'HDMI-CIM', 'Yes', 'Standard Port', 'Analog', '2.0.0.2', '/opt/lampp/htdocs/', 'Stereo, 96KHz', '320 * 240', '60 fps', 0, 'decoder1', 'busy', '2024-02-23 09:00:42', 1, 'C:/xampp1/htdocs/build.js', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', '', '', '', '', '', '', '', '', '', '', '', '', '', 'View', '', '', 27, NULL, NULL, 'port6.jpg'),
(7, 'encoder7', '10.5.5.2', '06:42:4e:d1:03:2a', 'HDMI-CIM', 'Yes', 'Standard Port', 'Analog', '2.0.0.2010', '/opt/lampp/var/', 'Stereo, 96KHz', '1280 * 720', '60 fps', 1, 'decoder1', 'busy', '2024-02-23 09:00:42', 1, 'C:/xampp1/htdocs/', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', '', 'Private', '', 'View', '', '', '', '', '', '', '', '', '', 'share', '', '', 26, NULL, NULL, 'port7.jpg'),
(8, 'encoder8', '10.5.5.2', '06:42:4e:d1:06:2e', 'DP-CIM', 'Yes', 'Standard Port', 'Digital', '2.0.0.2010', '/opt/lampp/htdocs/', 'Stereo, 96KHz', ' 800 * 600', '15 fps', 1, 'decoder1', 'busy', '2024-02-23 09:12:53', 0, '', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', 's', '', '', '', '', '', '', '', 'View', '', '', '', '', '', '', '', '', 25, NULL, NULL, 'port8.jpg'),
(9, 'encoder9', '10.5.5.2', '06:42:4e:d1:03:2H', 'HDMI-CIM', 'Yes', 'Standard Port', 'OFF', '2.0.0.2010', '/opt/lampp/var/', 'Stereo, 96KHz', '1280 * 720', '30 fps', 1, '', 'idel', '2024-02-23 09:00:42', 0, '', 'on', '', 'on', 'on', '', 'on', '', '', '', '', '', '', 'on', 'on', '', '', '', 's', '', '', '', 's', '', '', '', '', '', 's', '', 's', 's', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 24, NULL, NULL, '/home/acclivis/Desktop/images/port9.jpg'),
(10, 'encoder10', '12.2.2.2', '01:40:4e:d1:03:2a', 'HDMI-CIM', 'Yes', 'KvmSwitch', 'Analog', '2.0.0.2010', '/opt/lampp/htdocs/', 'Stereo, 96KHz', '640 * 480', '30 fps', 0, '', 'idel', '2024-02-23 09:00:42', 0, '', 'on', '', 'on', '', '', '', 'on', 'on', '', '', 'on', '', '', '', '', 'on', '', 's', '', '', '', 's', '', '', '', '', 's', '', 's', '', 's', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 23, NULL, NULL, '/home/acclivis/Desktop/images/port10.jpg'),
(11, 'encoder11', '12.2.2.2', '06:42:4e:d1:03:2H', 'HDMI-CIM', 'Yes', 'Standard Port', 'Digital', '2.0.0.2010', '/opt/lampp/htdocs/', 'Stereo, 96KHz', '320 * 240', '15 fps', 1, '', 'busy', '2024-02-23 09:00:42', 0, '', 'on', 'on', 'on', '', '', '', '', '', '', '', '', 'on', 'on', 'on', 'on', '', '', 's', '', '', 's', '', 's', '', 's', '', '', 's', '', 's', '', '', 'View', '', 'View', '', 'View', '', 'View', '', '', '', '', '', '', '', '', '', 22, NULL, NULL, '/home/acclivis/Desktop/images/port11.jpg'),
(12, 'encoder12', '12.2.2.2', '06:42:4e:d1:01:2H', 'DP-CIM', '', 'Standard Port', 'Analog', '2.0.0.2010', '/opt/lampp/var/', 'Stereo, 96KHz', '320 * 240', '15 fps', 0, '', '', '2024-02-23 09:00:42', 0, '', '', '', 'on', 'on', 'on', '', '', '', '', 'on', '', 'on', '', '', 'on', 'on', '', 's', '', '', '', '', 's', 's', '', '', 's', 's', '', 's', '', '', '', '', '', 'View', '', '', '', '', '', '', '', '', '', '', '', '', 21, NULL, NULL, '/home/acclivis/Desktop/images/port12.jpg'),
(13, 'encoder13', '12.2.2.2', '06:42:4e:d2:03:2H', 'HDMI-CIM', '', 'Standard Port', 'Digital', '2.0.0.2010', '/opt/lampp/htdocs/', 'Stereo, 96KHz', ' 800 * 600', '30 fps', 0, '', 'idel', '2024-02-23 09:00:42', 0, '', '', 'on', '', '', '', '', '', '', '', '', 'on', 'on', 'on', 'on', '', '', 's', '', '', '', '', 's', '', 's', '', 's', '', '', '', 's', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'View', '', '', 20, NULL, NULL, '/home/acclivis/Desktop/images/port13.jpg'),
(14, 'encoder14', '12.2.2.2', '06:42:4e:d1:03:26', 'HDMI-CIM', 'Yes', 'Standard Port', 'Analog', '2.0.0.2010', '/opt/lampp/var/', 'Stereo, 96KHz', '1280 * 720', '60 fps', 1, 'decoder1', 'busy', '2024-02-23 09:00:42', 0, '', 'on', '', '', '', '', '', '', 'on', '', 'on', '', 'on', '', '', 'on', '', 's', '', '', '', '', '', '', '', '', 's', '', 's', 's', '', 's', '', '', '', '', '', '', '', '', 'Private', '', '', '', '', '', '', '', '', 19, NULL, NULL, '/home/acclivis/Desktop/images/port14.jpg'),
(15, 'encoder15', '12.2.2.2', '06:42:4e:d1:03:2H', 'HDMI-CIM', 'Yes', 'Standard Port', 'Digital', '2.0.0.2010', '/opt/lampp/var/', 'Stereo, 96KHz', '320 * 240', '60 fps', 1, '', 'busy', '2024-02-23 09:00:42', 0, '', 'on', '', '', '', '', '', '', '', '', 'on', '', '', 'on', 'on', '', 'on', 's', 's', '', '', '', '', '', '', '', '', '', 's', '', '', 's', 's', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 18, NULL, NULL, '/home/acclivis/Desktop/images/port15.jpg'),
(16, 'encoder16', '12.2.2.2', '06:42:4e:d1:03:2H', 'HDMI-CIM', 'Yes', 'Standard Port', 'Analog', '2.0.0.2010', '/opt/lampp/htdocs/', 'Stereo, 96KHz', '1920 * 1080', '60 fps', 1, '', '', '2024-02-23 09:00:42', 1, 'C:/xampp1/htdocs/', 'on', '', '', '', '', '', 'on', '', 'on', '', '', 'on', '', '', '', '', 's', '', '', '', '', '', '', '', '', '', '', 's', 's', '', '', 's', '', '', '', '', '', '', '', 'View', '', 'Private', '', '', '', '', '', '', 17, NULL, NULL, '/home/acclivis/Desktop/images/port16.jpg'),
(17, 'encoder17', '12.2.2.2', '06:42:4e:d1:03:2H', 'DP-CIM', '', 'Standard Port', 'Digital', '2.0.0.2010', '/opt/lampp/var/', 'Stereo, 96KHz', '1280 * 720', '30 fps', 0, '', '', '2024-02-23 09:00:42', 0, '', '', '', '', 'on', 'on', '', '', '', 'on', 'on', '', '', 'on', '', 'on', '', '', 's', '', '', '', '', '', '', '', '', 's', 's', 's', '', 's', '', 'View', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16, NULL, NULL, '/home/acclivis/Desktop/images/port17.jpg'),
(18, 'encoder18', '12.2.2.2', '06:42:4e:d1:03:2H', 'HDMI-CIM', 'Yes', 'KvmSwitch', 'Analog', '2.0.0.2010', '/opt/lampp/htdocs/', 'Stereo, 96KHz', '3840 * 2160', '60 fps', 2, 'decoder1', 'busy', '2024-02-23 09:00:42', 0, '', '', 'on', '', '', '', '', '', 'on', 'on', '', '', '', 'on', '', 'on', 'on', 's', '', '', '', '', 's', '', '', '', '', 's', 's', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Private', '', '', '', '', '', 15, NULL, NULL, '/home/acclivis/Desktop/images/port18.jpg'),
(19, 'encoder19', '12.2.2.2', '16:42:4e:d1:03:2j', 'DP-CIM', '', 'Standard Port', 'Digital', '2.0.0.2010', '/opt/lampp/var/', 'Stereo, 96KHz', '640 * 480', '15 fps', 0, '', '', '2024-02-23 09:00:42', 0, '', 'on', '', '', 'on', 'on', '', '', '', '', 'on', '', '', '', '', '', '', 's', '', '', 's', 's', 's', '', '', 's', '', 's', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 14, NULL, NULL, '/home/acclivis/Desktop/images/port19.jpg'),
(20, 'encoder20', '12.2.2.2', '06:42:4e:d1:03:2H', 'HDMI-CIM', '', 'Standard Port', 'Analog', '2.0.0.2010', '/opt/lampp/var/', 'Stereo, 96KHz', '640 * 480', '60 fps', 0, '', '', '2024-02-23 09:00:42', 0, '', 'on', '', '', '', '', '', 'on', 'on', '', 'on', 'on', '', '', '', 'on', 'on', 's', '', 's', 's', 's', 's', 's', 's', '', '', 's', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 13, NULL, NULL, '/home/acclivis/Desktop/images/port20.jpg'),
(21, 'encoder21', '12.2.2.2', '10:42:4e:d1:03:2d', 'HDMI-CIM', '', 'KvmSwitch', 'Digital', '2.0.0.2010', '/opt/lampp/var/', 'Stereo, 96KHz', '320 * 240', '15 fps', 0, '', '', '2024-02-23 09:00:42', 0, '', 'on', '', '', '', '', 'on', 'on', '', '', 'on', '', '', '', '', '', '', '', '', '', '', '', '', 's', '', '', 's', '', 's', 's', 's', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 12, NULL, NULL, '/home/acclivis/Desktop/images/port21.jpg'),
(22, 'encoder22', '12.2.2.2', '06:42:4e:d1:03:2H', 'HDMI-CIM', 'Yes', 'Standard Port', 'OFF', '2.0.0.2010', '/opt/lampp/var/', 'Stereo, 96KHz', '640 * 480', '60 fps', 1, '', '', '2024-02-23 09:00:42', 0, '', 'on', '', '', '', '', '', '', '', '', 'on', '', 'on', 'on', 'on', '', '', '', 's', '', '', '', '', '', 's', '', '', 's', 's', 's', '', 's', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 11, NULL, NULL, '/home/acclivis/Desktop/images/port22.jpg'),
(23, 'encoder23', '12.2.2.2', '06:42:4e:d1:03:2H', 'DP-CIM', 'Yes', 'Standard Port', 'Digital', '2.0.0.2010', '/opt/lampp/htdocs/', 'Mono, 44.1KHz', '1280 * 720', '60 fps', 1, '', '', '2024-02-23 09:00:42', 0, '', 'on', '', '', '', 'on', '', '', '', 'on', '', '', 'on', '', '', '', '', 's', '', '', '', 's', '', '', '', '', 's', '', 's', '', '', '', 's', '', '', 'View', '', '', '', '', '', '', '', '', '', '', '', '', '', 10, NULL, NULL, '/home/acclivis/Desktop/images/port23.jpg'),
(24, 'encoder24', '12.2.2.2', '06:42:4e:d1:03:2H', 'HDMI-CIM', 'Yes', 'Standard Port', 'Digital', '2.0.0.2010', '/opt/lampp/var/', 'Stereo, 96KHz', '3840 * 2160', '30 fps', 1, '', '', '2024-02-23 09:00:42', 1, 'C:/xampp1/htdocs/', 'on', '', '', '', '', '', '', '', '', '', 'on', '', '', 'on', '', '', 's', '', '', '', '', '', '', '', '', 's', '', 's', 's', 's', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 9, NULL, NULL, '/home/acclivis/Desktop/images/port24.jpg'),
(25, 'encoder25', '12.2.2.2', '06:42:4e:d1:03:2H', 'HDMI-CIM', '', 'Standard Port', 'Analog', '2.0.0.2010', '/opt/lampp/var/', 'Stereo, 96KHz', '1280 * 720', '15 fps', 0, '', '', '2024-02-23 09:00:42', 0, '', '', 'on', '', '', '', '', 'on', '', 'on', '', '', '', 'on', 'on', 'on', '', '', '', '', 's', '', '', 's', '', 's', 's', '', '', 's', '', 's', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 8, NULL, NULL, '/home/acclivis/Desktop/images/port25.jpg'),
(26, 'encoder26', '12.2.2.2', '06:42:4e:d1:03:2H', 'HDMI-CIM', '', 'Standard Port', 'Analog', '2.0.0.2010', '/opt/lampp/var/', 'Stereo, 96KHz', '3840 * 2160', '60 fps', 0, '', '', '2024-02-23 09:00:42', 0, '', 'on', '', '', '', '', '', 'on', 'on', '', 'on', 'on', 'on', '', '', '', '', '', '', 's', '', '', '', 's', 's', 's', '', '', 's', '', 's', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 7, NULL, NULL, '/home/acclivis/Desktop/images/port26.jpg'),
(27, 'encoder27', '12.2.2.2', '06:42:4e:d1:03:2H', 'HDMI-CIM', '', 'Standard Port', 'Analog', '2.0.0.2010', '/opt/lampp/var/', 'Stereo, 96KHz', '640 * 480', '60 fps', 0, '', '', '2024-02-23 09:00:42', 0, '', '', '', '', '', '', '', '', '', '', '', 'on', '', 'on', '', 'on', '', '', '', '', '', '', 's', 's', 's', '', 's', 's', '', 's', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 6, NULL, NULL, '/home/acclivis/Desktop/images/port27.jpg'),
(28, 'encoder28', '12.2.2.2', '06:42:4e:d1:03:2H', 'HDMI-CIM', '', 'Standard Port', 'Analog', '2.0.0.2010', '/opt/lampp/var/', 'Stereo, 96KHz', '1920 * 1080', '60 fps', 0, '', '', '2024-02-23 09:00:42', 0, '', '', 'on', '', '', '', '', '', '', 'on', 'on', '', 'on', '', '', '', '', 's', '', '', '', '', '', '', '', '', 's', 's', 's', 's', '', '', 's', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 5, NULL, NULL, '/home/acclivis/Desktop/images/port28.jpg'),
(29, 'encoder29', '12.2.2.2', '06:42:4e:d1:03:2H', 'HDMI-CIM', '', 'Standard Port', 'Analog', '2.0.0.2010', '/opt/lampp/var/', 'Stereo, 96KHz', '640 * 480', '60 fps', 0, '', '', '2024-02-23 09:00:42', 0, '', 'on', 'on', 'on', '', '', '', '', '', '', '', '', 'on', '', '', '', 'on', '', '', 's', '', 's', '', 's', 's', '', 's', '', 's', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 4, NULL, NULL, '/home/acclivis/Desktop/images/port29.jpg'),
(30, 'encoder30', '12.2.2.2', '06:42:4e:d1:03:2H', 'HDMI-CIM', '', 'Standard Port', 'Analog', '2.0.0.2010', '/opt/lampp/var/', 'Stereo, 96KHz', '1920 * 1080', '60 fps', 0, '', '', '2024-02-23 09:00:42', 0, '', 'on', '', '', '', '', '', '', '', '', '', '', '', 'on', '', '', '', 's', 's', '', '', '', '', 's', '', '', '', '', 's', 's', 's', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 3, NULL, NULL, '/home/acclivis/Desktop/images/port30.jpg'),
(31, 'encoder31', '12.2.2.2', '06:42:4e:d1:03:2H', 'HDMI-CIM', '', 'Standard Port', 'Analog', '2.0.0.2010', '/opt/lampp/var/', 'Stereo, 96KHz', '640 * 480', '60 fps', 0, '', '', '2024-02-23 09:00:42', 0, '', '', '', '', '', '', '', 'on', '', '', 'on', '', '', 'on', 'on', '', '', 's', '', '', '', '', '', '', 's', '', 's', '', 's', '', 's', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 2, NULL, NULL, '/home/acclivis/Desktop/images/port31.jpg'),
(32, 'encoder32', '12.2.2.2', '06:42:4e:d1:03:2H', 'HDMI-CIM', '', 'Standard Port', 'Analog', '2.0.0.2010', '/opt/lampp/var/', 'Stereo, 96KHz', '1920 * 1080', '60 fps', 0, '', '', '2024-02-23 09:00:42', 0, '', '', 'on', '', '', '', 'on', '', '', '', '', 'on', '', 'on', '', '', '', '', '', '', 's', '', '', '', '', '', 's', '', '', 's', 's', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, NULL, NULL, '/home/acclivis/Desktop/images/port32.jpg');

--
-- Triggers `portname`
--
DELIMITER $$
CREATE TRIGGER `port_trigger` AFTER UPDATE ON `portname` FOR EACH ROW BEGIN
    DECLARE column_name VARCHAR(50);
    DECLARE new_value TEXT;
    DECLARE trigger_name VARCHAR(50);
    DECLARE portname_switch_id INT;

    SET trigger_name = 'portname_trigger';

    IF NEW.portname <> OLD.portname THEN
        SET column_name = 'portname';
        SET new_value = NEW.portname;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.ip_address <> OLD.ip_address THEN
        SET column_name = 'ip_address';
        SET new_value = NEW.ip_address;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.macaddr <> OLD.macaddr THEN
        SET column_name = 'macaddr';
        SET new_value = NEW.macaddr;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.type <> OLD.type THEN
        SET column_name = 'type';
        SET new_value = NEW.type;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

        IF NEW.pc_online <> OLD.pc_online THEN
        SET column_name = 'pc_online';
        SET new_value = NEW.pc_online;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.linktype <> OLD.linktype THEN
        SET column_name = 'linktype';
        SET new_value = NEW.linktype;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.audio <> OLD.audio THEN
        SET column_name = 'audio';
        SET new_value = NEW.audio;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.format <> OLD.format THEN
        SET column_name = 'format';
        SET new_value = NEW.format;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.resolution <> OLD.resolution THEN
        SET column_name = 'resolution';
        SET new_value = NEW.resolution;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.framerate <> OLD.framerate THEN
        SET column_name = 'framerate';
        SET new_value = NEW.framerate;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

        IF NEW.connect <> OLD.connect THEN
        SET column_name = 'connect';
        SET new_value = NEW.connect;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.decoder_name <> OLD.decoder_name THEN
        SET column_name = 'decoder_name';
        SET new_value = NEW.decoder_name;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                IF NEW.path <> OLD.path THEN
        SET column_name = 'path';
        SET new_value = NEW.path;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    
                IF NEW.upgrade <> OLD.upgrade THEN
        SET column_name = 'upgrade';
        SET new_value = NEW.upgrade;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

        IF NEW.switch_id <> OLD.switch_id THEN
        SET column_name = 'switch_id';
        SET new_value = NEW.switch_id;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

        IF NEW.decoder_count <> OLD.decoder_count THEN
        SET column_name = 'decoder_count';
        SET new_value = NEW.decoder_count;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.media <> OLD.media THEN
        SET column_name = 'media';
        SET new_value = NEW.media;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                IF NEW.a1 <> OLD.a1 THEN
        SET column_name = 'a1';
        SET new_value = NEW.a1;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                IF NEW.a2 <> OLD.a2 THEN
        SET column_name = 'a2';
        SET new_value = NEW.a2;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a3 <> OLD.a3 THEN
        SET column_name = 'a3';
        SET new_value = NEW.a3;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a4 <> OLD.a4 THEN
        SET column_name = 'a4';
        SET new_value = NEW.a4;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a5 <> OLD.a5 THEN
        SET column_name = 'a5';
        SET new_value = NEW.a5;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a6 <> OLD.a6 THEN
        SET column_name = 'a6';
        SET new_value = NEW.a6;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a7 <> OLD.a7 THEN
        SET column_name = 'a7';
        SET new_value = NEW.a7;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a8 <> OLD.a8 THEN
        SET column_name = 'a8';
        SET new_value = NEW.a8;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a9 <> OLD.a9 THEN
        SET column_name = 'a9';
        SET new_value = NEW.a9;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a10 <> OLD.a10 THEN
        SET column_name = 'a10';
        SET new_value = NEW.a10;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a11 <> OLD.a11 THEN
        SET column_name = 'a11';
        SET new_value = NEW.a11;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a12 <> OLD.a12 THEN
        SET column_name = 'a12';
        SET new_value = NEW.a12;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a13 <> OLD.a13 THEN
        SET column_name = 'a13';
        SET new_value = NEW.a13;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a14 <> OLD.a14 THEN
        SET column_name = 'a14';
        SET new_value = NEW.a14;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a15 <> OLD.a15 THEN
        SET column_name = 'a15';
        SET new_value = NEW.a15;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a16 <> OLD.a16 THEN
        SET column_name = 'a16';
        SET new_value = NEW.a16;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.enable1 <> OLD.enable1 THEN
        SET column_name = 'enable1';
        SET new_value = NEW.enable1;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable2 <> OLD.enable2 THEN
        SET column_name = 'enable2';
        SET new_value = NEW.enable2;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable3 <> OLD.enable3 THEN
        SET column_name = 'enable3';
        SET new_value = NEW.enable3;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable4 <> OLD.enable4 THEN
        SET column_name = 'enable4';
        SET new_value = NEW.enable4;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable5 <> OLD.enable5 THEN
        SET column_name = 'enable5';
        SET new_value = NEW.enable5;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable6 <> OLD.enable6 THEN
        SET column_name = 'enable6';
        SET new_value = NEW.enable6;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable7 <> OLD.enable7 THEN
        SET column_name = 'enable7';
        SET new_value = NEW.enable7;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable8 <> OLD.enable8 THEN
        SET column_name = 'enable8';
        SET new_value = NEW.enable8;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable9 <> OLD.enable9 THEN
        SET column_name = 'enable9';
        SET new_value = NEW.enable9;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable10 <> OLD.enable10 THEN
        SET column_name = 'enable10';
        SET new_value = NEW.enable10;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable11 <> OLD.enable11 THEN
        SET column_name = 'enable11';
        SET new_value = NEW.enable11;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable12 <> OLD.enable12 THEN
        SET column_name = 'enable12';
        SET new_value = NEW.enable12;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable13 <> OLD.enable13 THEN
        SET column_name = 'enable13';
        SET new_value = NEW.enable13;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable14 <> OLD.enable14 THEN
        SET column_name = 'enable14';
        SET new_value = NEW.enable14;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable15 <> OLD.enable15 THEN
        SET column_name = 'enable15';
        SET new_value = NEW.enable15;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable16 <> OLD.enable16 THEN
        SET column_name = 'enable16';
        SET new_value = NEW.enable16;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

        IF NEW.scan1 <> OLD.scan1 THEN
        SET column_name = 'scan1';
        SET new_value = NEW.scan1;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan2 <> OLD.scan2 THEN
        SET column_name = 'scan2';
        SET new_value = NEW.scan2;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan3 <> OLD.scan3 THEN
        SET column_name = 'scan3';
        SET new_value = NEW.scan3;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan4 <> OLD.scan4 THEN
        SET column_name = 'scan4';
        SET new_value = NEW.scan4;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan5 <> OLD.scan5 THEN
        SET column_name = 'scan5';
        SET new_value = NEW.scan5;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan6 <> OLD.scan6 THEN
        SET column_name = 'scan6';
        SET new_value = NEW.scan6;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan7 <> OLD.scan7 THEN
        SET column_name = 'scan7';
        SET new_value = NEW.scan7;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan8 <> OLD.scan8 THEN
        SET column_name = 'scan8';
        SET new_value = NEW.scan8;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan9 <> OLD.scan9 THEN
        SET column_name = 'scan9';
        SET new_value = NEW.scan9;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan10 <> OLD.scan10 THEN
        SET column_name = 'scan10';
        SET new_value = NEW.scan10;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan11 <> OLD.scan11 THEN
        SET column_name = 'scan11';
        SET new_value = NEW.scan11;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan12 <> OLD.scan12 THEN
        SET column_name = 'scan12';
        SET new_value = NEW.scan12;

        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan13 <> OLD.scan13 THEN
        SET column_name = 'scan13';
        SET new_value = NEW.scan13;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan14 <> OLD.scan14 THEN
        SET column_name = 'scan14';
        SET new_value = NEW.scan14;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan15 <> OLD.scan15 THEN
        SET column_name = 'scan15';
        SET new_value = NEW.scan15;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan16 <> OLD.scan16 THEN
        SET column_name = 'scan16';
        SET new_value = NEW.scan16;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `port_log`
--

CREATE TABLE `port_log` (
  `port_id` int(11) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `column_name` varchar(50) NOT NULL,
  `new_value` text NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `switch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `port_log`
--

INSERT INTO `port_log` (`port_id`, `table_name`, `column_name`, `new_value`, `updated_at`, `switch_id`) VALUES
(10, 'portname', 'resolution', '640 * 480', '2023-11-24 05:37:14', 23),
(1, 'portname', 'linktype', 'StandardPort', '2023-11-24 05:41:57', 32),
(5, 'portname', 'framerate', '60 fps', '2023-11-24 06:43:13', 28),
(13, 'portname', 'macaddr', '06:42:4e:d2:03:2H', '2023-11-24 06:46:40', 20),
(2, 'portname', 'framerate', '30 fps', '2023-11-24 06:54:12', 31),
(2, 'portname', 'framerate', '60 fps', '2023-11-24 07:00:36', 31),
(1, 'portname', 'linktype', 'KvmSwitch', '2023-11-24 07:15:45', 32),
(7, 'portname', 'macaddr', '06:42:4e:d1:03:2a', '2023-11-24 07:20:23', 26),
(2, 'portname', 'resolution', '320 * 240', '2023-11-24 07:47:11', 31),
(2, 'portname', 'linktype', 'KvmSwitch', '2023-11-24 07:50:14', 31),
(2, 'portname', 'audio', 'Digital', '2023-11-24 08:01:09', 31),
(10, 'portname', 'macaddr', '01:40:4e:d1:03:2a', '2023-11-24 08:06:32', 23),
(14, 'portname', 'macaddr', '06:42:4e:d1:03:26', '2023-11-24 08:15:50', 19),
(1, 'portname', 'resolution', '320 * 240', '2023-11-24 08:33:56', 32),
(2, 'portname', 'media', '/opt/lampp/htdocs/', '2023-11-24 08:35:51', 31),
(6, 'portname', 'resolution', '1920 * 1080', '2023-11-24 08:36:47', 27),
(3, 'portname', 'portname', 'server3', '2023-11-24 09:01:45', 30),
(7, 'portname', 'resolution', '1280 * 720', '2023-11-24 09:08:39', 26),
(3, 'portname', 'resolution', '1920 * 1080', '2023-11-24 09:23:02', 30),
(2, 'portname', 'resolution', '3840 * 2160', '2023-11-24 09:24:15', 31),
(5, 'portname', 'resolution', '1920 * 1080', '2023-11-24 09:44:32', 28),
(10, 'portname', 'media', '/opt/lampp/htdocs/', '2023-11-24 09:47:10', 23),
(13, 'portname', 'media', '/opt/lampp/htdocs/', '2023-11-24 09:55:56', 20),
(4, 'portname', 'resolution', '1280 * 720', '2023-11-24 10:45:03', 29),
(1, 'portname', 'linktype', 'StandardPort', '2023-11-24 10:45:17', 32),
(1, 'portname', 'audio', 'Analog', '2024-02-23 09:06:48', 32),
(2, 'portname', 'audio', 'OFF', '2024-02-23 09:06:53', 31),
(8, 'portname', 'media', '/opt/lampp/htdocs/', '2024-02-23 09:07:56', 25),
(2, 'portname', 'resolution', '1920 * 1080', '2024-02-23 09:10:42', 31),
(4, 'portname', 'framerate', '15 fps', '2024-02-23 09:10:51', 29),
(2, 'portname', 'audio', 'Digital', '2024-02-23 09:12:38', 31),
(2, 'portname', 'format', 'Mono, 48KHz', '2024-02-23 09:12:38', 31),
(5, 'portname', 'resolution', '1920 * 1080', '2024-02-23 09:12:47', 28),
(8, 'portname', 'framerate', '15 fps', '2024-02-23 09:12:53', 25);

-- --------------------------------------------------------

--
-- Table structure for table `port_queue`
--

CREATE TABLE `port_queue` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `portname` varchar(50) NOT NULL,
  `decoder_name` varchar(30) NOT NULL,
  `request_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT 'waiting'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `port_queue`
--

INSERT INTO `port_queue` (`id`, `user_id`, `portname`, `decoder_name`, `request_time`, `status`) VALUES
(1, 14, 'port1', 'decoder1', '2023-12-19 11:33:12', 'busy'),
(2, 14, 'port1', 'decoder1', '2023-12-19 11:49:05', 'waiting'),
(3, 14, 'port1', 'decoder1', '2023-12-19 11:49:57', 'waiting'),
(4, 14, 'port2', 'decoder1', '2023-12-20 05:09:27', 'waiting'),
(5, 14, 'port2', 'decoder1', '2023-12-20 05:09:29', 'waiting'),
(6, 14, 'port7', 'decoder1', '2023-12-20 05:42:42', 'waiting'),
(7, 14, 'port7', 'decoder1', '2023-12-20 06:28:37', 'waiting'),
(8, 14, 'port8', 'decoder1', '2023-12-20 06:28:40', 'waiting'),
(9, 14, 'port1', 'decoder1', '2023-12-20 08:49:34', 'waiting'),
(10, 14, 'port4', 'decoder1', '2023-12-21 04:48:33', 'waiting'),
(11, 14, 'port3', 'decoder1', '2023-12-21 05:58:35', 'waiting'),
(12, 14, 'port8', 'decoder1', '2023-12-21 05:58:39', 'waiting'),
(13, 14, 'port1', 'decoder1', '2023-12-21 05:58:43', 'waiting'),
(14, 1, 'port3', 'decoder1', '2023-12-27 05:43:37', 'waiting'),
(15, 1, 'server2', 'decoder1', '2024-01-03 05:37:47', 'waiting'),
(16, 11, 'ENCODER1', 'decoder1', '2024-01-05 05:10:57', 'waiting'),
(17, 11, 'ENCODER1', 'decoder1', '2024-01-05 06:00:49', 'waiting'),
(18, 1, 'ENCODER1', 'decoder1', '2024-01-05 08:50:02', 'waiting'),
(19, 14, 'ENCODER1', 'decoder1', '2024-01-08 05:19:24', 'waiting'),
(20, 14, 'ENCODER1', 'decoder1', '2024-01-08 05:27:10', 'waiting'),
(21, 14, 'ENCODER1', 'decoder1', '2024-01-08 05:27:48', 'waiting'),
(22, 14, 'portserver1', 'decoder1', '2024-01-08 05:29:08', 'waiting'),
(23, 14, 'portserver1', 'decoder1', '2024-01-08 08:28:38', 'waiting'),
(24, 1, 'ENCODER1', 'decoder1', '2024-01-11 08:55:13', 'waiting'),
(25, 16, 'ENCODER1', 'decoder1', '2024-01-16 05:39:55', 'waiting');

-- --------------------------------------------------------

--
-- Table structure for table `switch`
--

CREATE TABLE `switch` (
  `switch_id` int(11) NOT NULL,
  `encoder_id` int(11) NOT NULL,
  `kvm_type` varchar(50) NOT NULL,
  `kvm_name` varchar(50) NOT NULL,
  `lastupdatedby` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `switch`
--

INSERT INTO `switch` (`switch_id`, `encoder_id`, `kvm_type`, `kvm_name`, `lastupdatedby`) VALUES
(1, 32, 'Standard Port', 'Rack2023', '2023-11-24 05:02:51'),
(2, 31, 'Standard Port', 'Rack2023', '2023-11-24 05:02:51'),
(3, 30, 'Standard Port', 'oct', '2023-11-24 10:49:16'),
(4, 29, 'Kvm Switch', 'Rack2023', '2023-11-24 09:58:09'),
(5, 28, 'Standard Port', 'Rack2023', '2023-11-24 05:02:51'),
(6, 27, 'Standard Port', 'Rack2023', '2023-11-24 05:02:51'),
(7, 26, 'Standard Port', 'Rack2023', '2023-11-24 05:02:51'),
(8, 25, 'kvm', 'Rack2023', '2023-11-24 11:55:50'),
(9, 24, 'Standard Port', 'oct', '2023-11-24 10:08:41'),
(10, 23, 'Kvm Switch', 'Rack2023', '2023-11-24 06:06:00'),
(11, 22, 'Standard Port', 'Rack2023', '2023-11-24 05:02:51'),
(12, 21, 'Standard Port', 'Rack2023', '2023-11-24 05:02:51'),
(13, 20, 'kvm', 'Rack2023', '2023-11-24 11:59:08'),
(14, 19, 'Standard Port', 'oct', '2023-11-24 10:53:59'),
(15, 18, 'Standard Port', 'Rack2023', '2023-11-24 05:02:51'),
(16, 17, 'Kvm Switch', 'Rack_oct', '2023-11-24 06:06:54'),
(17, 16, 'Standard Port', 'kkkkk', '2023-11-24 11:05:45'),
(18, 15, 'oct', 'Rack2023', '2023-11-24 12:01:33'),
(19, 14, 'Standard Port', 'Rack2023', '2023-11-24 05:02:51'),
(20, 13, 'Standard Port', 'Rackoct', '2023-11-24 06:46:25'),
(21, 12, 'Standard Port', 'Rack2023', '2023-11-24 05:02:51'),
(22, 11, 'Standard Port', 'oct', '2023-11-24 06:48:04'),
(23, 10, 'Kvm switch', 'kvm_13', '2024-01-09 10:01:00'),
(24, 9, 'Standard Port', 'Rack2023', '2023-11-24 05:02:51'),
(25, 8, 'Standard Port', 'oct', '2023-11-24 12:06:18'),
(26, 7, 'Standard Port', 'Rack2023', '2023-11-24 05:02:51'),
(27, 6, 'Standard Port', 'Rack2023', '2023-11-24 05:02:51'),
(28, 5, 'Standard Port', 'Rack2023', '2023-11-24 05:02:51'),
(29, 4, 'Kvm Switch', 'Rack2023', '2023-11-24 06:08:57'),
(30, 3, 'Standard Port', 'Rack2023', '2023-11-24 05:02:51'),
(31, 2, 'Kvm Switch', 'oct', '2023-11-24 07:04:13'),
(32, 1, 'Kvm Switch', 'Rack2023', '2023-11-24 06:09:36');

--
-- Triggers `switch`
--
DELIMITER $$
CREATE TRIGGER `switch_trigger` AFTER UPDATE ON `switch` FOR EACH ROW BEGIN
    DECLARE column_name VARCHAR(50);
    DECLARE new_value TEXT;
    DECLARE trigger_name VARCHAR(50);
    DECLARE switch_encoder_id INT;

    SET trigger_name = 'switch_trigger';

    IF NEW.encoder_id <> OLD.encoder_id THEN
        SET column_name = 'encoder_id';
        SET new_value = NEW.encoder_id;
        SET switch_encoder_id = NEW.encoder_id; -- Capture the encoder_id

        INSERT INTO switch_log (switch_id, table_name, column_name, new_value, encoder_id)
        VALUES (OLD.switch_id, 'switch', column_name, new_value, switch_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.kvm_type <> OLD.kvm_type THEN
        SET column_name = 'kvm_type';
        SET new_value = NEW.kvm_type;
        SET switch_encoder_id = NEW.encoder_id; -- Capture the encoder_id

        INSERT INTO switch_log (switch_id, table_name, column_name, new_value, encoder_id)
        VALUES (OLD.switch_id, 'switch', column_name, new_value, switch_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.kvm_name <> OLD.kvm_name THEN
        SET column_name = 'kvm_name';
        SET new_value = NEW.kvm_name;
        SET switch_encoder_id = NEW.encoder_id; -- Capture the encoder_id

        INSERT INTO switch_log (switch_id, table_name, column_name, new_value, encoder_id)
        VALUES (OLD.switch_id, 'switch', column_name, new_value, switch_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `switch_log`
--

CREATE TABLE `switch_log` (
  `switch_id` int(11) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `column_name` varchar(50) NOT NULL,
  `new_value` text NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `encoder_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `switch_log`
--

INSERT INTO `switch_log` (`switch_id`, `table_name`, `column_name`, `new_value`, `updated_at`, `encoder_id`) VALUES
(23, 'switch', 'kvm_type', 'Kvm seitch', '2023-11-24 05:36:32', 10),
(16, 'switch', 'kvm_name', 'Rack_oct', '2023-11-24 06:01:26', 17),
(23, 'switch', 'kvm_type', 'Kvm switch', '2023-11-24 06:05:32', 10),
(10, 'switch', 'kvm_type', 'Kvm Switch', '2023-11-24 06:06:00', 23),
(16, 'switch', 'kvm_type', 'Kvm Switch', '2023-11-24 06:06:54', 17),
(29, 'switch', 'kvm_type', 'Kvm Switch', '2023-11-24 06:08:57', 4),
(32, 'switch', 'kvm_type', 'Kvm Switch', '2023-11-24 06:09:36', 1),
(20, 'switch', 'kvm_name', 'Rackoct', '2023-11-24 06:46:25', 13),
(22, 'switch', 'kvm_name', 'oct', '2023-11-24 06:48:04', 11),
(31, 'switch', 'kvm_type', 'Kvm Switch', '2023-11-24 06:57:37', 2),
(31, 'switch', 'kvm_name', 'oct', '2023-11-24 07:04:13', 2),
(4, 'switch', 'kvm_type', 'Kvm Switch', '2023-11-24 09:58:09', 29),
(9, 'switch', 'kvm_name', 'oct', '2023-11-24 10:08:41', 24),
(18, 'switch', 'kvm_type', 'kvm switch', '2023-11-24 10:42:46', 15),
(3, 'switch', 'kvm_name', 'oct', '2023-11-24 10:49:16', 30),
(18, 'switch', 'kvm_type', 'Standard Port', '2023-11-24 10:51:31', 15),
(14, 'switch', 'kvm_name', 'oct', '2023-11-24 10:53:59', 19),
(17, 'switch', 'kvm_name', 'kkkkk', '2023-11-24 11:05:45', 16),
(8, 'switch', 'kvm_type', 'kvm', '2023-11-24 11:55:50', 25),
(13, 'switch', 'kvm_type', 'kvm', '2023-11-24 11:59:08', 20),
(18, 'switch', 'kvm_type', 'oct', '2023-11-24 12:01:33', 15),
(25, 'switch', 'kvm_name', 'oct', '2023-11-24 12:06:18', 8),
(23, 'switch', 'kvm_name', 'kvm_13', '2024-01-09 10:01:00', 10);

-- --------------------------------------------------------

--
-- Table structure for table `trigger_log`
--

CREATE TABLE `trigger_log` (
  `id` int(11) NOT NULL,
  `trigger_name` varchar(255) DEFAULT NULL,
  `event_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trigger_log`
--

INSERT INTO `trigger_log` (`id`, `trigger_name`, `event_time`) VALUES
(1, 'user_trigger', '2024-02-23 08:13:04'),
(2, 'portname_trigger', '2024-02-23 09:06:48'),
(3, 'portname_trigger', '2024-02-23 09:06:53'),
(4, 'portname_trigger', '2024-02-23 09:07:56'),
(5, 'user_trigger', '2024-02-23 09:09:58'),
(6, 'portname_trigger', '2024-02-23 09:10:42'),
(7, 'portname_trigger', '2024-02-23 09:10:51'),
(8, 'portname_trigger', '2024-02-23 09:12:38'),
(9, 'portname_trigger', '2024-02-23 09:12:38'),
(10, 'portname_trigger', '2024-02-23 09:12:47'),
(11, 'portname_trigger', '2024-02-23 09:12:53');

-- --------------------------------------------------------

--
-- Table structure for table `upgradehistory`
--

CREATE TABLE `upgradehistory` (
  `no` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `user` varchar(100) NOT NULL,
  `starttime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  `perversion` varchar(80) NOT NULL,
  `upgradeversion` varchar(80) NOT NULL,
  `result` varchar(80) NOT NULL,
  `path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `upgradehistory`
--

INSERT INTO `upgradehistory` (`no`, `type`, `user`, `starttime`, `endtime`, `perversion`, `upgradeversion`, `result`, `path`) VALUES
(1, 'Dongle FW Upgrade', ' USER3 ', '2023-04-11 11:28:31', '2023-04-11 11:34:11', '2.0.0.2010', '', 'successful', 'C:/xampp1/htdocs/'),
(2, 'Dongle FW Upgrade', ' USER3 ', '2023-04-11 11:28:31', '2023-04-11 11:34:11', '2.0.0.2010', '', 'successful', 'C:/xampp1/htdocs/'),
(3, 'Dongle FW Upgrade', ' USER3 ', '2023-04-11 11:28:31', '2023-04-11 11:34:11', '2.0.0.2010', '', 'successful', 'C:/xampp1/htdocs/dongleupgrade2.php'),
(4, 'Dongle FW Upgrade', ' USER3 ', '2023-04-11 11:28:31', '2023-04-11 11:34:11', '2.0.0.2010', '', 'successful', ''),
(5, 'Dongle FW Upgrade', ' USER3 ', '2023-04-11 11:28:31', '2023-04-11 11:34:11', '2.0.0.2010', '', 'successful', 'C:/xampp1/htdocs/upload.php'),
(6, 'Dongle FW Upgrade', ' USER3 ', '2023-04-11 11:28:31', '2023-04-11 11:34:11', '2.0.0.2010', '', 'successful', 'C:/xampp1/htdocs/demo.php'),
(7, 'Dongle FW Upgrade', ' USER3 ', '2023-04-11 11:28:31', '2023-04-11 11:34:11', '2.0.0.2010', '', 'successful', 'C:/xampp1/htdocs/DBConnection.php'),
(8, 'Dongle FW Upgrade', ' USER3 ', '2023-04-11 11:28:31', '2023-04-11 11:34:11', '2.0.0.2010', '', 'successful', 'C:/xampp1/htdocs/style.css'),
(9, 'Dongle FW Upgrade', ' USER3 ', '2023-04-11 11:28:31', '2023-04-11 11:34:11', '2.0.0.2010', '', 'successful', 'C:/xampp1/htdocs/upload.php'),
(10, 'Dongle FW Upgrade', ' USER3 ', '2023-04-11 11:28:31', '2023-04-11 11:34:11', '2.0.0.2010', '', 'successful', 'C:/xampp1/htdocs/virtualmedia.php'),
(11, 'Dongle FW Upgrade', ' USER3 ', '2023-04-11 11:28:31', '2023-04-11 11:34:11', '2.0.0.2010', '', 'successful', 'C:/xampp1/htdocs/Actions_audit.php'),
(12, 'Dongle FW Upgrade', ' USER3 ', '2023-04-11 11:28:31', '2023-04-11 11:34:11', '2.0.0.2010', '', 'successful', 'C:/xampp1/htdocs/'),
(13, 'Dongle FW Upgrade', ' USER3 ', '2023-04-11 11:28:31', '2023-04-11 11:34:11', '2.0.0.2010', '', 'successful', 'C:/xampp1/htdocs/'),
(14, 'Dongle FW Upgrade', ' USER3 ', '2023-04-11 11:28:31', '2023-04-11 11:34:11', '2.0.0.2010', '', 'successful', 'C:/xampp1/htdocs/'),
(15, 'Dongle FW Upgrade', ' USER3 ', '2023-04-11 11:28:31', '2023-04-11 11:34:11', '2.0.0.2010', '', 'successful', 'C:/xampp1/htdocs/'),
(16, 'Dongle FW Upgrade', ' USER3 ', '2023-04-11 11:28:31', '2023-04-11 11:34:11', '2.0.0.2010', '', 'successful', 'C:/xampp1/htdocs/audio3.php'),
(17, 'Dongle FW Upgrade', ' USER3 ', '2023-04-11 11:28:31', '2023-04-11 11:34:11', '2.0.0.2010', '', 'successful', 'C:/xampp1/htdocs/'),
(18, 'Dongle FW Upgrade', ' USER3 ', '2023-04-11 11:28:31', '2023-04-11 11:34:11', '2.0.0.2010', '', 'successful', 'C:/xampp1/htdocs/'),
(19, 'Dongle FW Upgrade', ' USER3 ', '2023-04-11 11:28:31', '2023-04-11 11:34:11', '2.0.0.2010', '', 'successful', 'C:/xampp1/htdocs/Actions_audit.php'),
(20, 'Dongle FW Upgrade', ' USER7 ', '2023-04-11 11:28:31', '2023-04-11 11:34:11', '2.0.0.2010', '', 'successful', 'C:/xampp1/htdocs/data1 (4).sql'),
(21, 'Dongle FW Upgrade', ' USER7 ', '2023-04-11 11:28:31', '2023-04-11 11:34:11', '2.0.0.2010', '', 'successful', 'C:/xampp1/htdocs/'),
(22, 'Dongle FW Upgrade', ' USER7 ', '2023-04-11 11:28:31', '2023-04-11 11:34:11', '2.0.0.2010', '', 'successful', 'C:/xampp1/htdocs/IMG_8766.JPG'),
(23, 'Dongle FW Upgrade', ' ADMIN ', '2023-04-12 09:38:59', '2023-04-12 09:38:59', '2.0.0.2010', '', 'successful', 'C:/xampp1/htdocs/'),
(24, 'Dongle FW Upgrade', ' ADMIN ', '2023-04-12 12:41:59', '2023-04-12 12:41:59', '2.0.0.2010', '', 'successful', 'C:/xampp1/htdocs/'),
(25, 'Dongle FW Upgrade', ' ADMIN ', '2023-04-12 12:42:00', '2023-04-12 12:42:00', '2.0.0.2010', '', 'successful', 'C:/xampp1/htdocs/');

-- --------------------------------------------------------

--
-- Table structure for table `username`
--

CREATE TABLE `username` (
  `id` int(11) NOT NULL,
  `aesname` text CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `desname` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `3desname` text NOT NULL,
  `aespass` text NOT NULL,
  `despass` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `3despass` text NOT NULL,
  `active` int(11) NOT NULL,
  `authority` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `view` varchar(50) NOT NULL,
  `hid` varchar(50) NOT NULL,
  `mass` varchar(50) NOT NULL,
  `card` varchar(50) NOT NULL,
  `virtual` varchar(50) NOT NULL,
  `lastUpdatedBy` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `username`
--

INSERT INTO `username` (`id`, `aesname`, `desname`, `3desname`, `aespass`, `despass`, `3despass`, `active`, `authority`, `username`, `password`, `view`, `hid`, `mass`, `card`, `virtual`, `lastUpdatedBy`) VALUES
(1, '2sPDkQJ0Eb4R0zoMq6P7RA==', '€Xç>w\nðìa', 'F8+HXyJjIg8=', '4QmiRgF99LHi', '€só˜9ÓFz¶\\lA÷.U\r', 'v05RBiWrY1am9Lgzn1jgrQ==', 1, 'Admin', 'admin', 'Admin@123', 'OFF', 'on', '', 'on', 'on', '2024-01-12 07:34:11'),
(2, 'Sz2U1QYrgmEDLNLB7lR8IQ==', '€ÜJÉØsU*e', 'OihiqHHsb/Y=', '9R6qXV199LHiLvc=', '€š¾bãï÷a2Æò?)Ž´', '6M0pao9hrFEf1t5aoMouuQ==', 1, 'User', 'USER2', 'User2@12345', 'OFF', 'on', 'on', '', '', '2024-01-16 11:12:57'),
(3, 'JnR69HP7mn7H3cm7BG4hlg==', '€1êÞ5éxž”', 'maQhwyAQCGA=', '9R6qXVx99LHiLvc=', '€Úà@¹;nÏÕÞm…ûG\'', 'QG4O4iuBxx4voMiMFOULGg==', 1, 'User', 'USER3', 'User3@12345', 'OFF', 'on', 'on', 'on', 'on', '2024-01-12 07:34:12'),
(4, 'hv6bRIo6dg2REa7ZovbA0Q==', '€¨‹Ëÿ^Ñ\r\n', 'XHJs2Ory9QM=', '9R6qXVt99LHiLvc=', '€<‘}_7r\0^9—Å˜Õ', 'VC0b/yisuRIvoMiMFOULGg==', 0, 'User', 'USER4', 'User4@12345', 'OFF', '', 'on', 'on', '', '2024-02-23 08:13:04'),
(5, '8mN8CSURPJZxropve0HoJA==', '€Ž‘M½\\‡', 'iVM5iuF/teI=', '9R6qXVp99LHiLvc=', '€«V&þëj)ÎTe®', 'SM6D+gCOGmEvoMiMFOULGg==', 0, 'User', 'USER5', 'User5@12345', 'OFF', 'on', 'on', 'on', 'on', '2024-01-18 09:38:27'),
(6, 'zl5cxwShn41JVKZrLEibVw==', '€¯Úöd0ô', 'rElCH/DTxKc=', '9R6qXVl99LHiLvc=', '€±c¢`KÈrYó€ó¦ ', '0rPbY6iXAoovoMiMFOULGg==', 1, 'User', 'USER6', 'User6@12345', 'OFF', 'on', 'on', 'on', 'on', '2023-11-20 12:29:03'),
(7, '0Vd5oH/pehlPCBCMgfTFgw==', '€N«#Ÿ\'ˆë', '5r3A1DRgpe0=', '9R6qXVh99LHiLvc=', '€þ\'Ÿ%l“†â!,Éh', 'x/WqepJ2rTgvoMiMFOULGg==', 0, 'User', 'USER7', 'User7@12345', 'OFF', 'on', 'on', 'on', 'on', '2023-11-20 12:29:03'),
(8, 'VHl8o5oac01YTAGP3+E/iw==', '€,©_ýõK‚', 'HcyYLKHkWb4=', '1R6qXVd99LHi', '€jH…l°\\ŸÄB:Å+\ZZù', 'lAt8jMGtZ4+m9Lgzn1jgrQ==', 0, 'Admin', 'USER8', 'user8@123', 'OFF', 'on', 'on', '', 'on', '2024-02-23 09:09:58'),
(9, 'jYyZLBNlFBn4yM4rSm0tmw==', '€}F§\0Ò®', 'Q4x8RqW7SzQ=', '9R6qXVZ99LHiLvc=', '€HÐŸŒAyR*Âó0õÿ ¯', 'l9CLCe6BLewvoMiMFOULGg==', 1, 'Admin', 'USER9', 'User9@12345', 'OFF', 'on', 'on', 'on', 'on', '2023-11-20 12:29:03'),
(10, 'em7Yt4l8RLimUf47Iy47iQ==', '€[ÁÖvÞÛ', 'qfbFKKQJwT8=', '9R6qXV4NhbLjKfb4', '€,°ú$¥¤…»µÜñÀ<˜s', '0EenkO+4Y3sdRR/o1qzTUw==', 0, 'User', 'USER10', 'User10@12345', 'OFF', 'on', 'on', 'on', 'on', '2023-11-20 12:29:03'),
(11, 'iTWsyHOuabdXSmw3VV6+KQ==', '€7^0†LÈR\'', '+uoS9mJcrUc=', '9R6qXV4MhbLjKfb4', '€×¨WÝmÙDÚ?íÂë', 'FL8AEWyZV5kdRR/o1qzTUw==', 1, 'Admin', 'USER11', 'User11@12345', 'OFF', 'on', 'on', 'on', 'on', '2024-01-05 05:13:21'),
(12, 'iyYtY06TxTjHPOYODDduSA==', '€¡LìóÇ›', 'NB4kF0HfkuA=', '9R6qXV4PhbLjKfb4', '€Ž©¤Fzø²¬âÛ½¦gA', 'scb5ysudtC8dRR/o1qzTUw==', 0, 'User', 'user12', 'User12@12345', 'OFF', 'on', 'on', '', '', '2024-01-18 09:13:37'),
(13, 'bkmXn8ipMpBpX0o9rDkJTA==', '€‚–Y\rž[\nÀ', 'iKKpkXrSpvs=', '1R6qXV4OhbLjKQ==', '€Þ-­Á=V\0úÿ\ZÊ°q', 'EyAkLYC+Hyesw7aZymrFqg==', 0, 'User', 'USER13', 'user13@123', 'OFF', 'on', 'on', 'on', 'on', '2023-11-20 12:29:03'),
(14, 'UK589/JSYa15wyRNQoTxlQ==', '€«Æ­eKb~6', 'YOSyd1zqcgM=', '9R6qXV4JhbLjKfb4', '€ö&¦\Zºá²hÑ	i^bb~', 'mEdxVLqpfc8dRR/o1qzTUw==', 1, 'User', 'USER14', 'User14@12345', 'OFF', 'on', 'on', '', '', '2024-01-18 09:13:37'),
(15, 'UqANM2nlW4HcMegvDbnMCQ==', '€’wÉ¼?9Sý', 'wAhsYanANuY=', '9R6qXV4IhbLjKfb4', '€/M[‘\ZìrÑÛœ”>Ñô{', 'Y+AJBeAD2AsdRR/o1qzTUw==', 1, 'Admin', 'USER15', 'User15@12345', 'OFF', 'on', 'on', '', 'on', '2023-11-22 06:12:52'),
(16, 'pXbAamDck7wy18zYInD0KA==', '€Ph]æa\"', 'hlDIInESIF8=', '9R6qXV4LhbLjKfb4', '€æ„rÍ·Û÷÷$ûþô‰B', 'Ov3dbwnbes4dRR/o1qzTUw==', 1, 'Admin', 'USER16', 'User16@12345', 'OFF', 'on', 'on', '', 'on', '2024-01-11 09:01:45');

--
-- Triggers `username`
--
DELIMITER $$
CREATE TRIGGER `user_trigger` AFTER UPDATE ON `username` FOR EACH ROW BEGIN
    DECLARE column_name VARCHAR(255);
    DECLARE new_value VARCHAR(255);
         DECLARE trigger_name VARCHAR(255);

     SET trigger_name='user_trigger';
    
    IF NEW.view <> OLD.view THEN
        SET column_name = 'view';
        SET new_value = NEW.view;
        INSERT INTO user_log (user_id, table_name, column_name, new_value) VALUES ( OLD.id, 'username', column_name, new_value);
    INSERT INTO trigger_log (trigger_name) VALUES (trigger_name); END IF;

    IF NEW.hid <> OLD.hid THEN
        
        SET column_name = 'hid';
        SET new_value = NEW.hid;
        INSERT INTO user_log (user_id, table_name, column_name, new_value) VALUES ( OLD.id, 'username', column_name, new_value);
    INSERT INTO trigger_log (trigger_name) VALUES (trigger_name); END IF;
    
    IF NEW.`mass` <> OLD.`mass` THEN
        
        SET column_name = 'mass';
        SET new_value = NEW.`mass`;
        INSERT INTO user_log (user_id, table_name, column_name, new_value) VALUES ( OLD.id, 'username', column_name, new_value);
    INSERT INTO trigger_log (trigger_name) VALUES (trigger_name); END IF;
    
    IF NEW.virtual <> OLD.virtual THEN
        
        SET column_name = 'virtual';
        SET new_value = NEW.virtual;
        INSERT INTO user_log (user_id, table_name, column_name, new_value) VALUES ( OLD.id, 'username', column_name, new_value);
    INSERT INTO trigger_log (trigger_name) VALUES (trigger_name); END IF;
    
    IF NEW.active <> OLD.active THEN
        
        SET column_name = 'active';
        SET new_value = NEW.active;
        INSERT INTO user_log (user_id, table_name, column_name, new_value) VALUES ( OLD.id, 'username', column_name, new_value);
    INSERT INTO trigger_log (trigger_name) VALUES (trigger_name); END IF;

    IF NEW.authority <> OLD.authority THEN
        
        SET column_name = 'authority';
        SET new_value = NEW.authority;
        INSERT INTO user_log (user_id, table_name, column_name, new_value) VALUES ( OLD.id, 'username', column_name, new_value);
    INSERT INTO trigger_log (trigger_name) VALUES (trigger_name); END IF;

    IF NEW.username <> OLD.username THEN
        
        SET column_name = 'username';
        SET new_value = NEW.username;
        INSERT INTO user_log (user_id, table_name, column_name, new_value) VALUES ( OLD.id, 'username', column_name, new_value);
    INSERT INTO trigger_log (trigger_name) VALUES (trigger_name); END IF;

    IF NEW.password <> OLD.password THEN
        
        SET column_name = 'password';
        SET new_value = NEW.password;
        INSERT INTO user_log (user_id, table_name, column_name, new_value) VALUES ( OLD.id, 'username', column_name, new_value);
    INSERT INTO trigger_log (trigger_name) VALUES (trigger_name); END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

CREATE TABLE `user_log` (
  `user_id` int(11) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `column_name` varchar(50) NOT NULL,
  `new_value` text NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_log`
--

INSERT INTO `user_log` (`user_id`, `table_name`, `column_name`, `new_value`, `updated_at`) VALUES
(11, 'user1', 'authority', 'User', '2023-05-29 07:50:04'),
(3, 'user1', 'active', '1', '2023-05-29 07:50:21'),
(10, 'user1', 'uname', 'user10', '2023-05-29 07:50:43'),
(7, 'user1', 'mass', '', '2023-05-29 07:51:07'),
(8, 'user1', 'mass', '', '2023-05-29 07:51:07'),
(15, 'user1', 'mass', '', '2023-05-29 07:51:07'),
(6, 'user1', 'uname', 'USER6', '2023-05-31 05:04:15'),
(6, 'user1', 'active', '1', '2023-05-31 05:13:33'),
(1, 'user1', 'uname', 'user1', '2023-05-31 12:02:02'),
(1, 'username', 'view', 'ON', '2023-11-20 05:29:21'),
(1, 'username', 'view', 'OFF', '2023-11-20 05:39:58'),
(1, 'username', 'view', 'ON', '2023-11-20 11:33:47'),
(2, 'username', 'view', 'ON', '2023-11-20 11:33:47'),
(3, 'username', 'view', 'ON', '2023-11-20 11:33:47'),
(4, 'username', 'view', 'ON', '2023-11-20 11:33:47'),
(5, 'username', 'view', 'ON', '2023-11-20 11:33:47'),
(6, 'username', 'view', 'ON', '2023-11-20 11:33:47'),
(7, 'username', 'view', 'ON', '2023-11-20 11:33:47'),
(8, 'username', 'view', 'ON', '2023-11-20 11:33:47'),
(9, 'username', 'view', 'ON', '2023-11-20 11:33:47'),
(10, 'username', 'view', 'ON', '2023-11-20 11:33:47'),
(11, 'username', 'view', 'ON', '2023-11-20 11:33:47'),
(12, 'username', 'view', 'ON', '2023-11-20 11:33:47'),
(13, 'username', 'view', 'ON', '2023-11-20 11:33:47'),
(14, 'username', 'view', 'ON', '2023-11-20 11:33:47'),
(15, 'username', 'view', 'ON', '2023-11-20 11:33:47'),
(16, 'username', 'view', 'ON', '2023-11-20 11:33:47'),
(1, 'username', 'view', 'OFF', '2023-11-20 12:29:03'),
(2, 'username', 'view', 'OFF', '2023-11-20 12:29:03'),
(3, 'username', 'view', 'OFF', '2023-11-20 12:29:03'),
(4, 'username', 'view', 'OFF', '2023-11-20 12:29:03'),
(5, 'username', 'view', 'OFF', '2023-11-20 12:29:03'),
(6, 'username', 'view', 'OFF', '2023-11-20 12:29:03'),
(7, 'username', 'view', 'OFF', '2023-11-20 12:29:03'),
(8, 'username', 'view', 'OFF', '2023-11-20 12:29:03'),
(9, 'username', 'view', 'OFF', '2023-11-20 12:29:03'),
(10, 'username', 'view', 'OFF', '2023-11-20 12:29:03'),
(11, 'username', 'view', 'OFF', '2023-11-20 12:29:03'),
(12, 'username', 'view', 'OFF', '2023-11-20 12:29:03'),
(13, 'username', 'view', 'OFF', '2023-11-20 12:29:03'),
(14, 'username', 'view', 'OFF', '2023-11-20 12:29:03'),
(15, 'username', 'view', 'OFF', '2023-11-20 12:29:03'),
(16, 'username', 'view', 'OFF', '2023-11-20 12:29:03'),
(2, 'username', 'hid', 'on', '2023-11-22 05:47:13'),
(2, 'username', 'mass', '', '2023-11-22 05:47:13'),
(2, 'username', 'virtual', '', '2023-11-22 05:47:13'),
(4, 'username', 'mass', '', '2023-11-22 05:47:14'),
(4, 'username', 'virtual', '', '2023-11-22 05:47:14'),
(12, 'username', 'mass', '', '2023-11-22 05:50:29'),
(12, 'username', 'virtual', '', '2023-11-22 05:50:29'),
(14, 'username', 'hid', '', '2023-11-22 05:50:29'),
(14, 'username', 'mass', '', '2023-11-22 05:50:29'),
(14, 'username', 'virtual', '', '2023-11-22 05:50:29'),
(14, 'username', 'hid', 'on', '2023-11-22 05:54:54'),
(8, 'username', 'mass', '', '2023-11-22 06:00:53'),
(3, 'username', 'hid', 'on', '2023-11-22 06:06:29'),
(3, 'username', 'mass', '', '2023-11-22 06:06:29'),
(16, 'username', 'hid', 'on', '2023-11-22 06:06:29'),
(15, 'username', 'hid', 'on', '2023-11-22 06:12:52'),
(11, 'username', 'authority', 'Admin', '2024-01-05 05:13:21'),
(1, 'username', 'username', 'LOVELINA', '2024-01-05 09:53:12'),
(1, 'username', 'username', 'USER6', '2024-01-05 09:54:00'),
(1, 'username', 'active', '0', '2024-01-05 09:54:00'),
(1, 'username', 'authority', 'User', '2024-01-05 09:54:00'),
(1, 'username', 'active', '1', '2024-01-05 09:56:34'),
(1, 'username', 'authority', 'Admin', '2024-01-05 09:56:34'),
(1, 'username', 'username', 'LOVELINA', '2024-01-05 09:56:34'),
(1, 'username', 'username', 'USER4', '2024-01-05 10:18:59'),
(1, 'username', 'active', '0', '2024-01-05 10:21:12'),
(1, 'username', 'authority', 'User', '2024-01-05 10:21:12'),
(1, 'username', 'username', 'USER7', '2024-01-05 10:21:12'),
(1, 'username', 'active', '1', '2024-01-09 08:11:59'),
(1, 'username', 'username', 'admin', '2024-01-09 08:12:06'),
(1, 'username', 'authority', 'Admin', '2024-01-09 08:12:32'),
(2, 'username', 'active', '0', '2024-01-09 09:52:40'),
(4, 'username', 'active', '0', '2024-01-10 05:47:29'),
(16, 'username', 'authority', 'Admin', '2024-01-11 09:01:45'),
(1, 'username', 'mass', '', '2024-01-12 07:34:11'),
(2, 'username', 'mass', 'on', '2024-01-12 07:34:12'),
(3, 'username', 'mass', 'on', '2024-01-12 07:34:12'),
(4, 'username', 'mass', 'on', '2024-01-12 07:34:12'),
(2, 'username', 'active', '1', '2024-01-16 11:12:57'),
(8, 'username', 'mass', 'on', '2024-01-18 09:13:37'),
(12, 'username', 'mass', 'on', '2024-01-18 09:13:37'),
(14, 'username', 'mass', 'on', '2024-01-18 09:13:37'),
(4, 'username', 'authority', 'User', '2024-02-23 08:13:04'),
(8, 'username', 'authority', 'Admin', '2024-02-23 09:09:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `decoder`
--
ALTER TABLE `decoder`
  ADD PRIMARY KEY (`decoder_count`),
  ADD KEY `encoder_id` (`encoder_id`);

--
-- Indexes for table `decoder_log`
--
ALTER TABLE `decoder_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_encoder` (`encoder_id`);

--
-- Indexes for table `kvmname`
--
ALTER TABLE `kvmname`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portname`
--
ALTER TABLE `portname`
  ADD PRIMARY KEY (`id`),
  ADD KEY `switch_id` (`switch_id`),
  ADD KEY `decoder_count` (`decoder_count`);

--
-- Indexes for table `port_log`
--
ALTER TABLE `port_log`
  ADD KEY `fk_swi` (`switch_id`);

--
-- Indexes for table `port_queue`
--
ALTER TABLE `port_queue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `switch`
--
ALTER TABLE `switch`
  ADD PRIMARY KEY (`switch_id`),
  ADD KEY `fk_switch` (`encoder_id`);

--
-- Indexes for table `switch_log`
--
ALTER TABLE `switch_log`
  ADD KEY `fk_enco` (`encoder_id`);

--
-- Indexes for table `trigger_log`
--
ALTER TABLE `trigger_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upgradehistory`
--
ALTER TABLE `upgradehistory`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `username`
--
ALTER TABLE `username`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `decoder_log`
--
ALTER TABLE `decoder_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `kvmname`
--
ALTER TABLE `kvmname`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `portname`
--
ALTER TABLE `portname`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `port_queue`
--
ALTER TABLE `port_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `switch`
--
ALTER TABLE `switch`
  MODIFY `switch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `trigger_log`
--
ALTER TABLE `trigger_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `upgradehistory`
--
ALTER TABLE `upgradehistory`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `username`
--
ALTER TABLE `username`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `decoder`
--
ALTER TABLE `decoder`
  ADD CONSTRAINT `decoder_ibfk_1` FOREIGN KEY (`decoder_count`) REFERENCES `portname` (`id`),
  ADD CONSTRAINT `decoder_ibfk_2` FOREIGN KEY (`encoder_id`) REFERENCES `portname` (`id`);

--
-- Constraints for table `decoder_log`
--
ALTER TABLE `decoder_log`
  ADD CONSTRAINT `fk_encoder` FOREIGN KEY (`encoder_id`) REFERENCES `switch` (`encoder_id`);

--
-- Constraints for table `portname`
--
ALTER TABLE `portname`
  ADD CONSTRAINT `portname_ibfk_1` FOREIGN KEY (`switch_id`) REFERENCES `switch` (`switch_id`),
  ADD CONSTRAINT `portname_ibfk_2` FOREIGN KEY (`decoder_count`) REFERENCES `decoder` (`decoder_count`);

--
-- Constraints for table `port_log`
--
ALTER TABLE `port_log`
  ADD CONSTRAINT `fk_swi` FOREIGN KEY (`switch_id`) REFERENCES `switch` (`switch_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `switch`
--
ALTER TABLE `switch`
  ADD CONSTRAINT `fk_switch` FOREIGN KEY (`encoder_id`) REFERENCES `portname` (`id`);

--
-- Constraints for table `switch_log`
--
ALTER TABLE `switch_log`
  ADD CONSTRAINT `fk_enco` FOREIGN KEY (`encoder_id`) REFERENCES `portname` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
