function e = makeEnum(enumType, varargin)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    if eq(enumType(1.0), '$')
        switch enumType
        case '$rptgen_automanual'
            e = rptgen.enumAutoManual;
        case '$rptgen_table_halign'
            e = rptgen.enumTableHorizAlign;
        otherwise
            error('Unrecognized enumerated type');
        end % switch
    else
        e = rptgen.enum(enumType, varargin{:});
    end % if
end % function
