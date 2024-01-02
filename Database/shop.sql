-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 21, 2023 lúc 04:40 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`id`, `name`, `password`) VALUES
(9, 'admin', '123');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `id` int(11) NOT NULL,
  `madonhang` int(11) NOT NULL,
  `masanpham` int(11) NOT NULL,
  `tensanpham` text NOT NULL,
  `giasanpham` int(11) NOT NULL,
  `soluongsanpham` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietdonhang`
--

INSERT INTO `chitietdonhang` (`id`, `madonhang`, `masanpham`, `tensanpham`, `giasanpham`, `soluongsanpham`) VALUES
(1, 5, 1, 'Áo Thun Regular Horizontal Stripe', 290000, 1),
(2, 5, 4, 'quần jean ống rộng màu bạc có viền line', 650000, 1),
(3, 6, 2, 'Áo Thun Domino Four - 4th Anniversary', 320000, 1),
(4, 7, 4, 'quần jean ống rộng màu bạc có viền line', 650000, 1),
(5, 8, 2, 'Áo Thun Domino Four - 4th Anniversary', 640000, 2),
(6, 8, 3, 'Áo Thun 4 Years Of Adventure - 4th Anniversary', 320000, 1),
(7, 9, 2, 'Áo Thun Domino Four - 4th Anniversary', 320000, 1),
(8, 10, 2, 'Áo Thun Domino Four - 4th Anniversary', 320000, 1),
(9, 11, 6, 'Giày thể thao nam nữ - Giày Air Force Sneaker AF1 cao cấp full bill box JD', 697500, 1),
(10, 12, 4, 'quần jean ống rộng màu bạc có viền line', 1300000, 2),
(11, 12, 7, 'Giày Thể Thao MLB Chunky Liner Chuẩn 11 Full Bill Box', 647500, 1),
(12, 12, 11, 'Áo thun Unisex in VKFKBISON', 204000, 3),
(13, 12, 17, 'Quần jean dáng form suông rộng KONO ', 147000, 1),
(14, 12, 6, 'Giày thể thao nam nữ - Giày Air Force Sneaker AF1 cao cấp full bill box JD', 697500, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang` (
  `id` int(11) NOT NULL,
  `tenkhachhang` text NOT NULL,
  `sodienthoai` varchar(200) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `donhang`
--

INSERT INTO `donhang` (`id`, `tenkhachhang`, `sodienthoai`, `email`) VALUES
(1, 'hoa', '0989222666', 'hoa@gmail.com'),
(2, 'NguyenVanHuy', '0354626626', 'huy@gmail.com'),
(3, 'NguyenThiThu', '0999888777', 'thu@gmail.com'),
(4, 'NguyenVanHoang', '0657898234', 'hoang@gmail.com'),
(5, 'NguyenThiHuong', '0988734256', 'huong@gmail.com'),
(6, 'Van', '0988567456', 'NguyenThivan'),
(7, 'Ngoc', '0989999777', 'ngoc@gmail.com'),
(8, 'a', '123', 'a@gmail.com'),
(9, 'b', '123', 'b@gmail.com'),
(10, 'b', '123', 'b@gmail.com'),
(11, 'c', '123', 'c@gmail.com'),
(12, 'Nguyen Van Hoang', '0989555444', 'hoang@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `id` int(100) NOT NULL,
  `tenloaisanpham` text NOT NULL,
  `hinhanhloaisanpham` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `loaisanpham`
--

INSERT INTO `loaisanpham` (`id`, `tenloaisanpham`, `hinhanhloaisanpham`) VALUES
(1, 'Áo', 'https://img.lovepik.com/free-png/20210923/lovepik-t-shirt-png-image_401190055_wh1200.png'),
(2, 'Quần', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4TgSogqLkNAqZdWQlLkS9ZBwvWy0P0HZnsQ&usqp=CAU'),
(3, 'Giày', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgFFmTrm5ngAP18IvCAnU-bIYSdV135dLjSQ&usqp=CAU'),
(4, 'Khác', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGFkLHING1kGfP9er8AIuoLIR_xSLQaFUo9A&usqp=CAU');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(100) NOT NULL,
  `tensanpham` text NOT NULL,
  `giasanpham` int(100) NOT NULL,
  `hinhanhsanpham` mediumtext NOT NULL,
  `motasanpham` text NOT NULL,
  `idsanpham` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`id`, `tensanpham`, `giasanpham`, `hinhanhsanpham`, `motasanpham`, `idsanpham`) VALUES
(1, 'Áo Thun Regular Horizontal Stripe', 290000, 'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-ljw7owyu8xky2c', 'Áo Thun Regular Horizontal Stripe with logo ICONDENIM mang đến một sự kết hợp tinh tế giữa phong cách hiện đại và sự tối giản. Với chi tiết vạch ngang tinh xảo, áo thun này tạo nên một điểm nhấn thú vị cho bất kỳ bộ trang phục nào. Logo ICONDENIM trên áo là điểm nhấn độc đáo, thể hiện sự tinh tế và cá tính thương hiệu.', 1),
(2, 'Áo Thun Domino Four - 4th Anniversary', 320000, 'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-ljwdtpr74wsic4', 'Áo Thun Domino Four mang tinh thần sẵn sàng cùng nhau tận hưởng mọi khoảnh khắc. Phía trước của áo có họa tiết Domino đều mang nút số \"4\" tượng trưng cho sự kỷ niệm lần thứ tư. Họa tiết này còn mang ý nghĩa của tích hợp và liên kết, nhấn mạnh tinh thần cộng đồng và sự đồng lòng sẻ chia bất kể vui buồn.', 1),
(3, 'Áo Thun 4 Years Of Adventure - 4th Anniversary', 320000, 'https://down-vn.img.susercontent.com/file/vn-11134201-23030-zewyg571v6nv5a', '4 YEARS ADVENTURE - Áo Thun 4 Years Of Adventure là phiên bản đặc biệt dành cho kỷ niệm lần thứ tư của thương hiệu, kỷ niệm cho hành trình với những chặng đường hấp dẫn trong suốt bốn năm qua. Áo thun này là một cách để tôn vinh quá trình phát triển của thương hiệu và đồng thời thể hiện tinh thần phiêu lưu và khám phá, hướng tới mục tiêu cuối cùng: \"Thời trang không còn là nỗi lo - mà là một sự tận hưởng\".', 1),
(4, 'quần jean ống rộng màu bạc có viền line', 650000, 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmq1wh4prm5b6f', 'THÔNG TIN SẢN PHẨM- Chất liệu: jeans denim -Màu sắc: nâu -Size: S, M, L, XL Xuất xứ: Việt Nam -Form/kiểu dáng: jeans nâu trơn Jeans form dáng suông trẻ trung tạo cảm giác thoải mái cho người mặc CHI TIẾT CHỌN SIZE (bảng size mang tính tham khảo, bạn có thể check chi tiết số đo của quần ở trên hình ảnh sản phẩm nhé^^)\r\n\r\nSize S : Cân nặng 41-47kg, cao 1m57 - 1m62\r\n\r\nSize M : Cân nặng 48- 53kg, cao 1m60 - 1m63\r\n\r\nSize L : Cân nặng 54 - 62kg, cao 1m64 - 1m69\r\n\r\nSize XL : Cân nặng 62- 69kg, cao 1m67 - 1m75 -\r\n\r\nSize XXL; Cân nặng dưới 82kg\r\n\r\nS. lưng 69cm. Đùi 50cm. Ống 18cm. Dài 95cm.\r\n\r\nM. Lưng 72- 75cm. Đùi 54cm. Ống 20cm. Dài 97cm.\r\n\r\nL. Lưng 82- 84cm. Đùi 57cm. Ống 21cm. Dài 100cm\r\n\r\nXL. Lưng 85-87cm, Đùi 60cm, ống 23cm, Dài 103cm\r\n\r\nXXL. Lưng 89-95cm. Đùi 62cm, Ống 25cm. Dài 105cm . MỘT SỐ LƯU Ý KHI SỬ DỤNG QUẦN JEANS: - Để giữ màu quần jeans đẹp như mới, trong lần giặt đầu tiên bạn không nên giặt bằng xà phòng. - Giặt tay là cách hiệu quả để giữ quần jeans không bị phai màu. - Hạn chế dùng nước xả vải với quần jeans. Nước xả vải có tác dụng làm mềm vải, dễ khiến quần jeans mất dáng, không còn đứng phom. - Nếu dùng máy giặt, bạn nhớ lộn trái quần jeans trước khi cho vào máy. - Để quần jeans được bền đẹp, bạn không nên giặt quần jeans quá nhiều lần. Sau 5 đến 10 lần mặc có thể đem quần ra giặt. - Không vắt kiệt nước khi giặt: Do chất liệu để làm nên quần jeans có tính co dãn nên những tác động mạnh đều có thể làm mất dáng chiếc quần yêu thích của bạn. - Không phơi quần jeans dưới nắng gắt. Bạn chỉ cần phơi quần ở những nơi thoáng mát, có nhiều gió là được. Và đừng quên việc lộn trái quần để phơi', 2),
(5, 'Quần Jean Dài Lưng Cao Dáng Rộng Có Khóa Kéo Thời Trang Trẻ Trung Cho Nam Và Nữ', 625000, 'https://down-vn.img.susercontent.com/file/cn-11134211-7r98o-ll949cg77j58dc', 'Thương hiệu\r\nYOUTANG\r\nChất liệu\r\nDenim\r\nPhong cách\r\nĐường phố\r\nMẫu\r\nTrơn\r\nTall Fit\r\nKhông\r\nBản eo\r\nBản to\r\nKiểu dáng quần\r\nĐứng\r\nRất lớn\r\nKhông\r\nChiều dài quần\r\nChiều dài đầy đủ\r\n', 2),
(6, 'Giày thể thao nam nữ - Giày Air Force Sneaker AF1 cao cấp full bill box JD', 697500, 'https://down-vn.img.susercontent.com/file/sg-11134201-7rbk0-ll05krfzvvwo55', 'Tên sản phẩm: Giày thể thao nam nữ - Giày Air Force Sneaker AF1 cao cấp full bill box JD độn đế tăng chiều cao Y185\r\n- Xuất xứ: Quảng Châu\r\n- Chất Liệu mặt trong giày: da trơn\r\n- Chất liệu mặt ngoài giày: Da tổng hợp kết hợp da thật tạo nền độ bền chắc không bị bong tróc\r\n- Chất liệu đế giày thể thao nam nữ: Cao su tổng hợp\r\n- Đế chống trơn trượt, kết hợp cùng kiểu dáng thể thao và màu sắc nổi bật, chắc chắn sẽ là phụ kiện được nhiều bạn lựa chọn để thể hiện phong cách thể thao khỏe khoắn, năng động.\r\n- Bên cạnh đó, lót giày Công nghệ Cupsole Memory Foam chất liệu nhẹ, êm ái giúp bạn luôn cảm thấy thoải mái trong suốt quá trình vận động.\r\n- Màu sắc giày: Trắng\r\n- Size: dành cho cả nam và nữ từ 36-43\r\n- Hãy chọn cho mình 1 đôi giày thể thao Air Force 1 cá tính, năng động nhé\r\n\r\nHƯỚNG DẪN CHỌN SIZE GIÀY\r\n   Chiều dài bàn chân   ---> Size số : \r\n- 23cm     đến  23.5cm ---> Giày size 37\r\n- 23.5cm  đến  24cm    ---> Giày size 38\r\n- 24cm     đến  24.5cm ---> Giày size 39\r\n- 24,5cm  đến  25cm   ---> Giày size 40\r\n- 25cm     đến  25.5cm ---> Giày size 41\r\n- 25,5cm  đến  26cm ---> Giày size 42\r\n- 26,5cm  đến  27cm    ---> Giày size 43\r\n', 3),
(7, 'Giày Thể Thao MLB Chunky Liner Chuẩn 11 Full Bill Box', 647500, 'https://down-vn.img.susercontent.com/file/sg-11134201-7r98o-ll0g789ivup469', 'Giày Thể Thao MLB Chunky Liner Chuẩn 11 Full Bill Box, Giày Sneaker M.L.B N.Y Nam Nữ Cao Cấp G385 Garen Sneaker\r\nGiày thể thao MLB Chunky là siêu phẩm Hot nhất năm 2022\r\nMÔ TẢ SẢN PHẨM GIÀY THỂ THAO MLB CHUNKY:\r\n- SIZE: 36-44\r\n- Đế : Đế 2 lớp làm bằng chất liệu cao su cao cấp \r\n- Chiều cao đế: Giày Sneaker MLB có chiều cao 4-5cm\r\n- Lót giày thể thao: Lót dày dặn và mềm mại tại cảm giác êm ái khi vận động bảo vệ đôi bàn chân thoải mái\r\n- Giày MLB Chunky dễ phối đồ thích hợp cho các hoạt động đi lại hàng ngày, chạy bộ\r\n- Mũi giay the thao tròn, đế cao su tổng hợp, xẻ rãnh tạo cảm giác thoải mái khi đi\r\n- Giày MLB Thích hợp với các mùa trong năm: Xuân - Hè - Thu - Đông\r\n-------------------------------------------\r\n HƯỚNG DẪN BẢO QUẢN GIÀY THỂ THAO NAM NỮ:\r\n+ Để giày ở nơi khô ráo thoáng mát để giữ giày được bền đẹp hơn\r\n+ Vệ sinh giày, dùng khăn hay bàn trải lông mềm để chải sạch giày cùng với nước tẩy rửa giày chuyên dụng với da hay da Pu\r\n+ Giày Nam Có thể giặt giày cùng với chất tẩy rửa nhẹ\r\n\r\n KHUYẾN CÁO\r\n-	 Không dùng hóa chất hay bột giặt có hoạt tính tẩy rửa mạnh đối với giày thể thao\r\n-	 Không dùng bàn chải cứng để vệ sinh giày sẽ làm hư \r\n-	 Không đi mưa ngâm nước lâu, không phơi giày trực tiếp dưới ngoài trời nắng gắt', 3),
(8, 'Nước hoa nam thơm lâu GIQ Kafeina với mùi hương tinh tế ngọt ngào, Nước hoa nam giá rẻ nội địa trung dung tích 50ml.', 875000, 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-llui3yemhbdr73', 'Nước hoa nam thơm lâu GIQ Kafeina với mùi hương tinh tế ngọt ngào, Nước hoa nam giá rẻ nội địa trung dung tích 50ml.\r\n\r\n\r\n\r\nNước Hoa Nam GIQ Kafeina 50ml Thơm Lâu 12h Hương Thơm Nam Tính, Sang Trọng Mùi Ngọt được xây dựng một hình tượng về các chàng trai với thông điệp \" Cuộc sống tươi đẹp\". Hình tượng này đã trở nên hoàn hảo hơn khi giới thiệu phiên bản mới.\r\n\r\n\r\n\r\nNước hoa nam thơm lâu GIQ Kafeina với mùi hương tinh tế ngọt ngào, Nước hoa nam giá rẻ nội địa trung dung tích 50ml.\r\n\r\n\r\n\r\nMùi hương đặc trưng:\r\n\r\n\r\n\r\nHương đầu: Cam Bergamot, Hương nước biển.\r\n\r\nHương giữa: Hoa phong lữ, Cây hương thảo, Cây xô thơm.\r\n\r\nHương cuối: Cây hoắc hương, Nhang (Hương).\r\n\r\n\r\n\r\nNước Hoa Nam GIQ Kafeina 50ml Thơm Lâu 12h Hương Thơm Nam Tính, Sang Trọng được xây dựng một hình tượng về các chàng trai với thông điệp \" Cuộc sống tươi đẹp\". Hình tượng này đã trở nên hoàn hảo hơn khi Lancome giới thiệu phiên bản mới ra mắt tháng 8/2017, phiên bản nước hoa nam thơm lâu, với mùi hương khiến Nàng lấp lánh niềm vui và tràn đầy hứng khởi vì hạnh phúc. \r\n\r\n\r\n\r\nNước hoa nam thơm lâu GIQ Kafeina với mùi hương tinh tế ngọt ngào, Nước hoa nam giá rẻ nội địa trung dung tích 50ml.\r\n\r\n\r\n\r\nNước Hoa Nam GIQ Kafeina 50ml Thơm Lâu 12h Hương Thơm Nam Tính, Sang Trọng như một bó hoa tươi sáng được hòa tầu từ các hương thơm tươi mát và lấp lánh của cam bergamot và mandarin với những ghi chú của Iris Pallida, Jasmin Sambac và Freesia, và được nhấn mạnh bởi hương hoa cam.\r\n\r\nHương thơm của hoa cam ược bao quanh bởi những mùi thơm của vanilla và gỗ đàn hương\r\n\r\n\r\n\r\n? Mô tả sản phẩm Nước hoa nam 50ml, Nước hoa nam thơm lâu\r\n\r\n- Được kết hợp với đặc trưng sang trọng và lịch lãm vốn có của nước hoa, đây là chai nước hoa được làm ra để dành riêng cho phái mạnh, mang lại sự khỏe khoắn sảng khoái và phong cách. \r\n\r\n- Với hương thơm nhẹ nhàng tự nhiên từ thiên nhiên và sự cuốn hút gợi cảm được lưu lại trên làn da, tạo ra một sức thu hút quyến rũ không thể cưỡng lại được. Sản phẩm phù hợp sử dụng vào những ngày trời nóng ẩm của mùa xuân và hạ. - Được kết hợp với đặc trưng sang trọng và lịch lãm vốn có của nước hoa, đây là chai nước hoa được làm ra để dành riêng cho phái mạnh, mang lại sự khỏe khoắn sảng khoái và phong cách.', 4),
(9, 'Nước Hoa Nam Blue De Flower Of Story Đẳng Cấp Phái Mạnh - Hàng Nội Địa', 3150000, 'https://down-vn.img.susercontent.com/file/264cb7864b5c618e6e75e9c0ae564530', 'Nước hoa Nam Blue Flower Of Story\r\n- Nước Hoa Blue hiểu cuộc sống hiểu hương vị, hương thơm tự nhiên Blue làm cho bạn càng dùng càng khó cưỡng với vỏ bình màu xanh thần bí khiến cho bạn không ngừng tưởng tượng ra cảm giác thần bí nhưng lại đơn giản và rõ ràng, trở thành sự lựa chọn đầu tiên của phái mạnh\r\n- Chai 50ml Hương đầu: Cam chanhHương giữa: Lavender, Húng quế, Hoa nhài, Lily, Hoa hồngHương cuối: Đàn hương, Xạ Hương, Vanila Anh nào cũng nên có 1 chai trong túi à nha\r\nHương thơm dịu nhẹ quyến rũ , ngây ngất khó quên\r\n\r\nQuy trình “chuẩn” khi xài nước hoa nam \r\n\r\n1/ Xịt nước hoa sau khi bạn tắm, sau khi hong khô người. \r\n\r\n2/ Đừng xịt nước hoa vào không khí rồi bước qua. \r\n\r\n3/ Nhắm vào các điểm mạch, như cổ và cổ tay trong. \r\n\r\n4/ Giữ chai nước hoa cách da của bạn 3-6 inches (7-15 cm) khi xịt. \r\n\r\n5/ Đừng dùng nhiều quá (2-4 tia là lý tưởng) \r\n\r\n6/ Đừng chà nước hoa trên da sau khi xịt. \r\n\r\n7/ Khi mùi nước hoa phai dần hãy xịt lại trên cổ tay.Đặc tính sản phẩm [HOT] Nước Hoa Nam Blue Mạnh Mẽ, nước hoa for men giá tốt, hương thơm quyến rũ đàn ông đích thực\r\n\r\nĐối với các sản phẩm có xuất sứ trung quốc bạn vui lòng sử dụng phần mềm wechat ( giao diện EN ) để check mã vạch.   ', 4),
(10, 'Áo thun tay lỡ unisex Logo Gu Cì ', 45000, 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lm16uryaf3rz07', 'Áo thun tay lỡ unisex Logo Gu Cì phối mí nổi mẫu mới QUANAOPHUKIEN - Áo phông freesize nam nữ unisex form rộng\r\nChất liệu: Cotton\r\nMàu sắc: Như hình\r\nKích cỡ: Sản phẩm nam nữ Unisex Freesize từ 38-65kg tùy chiều cao nha!\r\n\r\n', 1),
(11, 'Áo thun Unisex in VKFKBISON', 68000, 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmhcqb01pjvj8a', '-Tên sản Phẩm: Áo thun nam tay lỡ dáng Unisex in hình cậu bé VKFKBISON\r\n-Để bắt kịp với xu hướng thời trang của các bạn trẻ Miuzi thành lập với một sứ mệnh cao cả là mang đến những bộ đồ độc đáo và phù hợp với các bạn trẻ Việt Nam và toàn cầu hiện nay.', 1),
(12, 'Áo Thun Tay Lỡ UNDER ', 647500, 'https://down-vn.img.susercontent.com/file/b668908fe744feac535e6eaf8593cff3', ' Áo thun tay lỡ unisex, áo thun phản quang nam nữ. Áo thun phản quang 7 màu.\r\n   - Chất liệu: Thành phần: Chất liệu vải cotton 75% mềm, mịn, xịn, sang, cực mát và dày dặn rất đẹp, 15% bangdel giúp áo co giãn tốt, 10% poly giúp áo bền không nhăn nhúm.\r\n   - Kĩ thuật may: Đường may tỉ mỉ, cẩn thận, đảm bảo chắc chắn không bị bung chỉ, hầu như không có chỉ thừa.\r\n   - In ấn: Hình in phản quang 7 màu, sắc nét, không bị bong tróc. Sử dụng công nghệ in chuyển nhiệt hình in chìm vào áo, cam kết chất lượng bền đẹp lâu phai (sáng đẹp khi chụp flash)\r\n  - Áo thun unisex phù hợp cho cả nam và nữ, đi chơi, đi học mix đồ cực cá tính, năng động. Mặc đôi siêu xinh, mặc nhóm càng ấn tượng.', 1),
(13, 'Áo thun tay lỡ form rộng SMILE', 29400, 'https://down-vn.img.susercontent.com/file/vn-11134201-23030-oh4f4vpvagovc9', 'Form áo: Các mẫu sản phẩm của shop được thiết kế theo size: siza 4XS ( <5 kg) Size M ( 40kg - 51kg ), Size L ( 52kg - 57kg ), Size XL ( 58kg - 68kg ) mặc đẹp như hình bạn nhé\r\n\r\nCHẤT LIỆU : Chất thun Tici mịn mát, không co rút, dày vừa ko bí, PHÙ HỢP GIÁ TIỀN.\r\n\r\nMàu sắc có thể đậm hoặc nhạt 1-5% do hiệu ứng ánh sáng (có thể do bóng râm, đèn sáng hoặc tối, độ phân giải của máy)\r\n\r\n\r\n\r\n\r\n\r\n- Giặt mặt trái, nhẹ tay, giặt xong phơi ngay, không ngâm áo trong nước quá lâu.\r\n\r\n- Áo trắng - áo màu nên chia ra giặt riêng, không giặt chung.\r\n\r\n- Nếu giặt máy thì hình in có thể sẽ tróc theo thời gian------------------------------------------*', 1),
(14, 'Áo phông nam nữ Tommy ', 49500, 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ll09lz07zcnx78', 'Áo được sản xuất từ nhiều loại sợi đặc biệt: thun cao cấp KHÔNG chứa thành phần nilon. Do vậy áo vừa có khả năng THẤM HÚT, THOÁNG MÁT vừa có độ CO DÃN, dai bền giúp người mặc dễ dàng vận động.\r\n\r\n✔ Bề mặt mềm mịn, thông thoáng, co dãn giúp giảm nhiệt cực nhanh.\r\n\r\n✔ Độ dày vừa phải cùng đường may tỉ mỉ đảm bảo giữ phom dáng, bền màu sau nhiều lần giặt\r\n\r\n✔ Họa tiết, logo  Thêu dễ giặt, mau khô, không lo bong tróc\r\n\r\n✔ Kiểu dáng thời trang phù hợp nhiều hoàn cảnh: mặc nhà, đi học, đi chơi, du lịch, thể thao, làm quà tặng...\r\n\r\n✔ Đủ size, Đủ ảnh, Video thực tế, Đảm bảo sản phẩm y hình ', 1),
(15, 'Giày Thể Thao Sneaker JD_Trắng Đen Cổ Cao', 697500, 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lm4sjywfcx5r00', 'Tất cả Sản phẩm cam kết hình ảnh thật, tự chụp 100% có thể yên tâm nó là ảnh và videos chính chủ.\r\n• Size : 36 37 38 39 40 41 42 43 44 ( Tuỳ mẫu )', 3),
(16, 'Giày sneaker nam nữ độn đế đen trắng DPIDE', 159000, 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lllr9a1rg5zj95', '- Tên sản phẩm: Giày nam sneaker \r\n\r\n- Mã sản phẩm: G06\r\n\r\n- Chất liệu: Da PU cao cấp, mềm mại, không thấm nước, dễ lau chùi, thoáng khí, không gây nóng bí khi sử dụng thời gian dài.\r\n\r\n- Thiết kế: Ôm chân, mũi giày tròn, đế cao su tổng hợp chắc chắn chống trơn cực tốt, gót chân phẳng, tạo cảm giác thoải mái.\r\n\r\n- Dễ phối đồ thích hợp cho các hoạt động đi lại hàng ngày, chạy bộ, chạy dài.\r\n\r\n- Màu Sắc: ĐEN TRẮNG\r\n\r\n- Size: 39 - 44\r\n\r\nVui lòng cho phép sai số kích thước nhỏ do sản phẩm được đo đạc bằng phương pháp thủ công, vui lòng đảm bảo kích thước phù hợp với bạn trước khi đặt hàng.', 3),
(17, 'Quần jean dáng form suông rộng KONO ', 147000, 'https://down-vn.img.susercontent.com/file/6bbb5aca7e4caa1e29ed64fa7e6d5123', 'Quần jean dáng form suông rộng KONO , quần bò baggy trơn ống rộng nam dễ phối đồ, chất jean đẹp QJ2\r\n\r\n=> Đây là sản phẩm KONO dành nhiều tâm huyết để tìm kiếm vải chất lượng, form rộng dáng chuẩn để mang sự hài lòng tuyệt đối đến Khách hàng. Bạn hãy yên tâm để trải nghiệm sản phẩm này.\r\n\r\n- CHẤT LƯỢNG: Chất vải jean CHÍNH PHẨM gồm 95% cotton ( thấm hút, vải mềm) và 5% spandex ( độ co dãn).\r\n- CAM KẾT không thua kém bất cứ mẫu nào tầm giá 200-400k của các Brand khác => Đổi trả trong 7 ngày với bất cứ lý do gì.\r\n', 2),
(18, 'Quần Kaki Nam Nữ Ống Suông Basic Unisex ', 119000, 'https://down-vn.img.susercontent.com/file/e2a2b078e1ed0487fdeed12e15c81c88', 'THÔNG TIN SẢN PHẨM\r\n- Form Unisex nên cả nam và nữ đều mặc được ạ\r\n QUẦN CÓ DÂY RÚT BÊN TRONG NÊN THOẢI MÁI VẬN ĐỘNG NHÉ Ạ! \r\n Chất vải: Vải kaki dày dặn, không xù lông, mềm mịn\r\n Mặt vải co dãn nên thoải mái vận động, thấm hút mồ hôi, thoáng mát\r\n- Đường kim mũi chỉ cẩn thận, chắc chắn\r\n- Sản phẩm nhập rất tỉ mỉ, đẹp suất sắc ạ', 2),
(19, 'Nước hoa Unisex Lelabo Another', 75000, 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ll8n3y7woma05d', 'THÔNG TIN SẢN PHẨM\r\nThương hiệu: Le labo\r\nXuất xứ: Mỹ\r\nGiới tính: Unisex (nam & nữ đều dùng được)\r\nNhóm hương: Iso E Super, Long diên hương, Xạ hương\r\nPhong cách: Sang trọng, Tinh tế, Nổi bật\r\n\r\nHương chính: Iso E Super, Amyl salicylate, Cây vông vang, Long Diên Hương, Xạ hương, Quả lê', 4),
(20, 'Nước Hoa Unisex AERU La Forêt Ngọt ngào Xanh mướt, Hương Gỗ thơm ngát - 15ml', 70000, 'https://down-vn.img.susercontent.com/file/sg-11134201-23010-1di6q6wwrulv9c', 'Nước hoa AERU La Forêt - 15ml\r\nThương hiệu: AERU\r\nTựa rừng xanh vào một ngày nắng đẹp. Bóng râm nơi tán lá khiến bạn muốn ngồi lại và tận hưởng sự tĩnh lặng, thư thái của không gian. Nốt hương lá xanh mướt đung đưa, biến chuyển mượt mà sang sự ngọt ngào của hạnh nhân và dừa. Nốt hương vanilla và gỗ tuyết tùng tạo nên sự bất ngờ, mang đến bạn một trải nghiệm hương đặc sắc.\r\n\r\nTHÔNG TIN SẢN PHẨM\r\nNhóm hương: Hương Gỗ Thơm ngát\r\nGiới tính: Unisex\r\nTầng hương\r\n- Hương đầu: Hương Lá Xanh\r\n- Hương giữa: Hạnh nhân, Dừa\r\n- Hương cuối: Vanilla, Gỗ Tuyết Tùng\r\nThời gian bám tỏa: 06 - 07 tiếng\r\n\r\nDung tích: 15ml\r\nThành phần: Alcohol Denat, Parfum (Fragrance), Aqua (Water), Limonene, Coumarin, Geraniol, Linalool\r\n\r\nHƯỚNG DẪN SỬ DỤNG\r\nXịt trực tiếp lên cơ thể hoặc quần áo. \r\nLưu ý:  1. Để xa tầm tay trẻ em. 2. Tránh tiếp xúc trực tiếp vào mắt, chỉ sử dụng ngoài da. 3. Không sử dụng trên vùng da có vết thương. \r\nBảo quản: Nơi khô ráo, tránh ánh nắng trực tiếp. \r\n\r\nHSD: 24 tháng sau khi mở nắp', 4),
(21, 'Dép nam nữ Uniex chữ S cao cấp', 64800, 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmief6x8j9b32f', 'MÔ TẢ SẢN PHẨM:\r\n Dép lê nam quai ngang Full Size họa tiết đep, thời trang, đế nâng chiều cao 5cm, quai da đẹp mê li.\r\n Dép dáng đẹp chất lượng cao, thiết kế đường dạng Thể Thao Thời Trang mắt thú cực kỳ nổi bật, hút người nhìn.\r\n Với đôi dép chất liệu nguyên khối siêu nhẹ này, mỗi bạn trẻ nhất định phải có cho mình ít nhất một đôi, thực sự cực kỳ dễ phối đồ phù hợp với mọi trang phục, đi chơi, đi biển thậm chí hẹn hò người yêu cũng chưa bao giờ là hết hot.\r\n\r\nTHÔNG TIN SẢN PHẨM:\r\n Màu : đa dạng.\r\n Kiểu Dáng: unisex, thể thao.\r\nChất liệu: dép đúc nguyên khối siêu nhẹ, đi nước đi mưa thoải mái, đi làm, đi chơi, đi biển đều đẹp hết ạ.\r\n Size đầy đủ: 38-39-40-41-42.\r\n Hàng bản đẹp full box nên các bạn đừng đánh đồng giá cả với những hàng kém chất lượng khác.\r\n', 4),
(22, 'Dép nam nữ phong cách Hàn Quốc đơn giản', 65000, 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmj08q2lkx5r9b', '+Mô tả sản phẩm cơ bản:\r\n- Chất liệu:EVA\r\n- Màu sắc: Trắng,đen,vàng\r\n- Kích thước: 36 dến 43(size kép)', 4),
(23, 'Dép Quai Ngang Nam Nữ', 69000, 'https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-ll3p7vfnwnns17', 'Dép Quai Ngang Nam Nữ Đúc Nguyên Khối Siêu Nhẹ Êm Chân Kiểu Dáng Thời Trang Lịch Sự Tinh Tế 193-1\r\n\r\n\r\nDép quai ngang nam, nữ đúc nguyên khối siêu nhẹ, êm chân kiểu dáng thời trang là mẫu dép mới nhất được sản xuất với chất liệu hạt nhựa eva siêu nhẹ chống nước\r\ndép thiết kế nguyên khối độ bền cực cao.chịu được mọi thời tiết hay trong các môi trường mưa nắng\r\nKiểu dáng thời trang, hợp phong cách giới trẻ.\r\nDép đem lại cho đôi chân của bạn cảm giác thoải mái, thông thoáng, bởi đế dép được thiết kế theo công nghệ hoàn toàn mới, đế đặc tăng cường độ ma sát, tạo cảm giác êm ái, chắc chắn mỗi khi bạn sải bước. \r\nKiểu dáng thời trang, cá tính mang lại phong cách trẻ trung năng động, đẹp và độc đáo  khi kết hợp với quần jeans, sooc\r\nChất liệu quai bền bỉ đẹp lạ mắt nhưng cũng không kém phần sang trọng, quyến rũ, trẻ trung. Đôi dép sẽ giúp bạn tôn lên vẻ đẹp đôi chân và giúp bạn nổi bật giữa đám đông.\r\nThích hợp với tất cả mọi chuyến du lịch đi chơi, dã ngoại, đi biển …', 4),
(24, 'Dép nam adidas adilatte, dép quai ngang thể thao nam mẫu mới nhất 2023, đế cao su đúc hàng đẹp', 60000, 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lls9vs05irxb0f', 'Dép nam adidas adilatte, dép quai ngang thể thao nam mẫu mới nhất 2023, đế cao su đúc hàng đẹp\r\n\r\nDép lỗi do sản suất, nhầm size, nhầm màu, các lỗi vặt đều được sử lý và đổi trả\r\n\r\n ( 096.383.2000) ( 0989.104.628 ) Call hoặc DALO\r\n\r\n- Chất Liệu cao su cao cấp bền bỉ trong mọi hoàn cảnh môi trường\r\n\r\n- Đế Dép nam adidas làm bằng cao su đúc đi siêu êm chân\r\n\r\n- Hoàn thiện cẩn thận chi tiết sắc nét,keo dán chắc chắn không thừa keo ra ngoài\r\n\r\n- From vừa đi ôm chân, dáng đẹp\r\n\r\n+ CAM KẾT CỦA SHOP Shop Tom Quậy\r\n\r\n- Shop cam kết 100% về chất lượng tốt so với sản phẩm cùng mức giá\r\n\r\n- Shop hỗ trợ đổi trả khi hàng lỗi do nhà sản xuất hoặc không đúng size số trong 7 ngày\r\n\r\n- Mọi vấn đề về sản phẩm các bạn có thể nhắn tin để shop tư vấn và sử lý\r\n\r\nHướng dẫn chọn size Dép nam adidas\r\n              \r\nsize 38: 22-22,5cm\r\nsize 39: 23-23,5cm\r\nsize 40: 24-24,5cm\r\nsize 41: 25-25,5cm\r\nsize 42: 26-26,5cm\r\nsize 43: 27-27,5cm', 4),
(25, 'Thắt Lưng | Dây Nịt nam nữ chất da PU', 55000, 'https://down-vn.img.susercontent.com/file/bda07b936a3d6d6877f6de25ada7faad', 'Thắt lưng nam khóa kim, dây nịt nam đục lỗ sẵn da PU chắc chắn, bền đẹp\r\n\r\nThắt Lưng Nam Cao Cấp Khóa Tự Động Dây Nịt Nam Da PU Chính Hãng Thương Hiệu Baellerry Dây 2 Da May Viền 2 Bên\r\n- Là phụ kiện thời trang không thể thiếu của phái mạnh khi kết hợp trang phục. Chính vì thế, sở hữu một BỘ THẮT LƯNG DA cao cấp dapu hàng hiệu sang trọng và đẳng cấp vô cùng quan trọng với cánh mày râu.\r\n\r\nTHÔNG TIN SẢN PHẨM :\r\n\r\n- Chất liệu dây: 1 da may giấu viền\r\n- Chất liệu mặt: Hợp kim thép không gỉ (**)\r\n- Chiều dài dây: 125 CM\r\n- Chiều dài mặt: 3.4 - 3.6 CM\r\n- Màu sắc dây : đen, nâu\r\n\r\nCông nghệ gia công da: Phủ bóng cực bền\r\n- Chất liệu đầu khóa:  Hợp kim\r\n- Loại đầu khóa: Khóa tự động đúc nguyên khối mạ crom titan sáng bóng\r\n- Màu sắc khóa: Khóa vàng - khóa đen\r\n\r\nKhóa hợp kim cao cấp luôn luôn sáng bóng, thể hiện vẻ sang trọng lịch sự của sản phẩm.\r\n\r\nCHÚ THÍCH :\r\nMặt khóa THẮT LƯNG NAM được làm bằng chất liệu hợp kim thép cao cấp kèm việc được phủ 1 lớp sơn tĩnh điện để đảm bảo luôn sáng đẹp và có khả năng chống hoen, ố, gỉ hoàn toàn. Tất cả đều được thể hiện vô cùng sắc sảo và hoàn hảo.\r\n\r\nDây được thiết kế dài phần đầu khoá quý khách đo vòng bụng thừa chưa đến nấc răng cưa có thể cắt bớt mà không ảnh hưởng đến D Y THẮT LƯNG\r\n\r\nTất cả sản phẩm thắt lưng da nam của shop đều 100% ảnh thật và hàng thật như ảnh ạ  \r\n\r\nNếu khách nhận hàng không ưng vì không như ảnh hay chất lượng kém , khách cứ inbox Shop nhé,  Shop cam kết sẽ nhận lại hàng và hoàn tiền cho khách ạ !\r\n\r\nChuyên bán sỉ lẻ với giá sỉ bóp ví - thắt lưng các loại !  Hàng thời trang cao cấp & siêu bền .\r\n\r\nCAM KẾT SẢN PHẨM ĐĂNG BÁN GIỐNG HÌNH 100%\r\n', 4),
(26, 'Thắt lưng chữ D nam nữ ', 79000, 'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lhpq4f0t9lfl45', 'Thắt lưng da nam nữ bản 2.8cm thắt lưng chữ D mặt dây lưng mạ bạc khắc chữ D thời trang - Dây lưng chữ D\r\n\r\n\r\n\r\nTHÔNG TIN SẢN PHẨM\r\n\r\nTên sản phẩm: Thắt lưng chữ D\r\n\r\nChất liệu: Da PU siêu bền\r\n\r\nKích thước: Dài 105cm x Rộng 2.8cm\r\n\r\nMặt thắt lưng: Chữ D bóng\r\n\r\n\r\n\r\n HƯỚNG DẪN BẢO QUẢN THẮT LƯNG: \r\n\r\n- Luôn giữ thắc lưng ở nơi thoáng mát, tránh ẩm thấp\r\n\r\n- Nếu thắt lưng bị ẩm ướt, bạn dùng khăn khô lau sau đó để khô tự nhiên ở nơi thoáng mát, không nên phơi trực tiếp dưới ánh nắng mặt trời gay gắt sẽ khiến thắt lưng bị bong tróc, nứt dây.\r\n\r\n- Khi sử dụng xong, bạn nên tháo dây thắc lưng ra khỏi quần và luôn treo dây theo hướng thẳng đứng, không gập dây khiến thắt lưng bị cong vẹo, biến dạng.\r\n\r\n\r\n', 4),
(27, 'Thắt lưng nam nữ đơn giản BROO thời trang unisex Hàn Quốc', 89000, 'https://down-vn.img.susercontent.com/file/sg-11134201-22090-0m07lujve4hv81', 'THÔNG TIN SẢN PHẨM:\r\nBản dây: 2.8cm / viền chỉ may chắc chắn 2 bên\r\nChiều dài: 110cm\r\nChất liệu: da pu dày dặn, chất dây mềm mịn, mang dễ chịu\r\nMặt vuông màu bạc\r\nMàu dây: dây lưng màu đen\r\nVới tín đồ của những chiếc dây nịt lưng basic thì đây là một item các cậu không thể bỏ qua, thắt lưng thiết kế đơn giản nên cực dễ phối đồ và mang cùng nhiều trang phục.', 4),
(28, 'Áo khoác Lông cừu Logo hình trái tim ', 320000, 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lo8fpen30djf45', 'Thông Tin Sản Phẩm: Áo khoác Lông cừu Logo hình trái tim ,Áo khoác hoodie Vải lông cừu giữ ấm Thoải mái\r\ncam kết đổi trả free phí ship nếu không ưng\r\nForm rộng Unisex cho cả nam và nữ \r\nHình Shop chụp, đảm bảo mặc lên form đẹp như ảnh\r\n Vải đẹp, không co rút , mềm mịn, mặc siêu ấm\r\nSản phẩm đẹp từng Centimet - chụp tại cửa hàng.\r\nGiao hàng tận nơi - xem hàng trước khi thanh toán .Áo khoác Lông cừu ,Áo khoác hoodie Vải lông cừu giữ ấm Thoải Logo hình trái tim\r\n✅Đổi trả ngay với bất cứ lỗi nào đến từ nhà sản xuất hoặc từ Shop .\r\nI.SHOP CAM KẾT;Áo khoác Lông cừu Logo hình trái tim ,Áo khoác hoodie Vải lông cừu giữ ấm Thoải mái\r\n- Sản phẩm Khoác lót lông cừu chất dù xuất dư xịn đét, form rộng giống mô tả 100%\r\n- Hình ảnh sản phẩm là ảnh thật, các hình hoàn toàn do shop tự thiết kế và chụp.\r\n- Kiểm tra  cẩn thận trước khi gói hàng giao cho Quý Khách Áo khoác Lông cừu ,Áo khoác hoodie Vải lông cừu giữ ấm Thoải Logo hình trái tim\r\n- Hàng có sẵn, giao hàng ngay khi nhận được đơn \r\n- Hoàn tiền nếu sản phẩm không giống với mô tả\r\n- Chấp nhận đổi hàng khi size không vừa trong 3 ngày.Áo khoác Lông cừu ,Áo khoác hoodie Vải lông cừu giữ ấm Thoải Logo hình trái timÁo khoác Lông cừu ,Áo khoác hoodie Vải lông cừu giữ ấm Thoải Logo hình trái tim \r\nII. HỖ TRỢ ĐỔI TRẢ THEO QUY ĐỊNH CỦA SHOPEE Áo khoác Lông cừu Logo hình trái tim ,Áo khoác hoodie Vải lông cừu giữ ấm Thoải mái\r\n- Điều kiện áp dụng (trong vòng 3 ngày kể từ khi nhận sản phẩm) \r\n- Hàng hoá bị rách, in lỗi, bung chỉ, và các lỗi do vận chuyển hoặc do nhà sản xuất.\r\n1. Trường hợp được chấp nhận: - Hàng giao sai size khách đã đặt hàng \r\n- Giao thiếu hàng  Áo khoác Lông cừu ,Áo khoác hoodie Vải lông cừu giữ ấm Thoải Logo hình trái tim2. Trường hợp không đủ điều kiện áp dụng chính sách: Áo khoác Lông cừu ,Áo khoác hoodie Vải lông cừu giữ ấm Thoải Logo hình trái tim\r\n- Quá 2 ngày kể từ khi Quý khách nhận hàng \r\n- Gửi lại hàng không đúng mẫu mã, không phải sản phẩm của Shop\r\n- Không thích, không hợp, đặt nhầm mã, nhầm màu,... Áo khoác Lông cừu ,Áo khoác hoodie Vải lông cừu giữ ấm Thoải Logo hình trái tim\r\n*Đặc Tính:  Chất lông cưu xuất dư nên dày dặn + 1 lớp lót bên trong nên mặc rất ấm.', 1),
(29, 'Áo khoá nỉ ', 320000, 'https://down-vn.img.susercontent.com/file/sg-11134201-22110-i1zpkd52kojv07', 'Áo chất nỉ in 336 ba màu đen,trắng,xám\r\nSản xuất tại: phuongmyt 0989401395\r\nFreesize \r\nnữ nam 40-60 cao 1m67 về mặc được \r\n\r\nCác bạn chú ý đọc Thông tin sp trước khi đặt hàng \r\nShop chỉ chuyển đơn theo đúng phân loại khách chọn trong đơn ..\r\n\r\n\r\nChuyên sỉ lẻ các loại quần áo 4 mùa\r\nGiá tại xưởng không qua trung gian\r\n Mẫu mã đa dạng ,hợp thời trang\r\n Các loại sản phẩm từ chất cotton,citi,lanh,thun....', 1),
(30, 'Áo khoác unisex lót lông cừu Nam nữ', 199000, 'https://down-vn.img.susercontent.com/file/vn-11134211-23030-n91dfnoaceov59', 'Tên sản phẩm : Áo khoác Unisex lót lông cừu xuất dư\r\n\r\n Chất Liệu: chất dù xuất dư\r\n\r\n Màu Sắc:   Đen + Be\r\n\r\n Đặc Tính:  Chất vải áo là dù xuất dư nên dày dặn + 1 lớp lông cừu bên trong nên mặc rất ấm.\r\nĐường may tỉ mỉ tinh tế, túi có dây khóa\r\n\r\nKiểu dáng rộng vừa thoải mái khi mặc, đơn giản dễ phối đồ\r\n\r\nThích hợp cho đi chống nắng, hoặc thu đông, tránh gió\r\n\r\nThích hợp cho cả nam, nữ, mọi lứa tuổi\r\n\r\n\r\n\r\nHướng dẫn chọn size:\r\n\r\n- XS (<20KG)\r\n\r\n- S (30-38Kg, <1m55)\r\n\r\n- M (39-50Kg, <1m65)\r\n\r\n- L (51-61Kg, <1m72)\r\n\r\n- XL (61-75Kg, <1m78)\r\n\r\n\r\n\r\náo bên mình form khá chuẩn và áo to nên các bạn lấy đúng size nha, đừng lấy lên size sẽ bị rộng đó ạ.\r\n\r\nLưu ý: Áo bên mình form khá to, các bạn có thể nhắn tin cho bên mình để được tư vấn size ạ. \r\n\r\nBảng size chỉ mang tính chất tham khảo vì cón tùy thuộc vào cơ địa của mỗi bạn ạ\r\n\r\n Bảng size mang tính chất tham khảo bạn có thể lấy size to hơn hoặc nhỏ theo yêu cầu của bạn!', 1),
(31, 'Áo khoác nữ kẻ ziczac phối da in chữ N Phong cách', 129000, 'https://down-vn.img.susercontent.com/file/sg-11134201-22100-g6wz9j9o15iv16', 'Áo khoác nữ kẻ ziczac phối da in chữ N Phong cách ulzzang chất dạ tweed dày dặn form rộng UNISEX cá tính hàn quốc\r\n\r\nTHÔNG TIN SẢN PHẨM:\r\n- Chât liệu:dạ tweed\r\n- Màu sắc: Đen phối trắng\r\n- Kích thước: S M L\r\n- Xuất xứ: Việt Nam\r\n Form dáng chuẩn mẫu, thiết kế trẻ trung cá tính, năng động, chuẩn style hàn quốc, áo cả nam nữ đều mặc được luôn nha\r\n\r\n\r\nÁo khoác nữ kẻ ziczac phối da in chữ N Phong cách ulzzang chất dạ tweed dày dặn form rộng UNISEX cá tính hàn quốc\r\nHƯỚNG DẪN CÁCH ĐẶT HÀNG:\r\n- Cách đặt hàng: Nếu bạn muốn mua 2 sản phẩm khác nhau hoặc 2 size khác nhau, để được freeship\r\n- Bạn chọn từng sản phẩm rồi thêm vào giỏ hàng\r\n- Khi giỏ hàng đã có đầy đủ các sản phẩm cần mua, bạn mới tiến hành ấn nút “ Thanh toán”\r\n- Shop luôn sẵn sàng trả lời inbox để tư vấn.\r\n', 1),
(32, 'Áo khoác nỉ dây kéo unisex form rộng', 119000, 'https://down-vn.img.susercontent.com/file/d28126530a4fcd245b43a3132fea47f4', 'ÁO KHOÁC NỈ DÂY KÉO FORM RỘNG -  MẠNH MẼ & CÁ TÍNH\r\n• Được may bằng nỉ chần bông dày đẹp, co giãn thoải mái.\r\n• Nam nữ mix đều Ngầu, mix cặp, mix nhóm càng thêm phong cách.\r\n• Size áo : <70KG\r\nMÔ TẢ SẢN PHẨM : \r\n• Chất liệu: Vải thun Nỉ, trong có lót lông. Chất liệu nỉ ngoại CAO CẤP .\r\n• Độ bền màu cao, giúp form áo luôn ổn định. (không như các áo thun chợ, chỉ giặt vài lần là bị chảy xệ, vặn vẹo, biến dạng)\r\n• Đường may chắc chắn chuẩn đẹp.\r\n• Sản phẩm thích hợp cho những bạn trẻ ưa thích vận động, tham gia thể thao, hoạt động ngoài trời,...\r\n• Dễ dàng phối đồ,mặc được trong nhiều dịp khác nhau.\r\nKÍCH THƯỚC : FREESIZE <70KG\r\nHƯỚNG DẪN BẢO QUẢN\r\nGiặt áo:\r\n* Lần đầu tiên giặt nên giặt tay và ngâm trong nước ấm để tiệt khuẩn.\r\n* Giặt riêng áo sáng màu và tối màu.\r\n* Không nên giặt áo trong nước nóng quá 40 độ\r\n* Nên giặt bằng tay để sử dụng áo được lâu hơn', 1),
(33, 'Áo khoác phao nam-nữ ', 697500, 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lm76cglibkdbb1', 'Áo khoác phao nam-nữ mặc đôi mẫu mới phom rộng chùm Mông SẴN HÀNG  MENFASHION 1989 MJK 033️\r\n\r\nHÀNG SẴN TẠI SHOP GIAO LUÔN CHO VẬN CHUYỂN \r\nCAM KẾT GIAO ĐÚNG HÀNG ĐÚNG MẪU KHÁCH HÀNG ĐẶT  \r\n\r\nCAM KẾT HÀNG CHUẨN Y HÌNH CÓ HAY KHÔNG CÓ ẢNH THẬT(màu sắc có thể lệch 1 chút do ánh sáng góc chụp)\r\nĐỔI TRẢ HÀNG THOẢI MÁI SAU 15 NGÀY NHẬN ĐƯỢC HÀNG (KHÔNG ƯNG-KHÔNG HÀI LÒNG-KHÔNG VỪA KHI SẢN PHẨM CÒN NGUYÊN CHƯA SỬ DỤNG)\r\nXUẤT XỨ TRUNG QUỐC  \r\nCHỊU TRÁCH NHIỆM NHẬP KHẨU:DOBAUQUANGCHAUCAOCAP ', 1),
(34, 'Quần jean nam nữ baggy ống suông rộng', 290000, 'https://down-vn.img.susercontent.com/file/c758d953b4833ba8c01554bea3b657f3', 'Quần jean nam nữ Baggy from suông rộng,quần bò nữ ống rộng hottrend hàn quốc 2022\r\nThông Tin Sản Phẩm:\r\n- Xuất xứ : Việt Nam\r\n\r\n- Kiểu Dáng: quần jean baggy dành cho nam\r\n\r\n- Mầu sắc; ĐEN full  + Xanh + Xám khói\r\n\r\n- Chất liệu:  jean cao cấp, ko phai màu\r\n\r\n- Số lượng : hàng đủ size \r\n\r\n- gồm có đủ  size: từ size S-M-L', 2),
(35, 'QUẦN SHORT JEAN RÁCH', 320000, 'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lgrib1qxrsabf4', 'Đây là một trong những chiếc quần jean hot nhất hiện nay đáng để sở hữu. Phong cách Hàn Quốc đơn giản phù hợp trong mọi hoàn cảnh và đối tượng gặp gỡ. Quần có màu xanh bắt mắt, thể hiện sự trẻ trung và lịch lãm.\r\n Các mẫu jean mang vẻ đẹp tính tế và hiện đại\r\n\r\nQUẦN  SHORT JEANS \r\n- Có phải bạn đang muốn tìm cho mình một chiếc quần short jean  cao cấp mang style hàn quốc? \r\nMay mắn là bạn đã tìm thấy chúng tôi.\r\n- Chiếc quần jean  dành cho  nam này cửa hàng chúng tôi bán khoảng nghìn chiếc mỗi tháng.\r\nĐã bán chục nghìn chiếc chỉ tính riêng trên hệ thống của Shopee Việt Nam, chưa kể đến những kênh bán khác!\r\n-  Bạn cũng sẽ là một trong số những người sẽ sở hữu chiếc quần jean  mang phong cách hàn quốc này.\r\nBởi vì đây là một chiếc quần jean mà cực kỳ dễ phối đồ từ áo thun, hoodie, áo khoác..cho đến các loại sneakers\r\n\r\n TẠI SAO NÊN CHỌN MUA QUẦN JEANS \r\n- CHẤT LƯỢNG: Chất vải jean CHÍNH PHẨM gồm 95% cotton ( thấm hút, vải mềm) và 5% spandex ( độ co dãn).\r\n- GIÁ CẢ : Chúng tôi trực tiếp sản xuất với số lượng lớn. Nên so với các quần cùng chất lượng giá cả của chiếc quần jean baggy thì giá tốt nhất cho bạn hiện tại.\r\n\r\n Thông Tin Sản Phẩm:\r\n- Kiểu Dáng: quần jean short\r\n- Mầu Sắc: Xanh\r\n- Chất liệu:  jean cao cấp, ko phai mầu\r\n- Số lượng : hàng đủ size , xuất khẩu', 2),
(36, 'quần jean nam thời trang retro ', 55000, 'https://down-vn.img.susercontent.com/file/6023c1059f2c970830c4a5c0676b3402', 'Trong trường hợp bình thường, bạn sẽ nhận được hàng trong vòng 7-9 ngày.\r\n\r\nMàu sắc: Xanh lam\r\n\r\nKích thước: M-3XL\r\n\r\nChất liệu: Denim\r\n\r\nĐộ dày: Bình thường\r\n\r\nPhong cách: rộng\r\n\r\nĐặc điểm sản phẩm: đơn giản, thời trang, rộng rãi, thoải mái, giản dị, đa năng, trung tính, cá nhân\r\n\r\nBảng kích thước chỉ mang tính chất tham khảo, vui lòng tham khảo dịch vụ khách hàng để biết kích thước cụ thể.', 2),
(37, 'QUẦN BAGGY JEANS ĐEN', 99000, 'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lizgepxiwzwy85', 'QUẦN BAGGY JEANS\r\nChất liệu: Jeans\r\nFull size: S M L XL\r\n\r\nSỐ ĐO\r\n-size S từ 45kg-50kg\r\n-size M từ 46kg-55kg\r\n-size L từ 56kg-65kg\r\n-size XL từ 66kg-75kg', 2),
(38, 'Quần ống Rộng Dhclothes Unisex', 109500, 'https://down-vn.img.susercontent.com/file/25813399328bde7badc531c8f3bd33d7', 'Quần ống Rộng Unisex nam nữ Kaki cao cấp\r\nChất vải kaki mềm cao cấp\r\n CÁCH CHỌN SIZE\r\nSize S  (Từ 40 - 47kg Cao Dưới 1m65)\r\nSize M  (Từ 48 - 55kg Cao Dưới 1m65)\r\nSize L  (Từ 55 - 65kg Cao Dưới 1m70) \r\nSize XL  ( Từ 65- 70kg Cao Dưới 1m79) \r\nSize XXL  (Từ 70 - 85kg Cao Dưới 1m80)  \r\n', 2),
(39, 'Giày sneaker Air Force 1 ', 135000, 'https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-lm40f8zqqo6789', ' Thông tin sản phẩm:\r\n Chất lượng tốt nhất trong tầm giá\r\n Form đẹp chuẩn :  Màu sắc giống đến 98 °/ₒ ; \r\n  Chất liệu da  + da lộn + vải mesh \r\n  Logo Mông in dập chìm.\r\n Lưỡi gà cao dày dặn; swoosh sắc nét; Mông mũi làm đẹp\r\n Tem QR CODE Có thể check mã 2D\r\n  Đế 2 lớp khâu chỉ đều\r\n  Full box + accessories\r\n  Mẫu này bạn mang đúng hoặc up 1 size đối với chân bè\r\n\r\n Cam kết với khách hàng về sản phẩm:\r\n Sản phẩm 100% giống với mô tả.\r\n Giao hàng đúng size, lỗi 1 đổi 1.\r\n Giao hàng trên toàn quốc theo hình thức COD, ví Airpay, internet banking,..', 3),
(40, 'GIÀY BLAZE JUST DO IT CAO CẤP', 558000, 'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lhfuo9l77uklf0', 'HÀNG CÓ SẴN+ ẢNH THẬT\r\nCÁC ĐƠN HÀNG TRƯỚC KHI GỬI ĐỀU ĐƯỢC KIỂM TRA CẨN THẬN TRÁNH TÍNH TRẠNG LỖI VÀ THÊM CẢ BOX BẢO VỆ CHỐNG NÁT HỘP LÊN CÁC CẬU CỨ YÊN TÂM \r\n MÔ TẢ SẢN PHẨM: BẢN ĐẸP XUẤT SẮC KHÁC BIỆT HOÀN TOÀN HÀNG TRÊN THỊ TRƯỜNG\r\nFullisze 36-43\r\nMẫu giày sneaker Hot trend nhất hiện nay \r\nTất cả các mẫu đều là ảnh thật, sản phẩm nhập tận gốc không qua trung gian nên giá sẽ rẻ hơn so với thị trường \r\nMọi thắc mắc xin liên hệ 0989509326 ( Lưu ý khi gọi bảo : đây có phải shop kiwi sneaker không nhỉ? để nhân viên hỗ trợ chính xác nhất)\r\nChúc mọi người mua hàng vui vẻ. Cảm ơn vì đã tin tưởng và ủng hộ MINH KHOA SNEAKER', 3),
(41, 'Giày sneaker AF1', 134000, 'https://down-vn.img.susercontent.com/file/6bc60cdde018bb9d635b849f0d294a06', 'Đến với Shop bạn hoàn toàn có thể yên tâm hàng đảm bảo chất lượng, tốt nhất trong tầm giá.( không có hàng lỗi, hàng thứ cấp )\r\n Chất liệu: Giày được làm từ Vải sợi thoáng khí bền đẹp theo thời gian\r\nĐế giày được làm bằng chất liệu cao su đúc nguyên khối chắc chắn có khắc họa tiết để tăng độ ma sát, chống trơn trượt.\r\n Màu sắc: \r\n Size: 39-43 \r\n ĐẶC ĐIỂM SẢN PHẨM\r\n Giày dễ phối đồ thích hợp cho các hoạt động đi lại hàng ngày, chạy bộ\r\n Mũi Giày tròn, đế cao su tổng hợp, xẻ rãnh tạo cảm giác thoải mái khi đi\r\n Thích hợp với các mùa trong năm: Xuân - Hè - Thu - Đông\r\n HƯỚNG DẪN BẢO QUẢN\r\n Để giày ở nơi khô ráo thoáng mát để giữ giày được bền đẹp hơn\r\n Vệ sinh giày, dùng khăn hay bàn trải lông mềm để chải sạch giày cùng với nước tẩy rửa giày chuyên dụng với da hay da Pu\r\n Có thể giặt giày cùng với chất tẩy rửa nhẹ\r\n KHUYẾN CÁO\r\n Không dùng hóa chất hay bột giặt có hoạt tính tẩy rửa mạnh\r\n Không dùng bàn chải cứng để vệ sinh giày sẽ làm hư \r\n Không đi mưa ngâm nước lâu, không phơi giày trực tiếp dưới ngoài trời nắng gắt\r\nShop cam kết:\r\n Sản phẩm chuẩn 100% như hình \r\n✔ Giao hàng trên toàn quốc\r\n✔ Đổi size nếu không vừa, thời gian trong 7 ngày.', 3),
(42, 'Giày MLB Chunky Liner New York Yankees White Black', 285000, 'https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-llz7h3mygzq7e8', 'Giày MLB Chunky Liner New York Yankees White Black, Giày Sneaker MLB Chunky NY Đen Hàng Chuẩn\r\n\r\nMÔ TẢ SẢN PHẨM:\r\n- SIZE: 36-44\r\n- Đế : Đế 2 lớp làm bằng chất liệu cao su cao cấp \r\n- Chiều cao đế: Giày có chiều cao 4-5cm\r\n- Lót giày thể thao: Lót dày dặn và mềm mại tại cảm giác êm ái khi vận động bảo vệ đôi bàn chân thoải mái\r\n- Giày  ??? dễ phối đồ thích hợp cho các hoạt động đi lại hàng ngày, chạy bộ\r\n- Mũi giay the thao tròn, đế cao su tổng hợp, xẻ rãnh tạo cảm giác thoải mái khi đi\r\n- Giày  ??? Thích hợp với các mùa trong năm: Xuân - Hè - Thu - Đông\r\n\r\n HƯỚNG DẪN BẢO QUẢN:\r\n- Để giày ở nơi khô ráo thoáng mát để giữ giày được bền đẹp hơn\r\n- Vệ sinh giày, dùng khăn hay bàn trải lông mềm để chải sạch giày cùng với nước tẩy rửa giày chuyên dụng với da hay da Pu\r\n- Giày Nam Có thể giặt giày cùng với chất tẩy rửa nhẹ\r\n\r\n KHUYẾN CÁO:\r\n- Không dùng hóa chất hay bột giặt có hoạt tính tẩy rửa mạnh đối với giày thể thao\r\n- Không dùng bàn chải cứng để vệ sinh giày sẽ làm hư \r\n- Không đi mưa ngâm nước lâu, không phơi giày trực tiếp dưới ngoài trời nắng gắt', 3),
(43, 'Giày converse cổ cao 1970s nam nữ', 155000, 'https://down-vn.img.susercontent.com/file/90f649543590c20ca20088b7f454d095', 'Thông Tin Sản Phẩm\r\nGiầy CV Classic 1970s Cổ Cao 1:1 [ Full Box + Tag ] Cao Cấp - Snerker Converse Nam Nữ\r\n- được thiết kế từ chất liệu vải canvas nhẹ, dày dặn, cứng form hơn. Là dòng giày tiêu biểu và đặc trưng cho phong cách cổ điển của Converse. Lớp lót dày tạo cảm giác êm ái khi vận động, vải dày dặn, cứng form hơn. Phần đế màu trắng ngà vintage được phủ 1 lớp bóng bên ngoài là điểm nhấn riêng cho dòng 1970s, dễ vệ sinh hơn. Dây giày dày hơn, cùng màu với phần đế, tem gót đen 1st-tring - đặc trưng riêng của dòng 1970s. Giày Converse 1970s là biểu tượng của văn hóa thể thao và các loại hình nghệ thuật đường phố kiểu Mỹ, truyền cảm hứng và sức sáng tạo mạnh mẽ đến giới trẻ trên toàn thế giới. Với đôi giày này bạn có thể chọn quần jeans với áo pull đơn giản. Bạn mix theo kiểu tone xuyệt tone để mang tới sự hài hòa trong phong cách.\r\nĐặc Điểm Sản Phẩm\r\n- Thiết kế mới, tinh tế hơn\r\n- Chất liệu vải nhẹ, dày dặn, cao cấp, dễ dàng phối với quần áo\r\n- Biểu tượng của văn hóa thể thao, nghệ thuật đường phố kiểu Mỹ\r\n- Lớp lót dày tạo cảm giác êm ái khi vận động, vải dày dặn, cứng form hơn.\r\n- Phần đế màu trắng ngà vintage được phủ 1 lớp bóng bên ngoài là điểm nhấn riêng\r\nHướng Dẫn Bảo Quản Giày\r\n- Bảo quản nơi khô thoáng\r\n- Tránh ngâm nước quá lâu\r\n- Không sử dụng nước tẩy hoặc bột giặt có nhiều chất tẩy\r\n- Sử dụng loại xi phù hợp với màu sắc, chất liệu da\r\n- Không phơi sản phẩm trực tiếp dưới ánh sáng mặt trời', 3),
(44, 'Dép ADILETTE ', 44500, 'https://down-vn.img.susercontent.com/file/vn-11134201-7qukw-ljz4bxdzw3r6f3', 'Tình trạng: mới 100% \r\n\r\nNhững sản phẩm của shop đều chính tự tay chụp nên hình sao hàng vậy \r\n\r\nTất cả hàng giày dép của shop đều có hàng sẵn, nếu các anh chị đặt hàng thì tầm 1 -2 ngày sẽ nhận được ạ \r\n\r\nKhi mua giày được tặng kèm bill nhà sản xuất + hộp và hàng có logo đầy đủ, tem mác đầy đủ \r\n\r\nSIZE: 36-43 ', 4),
(45, 'Dép Jordan 3 Nam Nữ', 139000, 'https://down-vn.img.susercontent.com/file/a41bcbebc0f049e4210650d5affc74fe', 'Dép Jordan 3 Nam Nữ - logo trắng\r\nTHÔNG TIN SẢN PHẨM\r\nDép full box +  - CAM KẾT 100% ảnh thật tự shop chụp!\r\nChất liệu: -Đế cao su mềm êm chân, siêu nhẹ, siêu êm\r\nMẫu dép thiết kế đơn giản hợp thời trang giới trẻ\r\nPhối đồ dễ dàng với nhiều trang phục khác nhau\r\nMang đi học đi chơi  hay đi du lịch đều hợp\r\n', 4),
(46, 'Dép quai ngang nam, nữ', 59000, 'https://down-vn.img.susercontent.com/file/vn-11134201-7qukw-lequqovnyoj741', 'Điểm nổi bật của sản phẩm là kiểu dáng trẻ trung, năng động. Sản phẩm thiết kế với kiểu quai truyền thống phù hợp với nhiều lứa tuổi từ học sinh, sinh viên và người đi làm. Không những thế sản phẩm còn phù hợp với nhiều trang phục như quần vải, jean bò, sooc…\r\n\r\nKhi thời tiết nóng lên bạn chỉ muốn xỏ chân ngay vào đôi dép thông thoáng, mát mẻ với quai mảnh đơn giản. Còn với những ngày mưa gió thì đây chính là “sản phẩm lựa chọn hàng đầu” giúp đôi chân luôn khô, hạn chế thấp nhất sự ẩm ướt khó chịu cho đôi chân.\r\n\r\nTùy theo sở thích và gu ăn mặc của bạn có thể kết hợp dép với quần short kaki với áo sơ mi, hay áo thun tạo nên chất riêng của mình. Dép đế đúc nguyên khối chống mài mòn trơn trượt. Kiểu dáng trẻ trung năng động, hợp thời trang.\r\n\r\nĐi cực êm ái, kết hợp được rất nhiều loại quần áo. Chất liệu cao cấp tạo sự thoải mái khi sử dụng.\r\n\r\nĐế cao 2cm đi cực đầm chân\r\n\r\nDễ phối cùng nhiều kiểu trang phục khác nhau.\r\n\r\nMẫu mã trẻ trung, phù hợp xu hướng 2023\r\n\r\nMàu sắc: Cá tính, họa tiết bắt mắt', 4),
(47, 'Dép đúc siêu nhẹ', 59000, 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lorkjooyz3t725', 'Shop có bỏ sỉ SLL cái bạn liên hệ zalo : 0964994260 (aloshop)\r\nDÉP Đúc Nam-Nữ\r\nCó Size cho Nam và Nữ\r\nChất liệu cao su đúc nguyên khối đi cực kỳ bền,nhẹ chân \r\nHình in sắc nét, không bong, không trầy xước\r\n \r\nSize : 35-36 chân dài từ 22-23 cm\r\n          37-38 chân dài từ 23,5-24 cm\r\n          39-40 chân dài từ 24,5-25 cm \r\n          40-41 chân dài từ 25,5-26 cm \r\n          42 chân dài từ 26 -26.5 cm', 4),
(48, 'Dép quai ngang nữ, nhiều màu họa tiết', 221200, 'https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-ll8ufr7mwnuw3f', 'Tên sản phẩm: PUMA LEATCAT\r\nSize: 36-39 nữ, phù hợp cho mọi dáng chân và luôn tạo phong cách mới.\r\nPhần đế cao: Lên đến 3cm, mang đến cảm giác tự tin và thời trang.\r\nPhối Đồ Và Phong Cách Cá Tính\r\n\r\nDép quai ngang: Dễ dàng phối đồ với quần jean, quần short, thậm chí đồ thể thao và áo thun.\r\nThích hợp cho mọi hoạt động: Đi học, đi chơi hay chỉ đơn giản là ở trong nhà, đôi dép này đều mang đến vẻ đẹp và dễ dàng phối đồ.\r\nCam Kết Chất Lượng Và Dịch Vụ Tận Tâm\r\n\r\nĐộ bền và chuẩn mô tả: Dép y hình và đúng mô tả, mang đến sự tin tưởng tuyệt đối về chất lượng.\r\nSẵn hàng và giao nhanh: Đảm bảo sẽ có hàng ngay và giao hàng nhanh chóng.\r\nChính xác màu sắc và size: Tận tâm đảm bảo giao đúng màu, đúng size và số lượng.\r\nThông Tin Vật Liệu Chi Tiết\r\n\r\nĐế:\r\n\r\nEVA cao cấp: Bảo vệ môi trường, êm ái và đàn hồi tốt.\r\nKhông biến dạng: Độ bền cao, chống nắng và nước, sử dụng suốt năm.\r\nQuai:\r\nSimili bền: Chống nước, chịu thời tiết tốt, lót mút êm ái.\r\nKeo:\r\nĐộ bền vượt trội: Keo dán chắc chắn, kết dính tốt.\r\nCảm giác mang: Dép nhẹ, ôm chân, đế mềm mại và chống trượt.\r\nSự Linh Hoạt Trong Phong Cách\r\n\r\nPhối đồ đa dạng: Dép thích hợp với nhiều loại trang phục, từ áo thun đến quần jean.\r\nHoàn hảo cho nhiều hoàn cảnh: Đi học, tham gia hoạt động thể thao hoặc dạo chơi cùng bạn bè.\r\nTiết kiệm thời gian: Đôi dép quai ngang nhanh chóng và dễ dàng phối cùng mọi loại trang phục.\r\nTrải Nghiệm Đóng Gói Chất Lượng\r\n\r\nĐóng gói cẩn thận: Sản phẩm được bọc giấy bên ngoài và đặt trong hộp giấy chắc chắn.\r\nQuy trình đổi trả thuận tiện: Hãy quay video khi mở hộp để đảm bảo quyền lợi của bạn trong quá trình đổi trả.\r\nCách Chọn Size Đơn Giản\r\n\r\nSize chuẩn đúng kích thước: Thông tin size chuẩn bên dưới để bạn lựa chọn.\r\nTư vấn tận tâm: Nhắn tin cho shop để được tư vấn nhiệt tình.\r\nSản Xuất và Phân Phối Bởi MOOVER STORE\r\n', 4),
(49, 'quần baggy jeans unisex form suông', 190000, 'https://down-vn.img.susercontent.com/file/sg-11134201-22120-jr76aqn4wglv69', '(Bảng size mang tính chất tham khảo và phù hợp 80-90% sở thích các cậu ạ. Các bạn muốn chọn size phù hợp có thể xem hình feedback các khách đã mua hoặc inbox cho THANH KS nhé ^^)\r\n-size M; 40kg đến 55kg\r\n-Size L: từ 56kg đến 65kg\r\n-Size XL: từ 66kg đến 75kg\r\n  Ngập tràn mẫu mới \r\nrộng Unisex cho cả nam và nữ ', 2),
(50, 'Giày thể thao nữ quai dán phong cách thời', 139000, 'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lkddj3ah8eco73', '1. Thông tin sản phẩm\r\n+ Màu sắc: Trắng,Kem,Đen...vvv\r\n+ Chấtt liệu: Da tổng hợp, Đế Cao Su..vvv\r\n+ Phong Cách : Thời Trang,\r\n+ Xu Hướng : Mới\r\n2. Bang kich thuöc\r\n+ Size 35 : Chiều dài bàn chân khoang 22.0CM - 22.5CM\r\n+ Size 36 : Chiều dài bàn chân khoang 22.6CM - 23.0CM\r\n+ Size 37 : Chiều dài bàn chân khoang 23.1CM - 23.5CM\r\n+ Size 38 : Chiều dài bàn chân khoäng 23.6CM - 24.0CM\r\n+ Size 39 : Chiều dài bàn chân khoäng 24.0CM - 24.5CM\r\n+ Size 40 : Chiều dài bàn chân khoang 24.5CM - 25.0CM\r\n\r\n3. Thông tin cánh bão\r\n+ Với tất cả các sản phẩm giày dép -> Tránh giặt với các hòa chất tẩy mạnh', 3),
(51, 'Áo Sơ Mi Nam Vải Cotton', 129000, 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-llsx9e8abw7zc5', '  Sơ Mi Nam dài tay dáng ôm body , chống nhăn cao cấp  chính là gợi ý tuyệt vời cho nam giới mỗi khi lựa chọn trang phục mỗi ngày. \r\nVới những mẫu áo sơ mi nam thiết kế đơn giản và toát lên vẻ lịch lãm tinh tế, mang đến phong cách thời trang trẻ trung, năng động chắc chắn sẽ là lựa chọn hoàn hảo cho chàng trai hiện đại, nam tính. \r\nNhững chiếc áo sơ mi dài tay dáng ôm body Hàn Quốc , chống nhăn cao cấp  dù kết hợp với quần âu, quần jeans khi đi làm hay diện cùng quần ngố, quần short đi chơi đều NỔI BẬT, THOẢI MÁI và PHONG CÁCH. \r\nVới form dáng vừa vặn các chàng có thể tự tin khoe body cực chuẩn của mình. Hãy bổ sung ngay vào tủ đồ item này để diện thật chất nhé!\r\n  2. THÔNG TIN CHI TIẾT\r\n\r\n+ Chất liệu: 100% chất đũi, thấm hút mồ hôi \r\n+ Chất vải sờ mịn không bai, không nhăn, không xù\r\n+ Quy cách, tiêu chuẩn đường may tinh tế, tỉ mỉ trong từng chi tiết\r\n+ Kiểu dáng: Thiết kế đơn giản, dễ mặc, dễ phối đồ\r\n+ Form body Hàn Quốc mang lại phong cách trẻ trung, lịch lãm\r\n+ Chất lượng sản phẩm tốt, giá cả hợp lý', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE `donhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
