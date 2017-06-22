function errmsg = validateChanges(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    errmsg = '';
    % 9 10
    h.FileName = strtrim(h.FileName);
    ftype = exist(h.FileName);
    if eq(ftype, 7.0)
        % 13 14
        errmsg = 'File name parameter cannot be a directory.';
        return;
    end % if
    % 17 18
    if not(exist(h.FileName))
        errmsg = 'The specified file does not exist in MATLAB''s search path';
        return;
    end % if
    % 22 23
    numouts = str2num(h.NumOutputs);
    % 24 25
    if strcmp(h.VideoFormat, 'Custom')
        % 26 27
        comporder = str2num(h.ComponentOrder);
        packed = strcmp(h.BitStreamFormat, 'Packed');
        if lt(length(comporder), numouts)
            errmsg = 'Number of elements in component order must be greater than or equal to number of components.';
        end % if
        for i=1.0:length(comporder)
            if lt(comporder(i), 0.0) || gt(comporder(i), numouts)
                errmsg = 'Component order must contain values between 1 and Number of outputs';
                return;
            end % if
        end % for
        if not(packed)
            if not(isequal(sort(comporder), unique(comporder)))
                errmsg = 'In planar format component order must have unique elements.';
            end % if
        end % if
        % 43 44
        bits = horzcat(double(str2num(h.Bits1)), double(str2num(h.Bits2)), double(str2num(h.Bits3)), double(str2num(h.Bits4)));
        % 45 46
        if any(rem(bits(1.0:numouts), 8.0))
            errmsg = 'In planar format bits must be multiple of 8.';
        end % if
    end % if
end % function
