-- phpMyAdmin SQL Dump
-- version 5.2.0-rc1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th7 21, 2022 lúc 03:50 AM
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
-- Cơ sở dữ liệu: `quan-ly-nhan-vien`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories_subscribe`
--

CREATE TABLE `categories_subscribe` (
  `SUBSCRIBE_ID` int(11) NOT NULL COMMENT 'trường này để lưu khóa tự tăng thể hiện mã của việc đăng ký',
  `EMPLOYEE_ID` int(11) NOT NULL COMMENT 'trường này là khóa ngoại tham chiếu đến mã nhân viên',
  `CATEGORIES_ID` int(11) NOT NULL COMMENT 'trường này là khóa ngoại tham chiếu đến mã thể loại',
  `SUBSCRIBE_DATE` datetime NOT NULL COMMENT 'trường này là ngày mà nhân viên đăng ký thể loại',
  `NOTIFICATION_FLAG` smallint(6) NOT NULL COMMENT 'trường này thể hiện nhân viên có muốn nhận thông báo khi có bài viết mới được đăng ký được đăng lên hệ thống không'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `categories_subscribe`
--

INSERT INTO `categories_subscribe` (`SUBSCRIBE_ID`, `EMPLOYEE_ID`, `CATEGORIES_ID`, `SUBSCRIBE_DATE`, `NOTIFICATION_FLAG`) VALUES
(1, 1, 2, '2022-05-01 00:00:00', 0),
(2, 2, 3, '2022-04-01 00:00:00', 0),
(3, 4, 1, '2022-07-01 00:00:00', 0),
(4, 7, 4, '2022-07-01 00:00:00', 1),
(5, 10, 2, '2022-05-01 00:00:00', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `department`
--

CREATE TABLE `department` (
  `DEPART_ID` int(11) NOT NULL COMMENT 'ID của phòng ban, là trường tự tăng',
  `MANAGER_ID` int(11) DEFAULT NULL COMMENT 'Trường này ghi ID của nhân viên quản lý phòng ban. Tham chiếu từ bảng "employee"',
  `NAME` varchar(522) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Tên đầy đủ của phòng ban',
  `PHONE` varchar(12) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL COMMENT 'SĐT để liên lạc với phòng ban'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Bảng này cho biết thông tin của một văn phòng/ban ';

--
-- Đang đổ dữ liệu cho bảng `department`
--

INSERT INTO `department` (`DEPART_ID`, `MANAGER_ID`, `NAME`, `PHONE`) VALUES
(1, 1, 'Phòng Kế toán', '0586037708'),
(2, 2, 'Phòng Quan hệ quốc tế', '0586484874'),
(3, 3, 'Phòng Nhân sự', '0586073704'),
(4, 4, 'Phòng Công nghệ thông tin', '0367778384'),
(5, 5, 'Phòng Giám đốc', '0366878384');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employee`
--

