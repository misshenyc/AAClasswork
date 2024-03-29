# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    has_many :author_polls,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Polls

    has_many :responses,
        primary_key: :id, 
        foreign_id: :user_id,
        class_name: :Response
end
