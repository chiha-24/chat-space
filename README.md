# ChatSpace

Database design
---------------

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false,unique: true|
|password|string|null: false|

### Association
- has_many :messages
- has_many :groups,through: :members
- has_many :members

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :messages
- has_many :users,through: :members
- has many :members

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|body|text||
|image|string||
|user_id|references|foreign_key: true|
|group_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group

## membersテーブル
|Column|Type|Options|
|------|----|-------|
|group_id|references|foreign_key: true|
|user_id|references|foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user