CREATE TABLE `employee` (
  `EMPLOYEE_ID` int(11) NOT NULL COMMENT 'ID của nhân viên, là trường tự tăng',
  `DEPART_ID` int(11) DEFAULT NULL COMMENT 'ID của phòng ban mà nhân viên này đang làm việc. Tham chiếu từ bảng deparment',
  `MANAGER_ID` int(11) DEFAULT NULL COMMENT 'ID của quản lý có quản lý nhân viên này. Quản lý không có ai quản lý mình thì để NULL, tham chiếu từ chính bảng employee',
  `NAME` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Họ tên đầy đủ của nhân viên',
  `EMAIL` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Email công ty của nhân viên',
  `PHONE` varchar(12) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL COMMENT 'SĐT của nhân viên',
  `SALARY_RATE` decimal(10,0) NOT NULL DEFAULT '0' COMMENT 'Tiền lương dự trù của nhân viên',
  `TYPE` text COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Loại hình làm việc: "Full-time", "Part-time", "Temporary", "Seasonal"',
  `USERNAME` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL DEFAULT 'admin' COMMENT 'Username của mỗi nhân viên. Username được cấp bởi công ty. Truong nay la unique',
  `PASSWORD` varchar(522) COLLATE utf8mb4_vietnamese_ci NOT NULL DEFAULT '12345678' COMMENT 'Password của mỗi nhân viên. Password được cấp bởi công ty',
  `TITLE` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Vị trí làm việc của nhân viên đó. VD: "Software Engineer"',
  `STATUS` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL DEFAULT 'Enabled' COMMENT 'Trạng thái làm việc hiện tại của NV đó. VD: "Enabled", "Disabled"',
  `ADDRESS` varchar(522) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL COMMENT 'Địa chỉ nhà của nhân viên đó',
  `CMND/CCCD` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'CMND/CAN CUOC CONG DAN cua nhan vien do. Truong nay la unique',
  `START_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời gian nhân viên đó bắt đầu làm việc tại công ty',
  `ROLE` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL DEFAULT 'Employee' COMMENT 'Vai trò của nhân viên đó trong công ty. Mặc định là "Employee". Ngoài ra sẽ còn có "Manager", "CEO", "COO",...',
  `AVATAR_URL` varchar(10000) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL COMMENT 'Chứa link ảnh avatar của nhân viên',
  `END_DATE` datetime DEFAULT NULL COMMENT 'Thời gian nhân viên đó kết thúc làm việc tại công ty. Mặc định là NULL. Thời gian này phải >= START DATE',
  `DOB` date NOT NULL COMMENT 'Chứa ngày tháng năm sinh (Date of Birth) của nhân viên đó'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Bảng này chứa thông tin của nhân viên';

--
-- Đang đổ dữ liệu cho bảng `employee`
--

INSERT INTO `employee` (`EMPLOYEE_ID`, `DEPART_ID`, `MANAGER_ID`, `NAME`, `EMAIL`, `PHONE`, `SALARY_RATE`, `TYPE`, `USERNAME`, `PASSWORD`, `TITLE`, `STATUS`, `ADDRESS`, `CMND/CCCD`, `START_DATE`, `ROLE`, `AVATAR_URL`, `END_DATE`, `DOB`) VALUES
(1, 1, 5, 'Mã Vân Tiên', 'mavantien801@gmail.com', '0798234759', '30000000', 'Full-time', 'mavantien', '4QtPn5cVDr5JK9bUuZ', 'Accounting Manager', 'Enabled', '21 Xã Thanh Hà, Huyện Thanh Liêm, Hà Nam', '0123456789', '2018-07-01 09:00:00', 'Manager', 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80', NULL, '1990-07-04'),
(2, 2, 5, 'Nguyễn Thị Thùy Dương', 'nguyenthithuyduong@gmail.com', '0919007159', '27000000', 'Full-time', 'nguyenthithuyduong', '12QtPn5cVDr5JK9bUuZ', 'Head Of International Relations', 'Enabled', '65 Trung Nhi Street, Le Loi Ward', '0299958918', '2017-12-01 09:00:00', 'Manager', 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', NULL, '1981-12-12'),
(3, 3, 5, 'Ân Hải Nam', 'anhainam727@gmail.com', '0901863279', '35000000', 'Full-time', 'anhainam', '8QG$@H$9&zgb4s', 'Senior HRBP ', 'Enabled', 'Xã Bằng Cốc, Huyện Hàm Yên, Tuyên Quang', '013890451', '2016-07-02 13:42:33', 'Manager', 'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80', NULL, '1995-11-25'),
(4, 4, 5, 'Đỗ Khánh Vi', 'dokhanhvi850@gmail.com', '0597623841', '50000000', 'Full-time', 'dokhanhvi', '8^UUGaK68m', 'IT Lead', 'Enabled', '29A Phường Cam Lộc, Thành phố Cam Ranh, Khánh Hòa', '0987654321', '2017-05-31 08:30:00', 'Manager', 'https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=461&q=80', NULL, '1981-10-04'),
(5, 5, NULL, 'Phan Thị Nguyên Trang', 'sophiepham2k@gmail.com', '0943807159', '60000000', 'Full-time', 'admin', '123456789', 'Company Chief Executive Officer', 'Enabled', 'Xã Bình Thủy, Huyện Châu Phú, An Giang', '0312458907', '2012-05-01 12:00:00', 'CEO', 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', NULL, '1975-01-01'),
(6, 4, 4, 'Trần Chí Dũng', 'tranchidung@gmail.com', '0959107159', '15000000', 'Full-time', 'tranchidung', 'pANICEALvAnE', 'Project Manager', 'Enabled', '12B Xã Bình Thủy, Huyện Châu Phú, An Giang', '0387958907', '2019-05-01 12:00:00', 'Manager', 'https://images.unsplash.com/photo-1507591064344-4c6ce005b128?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', NULL, '1989-01-05'),
(7, 4, 6, 'Hoàng Trúc Linh', 'hoangtruclinh@gmail.com', '0989007159', '10000000', 'Part-time', 'hoangtruclinh', 'sEnEWorBIaLZeR', 'Data Analyst', 'Enabled', '65 Trung Nhi Street, Le Loi Ward', '0387958918', '2022-06-01 09:00:00', 'Employee', 'https://images.unsplash.com/photo-1548142813-c348350df52b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=389&q=80', NULL, '1999-12-05'),
(8, 4, 6, 'Nguyễn Trung Tín', 'nguyentrungtin@gmail.com', '0919127159', '13500000', 'Seasonal', 'nguyentrungtin', '@E&jG$SaRxMWvd', 'Software Engineer', 'Enabled', '89A Hoang Van Thu Street, CMT8 Ward', '0212458917', '2021-12-30 09:00:00', 'Employee', 'https://images.unsplash.com/photo-1556157382-97eda2d62296?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', NULL, '1999-12-12'),
(9, 4, 6, 'Trần Minh Tiến', 'tranminhtien@gmail.com', '0901890456', '12000000', 'Full-time', 'tranminhtien', 'sOcabEnTEnUcke', 'Software Engineer', 'Enabled', '5 Nguyen Binh Khiem Street, Cam Linh Ward', '0123490192', '2022-06-01 17:37:41', 'Employee', 'https://images.unsplash.com/photo-1543132220-3ec99c6094dc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80', NULL, '1997-11-04'),
(10, 3, 3, 'Nguyễn Thị Linh Chi', 'nguyenthilinhchi@gmail.com', '0908789032', '13000000', 'Temporary', 'nguyenthilinhchi', 'FOcabEnTEnUckf', 'HRBP Manager Intern', 'Disabled', '227 Nguyễn Văn Cừ P.5 Q.5 TP.HCM', '0981958907', '2021-12-01 10:41:33', 'Employee', 'https://images.unsplash.com/photo-1514315384763-ba401779410f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=383&q=80', '2022-07-16 10:36:55', '1999-12-30'),
(12, 4, 6, 'Đỗ Ngọc Nga', 'dongocnga@gmail.com', '0346868990', '6000000', 'Full-time', 'dongocnga', 'sOcabEnTEnUcke', 'Data Scientist Intern', 'Disabled', '210A CMT8 P.15 Q.Tân Bình TP.HCM', '0290858918', '2021-07-01 10:41:40', 'Employee', 'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80', '2022-07-17 10:41:40', '2001-01-01'),
(13, 4, 6, 'Nguyễn Thị Minh Tú', 'nguyenthiminhtu@gmail.com', '0586484992', '35000000', 'Temporary', 'nguyenthiminhtu', 'tgDARcfbMbhmHY', 'Software Architecture', 'Enabled', '19A Nguyễn Thị Minh Khai Q.3 TP.HCM', '0931490192', '2020-07-31 10:41:40', 'Employee', 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80', NULL, '1984-09-12'),
(14, 4, 6, 'Satoh Takeru', 'satohtakeru@gmail.com', '0918234744', '40000000', 'Full-time', 'satohtakeru', 'SiDARcfbMbhAAA', 'Senior Software Engineer', 'Enabled', '123 Nguyễn Văn Cừ P.5 Q.5 TP.HCM', '02001490192', '2020-06-01 10:52:17', 'Employee', 'https://images.unsplash.com/photo-1508341591423-4347099e1f19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80', NULL, '1995-10-26'),
(15, 4, 6, 'Đinh Ngọc Phi Linh', 'dinhngocphilinh@gmail.com', '0957807123', '20500000', 'Seasonal', 'dinhngocphilinh', 'u5ZDu56GQMF79285TF', 'Junior Data Scientist', 'Enabled', '289 Cộng Hòa Q.Tân Bình TP.HCM', '02921490192', '2021-07-01 10:56:05', 'Employee', 'https://images.unsplash.com/photo-1563306406-e66174fa3787?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80', NULL, '1993-05-04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `leave type history`
--

CREATE TABLE `leave type history` (
  `EMPLOYEE_ID` int(11) NOT NULL COMMENT 'Chứa ID của nhân viên. Tham chiếu từ bảng employee',
  `LEAVE_TYPEID` int(11) NOT NULL COMMENT 'Chứa ID của loại nghỉ phép. Tham chiếu từ bảng Leave Type',
  `USED_DAY` int(11) NOT NULL DEFAULT '0' COMMENT 'Tổng số ngày nghỉ mà nhân viên đó đã sử dụng cho loại nghỉ phép đó',
  `REMAINING_DAY` int(11) NOT NULL DEFAULT '16' COMMENT 'Tổng số ngày nghỉ mà nhân viên còn của loại nghỉ phép đó',
  `COMMENT` varchar(5000) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Bình luận của nhân viên'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `leave type history`
--

INSERT INTO `leave type history` (`EMPLOYEE_ID`, `LEAVE_TYPEID`, `USED_DAY`, `REMAINING_DAY`, `COMMENT`) VALUES
(9, 4, 4, 26, 'Nghỉ vì bị bệnh phải nhập viện'),
(14, 1, 2, 14, ''),
(14, 3, 1, 7, ''),
(14, 4, 1, 29, ''),
(15, 2, 2, 4, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `leave_type`
--

CREATE TABLE `leave_type` (
  `LEAVETYPE_ID` int(11) NOT NULL COMMENT 'Chứa ID của loại nghỉ phép',
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Chứa thông tin về loại nghỉ phép đó',
  `TOTAL_DAY` int(11) NOT NULL DEFAULT '16' COMMENT 'Chứa thông tin về tổng số ngày nghỉ của loại nghỉ phép đó'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Bảng này cho biết thông tin của các loại nghỉ phép';

--
-- Đang đổ dữ liệu cho bảng `leave_type`
--

INSERT INTO `leave_type` (`LEAVETYPE_ID`, `DESCRIPTION`, `TOTAL_DAY`) VALUES
(1, 'Annual Leave', 16),
(2, 'Personal Leave', 6),
(3, 'Compensation Leave', 8),
(4, 'Sick Leave (Non-paid)', 30),
(5, 'Non-paid Leave', 30),
(6, 'Maternity Leave (Non-paid)', 60),
(7, 'Engagement Ceremony', 2),
(8, 'Wedding Leave', 3),
(9, 'Relative Funeral Leave', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pa_feedback`
--

CREATE TABLE `pa_feedback` (
  `PAFB_ID` int(11) NOT NULL COMMENT 'ID của một thông tin feedback, là trường tự tăng',
  `EMPLOYEE_BEINGFEEDBACK_ID` int(11) NOT NULL COMMENT 'Chứa ID của nhân viên cần được đánh giá. Tham chiếu từ bảng employee',
  `EMPLOYEE_FEEDBACK_ID` int(11) NOT NULL COMMENT 'Chứa ID của nhân viên đánh giá, tham chiếu từ bảng employee',
  `RESPONDED_DATE` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT 'Thời gian phản hồi gần đây nhất của feedback',
  `CONTENT` varchar(10000) COLLATE utf8mb4_vietnamese_ci NOT NULL DEFAULT 'Hãy điền nội dung đánh giá ở đây' COMMENT 'Chứa nội dung feedback',
  `STATUS` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL DEFAULT 'Not responding' COMMENT 'Trạng thái xử lý của feedback. Gồm 1 trong 2 trạng thái "Not responding", "Responded". Được điền tự động bởi hệ thống, nhân viên không thể sửa. Trạng thái được chuyển sang "Responded" khi nhân viên có điền thông tin feedback',
  `DEADLINE_FEEDBACK` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Deadline cho việc đánh giá (feedback).  Trường này phải >= RESPONDED_DATE ',
  `EMPLOYEE_MANAGER` int(11) NOT NULL COMMENT 'Chứa ID của quản lý - người quản lý nhân viên làm feedback. Tham chiếu từ bảng Employee'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Bảng này cho biết thông tin của một feedback';

--
-- Đang đổ dữ liệu cho bảng `pa_feedback`
--

INSERT INTO `pa_feedback` (`PAFB_ID`, `EMPLOYEE_BEINGFEEDBACK_ID`, `EMPLOYEE_FEEDBACK_ID`, `RESPONDED_DATE`, `CONTENT`, `STATUS`, `DEADLINE_FEEDBACK`, `EMPLOYEE_MANAGER`) VALUES
(1, 6, 8, '2022-07-11 17:48:54', 'Quản lý rất dễ thương, làm việc đúng giờ, teamwork tốt, nên phát huy.', 'Responded', '2022-08-31 23:00:00', 4),
(2, 9, 8, '2022-07-11 12:49:55', 'Đồng đội dễ thương, làm việc nhiệt tình, năng suất.', 'Responded', '2022-08-31 23:00:00', 6),
(3, 7, 8, '2022-07-10 17:51:12', 'Bạn nữ xinh, dễ thương, học hỏi nhanh, có chí tiến thủ', 'Responded', '2022-08-31 23:00:00', 6),
(4, 4, 6, '1970-01-01 00:00:00', 'Hãy điền nội dung đánh giá ở đây', 'Not responding', '2022-07-15 23:00:00', 5),
(5, 15, 8, '2022-07-17 11:03:46', 'Chị Linh làm việc rất chăm chỉ, giỏi và thân thiện. Chị ấy cũng thường xuyên giúp đỡ các thành viên khác', 'Responded', '2022-08-31 23:00:00', 6),
(6, 13, 8, '1970-01-01 00:00:00', 'Hãy điền nội dung đánh giá ở đây', 'Not responding', '2022-08-31 23:00:00', 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pa_goal`
--

CREATE TABLE `pa_goal` (
  `PAGOAL_ID` int(11) NOT NULL COMMENT 'ID của một PA form. Mỗi PA Form sẽ có nhiều thông tin mục tiêu ',
  `EMPLOYEECREATE_ID` int(11) NOT NULL COMMENT 'ID của nhân viên tạo ra PA Form đó. Tham chiếu từ bảng employee',
  `MANAGER_ID` int(11) NOT NULL COMMENT 'ID của quản lý cấp 1 quản lý PA form và nhân viên tạo PA Form. Tham chiếu từ bảng employee',
  `LASTUPDATE_DATE` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT 'Thời gian cập nhật PA Form gần đây nhất. Mặc định để là ''1970-01-01 00:00:00''',
  `STATUS` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL DEFAULT 'Draft' COMMENT 'Trạng thái xử lý của request OT. Gồm 1 trong 5 trạng thái: Draft, Pending, Approved, Rejected, Cancelled.',
  `TOTAL_GOALS` int(11) NOT NULL DEFAULT '1' COMMENT 'Tổng mục tiêu của PA Form. Thông tin này được tính trên số lượng thông tin chi tiết goal của bảng pa goal detail cho PA Form đó',
  `UNSUBMIT_REASON` varchar(5000) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL COMMENT 'Lý do nhân viên muốn hủy gửi (unsubmit) form PA. Nếu trường này có thông tin, trạng thái của request bắt buộc là Cancelled, mặc định là None	',
  `MANAGER_COMMENT` varchar(5000) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL COMMENT 'Ghi lí do quản lý cấp 1 từ chối form PA. Nếu trường này có thông tin, trạng thái của form phải là "Rejected", mặc định là None',
  `DEADLINE_PAGOAL` datetime NOT NULL COMMENT 'Deadline phải nộp PA Form. Thời gian này phải >= LASTUPDATE_DATE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Bảng này cho biết thông tin của một PA Form';

--
-- Đang đổ dữ liệu cho bảng `pa_goal`
--

INSERT INTO `pa_goal` (`PAGOAL_ID`, `EMPLOYEECREATE_ID`, `MANAGER_ID`, `LASTUPDATE_DATE`, `STATUS`, `TOTAL_GOALS`, `UNSUBMIT_REASON`, `MANAGER_COMMENT`, `DEADLINE_PAGOAL`) VALUES
(1, 8, 6, '2021-07-11 21:00:00', 'Approved', 3, NULL, NULL, '2021-07-30 23:00:00'),
(2, 8, 6, '2022-07-17 16:45:23', 'Pending', 5, NULL, NULL, '2022-08-30 16:45:23'),
(3, 15, 6, '2022-07-17 19:37:34', 'Cancelled', 1, 'Không có đủ thời gian để hoàn thành mục tiêu', NULL, '2022-07-31 23:02:00'),
(4, 15, 6, '2022-07-16 12:00:00', 'Draft', 1, NULL, NULL, '2022-07-31 23:00:00'),
(5, 14, 6, '2022-07-14 19:44:33', 'Rejected', 1, NULL, 'Mục tiêu của PA này còn quá mơ hồ và quá rộng, chưa thực sự cụ thể', '2022-07-31 23:00:00'),
(6, 14, 6, '2022-07-17 19:51:58', 'Pending', 1, NULL, NULL, '2022-07-31 23:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pa_goal detail`
--

CREATE TABLE `pa_goal detail` (
  `PAGOALDETAIL_ID` int(11) NOT NULL COMMENT 'ID của một chi tiết mục tiêu (goal). Một form PA có thể có nhiều thông tin chi tiết mục tiêu',
  `PAGOAL_ID` int(11) NOT NULL COMMENT 'ID của PA Form mà chi tiết mục tiêu thuộc về. Tham chiếu từ bảng pa goal',
  `GOAL_NAME` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL COMMENT 'Chứa thông tin về tên của mục tiêu',
  `ACTION_STEP` varchar(5000) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL COMMENT 'Chứa các bước thực hiện mục tiêu đó',
  `DUE_DATE` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT 'Ngày dự kiến hoàn thành của mục tiêu',
  `COMPLETED_DATE` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT 'Ngày hoàn thành thực tế của mục tiêu. Mặc định để là 1970-01-01 00:00:00, trong TH trạng thái của mục tiêu là "Completed" thì trường này phải có giá trỊ sao cho Complete Date phải >= Due Date',
  `STATUS` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL DEFAULT 'Processing' COMMENT 'Trạng thái hoàn thành của mục tiêu đó.Có 1 trong 2 trạng thái "Processing", "Completed". Lưu ý: Trạng thái này của mục tiêu khác với trạng thái của PA Form. Trạng thái này nhân viên có thể sửa được.',
  `COMMENT` varchar(5000) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL COMMENT 'Bình luận của nhân viên về mục tiêu mà mình tạo ra'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Bảng này cho biết thông tin của 1 CHI TIẾT goal của PA Form';

--
-- Đang đổ dữ liệu cho bảng `pa_goal detail`
--

INSERT INTO `pa_goal detail` (`PAGOALDETAIL_ID`, `PAGOAL_ID`, `GOAL_NAME`, `ACTION_STEP`, `DUE_DATE`, `COMPLETED_DATE`, `STATUS`, `COMMENT`) VALUES
(1, 1, 'Kiếm thêm được nhiều dự án hơn', '1. Mở rộng mối quan hệ\r\n2. Thuyết phục khách hàng\r\n3. Kiếm được khách hàng\r\n4. Chốt dự án + giá cả', '2021-11-30 23:00:00', '2021-11-01 09:00:00', 'Completed', 'Cần hoàn thành nhanh nhất có thể'),
(2, 1, 'Hoàn thành chứng chỉ Oracle Certified Associate (OCA) trong thời gian càng sớm càng tốt', '- Học và sử dụng Oracle cơ bản\r\n- Tham gia khóa học luyện chứng chỉ Oracle Certified Associate (OCA)', '2021-09-01 23:00:00', '2021-08-01 00:00:00', 'Completed', 'Không có comment'),
(3, 1, 'Hoàn thành chứng chỉ Specialist cho Oracle Database 12c', '- Học và sử dụng Oracle cơ bản\r\n- Tham gia khóa học luyện chứng chỉ Specialist cho Oracle Database 12c', '2021-11-01 00:00:00', '2021-10-28 00:00:00', 'Completed', 'Có thể hoàn thành cuối cùng vì chứng chỉ này không bắt buộc'),
(4, 2, 'Hoàn thành dự án Alola trước đầu tháng 10 năm nay', '- Tập trung nhiều giờ hơn để hoàn thành dự án Alola\r\n- Có thể OT thêm vài ngày để thúc đẩy tiến độ dự án, mỗi ngày OT tầm 3-4 tiếng.', '2022-09-30 23:21:27', '1970-01-01 00:00:00', 'Processing', 'Ưu tiên mục tiêu này trước các mục tiêu khác'),
(5, 2, 'Đạt được trình độ Tiếng Anh đầu ra ít nhất: IELTS 6.5 với kĩ năng Speaking >= 5.0 trước tháng 12/2022. Có thể quy đổi ra các chứng chỉ tương đương khác như TOEFL, TOEIC', '- Lập kế hoạch ôn luyện tiếng anh mỗi ngày ít nhất 30 phút\r\n- Luyện nói ở trung tâm VUS vào thứ 7 và CN ít nhất 1 tiếng rưỡi', '2022-11-30 23:00:00', '1970-01-01 00:00:00', 'Processing', 'Không được trễ tiến độ khi hoàn thành mục tiêu này'),
(6, 2, 'Tham gia chương trình Tình nguyện mùa hè xanh vào tháng 8 chung với công ty để đạt KPI', 'Hoàn thành nhanh các công việc trên công ty', '2022-08-30 23:00:00', '1970-01-01 00:00:00', 'Processing', NULL),
(7, 2, 'Hoàn thành chứng chỉ \"Chứng nhận trong quản trị doanh nghiệp CNTT\" ( Certified in the Governance of Enterprise IT – CGEIT)', 'Dành thời gian ôn luyện ít nhất mỗi ngày 30 phút - 1 tiếng. Vào thứ 7, CN thì ôn nhiều hơn (>=2 tiếng)', '2022-11-01 23:00:00', '1970-01-01 00:00:00', 'Processing', NULL),
(8, 2, 'Hoàn thành chứng chỉ \"AWS Certified Solutions Architect – Associate\"', '- Hoàn thành nhanh các công việc trên công ty\r\n- Học các kiến thức AWS cơ bản \r\n- Dành thời gian luyện đề mỗi ngày ít nhất 1 tiếng', '2022-12-31 00:00:00', '1970-01-01 00:00:00', 'Processing', 'Ưu tiên hoàn thành chứng chỉ này hơn các chứng chỉ khác'),
(9, 3, 'Hoàn thành chứng chỉ \"Certified in the Governance of Enterprise IT – CGEIT\" trước giữa tháng 8', '- Dành nhiều thời gian hơn để học và ôn luyện thi mỗi ngày ít nhất 2 tiếng\r\n- Giảm bớt thời gian học và làm việc xuống', '2022-08-15 00:00:00', '1970-01-01 00:00:00', 'Processing', 'Là mục tiêu ưu tiên'),
(10, 4, 'Hoàn thành chứng chỉ \"Data Science Council of America (DASCA) Principle Data Scientist (PDS)\" trước cuối tháng 12', 'Tập trung nhiều giờ hơn để ôn và luyện thi chứng chỉ', '2022-12-31 23:00:00', '1970-01-01 00:00:00', 'Processing', NULL),
(11, 5, 'Hoàn thành các chứng chỉ liên quan đến AWS trong năm nay', 'Chỉ cần tập trung nhiều vào việc ôn thi chứng chỉ là được', '2022-12-31 23:00:00', '1970-01-01 00:00:00', 'Processing', NULL),
(12, 6, 'Hoàn thành chứng chỉ AWS Certified Solutions Architect – Associate trước tháng 10 năm 2022', 'Dành thời gian ôn luyện ít nhất mỗi ngày 30 phút - 1 tiếng. Vào thứ 7, CN thì ôn nhiều hơn (>=2 tiếng)', '2022-09-30 23:59:00', '1970-01-01 00:00:00', 'Processing', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `request ot`
--

CREATE TABLE `request ot` (
  `ROT_ID` int(11) NOT NULL COMMENT 'Mã của 1 request OT, là trường tự tăng',
  `EMPLOYEE_ID` int(11) NOT NULL COMMENT 'Chứa ID của nhân viên tạo ra request OT',
  `MANAGER_ID` int(11) NOT NULL COMMENT 'Chứa ID của nhân viên quản lý cấp 1 của nhân viên tạo ra request',
  `REASON` varchar(5000) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Lý do nhân viên muốn làm việc OT',
  `CREATE_DATE` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT 'Thời gian tạo request OT',
  `UPDATE_DATE` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT 'Thời gian cập nhật thông tin của request OT gần nhất. Mặc định là 1970-01-01 00:00:00, khi được cập nhật lại, thời gian này phải >= CREATE_DATE',
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
(1, 8, 6, 'Dự án mới sắp ra cần hoàn thành gấp để giao vào đầu tháng 8', '2022-07-11 17:40:03', '2022-07-11 17:40:03', 'Draft', 'None', '2022-07-27', '8', '2022-07-31', 'None', 1),
(2, 15, 6, 'Làm không kịp nên tăng ca để kịp tiến độ dự án mới', '2022-07-17 12:08:03', '2022-07-18 12:08:03', 'Pending', 'None', '2022-07-16', '4', '2022-07-16', 'None', 1),
(3, 14, 6, 'Anh có việc gia đình cần nghỉ 1 tuần nên anh cần tăng ca để làm bù để kịp tiến độ dự án.', '2022-07-15 12:12:35', '2022-07-15 13:12:35', 'Approved', 'None', '2022-08-01', '6', '2022-08-03', 'None', 1),
(4, 8, 6, 'Dự án Alola cần bàn giao cho khách hàng gấp vào cuối tháng 8 nên em cần OT để kịp tiến độ', '2022-07-17 12:14:54', '2022-07-17 12:25:54', 'Draft', 'None', '2022-07-25', '12', '2022-07-27', 'None', 1),
(5, 8, 6, 'Em xin OT để tuần sau em nghỉ đi chơi với người yêu', '2022-07-16 12:14:54', '2022-07-17 15:25:54', 'Cancelled', 'None', '2022-08-15', '4', '2022-08-18', 'Lí do em ghi còn chưa thật sự hợp lí, em xin được thu hồi request để gửi lại request mới', 0);

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
(1, 1, '2022-07-27', '4'),
(2, 1, '2022-07-31', '4'),
(3, 4, '2022-07-25', '4'),
(4, 4, '2022-07-26', '4'),
(5, 4, '2022-07-27', '4'),
(6, 5, '2022-08-15', '1'),
(7, 5, '2022-08-16', '1'),
(8, 5, '2022-08-17', '1'),
(9, 5, '2022-08-18', '1'),
(10, 2, '2022-07-16', '4'),
(11, 3, '2022-08-01', '3'),
(12, 3, '2022-08-02', '2'),
(13, 3, '2022-08-03', '1');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories_subscribe`
--
ALTER TABLE `categories_subscribe`
  ADD PRIMARY KEY (`SUBSCRIBE_ID`),
  ADD KEY `FK_SUBCRIBE_EMPLOYEE` (`EMPLOYEE_ID`);

--
-- Chỉ mục cho bảng `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DEPART_ID`),
  ADD KEY `FK_Department_Manager` (`MANAGER_ID`);

--
-- Chỉ mục cho bảng `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EMPLOYEE_ID`),
  ADD UNIQUE KEY `username_ind` (`USERNAME`),
  ADD UNIQUE KEY `cmnd_index` (`CMND/CCCD`),
  ADD KEY `FK_Department_Working` (`DEPART_ID`),
  ADD KEY `FK_Manager_Employee` (`MANAGER_ID`);

--
-- Chỉ mục cho bảng `leave type history`
--
ALTER TABLE `leave type history`
  ADD PRIMARY KEY (`EMPLOYEE_ID`,`LEAVE_TYPEID`),
  ADD KEY `FK_Leave_Type_Ref` (`LEAVE_TYPEID`);

--
-- Chỉ mục cho bảng `leave_type`
--
ALTER TABLE `leave_type`
  ADD PRIMARY KEY (`LEAVETYPE_ID`),
  ADD UNIQUE KEY `leave_type_describe` (`DESCRIPTION`);

--
-- Chỉ mục cho bảng `pa_feedback`
--
ALTER TABLE `pa_feedback`
  ADD PRIMARY KEY (`PAFB_ID`),
  ADD KEY `FK_Employee_Being_Feedback` (`EMPLOYEE_BEINGFEEDBACK_ID`),
  ADD KEY `FK_Employee_Feedback` (`EMPLOYEE_FEEDBACK_ID`),
  ADD KEY `FK_Feedback_Manager` (`EMPLOYEE_MANAGER`);

--
-- Chỉ mục cho bảng `pa_goal`
--
ALTER TABLE `pa_goal`
  ADD PRIMARY KEY (`PAGOAL_ID`),
  ADD KEY `FK_Employee_Create` (`EMPLOYEECREATE_ID`),
  ADD KEY `FK_Employee_Manager` (`MANAGER_ID`);

--
-- Chỉ mục cho bảng `pa_goal detail`
--
ALTER TABLE `pa_goal detail`
  ADD PRIMARY KEY (`PAGOALDETAIL_ID`,`PAGOAL_ID`),
  ADD KEY `FK_PAGoal_Related` (`PAGOAL_ID`);

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
-- AUTO_INCREMENT cho bảng `categories_subscribe`
--
ALTER TABLE `categories_subscribe`
  MODIFY `SUBSCRIBE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'trường này để lưu khóa tự tăng thể hiện mã của việc đăng ký', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `department`
--
ALTER TABLE `department`
  MODIFY `DEPART_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID của phòng ban, là trường tự tăng', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `employee`
--
ALTER TABLE `employee`
  MODIFY `EMPLOYEE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID của nhân viên, là trường tự tăng', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `leave_type`
--
ALTER TABLE `leave_type`
  MODIFY `LEAVETYPE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chứa ID của loại nghỉ phép', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `pa_feedback`
--
ALTER TABLE `pa_feedback`
  MODIFY `PAFB_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID của một thông tin feedback, là trường tự tăng', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `pa_goal`
--
ALTER TABLE `pa_goal`
  MODIFY `PAGOAL_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID của một PA form. Mỗi PA Form sẽ có nhiều thông tin mục tiêu ', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `pa_goal detail`
--
ALTER TABLE `pa_goal detail`
  MODIFY `PAGOALDETAIL_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID của một chi tiết mục tiêu (goal). Một form PA có thể có nhiều thông tin chi tiết mục tiêu', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `request ot`
--
ALTER TABLE `request ot`
  MODIFY `ROT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã của 1 request OT, là trường tự tăng', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `request ot detail`
--
ALTER TABLE `request ot detail`
  MODIFY `ROTDETAIL_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID của một chi tiết request OT. Một request OT có thể có nhiều thông tin chi tiết', AUTO_INCREMENT=14;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `categories_subscribe`
--
ALTER TABLE `categories_subscribe`
  ADD CONSTRAINT `FK_SUBCRIBE_EMPLOYEE` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `employee` (`EMPLOYEE_ID`);

--
-- Các ràng buộc cho bảng `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `FK_Department_Manager` FOREIGN KEY (`MANAGER_ID`) REFERENCES `employee` (`EMPLOYEE_ID`);

--
-- Các ràng buộc cho bảng `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `FK_Department_Working` FOREIGN KEY (`DEPART_ID`) REFERENCES `department` (`DEPART_ID`),
  ADD CONSTRAINT `FK_Manager_Employee` FOREIGN KEY (`MANAGER_ID`) REFERENCES `employee` (`EMPLOYEE_ID`);

--
-- Các ràng buộc cho bảng `leave type history`
--
ALTER TABLE `leave type history`
  ADD CONSTRAINT `FK_Leave_Type_Emp` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `employee` (`EMPLOYEE_ID`),
  ADD CONSTRAINT `FK_Leave_Type_Ref` FOREIGN KEY (`LEAVE_TYPEID`) REFERENCES `leave_type` (`LEAVETYPE_ID`);

--
-- Các ràng buộc cho bảng `pa_feedback`
--
ALTER TABLE `pa_feedback`
  ADD CONSTRAINT `FK_Employee_Being_Feedback` FOREIGN KEY (`EMPLOYEE_BEINGFEEDBACK_ID`) REFERENCES `employee` (`EMPLOYEE_ID`),
  ADD CONSTRAINT `FK_Employee_Feedback` FOREIGN KEY (`EMPLOYEE_FEEDBACK_ID`) REFERENCES `employee` (`EMPLOYEE_ID`),
  ADD CONSTRAINT `FK_Feedback_Manager` FOREIGN KEY (`EMPLOYEE_MANAGER`) REFERENCES `employee` (`EMPLOYEE_ID`);

--
-- Các ràng buộc cho bảng `pa_goal detail`
--
ALTER TABLE `pa_goal detail`
  ADD CONSTRAINT `FK_PAGoal_Related` FOREIGN KEY (`PAGOAL_ID`) REFERENCES `pa_goal` (`PAGOAL_ID`);

--
-- Các ràng buộc cho bảng `request ot detail`
--
ALTER TABLE `request ot detail`
  ADD CONSTRAINT `FK_OTReq_Related` FOREIGN KEY (`ROT_ID`) REFERENCES `request ot` (`ROT_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
