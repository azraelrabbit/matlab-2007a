function slr3 = plus(slr1, slr2)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    slr3 = Simulink.rect;
    if isempty(slr1)
        slr3 = slr2;
    else
        if isempty(slr2)
            slr3 = slr1;
        else
            slr3.left = min(slr1.left, slr2.left);
            slr3.top = min(slr1.top, slr2.top);
            slr3.right = max(slr1.right, slr2.right);
            slr3.bottom = max(slr1.bottom, slr2.bottom);
        end % if
    end % if
end % function
