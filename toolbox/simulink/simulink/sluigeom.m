function outGeom = sluigeom(units)
    % 1 27
    % 2 27
    % 3 27
    % 4 27
    % 5 27
    % 6 27
    % 7 27
    % 8 27
    % 9 27
    % 10 27
    % 11 27
    % 12 27
    % 13 27
    % 14 27
    % 15 27
    % 16 27
    % 17 27
    % 18 27
    % 19 27
    % 20 27
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    if eq(nargin, 0.0)
        units = 'pixels';
    end % if
    % 29 31
    switch units
    case 'points'
        % 32 38
        % 33 38
        % 34 38
        % 35 38
        % 36 38
        inchPerPix = mrdivide(1.0, get(0.0, 'ScreenPixelsPerInch'));
        scale = mtimes(inchPerPix, 72.0);
        % 39 41
        fudgeFactors = ceil(mtimes(i_CreateGeomStruct, scale));
    case 'pixels'
        % 42 48
        % 43 48
        % 44 48
        % 45 48
        % 46 48
        fudgeFactors = i_CreateGeomStruct;
    case 'character'
        % 49 54
        % 50 54
        % 51 54
        % 52 54
        fudgeFactors = i_CreateGeomStructForCharUnits;
    otherwise
        % 55 57
        error('units must be ''pixels'' or ''character'' or ''points''');
        % 57 59
    end % switch
    % 59 62
    % 60 62
    outGeom.pushbutton = fudgeFactors(1.0, :);
    outGeom.radiobutton = fudgeFactors(2.0, :);
    outGeom.checkbox = fudgeFactors(3.0, :);
    outGeom.edit = fudgeFactors(4.0, :);
    outGeom.text = fudgeFactors(5.0, :);
    outGeom.slider = fudgeFactors(6.0, :);
    outGeom.frame = fudgeFactors(7.0, :);
    outGeom.listbox = fudgeFactors(8.0, :);
    outGeom.popupmenu = fudgeFactors(9.0, :);
    outGeom.listboxHscroll = fudgeFactors(10.0, :);
    outGeom.listboxVscroll = fudgeFactors(11.0, :);
end % function
function geom = i_CreateGeomStruct
    % 74 83
    % 75 83
    % 76 83
    % 77 83
    % 78 83
    % 79 83
    % 80 83
    % 81 83
    if isunix
        geom = [0.0 0.0 4.0 4.0 ;  0.0 0.0 26.0 4.0 ;  0.0 0.0 26.0 4.0 ;  0.0 0.0 4.0 4.0 ;  0.0 0.0 0.0 0.0 ;  0.0 0.0 0.0 0.0 ;  0.0 0.0 4.0 4.0 ;  0.0 0.0 4.0 4.0 ;  0.0 0.0 26.0 6.0 ;  0.0 0.0 0.0 17.0 ;  0.0 0.0 19.0 0.0];
    else
        % 85 98
        % 86 98
        % 87 98
        % 88 98
        % 89 98
        % 90 98
        % 91 98
        % 92 98
        % 93 98
        % 94 98
        % 95 98
        % 96 98
        if ispc
            % 98 100
            geom = [0.0 0.0 4.0 4.0 ;  0.0 0.0 18.0 0.0 ;  0.0 0.0 18.0 0.0 ;  0.0 0.0 7.0 4.0 ;  0.0 0.0 0.0 0.0 ;  0.0 0.0 0.0 0.0 ;  0.0 0.0 2.0 2.0 ;  0.0 0.0 16.0 2.0 ;  0.0 0.0 20.0 4.0 ;  0.0 0.0 0.0 18.0 ;  0.0 0.0 0.0 0.0];
        else
            % 101 113
            % 102 113
            % 103 113
            % 104 113
            % 105 113
            % 106 113
            % 107 113
            % 108 113
            % 109 113
            % 110 113
            % 111 113
            % 112 114
            error(horzcat('Invalid computer type ', computer, ' in sluigeom.m'));
            % 114 116
        end % if
    end % if
end % function
function geom = i_CreateGeomStructForCharUnits
    % 119 128
    % 120 128
    % 121 128
    % 122 128
    % 123 128
    % 124 128
    % 125 128
    % 126 128
    if isunix
        geom = [0.0 0.0 2.0 .7 ;  0.0 0.0 0.0 .55 ;  0.0 0.0 3.6 1.0 ;  0.0 0.0 2.0 .7 ;  0.0 0.0 0.0 .33 ;  0.0 0.0 0.0 0.0 ;  0.0 0.0 0.0 0.0 ;  0.0 0.0 0.0 0.0 ;  0.0 0.0 5.0 .9 ;  0.0 0.0 0.0 0.0 ;  0.0 0.0 0.0 0.0];
    else
        % 130 142
        % 131 142
        % 132 142
        % 133 142
        % 134 142
        % 135 142
        % 136 142
        % 137 142
        % 138 142
        % 139 142
        % 140 142
        if ispc
            % 142 144
            geom = [0.0 0.0 3.0 .6 ;  0.0 0.0 0.0 .35 ;  0.0 0.0 3.6 .1 ;  0.0 0.0 3.0 .5 ;  0.0 0.0 .5 .3 ;  0.0 0.0 0.0 0.0 ;  0.0 0.0 0.0 0.0 ;  0.0 0.0 0.0 2.0 ;  0.0 0.0 5.0 .55 ;  0.0 0.0 0.0 0.0 ;  0.0 0.0 0.0 0.0];
        else
            % 145 157
            % 146 157
            % 147 157
            % 148 157
            % 149 157
            % 150 157
            % 151 157
            % 152 157
            % 153 157
            % 154 157
            % 155 157
            % 156 158
            error(horzcat('Invalid computer type ', computer, ' in sluigeom.m'));
            % 158 160
        end % if
    end % if
end % function
