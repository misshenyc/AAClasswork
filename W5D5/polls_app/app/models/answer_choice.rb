# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint           not null, primary key
#  text        :string           not null
#  question_id :integer          not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class AnswerChoice < ApplicationRecord

    belong_to :question,
        primary_key: :id,
        foreign_key: :question_id,
        class_name: :Question


    has_many :responses,
        primary_key: :id, 
        foreign_id: :user_id,
        class_name: :Response
end
