class User < ApplicationRecord
    has_many :enrollments,
        # primary_key: :id,
        foreign_key: :student_id,
        class_name: :Enrollment

    has_many :enrolled_courses,
        # primary_key: :id,  #<== id inside of users table refering to users.id
        through: :enrollments,
        source: :course
end
