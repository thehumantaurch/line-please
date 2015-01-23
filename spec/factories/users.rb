FactoryGirl.define do
  factory :user, :class => 'Users' do
    username "The_Dane"
    password "BillieShakes"
    email "prince@denmarkcastle.com"
    first_name "Hamlet"
    last_name "Junior"
    access_level 1
  end
end
