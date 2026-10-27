funcprot(0); // Tắt cảnh báo định nghĩa lại hàm

function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    // Bước 1: Tính vị trí gốc của tín hiệu ngõ ra y(n)
    yorigin = xorigin + horigin - 1;
    
    // Bước 2: Thực hiện phép chập sử dụng hàm convol của Scilab
    yn = convol(xn, hn);
    
    // Bước 3: Xác định trục thời gian cho các tín hiệu
    n1 = -(xorigin - 1) : (length(xn) - xorigin);
    n2 = -(horigin - 1) : (length(hn) - horigin);
    ny = -(yorigin - 1) : (length(yn) - yorigin);
    
    // Bước 4: Vẽ đồ thị x(n), h(n) và y(n) trên cùng một cửa sổ
    scf(); // Tạo cửa sổ figure mới
    
    // Subplot 1: x(n)
    subplot(3,1,1);
    plot2d3(n1', xn');
    xtitle('Tin hieu dau vao x(n)', 'n', 'x(n)');
    gca().data_bounds = [min(n1)-0.5, min(0, min(xn)*1.2); max(n1)+0.5, max(xn)*1.2];
    
    // Subplot 2: h(n)
    subplot(3,1,2);
    plot2d3(n2', hn');
    xtitle('Ham dac trung he thong h(n)', 'n', 'h(n)');
    gca().data_bounds = [min(n2)-0.5, min(0, min(hn)*1.2); max(n2)+0.5, max(hn)*1.2];
    
    // Subplot 3: y(n)
    subplot(3,1,3);
    plot2d3(ny', yn');
    xtitle('Tin hieu ngo ra y(n) = x(n) * h(n)', 'n', 'y(n)');
    gca().data_bounds = [min(ny)-0.5, min(0, min(yn)*1.2); max(ny)+0.5, max(yn)*1.2];
endfunction
