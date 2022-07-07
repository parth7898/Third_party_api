FactoryBot.define do
  factory(:user) do
    email { "jane.doe@hey.com" }
    password { "SecretPassword123" }
  end
  factory(:coin) do
    coin_id { "01coin" }
    name { "01coin" }
    symbool{"bits"}
  end
end