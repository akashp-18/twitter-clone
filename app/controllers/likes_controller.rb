class LikesController < ApplicationController
  before_action :load_likeable

  def toggle
    like = @likeable.likes.find_or_initialize_by(user_id: current_user.id)
    @result = like.persisted? ? like.destroy : like.save
  end

  private

  def load_likeable
    klass = [Tweet, Comment].detect { |c| params["#{c.name.underscore}_id"] }
    @likeable = klass.find(params["#{klass.name.underscore}_id"])
  end

end