class SnsCredential < ApplicationRecord
  #opthional: true は、紐付けたuserがなくともDBに保存できるようにするためのものです。
  belongs_to :user, optional: true
end