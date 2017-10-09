# == Schema Information
#
# Table name: comments
#
#  id        :integer          not null, primary key
#  user_id   :integer
#  content   :text
#  thread_id :integer
#  client_id :integer
#

class Comment < ApplicationRecord
	belongs_to :users
  belongs_to :clients
end
