# sử dụng image Nginx chính thức
FROM nginx:stable-alpine3.20-perl

# đặt thư mục làm việc
WORKDIR /usr/share/nginx/html

# sao chép tệp index.html vào thư mục làm việc
COPY index.html .

# mở cổng 80
EXPOSE 80

# chạy Nginx ở chế độ foreground
CMD ["nginx", "-g", "daemon off;"]

#dùng docker file tạo ra image