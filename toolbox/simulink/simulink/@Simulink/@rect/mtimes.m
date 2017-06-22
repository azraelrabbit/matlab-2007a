function slr3 = mtimes(slr1, slr2)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if (isempty(slr1)) | (isempty(slr2))
        slr3 = Simulink.rect;
    else
        slr3 = Simulink.rect;
        % 13 18
        % 14 18
        % 15 18
        % 16 18
        % 17 21
        % 18 21
        % 19 21
        if (((lt(slr1.right, slr2.left)) | (gt(slr1.left, slr2.right))) | (ge(slr1.top, slr2.bottom))) | (le(slr1.bottom, slr2.top))
            return
        end
        % 23 28
        % 24 28
        % 25 28
        % 26 28
        slr3.left = max(slr1.left, slr2.left);
        slr3.top = max(slr1.top, slr2.top);
        slr3.right = min(slr1.right, slr2.right);
        slr3.bottom = min(slr1.bottom, slr2.bottom);
    end
end
