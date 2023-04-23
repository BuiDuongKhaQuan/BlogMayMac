/*
 Navicat Premium Data Transfer

 Source Server         : forum
 Source Server Type    : MySQL
 Source Server Version : 100427
 Source Host           : localhost:3306
 Source Schema         : forum

 Target Server Type    : MySQL
 Target Server Version : 100427
 File Encoding         : 65001

 Date: 23/04/2023 15:55:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `role` int NULL DEFAULT NULL,
  `id_fb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, 'quan', 'Innisfree', '111@gmail.com', '96e79218965eb72c92a549dd5a330112', 1, 0, NULL);
INSERT INTO `account` VALUES (2, 'quan1', 'ABC', '111@gmail.com', '96e79218965eb72c92a549dd5a330112', 1, 0, NULL);
INSERT INTO `account` VALUES (3, 'kha', 'kha quan', '111@gmail.com', '96e79218965eb72c92a549dd5a330112', 1, 0, NULL);
INSERT INTO `account` VALUES (5, 'teo', 'huy', '20130281@st.hcmuaf.edu.vn', '202cb962ac59075b964b07152d234b70', 1, 0, NULL);
INSERT INTO `account` VALUES (6, 'si', 's', 's@gmail.com', '202cb962ac59075b964b07152d234b70', 1, 0, NULL);

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `CateName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NULL DEFAULT NULL,
  `postId` int NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `cmtDate` datetime NULL DEFAULT current_timestamp,
  `status` bit(1) NULL DEFAULT NULL,
  `parentId` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12313 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1401, 5, 1, '123', '2023-04-19 09:52:22', b'1', 4568);
INSERT INTO `comment` VALUES (4568, 5, 1, 'cám ơn bạn đã chia sẻ', '2023-04-14 00:00:00', b'1', NULL);
INSERT INTO `comment` VALUES (5444, 5, 1, '123', '2023-04-19 09:52:22', b'1', 4568);
INSERT INTO `comment` VALUES (8353, 5, 1, 'fffffffffff', '2023-04-19 11:03:31', b'1', NULL);
INSERT INTO `comment` VALUES (8728, 5, 1, 'huy', '2023-04-19 09:51:56', b'1', 4568);
INSERT INTO `comment` VALUES (9345, 5, 1, 'huy', '2023-04-19 09:52:05', b'1', NULL);

-- ----------------------------
-- Table structure for new
-- ----------------------------
DROP TABLE IF EXISTS `new`;
CREATE TABLE `new`  (
  `idnew` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `time` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idnew`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of new
-- ----------------------------
INSERT INTO `new` VALUES (0, 'Kỹ Thuật May Khẩu Trang Vải Kháng Khuẩn Theo Quyết Định số 870/QĐ-BYT 2020 – Bộ Y Tế', 'May vá', '9/9/2022', 'Quyết Định Số 870/QĐ-BYT là gì?\r\nQuyết định số 870/QĐ-BYT được phát hành vào ngày 12 tháng 3 năm 2020 của Bộ trưởng Bộ Y tế là thông tin hướng dẫn chi tiết được sử dụng tạm thời trong bối cảnh dịch bệnh Covid-19 tăng cao độ biến. Thông tư bao gồm các quy ', NULL, '12.jpg');
INSERT INTO `new` VALUES (1, 'Cách tổ chức bữa tiệc theo chủ đề may vá tuyệt đỉnh', 'May vá', '24/03/2023', 'Hãy đối mặt với nó, các bữa tiệc thường vui hơn với một chủ đề. Vậy tại sao không ghép nối sở thích yêu thích của bạn với những người bạn yêu thích và tổ chức một lễ kỷ niệm đáng nhớ?', 'https://www.threadsmagazine.com/2023/01/12/how-to-throw-the-ultimate-sewing-themed-party', '1.jpg');
INSERT INTO `new` VALUES (2, 'Hoàn tất cho các đường may lộ ra ngoài và vải bị sờn', 'May vá', '2/2/2023', 'Trong khi tôi đang mua sắm các ý tưởng tại cửa hàng Thủ công và Vải Joann ở địa phương, bộ phận vải đã gọi cho tôi. Tôi đi dạo và phát hiện ra một loại vải có kiểu dệt xương cá. Khoảng sân màu nâu và đen khác với bất cứ thứ gì tôi từng thấy ở đó. Tôi lướt', NULL, '2.jpg');
INSERT INTO `new` VALUES (3, 'Tìm Hiểu Về May Mặc Dễ Dàng', 'May vá', '1/2/2023', 'Khi làm việc với khách hàng về trang phục cá nhân, tôi thường hỏi họ nghĩ họ nên mặc mẫu cỡ nào. Thông thường, họ chọn kích thước tương ứng với diện tích lớn nhất trên cơ thể. Họ tin rằng điều này đảm bảo vừa vặn vì mọi bộ phận của họ đều có thể vừa vặn v', NULL, '3.jpg');
INSERT INTO `new` VALUES (4, 'Tạo một chiếc Blazer đan bóng loáng với các kỹ thuật được nâng cấp', 'Thời trang', '4/1/2023', 'Có rất nhiều lợi ích đối với áo khoác đan len—nó là món đồ chính trong tủ quần áo thực sự. Hãy cân nhắc: Thoải mái khi mặc, dễ chăm sóc, chuyên nghiệp nhưng không ngột ngạt, thuận tiện khi đi công tác và, bằng nhiều loại vải, là trang phục bạn có thể mặc ', NULL, '4.jpg');
INSERT INTO `new` VALUES (5, 'Làm tròn mẫu: Váy và váy có viền bong bóng', 'Thời trang', '5/3/2023', 'Những gì cũ là mới một lần nữa. Cuối những năm 1950 chứng kiến ​​rất nhiều đường viền bong bóng trong trang phục vũ hội và trang phục dạ hội. Vào thời điểm tôi đã sẵn sàng cho buổi vũ hội vào những năm 1980, họ lại quay trở lại. Và chúng ta đang chứng kiế', NULL, '5.jpg');
INSERT INTO `new` VALUES (6, 'Làm tròn mẫu: Mặc quần áo hai mảnh', 'Thời trang ', '2/3/2023', 'Khi các kiểu dáng mùa xuân ra mắt, tôi không thể không chú ý đến một số mẫu đồ hai mảnh tuyệt đẹp, nhiều mẫu trong số đó có kích thước mở rộng. Với việc phát hành các mẫu KnowMe và với kích thước mở rộng trong các dòng lò xo mới, McCall\'s sẽ giết chết kiể', NULL, '6.jpg');
INSERT INTO `new` VALUES (7, 'Dự báo thời trang cho mùa xuân 2023', 'Thời trang', '21/1/2023', 'Nó luôn là một dấu hiệu tốt cho thời trang khi có nhiều thứ để hấp thụ. Mùa xuân năm 2023 mở ra một loạt các lựa chọn phong cách mới. Chúng ta đã thực sự thoát khỏi những trang phục mặc trong nhà và những thứ cơ bản, và giờ là lúc dành cho thời trang vui ', NULL, '7.jpg');
INSERT INTO `new` VALUES (8, 'What Sadie\'s Stitch: Tôn tạo một bộ lễ phục', 'May vá', '22/2/2023', 'Tháng này dường như đang tăng tốc quá nhanh. Trước khi tôi biết điều đó, học sinh cuối cấp của tôi sẽ bắt đầu buổi dạ hội cuối cấp và tốt nghiệp trung học! Đó là tất cả rất buồn vui lẫn lộn đối với tôi. Dù sao thì, chúng ta đang ở tuần thứ 4 của dự án tra', NULL, '8.jpg');
INSERT INTO `new` VALUES (9, 'Đóng gói & May vá cho một kỳ nghỉ làm đồ thủ công', 'May vá', '15/10/2022', 'Đầu tiên và quan trọng nhất, đừng đợi đến đêm trước khi khởi hành mới thu dọn đồ đạc—hãy bắt đầu lập kế hoạch và sắp xếp đồ đạc khoảng một tuần trước chuyến đi để bạn có thời gian đưa ra quyết định sao cho sử dụng hiệu quả không gian vali của mình và quan', NULL, '9.jpg');
INSERT INTO `new` VALUES (10, 'Đóng gói & May vá cho một kỳ nghỉ làm đồ thủ công', 'Dệt may', '25/3/2022', 'Đầu tiên và quan trọng nhất, đừng đợi đến đêm trước khi khởi hành mới thu dọn đồ đạc—hãy bắt đầu lập kế hoạch và sắp xếp đồ đạc khoảng một tuần trước chuyến đi để bạn có thời gian đưa ra quyết định sao cho sử dụng hiệu quả không gian vali của mình và quan', NULL, '10.jpg');
INSERT INTO `new` VALUES (11, '10 Loại Vải May Áo Sơ Mi Phổ Biến Nhất Ở Việt Nam', 'Dệt may', '16/12/2022', 'Áo sơ mi trên thị trường hiện nay vô cùng đa dạng và phong phú về kiểu dáng và chất liệu. Những chât liệu khác nhau với những đặc trưng riêng sẽ mang lại cho người sử dụng những cảm giác khác nhau. Vậy chúng ta hãy cùng nhau cùng tìm hiểu những loại vải n', NULL, '11.jpg');
INSERT INTO `new` VALUES (13, 'Kỹ Thuật May Khẩu Trang Vải Kháng Khuẩn Theo Quyết Định số 870/QĐ-BYT 2020 – Bộ Y Tế', 'May vá', '9/9/2022', 'Quyết Định Số 870/QĐ-BYT là gì?\r\nQuyết định số 870/QĐ-BYT được phát hành vào ngày 12 tháng 3 năm 2020 của Bộ trưởng Bộ Y tế là thông tin hướng dẫn chi tiết được sử dụng tạm thời trong bối cảnh dịch bệnh Covid-19 tăng cao độ biến. Thông tư bao gồm các quy ', NULL, '13.jpg');
INSERT INTO `new` VALUES (14, 'Hướng dẫn 10 Bước Để Phát Triển Mẫu Mới (Prototype Sample) Cho Đơn Hàng Ngành May Mặc.', 'Dệt may', '24/1/2022', 'Vì có nhiều ban thắc mắc không hiểu rõ ràng quá trình phát triển mẫu mới của một xưởng may diễn ra như thế nào, nên hôm này DOSI xin giới thiệu “Quy Trình Phát Triển Mẫu Mã Mới (Prototype Sample) cơ bản & quy chuẩn của những xưởng may trong và ngoài nước ', NULL, '14.jpg');
INSERT INTO `new` VALUES (15, 'Side seam là gì? Ý nghĩa và cách đo sideseam quần.', 'Dệt may', '28/2/2022', 'Ý nghĩa của từ side seam là gì? Bạn đã từng nghe về thuật ngữ này nhiều lần, hoặc thấy nó ở trong các bảng số đo size quần của các hãng nước ngoài? nhưng có thể không biết chính xác nó có nghĩa là gì và tại sao nó lại quan trong tới thế? Bài viết dưới đây', NULL, '15.jpg');
INSERT INTO `new` VALUES (16, 'Hướng Dẫn Cách Chọn Áo Sơ Mi Thu Đông', 'Thời trang ', '5/3/2022', 'Gió mùa thu đang ùa về, thời tiết bắt đầu chuyển lạnh không biết các cô nàng xinh đẹp của chúng ta đã lên được ý tưởng thời trang cho mùa thu đông năm nay hay chưa? Thời trang không chỉ là vẻ đẹp bề ngoài mà còn thể hiện cá tính của người mặc. Giúp thổi m', NULL, '16.jpg');
INSERT INTO `new` VALUES (17, 'Vải kaki là gì? có mấy loại vải kaki? Vải kaki dùng may những gì?', 'May vá', '9/1/2022', 'Vải kaki là gì? có mấy loại vải kaki? Vải kaki dùng may những gì? là những câu hỏi đang làm nhiều người thắc mắc. Các bạn thường nghe nói về loại vải này? Các bạn không biết nó là gì? Công dụng và đặc tính của nó ra sao? Hãy cùng nhau tìm hiểu về loại vải', NULL, '17.jpg');
INSERT INTO `new` VALUES (18, 'Vải thổ cẩm là gì? 5 bước nhận biết vải thổ cẩm', 'May vá', '3/4/2023', 'Ngày này, vải thổ cẩm được ứng dụng nhiều trong các ngành may mặc, đồ nội thất, đồ gia dụng,… Thế nhưng vẫn không ít người băn khoăn không biết vải thổ cẩm là loại vải như thế nào, quy trình sản xuất, cách bảo quản hay ưu nhược điểm của loại vải này là gì', NULL, '18.jpg');
INSERT INTO `new` VALUES (19, 'Phương pháp may vắt sổ nhanh bằng máy và tay siêu chuẩn', 'Thời trang', '20/4/2023', 'Ngành may mặc gắn liền với cuộc sống của chúng ta, tạo ra những sản phẩm tuyệt vời từ trang phục, giày dép thời trang, mũ,… Chính vì thế một số cụm từ thông dụng của ngành chúng ta thường nghe nhắc đến thường xuyên như may vắt sổ. Vậy may vắt sổ là gì? ', NULL, '19.jpg');
INSERT INTO `new` VALUES (20, 'Các loại cổ áo sơ mi nam đẹp, tên gọi & cách chọn phù hợp', 'Thời trang ', '15/6/2022', 'Bên cạnh màu sắc, form dáng và chất liệu thì cổ áo sơ mi nam cũng góp phần định hình cá tính và phong cách thời trang của quý ông. Việc lựa chọn khéo léo cổ áo khiến tổng thể trang phục trở nên hài hòa và nổi bật, đồng thời mỗi kiểu cổ áo sơ mi nam cũng s', NULL, '20.jpg');
INSERT INTO `new` VALUES (21, 'Chất Liệu Vải May Quần Áo Mùa Đông Vừa ấm áp, thời trang', 'Dệt may', '30/7/2022', 'Mùa đông là thời điểm thích hợp nhất trong năm để chúng ta trở nên “sành điệu” hơn với thời trang. Việc lựa chọn và phối hợp quần áo mùa đông sao cho vừa ấm áp, dễ chịu, lại vừa tôn dáng, thể hiện gu thời trang đỉnh cao là không hề dễ dàng. Chỉ cần một ch', NULL, '21.jpg');
INSERT INTO `new` VALUES (22, '16 Loại Cổ Áo Sơ Mi Thông Dụng Trên Thị Trường Áo Việt Nam', 'Dệt  may', '8/2/2023', 'Thông thường khi lựa chọn áo sơ mi chúng ta sẽ chỉ tập trung chú ý vào phần chất liệu, màu sắc và form dáng nhưng có một phần cực kỳ quan trọng mà bạn hay bỏ qua đó chính là cổ áo. Do đó, có nhiều trường mua đồ online hoặc trực tiếp tại cửa hàng rất đẹp n', NULL, '22.jpg');
INSERT INTO `new` VALUES (23, 'Chất liệu vải rayon là gì? Ứng dụng ra sao trong may mặc?', 'Dệt may', '9/4/2022', 'Rayon là một loại vải pha trộn, có những ưu điểm của bông và tơ tằm nguyên chất. Được sử dụng rộng rãi trong sản xuất trang phục, đồ gia dụng và các sản phẩm y tế, vệ sinh. Vậy vải Rayon là gì? Bảo quản vải này như thế nào? ', NULL, '23.jpg');
INSERT INTO `new` VALUES (24, 'Phụ liệu may mặc & Danh sách cửa hàng bán phụ liệu may TPHCM', 'Dệt may', '5/5/2022', 'Bạn đang có kế hoạch kinh doanh cửa hàng bán phụ liệu may mặc nhưng chưa biết nhập hàng ở đâu. Bạn muốn mua phụ liệu may mặc số lượng lớn để may vá? Tìm mua loại mặc hàng này không khó, cái khó là tìm được cơ sở bán si', NULL, '24.jpg');
INSERT INTO `new` VALUES (25, 'Top 11+ loại vải không nhăn chất lượng và phổ biến hiện nay', 'Dệt may', '7/4/2023', 'Chất liệu vải luôn là nỗi quan tâm hàng đầu khi lựa chọn trang phục. Vải không nhăn, chất lượng tốt thì mới giữ nguyên được nét đẹp trang phục, tôn lên nét quý phái cho người diện.', NULL, '25.jpg');
INSERT INTO `new` VALUES (26, 'Vải Tole là gì? Nguồn gốc và cách ứng dụng vải tole', 'Dệt may', '11/11/2023', 'Vải Tole “được lòng” rất nhiều khách hàng nhờ ưu điểm vượt trội, ứng dụng rộng rãi trong đời sống. Tuy nhiên, không phải ai cũng thực sự hiểu rõ về chất liệu này. ', NULL, '26.jpg');
INSERT INTO `new` VALUES (27, 'Top 5 bước thiết kế quần áo độc đáo, ấn tượng cho người mới', 'Thời trang', '12/12/2022', 'Thiết kế quần áo liệu có còn khó như trong suy nghĩ? Thời trang là thứ mà con người luôn quan tâm hàng đầu, cả phần đông nam giới và nữ giới. Nếu bạn còn đang mơ hồ về những kiến thức này, bài viết dưới đây', NULL, '27.jpg');
INSERT INTO `new` VALUES (28, 'Máy vắt sổ là gì? Phân loại & các thương hiệu máy uy tín', 'May vá', '13/8/2022', 'Máy vắt sổ là một thuật ngữ chuyên ngành, cũng là một trong những thiết bị không thể thiếu đối với ngành may mặc. Để hiểu rõ hơn về máy vắt sổ là gì? Những dòng máy vắt sổ? Nên mua máy vắt sổ của thương hiệu nào? Những vấn đề thường gặp phải ra sao? ', NULL, '28.jpg');
INSERT INTO `new` VALUES (29, 'Top 12 xưởng sỉ quần áo hot trend giá rẻ và chất lượng TPHCM', 'Dệt may', '4/4/2023', 'Trên thị trường hiện nay, có rất nhiều xưởng sỉ quần áo ra đời khiến bạn không biết nhập hàng ở đâu uy tín, chất lượng để kinh doanh. Đừng lo lắng, ở bài viết sau đây, sẽ giới thiệu đến cho bạn top các xưởng sỉ quần áo hot trend đang được nhiều khách lựa ', NULL, '29.jpg');
INSERT INTO `new` VALUES (30, 'Vải Tole là gì? Nguồn gốc và cách ứng dụng vải tole', 'Dệt may', '30/1/2023', 'Vải Tole “được lòng” rất nhiều khách hàng nhờ ưu điểm vượt trội, ứng dụng rộng rãi trong đời sống. Tuy nhiên, không phải ai cũng thực sự hiểu rõ về chất liệu này. Mời bạn cùng  tìm hiểu kỹ hơn trong bài viết dưới đây.', NULL, '30.jpg');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createDate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for post_detail
-- ----------------------------
DROP TABLE IF EXISTS `post_detail`;
CREATE TABLE `post_detail`  (
  `idpostdetail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_detail
-- ----------------------------

-- ----------------------------
-- Table structure for postcategories
-- ----------------------------
DROP TABLE IF EXISTS `postcategories`;
CREATE TABLE `postcategories`  (
  `post_id` int NOT NULL,
  `category_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of postcategories
-- ----------------------------

-- ----------------------------
-- Table structure for postimage
-- ----------------------------
DROP TABLE IF EXISTS `postimage`;
CREATE TABLE `postimage`  (
  `post_id` int NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of postimage
-- ----------------------------

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `id` int NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `content` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `idA` int NULL DEFAULT NULL,
  `created_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES (1, 'images/news/img01.jpg', '10 Loại Vải Thông Dụng Nhất Để May Áo Sơ Mi\r\nDưới đây sẽ là những loại vải may áo sơ mi có thể coi là thông dụng và phổ biến nhất trên thị trường thường dùng để may áo sơ mi:\r\n\r\nVải Kate\r\nVải Kate được biết đến như là một loại vải áo sơ mi được sử dụng nhiều dành cho các bạn nam giới. Đây là loại vải thuộc nhóm vải tổng hợp pha trộn giữa những sợi Polyester và sợi bông trên vải tự nhiên Cotton. Bề mặt vải tương đối phẳng, bóng và mềm mịn, khó nhăn, dễ giặt ủi nên rất được ưa chuộng. Dù trong điều kiện thời tiết nào thì vải cũng đem lại cho người sử dụng một cảm giác êm ái, nhẹ nhàng và thoáng mát. Đặc biệt, những chiếc áo sơ mi được làm từ vải Kate cũng được đánh giá là bền màu, khó bị phai trong quá trình giặt ủi, sử dụng thời gian dài. Hiện nay trên thị trường có rất nhiều sản phẩm vải Kate khác nhau như: Vải Kate Ý Kate Mỹ, Kate Hàn, Kate Polin, Kate Silk, vải,… Với mỗi loại lại sở hữu những tính chất riêng giúp cho bạn tha hồ lựa chọn tùy theo nhu cầu sử dụng và sở thích sao cho phù hợp với phong cách, kiểu dáng của bạn\r\n\r\nVì vải kate có ưu điểm là thấm hút mồ hôi tốt, ít phai màu và bền và có khá nhiều lại như: Kate Silk (100% PE), Kate Ý – USA, Kate Polin, Kate Ford, Kate Hàn Quốc,… Mỗi loại vải sẽ có chất lượng, giá thành khác nhau, trong đó Kate Hàn Quốc là loại vải có giá thành rẻ nhất do đó chúng kém bền màu và dễ bị xù hơn những loại vải Kate khác. Vải Kate Ý – USA và Kate Polin có chất lượng tốt nhất, độ thấm hút mồ hôi cao, ít bị nhăn, mềm mịn. Còn đối với Kate Ford thì khi sử dụng bạn nên chú ý vì chúng rất dễ bị xù lông.\r\n\r\n=> Xem thêm: Vải Kate Là Vải Gì? 6 Loại Vải Kate Phổ Biến ở Việt Nam\r\n\r\nVải Kate là loại vải có đô bền cao, khả năng hút ẩm tốt, chống nhăn tốt nên thường được dùng làm áo sơ mi và được giới làm văn phòng công sở ưa chuộng.\r\nVải Kate là loại vải có đô bền cao, khả năng hút ẩm tốt, chống nhăn tốt nên thường được dùng làm áo sơ mi và được giới làm văn phòng công sở ưa chuộng.\r\nƯu nhược điểm của vải Kate:\r\nƯu Điểm: Chất liệu Kate thuộc phân khúc bình dân vì chất lượng khá tốt nhưng giá thành lại rất hợp lý. Loại vải này mang lại cảm giác thoáng mát cho người mặc, đặc biệt là đa dạng màu sắc nhưng lại không hề dễ phai màu. Áo sơ mi được may từ vải Kate giữ form dáng nằm ở mức khá ổn, do đó chúng thường được nhận xét là khá bền. Với giá thành rẻ thì cũng không thể quá đòi hỏi chất lượng của sơ mi Kate, tuy nhiên những gì chúng mang lại chắc chắn sẽ vượt ngoài mong đợi của bạn. Từ khóa để nhắc đến áo sơ mi Kate có lẽ là: “Bền, Rẻ, Đẹp”\r\nNhược điểm: Mặc dù nhận được khá nhiều lời khen từ người tiêu dùng như áo sơ mi Kate vẫn có những hạn chế như: Vải Kate thường được sử dụng để may các loại áo sơ mi có phong cách chững chạc, nghiêm túc, thanh lịch và sẽ phù hợp hơn dành cho phái nam. Nguyên nhân là do vải Kate khá cứng và vào form nên nếu bạn có nhu cầu với một chiếc áo mềm mại, thoải mái thì các bạn không nên chọn loại vải này.\r\nNhiều loại vải Kate được pha nhiều chất Poly sẽ làm vải khá cứng mặc không thoải mái\r\nNhiều loại vải Kate được pha nhiều chất Poly sẽ làm vải khá cứng mặc không thoải mái.\r\nVải Kate là loại vải có đô bền cao, khả năng hút ẩm tốt, chống nhăn tốt nên thường được giới làm văn phòng công sở ưa chuộngVải Kate là loại vải có đô bền cao, khả năng thắm hút ẩm tốt, khả năng chống nhăn tốt nên thường được giới làm văn phòng & công sở dùng để may áo sơ mi rất được ưa chuộng.\r\n\r\nVải Kaki\r\nVải Kaki thường có 2 loại: loại vải pha sợi thun và loại vải không pha sợi thun. Vải Kaki là sự kết hợp của cotton và polyester, sự kết hợp này cho bạn những trải nghiệm thoáng mát, không bị tù bí khi mặc. Loại vải pha thun (Các sợi Spandex) sẽ giúp cho vải có độ co giãn tốt hơn, còn vải Kaki thông thường giữ được độ cứng, lên form dáng chuẩn hơn và rất thích hợp tôn lên vẻ đẹp mạnh mẽ, cứng cỏi của các đấng mày râu.\r\n\r\nNếu bạn muốn tìm loại vải may áo sơ mi không nhăn, dày dặn, chuẩn form và chất lượng cao. Thì đúng rồi đấy, loại vải bạn đang tìm đó chính là vải kaki. Kiểu áo thường được may từ vải Kaki là áo công sở, đồ bảo hộ lao động,… vì chúng phù hợp với nhiều môi trường và thời tiết khác nhau. Vải Kaki được chia thành 2 loại  phổ biến đó là vải Kaki co dãn và Kaki không co dãn. Loại vải Kaki co dãn có bề mặt khá là dày, nhưng nó lại đảm bảo được độ thông thoáng cao và co giãn tốt, khi mặc, giúp bạn dễ dàng hoạt động hơn. Người mặc sẽ có cảm giác thoải mái, dễ chịu nhất là trong điều kiện đi lại và làm việc nhiều. Tuy nhiên, vải Kaki không co dãn thì lại có độ cứng cao hơn, giúp Form dáng chuẩn hơn, ít nhăn nên được rất nhiều nam giới yêu thích. Bạn có thể lựa chọn cho mình loại vải áo sơ mi này để bảo đảm phong cách thời trang lịch lãm, lịch sự và sang trọng.\r\n\r\nÁo sơ mi vải kaki là loại áo ít nhăn, dày dặn, chuẩn form và chất lượng cao.\r\nÁo sơ mi vải kaki là loại áo ít nhăn, dày dặn, chuẩn form và chất lượng cao.\r\nƯu nhược điểm của vải Kaki:\r\nƯu điểm: Cũng như Kate, vải Kaki được đánh giá rất cao ở khả năng thấm hút mồ hôi và bền đẹp. Ngoài ra, nếu bạn có nhu cầu về một chiếc áo sơ mi có độ co giãn nhất định thì có thể cân nhắc lựa chọn loại vải Kaki pha thun. Nếu vải Kate thường bị mất form sau khi giặt thì Kaki pha thun sẽ khắc phục được nhược điểm này do đó chúng trở thành lựa chọn của không ít người.\r\nNhược điểm: Mặc dù nhận được khá nhiều lời khen từ người tiêu dùng như áo sơ mi Kate vẫn có những hạn chế như: Vải Kate thường được sử dụng để may các loại áo sơ mi có phong cách chững chạc, nghiêm túc, thanh lịch và sẽ phù hợp hơn dành cho phái nam. Nguyên nhân là do vải Kate khá cứng và vào form nên nếu bạn có nhu cầu với một chiếc áo mềm mại, thoải mái thì các bạn không nên chọn loại vải này.\r\n=> Xem thêm: Vải kaki là gì? có mấy loại vải kaki? Vải kaki dùng may những gì?\r\n\r\nVải Kaki là loại vải thường được dùng để làm đồng phục trong quân đội\r\nVải Kaki là loại vải thường được dùng để làm đồng phục trong quân đội\r\nVải Cotton\r\nVải Cotton là loại vải thông dụng nhất, được làm từ những sợi bông thiên nhiên. Vải có ưu điểm là thấm hút mồ hôi tương đối tốt tạo sự thông thoáng đem lại cảm giác thoải mái, mát mẻ cho người sử dụng. Bề mặt áo không bóng, nhưng màu sắc trên vải thì rất bền, tuổi thọ tương đối cao, giữ Form tốt và đặc biệt là sẽ không bị xù lông.  Dù sở hữu rất nhiều ưu điểm, được nhiều người tin tưởng lựa chọn để may ra áo sơ mi đẹp. Song, loại vải lại có nhược điểm là giá thành cao, dễ bị nhăn nên lúc nào cũng cần phải ủi trước khi mặc. Chưa kể là khi mặc, bạn không nên vận động mạnh sẽ dễ làm cho áo không còn phẳng được.  Hiện tại, để khắc phục những nhược điểm này thì nhiều nhà sản xuất đã pha trộn thêm nhiều nguyên liệu kết hợp với cotton. Ví dụ như kết hợp với các loại sợi như lụa, Spandex,… để áo sơ mi được mềm mại và êm ái hơn.\r\n\r\nChất liệu vải 100% Cotton được sử dụng rất nhiều trong may áo sơ mi đặc biệt là áo sơ mi phục vụ mùa hè. Vải cotton từ thiên nhiên có độ thấm hút mồ hôi được đánh giá ở mức tốt mang lại cảm giác thoáng mát dù là những ngày hè nóng nực. Chính vì vậy vải Cotton cũng thường được lựa chọn là một loại vải may áo sơ mi. Tuy nhiên, loại vải này thường không phong phú về màu sắc, độ bền màu kém, khá dễ bị nhăn, giá thành cao.\r\n\r\nVải Cotton là loại có ưu điểm là thấm hút mồ hôi tương đối tốt tạo sự thông thoáng đem lại cảm giác thoải mái cho người mặc\r\nVải Cotton là loại có ưu điểm là thấm hút mồ hôi tương đối tốt tạo sự thông thoáng đem lại cảm giác thoải mái cho người mặc\r\nVải Lụa\r\nNếu những loại vải vừa kể trên phù hợp với phái nam hơn thì vải lụa chắc chắn là lựa chọn của phái nữ. Nói như vậy không phải loại vải này chỉ phù hợp với phụ nữ đâu bạn nhé. Những chiếc áo sơ mi cao cấp được may từ vải lụa thường khiến chị em phụ nữ mê mẩn vì độ mềm mại, quyến rũ, lả lướt. Tuy nhiên, sơ mi lụa bạn nên chú ý màu sắc vì chúng có thể khiến bạn bị già đi. Khi mặc sơ mi lụa sẽ có độ bóng nhất định rất bắt mắt.\r\n\r\nÁo sơ mi lụa rất màu sắc bóng bẩy, mịn màng, sự sang trọng, duyên dáng rất phù hợp với phái nữ.\r\nÁo sơ mi lụa rất màu sắc bóng bẩy, mịn màng, sự sang trọng, duyên dáng rất phù hợp với phái nữ.\r\nNgoài ra vải Lụa luôn được mọi  người biết đến là một trong các loại chất liệu tơ tằm thượng hạng mang lại nhiều đặc điểm đặc biệt cho người sử dụng. Người ta thường chọn vải này trong việc may mặc chứ không riêng gì trong việc may áo sơ mi. Chất liệu vải lụa may áo sơ mi có bề mặt mỏng cực kì mịn, nhẹ nhàng, êm ái luôn mang lại cảm giác dễ chịu, mát mẻ hơn cho người mặc. Bề mặt áo sơ mi lụa rất bóng bẩy, mịn màng sẽ mang đến cho người mặc sự sang trọng, duyên dáng và đôi chút là sự nữ tính trong từng đường nét.  Hiện nay, tơ tằm dùng để sản xuất vải áo sơ mi lụa thường được sử dụng nhiều là: Tơ tằm dâu, tơ tằm sồi và tơ tằm lá sắn, tơ tằm lạc,…  Trong đó, tơ tằm dâu là loại tơ tằm được ứng dụng nhiều nhất và phổ biến nhất hiện nay vì nó có nhiều ưu điểm vượt trội hơn cả.  Qua bài viết này, hy vọng bạn đọc có thể dựa vào những đặc trưng cũng như những ưu điểm của từng loại vải để lựa chọn cho mình những loại chất liệu phù hợp nhất với bản thân mình nhé!', 5, '10/02/2022', 1);

-- ----------------------------
-- Table structure for postvideo
-- ----------------------------
DROP TABLE IF EXISTS `postvideo`;
CREATE TABLE `postvideo`  (
  `post_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of postvideo
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
