function subsysCap = bcstCreateCap(block, capString, trans)
    % 1 46
    % 2 46
    % 3 46
    % 4 46
    % 5 46
    % 6 46
    % 7 46
    % 8 46
    % 9 46
    % 10 46
    % 11 46
    % 12 46
    % 13 46
    % 14 46
    % 15 46
    % 16 46
    % 17 46
    % 18 46
    % 19 46
    % 20 46
    % 21 46
    % 22 46
    % 23 46
    % 24 46
    % 25 46
    % 26 46
    % 27 46
    % 28 46
    % 29 46
    % 30 46
    % 31 46
    % 32 46
    % 33 46
    % 34 46
    % 35 46
    % 36 46
    % 37 46
    % 38 46
    % 39 46
    % 40 46
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    flds = fields(trans);
    legalCaps = strcat(flds{:});
    % 47 51
    % 48 51
    % 49 51
    if strcmp(capString, '+')
        parseString = sprintf('%s;', flds{:});
    else
        parseString = capString;
    end
    % 55 58
    % 56 58
    caps = getInitialCap(trans);
    % 58 61
    % 59 61
    while gt(length(parseString), 0.0)
        split = regexp(parseString, horzcat('^([', legalCaps, '])', '(-|\.|)', '(([a-zA-Z][a-zA-Z0-9_]+(,|))+|)', '(;|)', '(.*)$'), 'tokens');
        % 62 70
        % 63 70
        % 64 70
        % 65 70
        % 66 70
        % 67 70
        % 68 70
        try
            cap = split{1.0}{1.0};
            div = split{1.0}{2.0};
            note = split{1.0}{3.0};
        catch
            blockName = regexprep(horzcat(get_param(block, 'Parent'), '/', get_param(block, 'Name')), '\s', ' ');
            DAStudio.error('Simulink:bcst:ErrCannotParse', blockName, capString);
        end % try
        % 77 79
        parseString = split{1.0}{5.0};
        if eq(length(cap), 1.0)
            if ~(strcmp(div, '-'))
                suppStr = 'Yes';
            else
                suppStr = 'No';
            end
            if gt(length(note), 0.0)
                caps.(trans.(cap)) = CapStruct(trans.(cap), suppStr, note);
            else
                caps.(trans.(cap)) = CapStruct(trans.(cap), suppStr);
            end
        else
            blockName = regexprep(horzcat(get_param(block, 'Parent'), '/', get_param(block, 'Name')), '\s', ' ');
            DAStudio.error('Simulink:bcst:ErrIllegalCapStr', blockName, capString);
        end
    end % while
    % 95 98
    % 96 98
    cellCaps = struct2cell(caps);
    % 98 101
    % 99 101
    subsysCap = Capabilities(CapSet(cellCaps{:}));
end
function initialCap = getInitialCap(trans)
    % 103 107
    % 104 107
    % 105 107
    caps = struct2cell(trans);
    for capIdx=1.0:length(caps)
        capName = caps{capIdx};
        initialCap.(capName) = CapStruct(capName, 'no');
    end % for
end
