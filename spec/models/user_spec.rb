Rspec.decribe name, type: :model do
  before :each do
    @user = User.create(name: "Tom")
  end
end