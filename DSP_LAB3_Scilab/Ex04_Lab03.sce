funcprot(0); // Tắt cảnh báo định nghĩa lại hàm

function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    // Bước 1: Xác định khoảng cách từ gốc đến hai đầu mút của x1 và x2
    left1 = x1origin - 1;
    right1 = length(x1n) - x1origin;
    
    left2 = x2origin - 1;
    right2 = length(x2n) - x2origin;
    
    // Bước 2: Xác định miền thời gian chung cho tín hiệu tổng y(n)
    max_left = max(left1, left2);
    max_right = max(right1, right2);
    
    yorigin = max_left + 1;
    total_len = max_left + max_right + 1;
    
    // Bước 3: Đệm giá trị 0 để căn chỉnh x1 và x2 về cùng hệ quy chiếu thời gian
    start1 = yorigin - x1origin + 1;
    end1 = start1 + length(x1n) - 1;
    
    start2 = yorigin - x2origin + 1;
    end2 = start2 + length(x2n) - 1;
    
    y1_full = zeros(1, total_len);
    y1_full(start1:end1) = x1n;
    
    y2_full = zeros(1, total_len);
    y2_full(start2:end2) = x2n;
    
    // Thực hiện phép cộng tín hiệu
    yn = y1_full + y2_full;
    
    // Bước 4: Khai báo trục thời gian
    n1 = -left1:right1;
    n2 = -left2:right2;
    ny = -max_left:max_right;
    
    // Bước 5: Vẽ đồ thị x1(n), x2(n) và y(n) trên cùng một cửa sổ
    scf(); // Tạo cửa sổ figure mới
    
    // Subplot 1: x1(n)
    subplot(3,1,1);
    plot2d3(n1', x1n');
    xtitle('Tin hieu x1(n)', 'n', 'x1(n)');
    gca().data_bounds = [min(n1)-0.5, min(0, min(x1n)*1.2); max(n1)+0.5, max(x1n)*1.2];
    
    // Subplot 2: x2(n)
    subplot(3,1,2);
    plot2d3(n2', x2n');
    xtitle('Tin hieu x2(n)', 'n', 'x2(n)');
    gca().data_bounds = [min(n2)-0.5, min(0, min(x2n)*1.2); max(n2)+0.5, max(x2n)*1.2];
    
    // Subplot 3: y(n)
    subplot(3,1,3);
    plot2d3(ny', yn');
    xtitle('Tin hieu tong y(n) = x1(n) + x2(n)', 'n', 'y(n)');
    gca().data_bounds = [min(ny)-0.5, min(0, min(yn)*1.2); max(ny)+0.5, max(yn)*1.2];
endfunction
