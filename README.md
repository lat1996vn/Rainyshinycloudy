# Rainyshinycloudy
IOS tutorial

Ôn tập lại MVC , custom tbv. Cấu trúc MVC gồm
  - Models: 
    + CurrentWeather.swift: thể hiện thời tiết hiện tại, có func lấy data(JSON) qua url của api dữ liệu trên web 
    + ForeCast.swift: thể hiện dự báo
    + ForeCasts.swift: là 1 mảng của ForeCast(), có func lấy data(JSON) qua url của api dữ liệu trên web
  - Views: tbvCell custom
  - Controllers: WeatherVC.swift
Cách thêm thư viện qua Pods file
Làm quen với JSON và lấy dữ liệu trên web thông data dạng JSON. Đọc dữ liệu từ JSON vào các Model
Các sử dụng closure, lấy closure làm argument của func.

Note chú ý: 
  - để closure completed trong Alamofire request
  - update tbv data khi lấy xong dữ liệu
  - chú ý đến [] là array trong JSON dễ nhìn nhầm
