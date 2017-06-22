function CreateFigure(widgetsObj, mplayObj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    widgetsObj.hfig = figure('tag', 'MPlay', 'NumberTitle', 'off', 'MenuBar', 'none', 'Renderer', 'painters', 'HandleVis', 'callback', 'IntegerHandle', 'off', 'Visible', 'off', 'CloseRequestFcn', @(hco,ev)mplayObj.Close, 'DeleteFcn', @(hco,ev)mplayObj.Close, 'Position', local_getInstancePos(mplayObj.instance), 'BackingStore', 'off', 'DoubleBuffer', 'on', 'userdata', mplayObj);
    % 9 22
    % 10 22
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
end
function instancePos = local_getInstancePos(instance)
    % 23 35
    % 24 35
    % 25 35
    % 26 35
    % 27 35
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    origUnits = get(0.0, 'units');
    set(0.0, 'units', 'pix');
    screenSize = get(0.0, 'screenSize');
    screenSize = screenSize(3.0:4.0);
    set(0.0, 'units', origUnits);
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    defaultSize = [410.0 300.0];
    % 44 46
    scheme = 'short_diagonal';
    switch scheme
    case 'short_diagonal'
        % 48 53
        % 49 53
        % 50 53
        % 51 53
        idx = minus(rem(minus(instance, 1.0), 5.0), 2.0);
        % 53 56
        % 54 56
        startForCenter = mrdivide(minus(screenSize, defaultSize), 2.0);
        % 56 61
        % 57 61
        % 58 61
        % 59 61
        startForCenter(2.0) = minus(startForCenter(2.0), 46.0);
        % 61 64
        % 62 64
        instanceOffset = [50.0 -50.0];
        % 64 75
        % 65 75
        % 66 75
        % 67 75
        % 68 75
        % 69 75
        % 70 75
        % 71 75
        % 72 75
        % 73 75
        instanceXY = plus(startForCenter, times(horzcat(idx, idx), instanceOffset));
        instancePos = horzcat(instanceXY, defaultSize);
    case 'skew_grid'
        % 77 88
        % 78 88
        % 79 88
        % 80 88
        % 81 88
        % 82 88
        % 83 88
        % 84 88
        % 85 88
        % 86 88
        idx = plus(rem(plus(instance, 2.0), 9.0), 1.0);
        % 88 91
        % 89 91
        centerXY = mrdivide(minus(screenSize, defaultSize), 2.0);
        % 91 94
        % 92 94
        [ix, iy] = ind2sub([3.0 3.0], idx);
        % 94 99
        % 95 99
        % 96 99
        % 97 99
        instanceOffset = horzcat(50.0, uminus(min(mrdivide(mrdivide(minus(minus(screenSize(2.0), defaultSize(2.0)), 100.0), 2.0), 5.0), 50.0)));
        % 99 104
        % 100 104
        % 101 104
        % 102 104
        instanceXY = plus(centerXY, times(horzcat(minus(plus(ix, iy), 4.0), minus(plus(ix, mtimes(3.0, iy)), 7.0)), instanceOffset));
        instancePos = horzcat(instanceXY, defaultSize);
    case 'bottom_up'
        % 106 111
        % 107 111
        % 108 111
        % 109 111
        defaultXY = [50.0 60.0];
        instanceOff = [40.0 40.0];
        instanceXY = plus(defaultXY, times(minus(instance, 1.0), instanceOff));
        maxXY = minus(minus(screenSize, defaultXY), defaultSize);
        instanceXY = plus(rem(minus(instanceXY, 1.0), maxXY), 1.0);
        instancePos = horzcat(instanceXY, defaultSize);
    end
end
