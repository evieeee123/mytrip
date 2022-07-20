json.spot do 
    json.extract! @spot, :id, :city_id, :name, :spot_type, :description, :duration, :longtitude, :latitude
end

json.reviews do 
    reviews = @spot.reviews.includes(:user)
    reviews.each do |review|
        json.set! review.id do 
            json.extract! review, :id, :user_id, :rating, :title, :body, :visit_date, :reviewable_id, :reviewable_type
            json.reviewer review.user.username
        end
    end
end