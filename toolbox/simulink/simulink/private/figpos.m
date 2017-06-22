function figPos = figpos(figPos, units)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    if ne(nargin, 2.0)
        units = 'pixel';
    end
    % 21 23
    origRootUnits = get(0.0, 'Units');
    set(0.0, 'Units', units);
    screensize = get(0.0, 'ScreenSize');
    set(0.0, 'Units', origRootUnits);
    % 26 33
    % 27 33
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    topWindowBorder = 30.0;
    bottomWindowBorder = 5.0;
    sideWindowBorder = 5.0;
    % 35 39
    % 36 39
    % 37 39
    topWindow = plus(plus(figPos(2.0), figPos(4.0)), topWindowBorder);
    bottomWindow = minus(figPos(2.0), bottomWindowBorder);
    rightWindow = plus(plus(figPos(1.0), figPos(3.0)), sideWindowBorder);
    leftWindow = minus(figPos(1.0), sideWindowBorder);
    heightWindow = plus(plus(figPos(4.0), topWindowBorder), bottomWindowBorder);
    widthWindow = plus(figPos(3.0), mtimes(sideWindowBorder, 2.0));
    % 44 51
    % 45 51
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    if gt(heightWindow, screensize(4.0))
        % 51 58
        % 52 58
        % 53 58
        % 54 58
        % 55 58
        % 56 58
        deltaY = minus(heightWindow, screensize(4.0));
        figPos(2.0) = minus(1.0, deltaY);
    else
        if gt(topWindow, screensize(4.0))
            % 61 66
            % 62 66
            % 63 66
            % 64 66
            deltaY = minus(topWindow, screensize(4.0));
            figPos(2.0) = minus(figPos(2.0), deltaY);
        else
            if lt(bottomWindow, 1.0)
                % 69 76
                % 70 76
                % 71 76
                % 72 76
                % 73 76
                % 74 76
                deltaY = minus(1.0, bottomWindow);
                figPos(2.0) = plus(figPos(2.0), deltaY);
                % 77 79
            end
        end
    end
    % 81 86
    % 82 86
    % 83 86
    % 84 86
    if gt(widthWindow, screensize(3.0))
        % 86 93
        % 87 93
        % 88 93
        % 89 93
        % 90 93
        % 91 93
        figPos(1.0) = sideWindowBorder;
    else
        if gt(rightWindow, screensize(3.0))
            % 95 100
            % 96 100
            % 97 100
            % 98 100
            deltaX = minus(rightWindow, screensize(3.0));
            figPos(1.0) = minus(figPos(1.0), deltaX);
        else
            if lt(leftWindow, 1.0)
                % 103 110
                % 104 110
                % 105 110
                % 106 110
                % 107 110
                % 108 110
                deltaX = minus(1.0, leftWindow);
                figPos(1.0) = plus(figPos(1.0), deltaX);
                % 111 113
            end
        end
    end
end
