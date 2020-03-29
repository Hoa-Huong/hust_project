require 'uri'

Comment.delete_all
TeachOffer.delete_all
Demand.delete_all
Teacher.delete_all
User.delete_all

25.times do |n|
  name = Faker::Name.name
  birth = Faker::Date.in_date_period(year: 1998)
  email = "user#{n+1}@gmail.com"
  phone = Faker::PhoneNumber.cell_phone
  role = 1
  password = "123456"
  password_confirmation = "123456"
  confirmed_at = Time.now
  user = User.create!(name: name, birth: birth, email: email, phone: phone, role: role, password: password, password_confirmation: password_confirmation, confirmed_at: confirmed_at)
  avar = URI.encode Faker::Avatar.image
  begin
    ava_file = open(URI.parse(avar))
    user.avatar.attach io: ava_file, filename: "image.png"
  rescue OpenURI::HTTPError => e
    user.avatar.attach io: File.open(Rails.root.join("app", "assets", "images", "default-ava.jpeg")),
    filename: "default-ava.jpeg"
  end
    user.save

end

25.times do |n|
  name = Faker::Name.name
  birth = Faker::Date.in_date_period(year: 1998)
  email = "user#{n+26}@gmail.com"
  phone = Faker::PhoneNumber.cell_phone
  role = 2
  password = "123456"
  password_confirmation = "123456"
  confirmed_at = Time.now
  user = User.create!(name: name, birth: birth, email: email, phone: phone, role: role, password: password, password_confirmation: password_confirmation, confirmed_at: confirmed_at)
  avar = URI.encode Faker::Avatar.image
  begin
    ava_file = open(URI.parse(avar))
    user.avatar.attach io: ava_file, filename: "image.png"
    user.save
  rescue OpenURI::HTTPError => e
    user.avatar.attach io: File.open(Rails.root.join("app", "assets", "images", "default-ava.jpeg")),
    filename: "default-ava.jpeg"
  end
  user.save
end

20.times do |n|
  user_ids = User.ids
  user_id = user_ids.sample
  title = "Tìm gia sư toán cho học sinh lớp 5"
  subject = "Toán"
  number_student = 1
  level_class = "Lớp 5"
  time_per_session = 2
  fee = 150000
  status = 1
  status_teach = 0
  province_id = 22
  district_id = 240
  address_detail = "Số 5 đường Bình minh"
  note = "Yêu cầu kinh nghiệm, học đại học bách khoa, học sinh học lực khá"
  Demand.create!(user_id: user_id, subject: subject, number_student: number_student, level_class: level_class, time_per_session: time_per_session, fee: fee, status: status, status_teach: status_teach, note: note, title: title, province_id: province_id, district_id: district_id, address_detail: address_detail)
end

User.teacher.ids.each do |n|
  user_id = n
  graduate = "Trường Đại học Bách khoa Hà Nội"
  address = "Số 5 ngách 15/5 Ngoc Gốc đề Đường Minh Khai"
  province_id = 22
  district_id = 240
  subject = "Toán"
  level_study = "Tiểu học"
  introduce = "Đang là sinh viên năm Hai trường Đại Học Hà Nội, Khoa tiếng Hàn. Có kinh nghiệm dạy gia sư và đứng lớp."
  teacher = Teacher.create!(user_id: user_id, graduate: graduate, address: address, province_id: province_id, district_id:district_id, subject: subject, level_study: level_study, introduce: introduce)
  teacher.diploma.attach io: File.open(Rails.root.join("app", "assets", "images", "certificates-default.jpg")),
    filename: "certificates-default.jpg"
  teacher.save
end

100.times do |n|
  teacher_ids = Teacher.ids
  teacher_id = Teacher.ids.sample
  demand_ids = Demand.ids
  demand_id = demand_ids.sample
  TeachOffer.create(teacher_id: teacher_id, demand_id: demand_id)
end

100.times do |n|
  teacher_ids = Teacher.ids
  teacher_id = teacher_ids.sample
  user_ids = User.ids
  user_id = user_ids.sample
  content = Faker::Lorem.paragraph(sentence_count: 5, supplemental: false, random_sentences_to_add: 5)
  Comment.create(teacher_id: teacher_id, user_id: user_id, content: content)
end

  user = User.create!(name: "Hòa Thị Hường", birth: "16-01-1998", email: "admin@gmail.com", phone:"0378578484", role: 0, password: "123456", password_confirmation: "123456", confirmed_at: Time.now)
  user.avatar.attach io: File.open(Rails.root.join("app", "assets", "images", "default-ava.jpeg")),
    filename: "default-ava.jpeg"
  user.save
