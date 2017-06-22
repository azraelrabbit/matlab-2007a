function h = show(t)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    h = figure('BackingStore', 'off', 'HitTest', 'off', 'IntegerHandle', 'off', 'Interruptible', 'off', 'MenuBar', 'none', 'Name', 'sgmltag object viewer', 'NumberTitle', 'off', 'Position', [150.0 150.0 50.0 50.0], 'Renderer', 'painters', 'RendererMode', 'manual', 'Tag', 'SGMLTAG_OBJECT_VIEWER', 'Visible', 'on');
    % 21 34
    % 22 34
    % 23 34
    % 24 34
    % 25 34
    % 26 34
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    LocProcess(t, h);
end
function LocProcess(data, pH)
    % 36 39
    % 37 39
    processChildren = logical(0);
    makeHandle = logical(1);
    switch class(data)
    case 'cell'
        myLabel = '';
        for i=1.0:length(data)
            LocProcess(data{i}, pH);
        end % for
        makeHandle = logical(0);
    case 'char'
        tempData = ctranspose(data);
        myLabel = strrep(ctranspose(tempData(:)), sprintf('\n'), ' ');
    case 'double'
        myLabel = num2str(data);
    case 'sgmltag'
        processChildren = logical(1);
        myLabel = horzcat('<', data.tag, '>');
    otherwise
        myLabel = '[unrecognized data type]';
    end
    % 58 60
    if makeHandle
        h = uimenu('Label', myLabel, 'Parent', pH, 'UserData', data, 'Callback', 'sgmlBrowse=get(gcbo,''UserData'')');
        % 61 65
        % 62 65
        % 63 65
        if processChildren
            LocProcess(data.data, h);
        end
    end
end
