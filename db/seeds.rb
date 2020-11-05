# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

image_stock = [
    'https://www.memphisveterinaryspecialists.com/files/best-breeds-of-house-cats-memphis-vet-1-1.jpeg',
    'https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/cat_relaxing_on_patio_other/1800x1200_cat_relaxing_on_patio_other.jpg?resize=750px:*',
    'https://nenow.in/wp-content/uploads/2020/04/cat-image-2.jpg',
    'https://www.click2houston.com/resizer/HKQAeI7i5nJAHlNtOZep7qxLpkM=/1600x1066/smart/filters:format(jpeg):strip_exif(true):strip_icc(true):no_upscale(true):quality(65)/cloudfront-us-east-1.images.arcpublishing.com/gmg/7CO7JEH4HZH5FML4JD6OCGMCLU.jpg',
    'https://artcityvets.com/wp-content/uploads/2019/03/animal-sitting-animals-inside.jpg', 
    'https://media.npr.org/assets/img/2020/02/11/gettyimages-1161583037_wide-9557db6da5960c53f9b7c51da280d17adbb772cc-s800-c85.jpg', 
    'https://live-production.wcms.abc-cdn.net.au/a5fd1eac5dfa4526ee1591d1d0400b9b?impolicy=wcms_crop_resize&cropH=468&cropW=701&xPos=24&yPos=0&width=862&height=575', 
    'https://www.rvc.ac.uk/Media/Default/VetCompass/images/persian-cat-full.jpg', 
    'https://images.squarespace-cdn.com/content/v1/5984da00cd0f685f369c47f7/1584636276892-10C4069PEPW7IT968JGL/ke17ZwdGBToddI8pDm48kNiEM88mrzHRsd1mQ3bxVct7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0s0XaMNjCqAzRibjnE_wBlkZ2axuMlPfqFLWy-3Tjp4nKScCHg1XF4aLsQJlo6oYbA/Cats.jpg?format=500w'
]

User.create(name: "Augusto", username: "Otsugua", email: "augusto@email.com", description: "Cheap date", image_url: image_stock.sample, password: "hello")
User.create( name: "Anastasia", username: "KittyGirl", email: "anastasia@hotmail.com", description: "Street cat running from heartache", image_url: image_stock.sample, password: "hello")

10.times do 
User.create(name: Faker::Artist.unique.name, username: Faker::Internet.unique.username, email: Faker::Internet.unique.free_email, description: Faker::Dessert.flavor, image_url: image_stock.sample, password: "hello" )
end
