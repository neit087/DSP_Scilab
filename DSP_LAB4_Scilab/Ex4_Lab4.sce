// TỰ TẠO ÂM THANH ĐỂ TEST 
Fs = 8000; // Tần số lấy mẫu 8000 Hz
t = 0:1/Fs:2; // Tạo trục thời gian dài 2 giây
y = sin(2 * %pi * 1000 * t); // Tạo sóng sine tần số 1000 Hz (tiếng bíp)

// 1. Phát âm thanh (Nhớ mở loa máy tính Windows của bạn)
playsnd(y, Fs);

// 2. Hiển thị dạng sóng âm thanh (chỉ vẽ 100 mẫu đầu tiên cho dễ nhìn)
figure(0);
plot(t(1:100), y(1:100));
xtitle("Bieu do tin hieu am thanh", "Thoi gian (s)", "Bien do");
