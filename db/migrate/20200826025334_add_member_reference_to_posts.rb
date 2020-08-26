class AddMemberReferenceToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :member
  end
end
