function i = getCompInfo(varargin)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    if eq(length(varargin), 0.0)
        varargin = rptgen.getCompList;
    end % if
    % 17 19
    i = struct('class', {}, 'name', {}, 'description', {}, 'type', {});
    for j=1.0:length(varargin)
        i(plus(end, 1.0)) = locGetInfo(varargin{j});
    end % for
    % 22 25
    % 23 25
    if not(isempty(i))
        % 25 27
        dName = cellhorzcat(i.name);
        [dName, sortIdx] = sort(lower(dName));
        i = i(sortIdx);
    end % if
function i = locGetInfo(className)
    % 31 35
    % 32 35
    % 33 35
    try
        cName = eval(horzcat(className, '.getName;'));
    catch
        cName = horzcat('(', className, ')');
    end % try
    % 39 41
    try
        cDesc = eval(horzcat(className, '.getDescription;'));
    catch
        cDesc = '<No description found>';
    end % try
    % 45 47
    try
        cType = eval(horzcat(className, '.getType;'));
    catch
        cType = 'Undefined Type';
    end % try
    % 51 53
    i = struct('class', className, 'name', cName, 'description', cDesc, 'type', cType);
    % 53 56
    % 54 56
