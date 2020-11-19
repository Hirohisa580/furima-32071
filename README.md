# フリマER図

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|encrypted_password|string|null: false|
|nickname|string|null: false|
|first_name|string|null: false|
|first_name_ruby|string|null: false|
|last_name|string|null: false|
|last_name_ruby|string|null: false|
|birthday|date|null: false ※date_select使用|
### Association
- has_many :items, through: :user_items

--- 
## items

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|explanation|text|null: false|
|category|integer|null: false ※ActiveHash使用|
|status|integer|null: false ※ActiveHash使用|
|shipping|integer|null: false ※ActiveHash使用|
|area|integer|null: false ※ActiveHash使用|
|days|integer|null: false ※ActiveHash使用|
|image|    |null: false ※ActiveStorageで実装|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user, through: :user_items, dependent: :destroy
---
## user_items
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery

---
## deliveries

|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefectures|integer|null: false|
|municipality|string|null: false|
|addres|integer|null: false|
|building_name|string|     |
|phone_number|string|null: false|
|item|references|null: false, foreign_key: true|

### Association
* belongs_to :user_item, dependent: :destroy
