create database categories_information;
use categories_information;
create table category_info
(
    catalog_id BIGINT PRIMARY KEY, -- カテゴリーID (Khóa chính)
    catalog_name VARCHAR(64) NOT NULL, -- カテゴリー名
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 作成日時 (Thời điểm tạo, mặc định là thời gian hệ thống)
    created_user_id BIGINT, -- 作成ユーザーID
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 更新日時 (Thời điểm cập nhật, tự động cập nhật khi thay đổi)
    updated_user_id BIGINT, -- 更新ユーザーID
    disp_control CHAR(2) DEFAULT '01' CHECK (disp_control IN ('01', '02')) -- 表示制御区分
        COMMENT '設定可能値: 01 (公開), 02 (非公開). デフォルト値: 01',
    CONSTRAINT fk_created_user FOREIGN KEY (created_user_id) REFERENCES Category_Info(catalog_id) ON DELETE SET NULL,
    CONSTRAINT fk_updated_user FOREIGN KEY (updated_user_id) REFERENCES Category_Info(catalog_id) ON DELETE SET NULL
);