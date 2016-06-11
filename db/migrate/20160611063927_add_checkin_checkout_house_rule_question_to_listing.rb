class AddCheckinCheckoutHouseRuleQuestionToListing < ActiveRecord::Migration
  def change
    add_column :listings, :checkin, :time
    add_column :listings, :checkout, :time
    add_column :listings, :house_rule, :text
    add_column :listings, :question, :text
  end
end
