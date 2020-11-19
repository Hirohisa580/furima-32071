# フリマER図

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|birthday|date|null: false ※date_select使用|
### Association
- has_many products

--- 
## products

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|string|null: false|
|explanation|text|null: false|
|category|integer|null: false ※enum使用|
|status|integer|null: false ※enum使用|
|shipping|integer|null: false ※enum使用|
|area|integer|null: false ※enum使用|
|days|integer|null: false ※enum使用|
|image|    |null: false ※ActiveStorageで実装|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to user
- belongs_to derivery

---
## deliveries

|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefectures|integer|null: false|
|municipality|string|null: false|
|addres|integer|null: false|
|building_name|string|     |
|phone_number|integer|null: false|
|product_id|references|null: false, foreign_key: true|

### Association
* belongs_to product
