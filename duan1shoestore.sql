-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3308:3308
-- Thời gian đã tạo: Th10 19, 2023 lúc 08:52 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `duan1shoestore`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `id` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `bill_name` varchar(255) NOT NULL,
  `bill_address` varchar(255) NOT NULL,
  `bill_tel` varchar(50) NOT NULL,
  `bill_email` varchar(255) NOT NULL,
  `bill_pttt` tinyint(1) NOT NULL COMMENT '0. Thanh toán trực tiếp\r\n1. Chuyển khoản\r\n2. Thanh toán online',
  `ngaydathang` varchar(50) NOT NULL,
  `total` int(11) NOT NULL,
  `bill_status` tinyint(1) NOT NULL COMMENT '0. Đơn hàng mới\r\n1. Đang xử lý\r\n2. Đang giao hàng\r\n3. Đã giao'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

CREATE TABLE `binhluan` (
  `id` int(11) NOT NULL,
  `noidung` text NOT NULL,
  `ngaybinhluan` varchar(30) NOT NULL,
  `iduser` int(11) NOT NULL,
  `idspbt` int(11) NOT NULL,
  `status` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `idspbt` int(11) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `namepro` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `soluong` int(11) NOT NULL,
  `thanhtien` int(11) NOT NULL,
  `idbill` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id` int(11) NOT NULL,
  `namedm` varchar(255) NOT NULL,
  `status` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`id`, `namedm`, `status`) VALUES
(1, 'Giày Adidas', b'1'),
(2, 'Giày MLB', b'1'),
(3, 'Giày Converse', b'1'),
(4, 'Giày Nike', b'1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mausp`
--

CREATE TABLE `mausp` (
  `id` int(11) NOT NULL,
  `mau` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `mausp`
--

INSERT INTO `mausp` (`id`, `mau`) VALUES
(1, 'blue'),
(2, 'yellow'),
(3, 'black'),
(4, 'red'),
(5, 'orange');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(11) NOT NULL,
  `namepro` varchar(255) NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `discount` int(11) NOT NULL DEFAULT 0,
  `img` varchar(255) NOT NULL,
  `mota` text DEFAULT NULL,
  `luotxem` int(11) NOT NULL DEFAULT 0,
  `iddm` int(11) NOT NULL,
  `status` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`id`, `namepro`, `price`, `discount`, `img`, `mota`, `luotxem`, `iddm`, `status`) VALUES
(1, 'Giày Nike Air Jordan 1 Retro High Dior Like Auth 99%', 5000000, 2500000, '126.png', 'Giày Nike Air Jordan 1 Retro High Dior Like Auth 99% với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Vậy nên đôi giày này trở nên phổ biến, mang tính biểu tượng và được rất nhiều giới trẻ yêu thích.', 0, 4, b'1'),
(2, 'Giày Adidas Superstar Adifom Đen Siêu Cấp', 800000, 690000, 'adidas-superstar-adifom-den.png', 'Giày Adidas Superstar Adifom Đen Siêu Cấp với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Vậy nên đôi giày này trở nên phổ biến, mang tính biểu tượng và được rất nhiều giới trẻ yêu thích.', 0, 1, b'1'),
(3, 'Giày Adidas Superstar Adifom Trắng Siêu Cấp', 900000, 400000, 'adidas-superstar-adifom-trang.png', 'Giày Adidas Superstar Adifom Trắng Siêu Cấp với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Vậy nên đôi giày này trở nên phổ biến, mang tính biểu tượng và được rất nhiều giới trẻ yêu thích.', 0, 1, b'1'),
(4, 'Giày MLB Liner Mid Monogram NY', 1800000, 860000, 'giay-mlb-liner-mid-monogram-ny.png', 'Giày MLB Liner Mid Monogram NY với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Vậy nên đôi giày này trở nên phổ biến, mang tính biểu tượng và được rất nhiều giới trẻ yêu thích.', 0, 2, b'1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `size`
--

CREATE TABLE `size` (
  `id` int(11) NOT NULL,
  `size` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `size`
--

INSERT INTO `size` (`id`, `size`) VALUES
(1, 38),
(2, 39),
(3, 40),
(4, 41),
(5, 42);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `spbt`
--

CREATE TABLE `spbt` (
  `id` int(11) NOT NULL,
  `idpro` int(11) NOT NULL,
  `idmau` int(11) NOT NULL,
  `idsize` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `status` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lk_bill_taikhoan` (`iduser`);

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lk_binhluan_taikhoan` (`iduser`),
  ADD KEY `lk_binhluan_spbt` (`idspbt`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lk_cart_taikhoan` (`iduser`),
  ADD KEY `lk_cart_bill` (`idbill`),
  ADD KEY `lk_cart_spbt` (`idspbt`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `mausp`
--
ALTER TABLE `mausp`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lk_sanpham_danhmuc` (`iddm`);

--
-- Chỉ mục cho bảng `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `spbt`
--
ALTER TABLE `spbt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lk_spbt_mau` (`idmau`),
  ADD KEY `lk_spbt_size` (`idsize`),
  ADD KEY `lk_spbt_sanpham` (`idpro`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `mausp`
--
ALTER TABLE `mausp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `size`
--
ALTER TABLE `size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `spbt`
--
ALTER TABLE `spbt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `lk_bill_taikhoan` FOREIGN KEY (`iduser`) REFERENCES `taikhoan` (`id`);

--
-- Các ràng buộc cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD CONSTRAINT `lk_binhluan_spbt` FOREIGN KEY (`idspbt`) REFERENCES `spbt` (`id`),
  ADD CONSTRAINT `lk_binhluan_taikhoan` FOREIGN KEY (`iduser`) REFERENCES `taikhoan` (`id`);

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `lk_cart_bill` FOREIGN KEY (`idbill`) REFERENCES `bill` (`id`),
  ADD CONSTRAINT `lk_cart_spbt` FOREIGN KEY (`idspbt`) REFERENCES `spbt` (`id`),
  ADD CONSTRAINT `lk_cart_taikhoan` FOREIGN KEY (`iduser`) REFERENCES `taikhoan` (`id`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `lk_sanpham_danhmuc` FOREIGN KEY (`iddm`) REFERENCES `danhmuc` (`id`);

--
-- Các ràng buộc cho bảng `spbt`
--
ALTER TABLE `spbt`
  ADD CONSTRAINT `lk_spbt_mau` FOREIGN KEY (`idmau`) REFERENCES `mausp` (`id`),
  ADD CONSTRAINT `lk_spbt_sanpham` FOREIGN KEY (`idpro`) REFERENCES `sanpham` (`id`),
  ADD CONSTRAINT `lk_spbt_size` FOREIGN KEY (`idsize`) REFERENCES `size` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
