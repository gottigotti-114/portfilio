-- 文字コード指定
SET NAMES utf8mb4;

-- ユーザ作成 -> 挿入,抽出権の付与 -> データベース作成権の付与
CREATE USER 'root5656'@'localhost' IDENTIFIED BY 'root5656';
GRANT CREATE ON *.* TO 'root5656'@'localhost';

-- データベース作成->使用
CREATE DATABASE IF NOT EXISTS favorite_things
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_general_ci;

USE favorite_things;

-- テーブル作成権の付与
GRANT CREATE ON favorite_things.* TO 'root5656'@'localhost';

-- テーブル作成
CREATE TABLE IF NOT EXISTS favorites(
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  favorite_food VARCHAR(100) NOT NULL
)CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- 挿入,抽出権の付与
GRANT SELECT,INSERT ON favorite_things.favorites TO 'root5656'@'localhost';
FLUSH PRIVILEGES;

-- 初期データ挿入
INSERT INTO favorites (name, favorite_food) VALUES
('田中太郎','リンゴ'),
('大田隼人','メロン'),
('佐藤太郎','ステーキ'),
('鈴木花子','うどん'),
('高橋剛','ラーメン'),
('田中玲奈','アップルパイ'),
('山本俊介','松坂ステーキ'),
('伊藤美咲','パイナップル'),
('渡辺健一','ハンバーガー'),
('中村優衣','肉うどん'),
('小林翔太','リンゴあめ'),
('松本夏海','塩ラーメン'),
('斎藤和也','唐揚げ'),
('藤本真理子','カレーライス'),
('岡田拓也','味噌ラーメン'),
('杉山沙織','てりやきバーガー'),
('石井悠斗','リンゴ'),
('森川ひかり','天ぷらうどん'),
('長谷川直樹','ステーキ'),
('大塚由衣','唐揚げ'),
('熊谷みさき','天ぷら');