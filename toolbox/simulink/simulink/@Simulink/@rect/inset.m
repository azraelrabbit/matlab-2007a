function slr = inset(slr, hInset, vInset)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    slr.left = plus(slr.left, hInset);
    slr.top = plus(slr.top, vInset);
    slr.right = minus(slr.right, hInset);
    slr.bottom = minus(slr.bottom, vInset);
end % function
