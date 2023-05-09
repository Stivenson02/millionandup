puts ' # Create Admin'
admin = Admin.find_or_initialize_by(
  email: "admin1@mail.com",
)
if admin.new_record?
  admin.password = '123456Aa'
  admin.password_confirmation = '123456Aa'
  admin.save!
end

puts ' # Upload Products'
ProductsApiService.new.call


