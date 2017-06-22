function title = gettitle(hFDA, level)
    % 1 26
    % 2 26
    % 3 26
    % 4 26
    % 5 26
    % 6 26
    % 7 26
    % 8 26
    % 9 26
    % 10 26
    % 11 26
    % 12 26
    % 13 26
    % 14 26
    % 15 26
    % 16 26
    % 17 26
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    error(nargchk(1.0, 2.0, nargin));
    % 26 28
    if eq(nargin, 1.0)
        subtitle = getsubtitle(hFDA);
        figtitle = getfigtitle(hFDA);
        title = horzcat(figtitle, ' ', subtitle);
    else
        if strcmpi(level, 'subtitle')
            title = getsubtitle(hFDA);
        else
            if strcmpi(level, 'figtitle')
                title = getfigtitle(hFDA);
            end
        end
    end
end
function subtitle = getsubtitle(hFDA)
    subtitle = get(hFDA, 'SubTitle');
    if isempty(subtitle)
        % 44 48
        % 45 48
        % 46 48
        subtitle = get(hFDA, 'filename');
        % 48 50
        maxStrLen = 50.0;
        if gt(length(subtitle), maxStrLen)
            subtitle = horzcat('...', subtitle(minus(end, maxStrLen):end));
        end
        % 53 55
        if get(hFDA, 'FileDirty')
            subtitle = horzcat(subtitle, ' *');
        end
        subtitle = horzcat('[', subtitle, ']');
    end
end
function figtitle = getfigtitle(hFDA)
    % 61 66
    % 62 66
    % 63 66
    % 64 66
    figtitle = get(hFDA, 'FigureTitle');
    if isempty(figtitle)
        % 67 70
        % 68 70
        figtitle = 'Filter Design & Analysis Tool - ';
    end
end
