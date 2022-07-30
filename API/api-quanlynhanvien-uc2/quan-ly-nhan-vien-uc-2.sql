-- phpMyAdmin SQL Dump
-- version 5.2.0-rc1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th7 29, 2022 lúc 02:39 AM
-- Phiên bản máy phục vụ: 5.7.33
-- Phiên bản PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quan-ly-nhan-vien-uc-2`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `request ot`
--

CREATE TABLE `request ot` (
  `ROT_ID` int(11) NOT NULL COMMENT 'Mã của 1 request OT, là trường tự tăng',
  `EMPLOYEE_ID` int(11) NOT NULL COMMENT 'Chứa ID của nhân viên tạo ra request OT',
  `MANAGER_ID` int(11) NOT NULL COMMENT 'Chứa ID của nhân viên quản lý cấp 1 của nhân viên tạo ra request',
  `REASON` varchar(5000) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Lý do nhân viên muốn làm việc OT',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời gian tạo request OT',
  `UPDATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời gian cập nhật thông tin của request OT gần nhất. Mặc định là 1970-01-01 00:00:00, khi được cập nhật lại, thời gian này phải >= CREATE_DATE',
  `STATUS` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL DEFAULT 'Draft' COMMENT 'Trạng thái xử lý của request OT. Gồm 1 trong 5 trạng thái: Draft, Pending, Approved, Rejected, Cancelled. Được điền tự động bởi hệ thống, nhân viên không thể sửa.',
  `MANAGER_COMMENT` varchar(5000) COLLATE utf8mb4_vietnamese_ci DEFAULT 'None' COMMENT 'Ghi lí do quản lý cấp 1 từ chối request OT. Nếu trường này có thông tin, trạng thái của request phải là "Rejected", mặc định là None',
  `START_DATE` date NOT NULL DEFAULT '1970-01-01' COMMENT 'Ngày bắt đầu dự kiến làm việc OT',
  `ESTIMATED_HOURS` decimal(11,0) NOT NULL DEFAULT '0' COMMENT 'Tổng thời gian dự kiến sẽ làm việc OT. Thời gian này được tính dựa trên chi tiết request ot từ bảng request ot detail',
  `END_DATE` date NOT NULL DEFAULT '1970-01-01' COMMENT 'Ngày kết thúc dự kiến làm việc OT. Mặc định có giá trị là 1970-01-01, khi được cập nhật lại, thời gian này phải >= Ngày bắt đầu OT',
  `UNSUBMIT_REASON` varchar(5000) COLLATE utf8mb4_vietnamese_ci DEFAULT 'None' COMMENT 'Lý do nhân viên muốn hủy gửi (unsubmit) request OT. Nếu trường này có thông tin, trạng thái của request bắt buộc là Cancelled, mặc định là None',
  `NOTIFICATION_FLAG` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Nhân viên khi tạo request OT chọn "Yes" hay "No" cho mục "Email follow up". 0 là No, 1 là Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Bảng này cho biết thông tin của 1 request OT';

--
-- Đang đổ dữ liệu cho bảng `request ot`
--

