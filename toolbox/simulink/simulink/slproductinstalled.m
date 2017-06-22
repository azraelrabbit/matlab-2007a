function status = slproductinstalled(productName)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    try
        MpcObj = slprivate('slchecklicense', productName, 'quiet');
    end % try
    if eq(MpcObj, 1.0)
        status = 0.0;
    else
        status = 1.0;
    end % if
end % function
