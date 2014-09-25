FactoryGirl.define do
  factory :user do
    name "test1"
    number  "100"
    operations "+-"
    email "test@text.t"
    password "helloworld"
    password_confirmation "helloworld"
  end

  factory :admin, class: User do
    name "admin"
    number  ""
    operations ""
    email "admin@u.u"
    password "helloworld"
    password_confirmation "helloworld"
  end
end