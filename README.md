# フリマER図

## users

|                                          |
| ---------------------------------------- |
| email (string not_null)                  |
| password (string not_null)               |
| nickname (string not_null)               |
| first_name (string not_nul)              |
| last_name (string not_null)              |
| birthday (date not_null) date_select使用  |
| |
|                                          |

### Association
* has_many products

--- 
## products
|                                     |
| ----------------------------------- |
| name (string not_null)              |
| price (string not_null              |
| explanation (text not_null)         |
| category (integer not_null) enum使用 | 
| status (integer not_null) enum使用   |
| burden (integer not_null) enum使用   |
| area (integer not_null) enum使用     |
| days (integer not_null) enum使用     |
| image (ActiveStorageで実装)          |
| user (references型)                  | 
|                                     |

### Association
* belongs_to user
* belongs_to delivery

---
## deliveries
|                                 |
| ------------------------------- |
| postal_code (integer not_null)  |
| prefectures (integer not_null)  |
| municipality (string not_null)  |
| address (integer not_null)      |
| building_name (string)          |
| phone_number (integer not_null) | 
| product (references型)           |
|                                 |

### Association
* belongs_to product

