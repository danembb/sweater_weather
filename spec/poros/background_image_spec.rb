require 'rails_helper'

RSpec.describe BackgroundImage do
  it 'exists and has attributes' do
    data = {
            "id": "mvtrRdFDzzI",
            "created_at": "2021-10-17T17:49:50-04:00",
            "updated_at": "2021-11-15T06:31:09-05:00",
            "width": 4160,
            "height": 5200,
            "color": "#f3f3f3",
            "blur_hash": "LxG[yYIAIUjZ~qIUM{WB%gM{R%WB",
            "description": "Community in Denver.",
            "urls": {
                "raw": "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?ixid=MnwyNzU5Mzl8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MzcwMzUzODk&ixlib=rb-1.2.1",
                "full": "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNzU5Mzl8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MzcwMzUzODk&ixlib=rb-1.2.1&q=85",
                "regular": "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNzU5Mzl8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MzcwMzUzODk&ixlib=rb-1.2.1&q=80&w=1080",
                "small": "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNzU5Mzl8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MzcwMzUzODk&ixlib=rb-1.2.1&q=80&w=400",
                "thumb": "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNzU5Mzl8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MzcwMzUzODk&ixlib=rb-1.2.1&q=80&w=200"
            },
            "links": {
                "self": "https://api.unsplash.com/photos/mvtrRdFDzzI",
                "html": "https://unsplash.com/photos/mvtrRdFDzzI",
                "download": "https://unsplash.com/photos/mvtrRdFDzzI/download?ixid=MnwyNzU5Mzl8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MzcwMzUzODk",
                "download_location": "https://api.unsplash.com/photos/mvtrRdFDzzI/download?ixid=MnwyNzU5Mzl8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MzcwMzUzODk"
            },
            "categories": [],
            "likes": 2,
            "liked_by_user": false,
            "current_user_collections": [],
            "topic_submissions": {
                "current-events": {
                    "status": "rejected"
                }
            },
            "user": {
                "id": "6fM0nTrpvTI",
                "updated_at": "2021-11-15T22:12:56-05:00",
                "username": "dillydallying",
                "name": "Dillon Wanner",
                "first_name": "Dillon",
                "last_name": "Wanner",
                "portfolio_url": "https://dillydally.myportfolio.com",
                "bio": "Artist, Photographer, cinematographer living in Denver, Co. \r\nMy photos are a small glimpse of what I’m feeling or that perspective at that time. Trying to communicate that with other humans. I love you.",
                "location": "Denver Colorado",
                "links": {
                    "self": "https://api.unsplash.com/users/dillydallying",
                    "html": "https://unsplash.com/@dillydallying",
                    "photos": "https://api.unsplash.com/users/dillydallying/photos",
                    "likes": "https://api.unsplash.com/users/dillydallying/likes",
                    "portfolio": "https://api.unsplash.com/users/dillydallying/portfolio",
                    "following": "https://api.unsplash.com/users/dillydallying/following",
                    "followers": "https://api.unsplash.com/users/dillydallying/followers"
                },
                "profile_image": {
                    "small": "https://images.unsplash.com/profile-1616266477156-e4cd50197e4dimage?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                    "medium": "https://images.unsplash.com/profile-1616266477156-e4cd50197e4dimage?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                    "large": "https://images.unsplash.com/profile-1616266477156-e4cd50197e4dimage?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
                },
                "instagram_username": "Dillydally.ing",
                "total_collections": 0,
                "total_likes": 35,
                "total_photos": 104,
                "accepted_tos": true,
                "for_hire": true,
                "social": {
                    "instagram_username": "Dillydally.ing",
                    "portfolio_url": "https://dillydally.myportfolio.com",
                }
            },
            "tags": [
                {
                    "type": "search",
                    "title": "denver"
                },
                {
                    "type": "search",
                    "title": "co"
                },
                {
                    "type": "search",
                    "title": "usa"
                }
            ]
        }

    background_image = BackgroundImage.new(data)

    expect(background_image).to be_a(BackgroundImage)
    expect(background_image.id).to eq("null")
    expect(background_image.source).to eq("unsplash.com")
    expect(background_image.logo).to eq("https://unsplash.com/blog/content/images/max/2560/1-VnKoValwGK3-d1bZhD6sVA.jpeg")
    expect(background_image.description).to eq("Community in Denver.")
    expect(background_image.image_url).to eq("https://images.unsplash.com/photo-1634507307799-ace9b49840b7?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNzU5Mzl8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MzcwMzUzODk&ixlib=rb-1.2.1&q=85")
    expect(background_image.user).to eq("dillydallying")
    expect(background_image.user_portfolio).to eq("https://dillydally.myportfolio.com")
    expect(background_image.location).to eq("Denver Colorado")
  end
end