INSERT INTO `request ot` (`ROT_ID`, `EMPLOYEE_ID`, `MANAGER_ID`, `REASON`, `CREATE_DATE`, `UPDATE_DATE`, `STATUS`, `MANAGER_COMMENT`, `START_DATE`, `ESTIMATED_HOURS`, `END_DATE`, `UNSUBMIT_REASON`, `NOTIFICATION_FLAG`) VALUES
(2, 15, 6, 'Làm không kịp nên tăng ca để kịp tiến độ dự án mới', '2022-07-17 05:08:03', '2022-07-18 05:08:03', 'Pending', 'None', '2022-07-16', '4', '2022-07-16', 'None', 1),
(3, 14, 6, 'Anh có việc gia đình cần nghỉ 1 tuần nên anh cần tăng ca để làm bù để kịp tiến độ dự án.', '2022-07-15 05:12:35', '2022-07-15 06:12:35', 'Approved', 'None', '2022-08-01', '6', '2022-08-03', 'None', 1),
(4, 8, 6, 'Dự án Alola cần bàn giao cho khách hàng gấp vào cuối tháng 8 nên em cần OT để kịp tiến độ', '2022-07-17 05:14:54', '2029-07-22 05:50:04', 'Canceled', '', '2022-07-23', '13', '2022-07-27', 'em Chịu rồi anh', 1),
(22, 8, 6, 'bản vip', '2022-07-29 01:32:02', '2029-07-21 18:32:02', 'Canceled', '', '2022-07-29', '0', '2022-07-29', 'ádasdasd', 0),
(23, 8, 6, 'demo post', '2022-07-29 01:33:09', '2029-07-21 18:33:09', 'Canceled', '', '2022-07-29', '2', '2022-07-29', 'chịu thôi anh zai', 0),
(26, 8, 6, 'game gì đó', '2022-07-29 01:41:59', '2029-07-21 18:41:59', 'Canceled', '', '2022-07-29', '2', '2022-07-29', 'trở về nè', 0),
(27, 8, 6, 'một con bọ cute', '2022-07-29 01:45:23', '2029-07-21 18:50:19', 'Canceled', '', '2022-07-29', '2', '2022-07-29', 'sadasdas', 0),
(28, 8, 6, 'oke yeeu em', '2022-07-29 01:50:29', '2029-07-21 18:50:29', 'Draft', '', '2022-07-29', '3', '2022-07-29', '', 0),
(29, 8, 6, 'gi ddos ', '2022-07-29 02:21:41', '2029-07-21 19:21:41', 'Pending', '', '2022-07-29', '2', '2022-07-29', '', 0),
(30, 8, 6, 'gi ddos ', '2022-07-29 02:21:49', '2029-07-21 19:21:49', 'Pending', '', '2022-07-29', '2', '2022-07-29', '', 0),
(31, 8, 6, 'asdasdasdas', '2022-07-29 02:24:41', '2029-07-21 19:24:48', 'Pending', '', '2022-07-29', '2', '2022-07-29', '', 0),
(32, 8, 6, 'asdasdasd', '2022-07-29 02:24:56', '2029-07-21 19:24:57', 'Pending', '', '2022-07-29', '0', '2022-07-29', '', 0),
(33, 8, 6, 'demo ?', '2022-07-29 02:25:08', '2029-07-21 19:25:08', 'Pending', '', '2022-07-29', '2', '2022-07-29', '', 0),
(34, 8, 6, 'demo nao', '2022-07-29 02:25:30', '2029-07-21 19:25:30', 'Pending', '', '2022-07-29', '2', '2022-07-29', '', 0),
(35, 8, 6, 'demo nhe', '2022-07-29 02:27:39', '2029-07-21 19:27:39', 'Draft', '', '2022-07-29', '0', '2022-07-29', '', 0),
(36, 8, 6, 'demo cai nhe', '2022-07-29 02:28:00', '2029-07-21 19:28:00', 'Draft', '', '2022-07-29', '0', '2022-07-29', '', 0),
(37, 8, 6, 'demo cai nhe', '2022-07-29 02:28:02', '2029-07-21 19:28:02', 'Pending', '', '2022-07-29', '0', '2022-07-29', '', 0),
(38, 8, 6, 'demo cai ne', '2022-07-29 02:28:36', '2029-07-21 19:28:36', 'Draft', '', '2022-07-29', '3', '2022-07-29', '', 0),
(39, 8, 6, 'demo ban moi', '2022-07-29 02:33:03', '2029-07-21 19:33:37', 'Pending', '', '2022-07-29', '3', '2022-07-29', '', 0),
(40, 8, 6, 'demo 1 ban rac', '2022-07-29 02:34:13', '2029-07-21 19:34:13', 'Draft', '', '2022-07-29', '3', '2022-07-29', '', 0),
(41, 8, 6, 'day laf 1 ban af khong nhe', '2022-07-29 02:34:36', '2029-07-21 19:34:46', 'Pending', '', '2022-07-29', '3', '2022-07-29', '', 0),
(42, 8, 6, 'day là bản rác ?\r\nkhông phải', '2022-07-29 02:36:59', '2029-07-21 19:37:09', 'Canceled', '', '2022-07-29', '3', '2022-07-29', 'sorry em nhầm', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `request ot detail`
--

CREATE TABLE `request ot detail` (
  `ROTDETAIL_ID` int(11) NOT NULL COMMENT 'ID của một chi tiết request OT. Một request OT có thể có nhiều thông tin chi tiết',
  `ROT_ID` int(11) NOT NULL COMMENT 'ID của request OT mà chi tiết request OT thuộc về. Tham chiếu từ bảng request ot',
  `DATE` date NOT NULL DEFAULT '1970-01-01' COMMENT 'Ngày nhân viên làm việc OT',
  `HOUR` decimal(10,0) NOT NULL DEFAULT '0' COMMENT 'Số giờ trong 1 ngày mà nhân viên đó làm việc OT. Không được quá 4 giờ trong 1 ngày'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Bảng này cho biết thông tin của một CHI TIẾT request OT';

--
-- Đang đổ dữ liệu cho bảng `request ot detail`
--

INSERT INTO `request ot detail` (`ROTDETAIL_ID`, `ROT_ID`, `DATE`, `HOUR`) VALUES
(10, 2, '2022-07-16', '4'),
(11, 3, '2022-08-01', '3'),
(12, 3, '2022-08-02', '2'),
(13, 3, '2022-08-03', '1'),
(23, 4, '2022-07-25', '4'),
(24, 4, '2022-07-26', '4'),
(25, 4, '2022-07-27', '4'),
(26, 4, '2022-07-23', '1'),
(56, 23, '2022-07-29', '1'),
(57, 23, '2022-07-29', '1'),
(58, 26, '2022-07-29', '1'),
(59, 26, '2022-07-29', '1'),
(60, 27, '2022-07-29', '1'),
(61, 27, '2022-07-29', '1'),
(62, 28, '2022-07-29', '1'),
(63, 28, '2022-07-29', '1'),
(64, 28, '2022-07-29', '1'),
(65, 29, '2022-07-29', '1'),
(66, 29, '2022-07-29', '1'),
(67, 30, '2022-07-29', '1'),
(68, 30, '2022-07-29', '1'),
(73, 31, '2022-07-29', '1'),
(74, 31, '2022-07-29', '1'),
(75, 33, '2022-07-29', '1'),
(76, 33, '2022-07-29', '1'),
(77, 34, '2022-07-29', '1'),
(78, 34, '2022-07-29', '1'),
(79, 38, '2022-07-29', '1'),
(80, 38, '2022-07-29', '1'),
(81, 38, '2022-07-29', '1'),
(85, 39, '2022-07-29', '1'),
(86, 39, '2022-07-29', '1'),
(87, 39, '2022-07-29', '1'),
(88, 40, '2022-07-29', '1'),
(89, 40, '2022-07-29', '1'),
(90, 40, '2022-07-29', '1'),
(94, 41, '2022-07-29', '1'),
(95, 41, '2022-07-29', '1'),
(96, 41, '2022-07-29', '1'),
(100, 42, '2022-07-29', '1'),
(101, 42, '2022-07-29', '1'),
(102, 42, '2022-07-29', '1');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `request ot`
--
ALTER TABLE `request ot`
  ADD PRIMARY KEY (`ROT_ID`),
  ADD KEY `FK_EmployeeCreate` (`EMPLOYEE_ID`),
  ADD KEY `FK_Appraiser_Manage` (`MANAGER_ID`);

--
-- Chỉ mục cho bảng `request ot detail`
--
ALTER TABLE `request ot detail`
  ADD PRIMARY KEY (`ROTDETAIL_ID`,`ROT_ID`),
  ADD KEY `FK_OTReq_Related` (`ROT_ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `request ot`
--
ALTER TABLE `request ot`
  MODIFY `ROT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã của 1 request OT, là trường tự tăng', AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `request ot detail`
--
ALTER TABLE `request ot detail`
  MODIFY `ROTDETAIL_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID của một chi tiết request OT. Một request OT có thể có nhiều thông tin chi tiết', AUTO_INCREMENT=103;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `request ot detail`
--
ALTER TABLE `request ot detail`
  ADD CONSTRAINT `FK_OTReq_Related` FOREIGN KEY (`ROT_ID`) REFERENCES `request ot` (`ROT_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
