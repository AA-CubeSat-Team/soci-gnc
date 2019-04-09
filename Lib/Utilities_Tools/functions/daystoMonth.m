function [m,d] = daystoMonth(d_y,y,y_epoch)

    monthDays = [0,31,... %january
        (31 + 28),... %february
        (31 + 28 + 31),... %march
        (31 + 28 + 31 + 30),... %april
        (31 + 28 + 31 + 30 + 31),... %may
        (31 + 28 + 31 + 30 + 31 + 30 ),... %june
        (31 + 28 + 31 + 30 + 31 + 30 + 31 ),... %july
        (31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 ),... %august
        (31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 ),... %september
        (31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31),... %october
        (31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30),... %november
        (31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30 + 31),... %december
        ];


    monthDaysLeap = [0,31,... %january
        (31 + 29),... %february
        (31 + 29 + 31),... %march
        (31 + 29 + 31 + 30),... %april
        (31 + 29 + 31 + 30 + 31),... %may
        (31 + 29 + 31 + 30 + 31 + 30 ),... %june
        (31 + 29 + 31 + 30 + 31 + 30 + 31 ),... %july
        (31 + 29 + 31 + 30 + 31 + 30 + 31 + 31 ),... %august
        (31 + 29 + 31 + 30 + 31 + 30 + 31 + 31 + 30 ),... %september
        (31 + 29 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31),... %october
        (31 + 29 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30),... %november
        (31 + 29 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30 + 31),... %december
        ];
    
    m = 0;
    d = 0;
% Calculate the current month froms days elapsed
    if (Is_Leap(y_epoch + y) == 1)
        for i=1:length(monthDays)
            if d_y < monthDays(i)
               m = i - 1 ;
               d = d_y - monthDays(i - 1);
               d_y = 370;
            end
        end
    else
        for i=1:length(monthDaysLeap)
            if d_y < monthDaysLeap(i)
               m = i - 1 ;
               d = d_y - monthDays(i - 1);
               d_y = 370;
            end
        
        end
    end
end
