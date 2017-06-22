function ch = char(t, myBlanks)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if lt(nargin, 2.0)
        myBlanks = '  ';
    end
    % 12 14
    if not(isempty(t.tag))
        % 14 16
        if t.opt(3.0)
            lbreak = char(10.0);
            closeBlanks = myBlanks;
        else
            lbreak = '';
            closeBlanks = '';
        end
        % 22 24
        openTag = horzcat(myBlanks, '<', t.tag, LocAttributes(t), '>', lbreak);
        if t.opt(2.0)
            closeTag = horzcat(closeBlanks, '</', t.tag, '>\n');
        else
            closeTag = '\n';
        end
        % 29 31
        if t.opt(1.0)
            myBlanks(plus(end, 1.0):plus(end, 2.0)) = '  ';
        else
            myBlanks = '';
        end
    else
        openTag = '';
        closeTag = '';
        lbreak = char(10.0);
    end
    % 40 42
    if not(t.opt(3.0))
        myBlanks = '';
    end
    % 44 46
    ch = horzcat(openTag, LocProcessData(t.data, myBlanks, lbreak, t.opt(4.0)), closeTag);
    % 46 48
end
function myChar = LocProcessData(data, indentBlanks, lbreak, isSGML)
    % 49 53
    % 50 53
    % 51 53
    myChar = '';
    switch class(data)
    case 'cell'
        for i=1.0:length(data)
            myChar = horzcat(myChar, LocProcessData(data{i}, indentBlanks, lbreak, isSGML));
            % 57 62
            % 58 62
            % 59 62
            % 60 62
        end % for
    case 'sgmltag'
        myChar = char(data, indentBlanks);
    case 'char'
        nRow = size(data, 1.0);
        if lt(nRow, 2.0)
            myChar = horzcat(indentBlanks, LocPrepareText(data, isSGML), lbreak);
        else
            if gt(nRow, 1.0)
                data = ctranspose(horzcat(data, mtimes(ones(nRow, 1.0), lbreak)));
                myChar = horzcat(indentBlanks, LocPrepareText(ctranspose(data(:)), isSGML));
            end
        end
    case 'double'
        if gt(size(data, 1.0), 0.0)
            myChar = horzcat(indentBlanks, sprintf('%0.5g ', data), lbreak);
        end
    end
end
function attStr = LocAttributes(t)
    attStr = '';
    for i=1.0:size(t.att, 1.0)
        data = t.att{i, 2.0};
        % 84 86
        if isnumeric(data)
            attStr = horzcat(attStr, ' ', t.att{i, 1.0}, '=', sprintf('%0.5g ', data));
        else
            if ischar(data)
                attStr = horzcat(attStr, ' ', t.att{i, 1.0}, '="', strrep(strrep(strrep(data, '%', '%%'), '\', '\\'), '<', '&lt;'), '"');
            else
                % 91 93
                % 92 94
                warning('Attribute value not a string or character');
            end
        end
    end % for
end
function out = LocPrepareText(in, isSGML)
    % 99 101
    out = strrep(strrep(in, '%', '%%'), '\', '\\');
    % 101 105
    % 102 105
    % 103 105
    if not(isSGML)
        out = strrep(strrep(strrep(strrep(out, '&nbsp;', char([255.0 110.0 98.0 115.0 112.0 59.0])), '&', '&amp;'), char([255.0 110.0 98.0 115.0 112.0 59.0]), '&nbsp;'), '<', '&lt;');
        % 106 111
        % 107 111
        % 108 111
        % 109 111
    end
end
