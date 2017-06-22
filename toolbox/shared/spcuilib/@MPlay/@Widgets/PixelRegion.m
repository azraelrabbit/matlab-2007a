function PixelRegion(widgetsObj, newState)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if gt(nargin, 1.0)
        % 7 10
        % 8 10
        isOn = newState;
    else
        % 11 13
        isOn = true;
    end % if
    % 14 17
    % 15 17
    h = widgetsObj.hPixelRegion;
    if isOn
        % 18 20
        if isempty(h) || not(ishandle(h))
            % 20 23
            % 21 23
            widgetsObj.hPixelRegion = impixelregion(widgetsObj.hfig);
            % 23 28
            % 24 28
            % 25 28
            % 26 28
            sp_api = iptgetapi(widgetsObj.hScrollPanel);
            centerPixelRegionCursor(sp_api, widgetsObj.hPixelRegion);
            % 29 33
            % 30 33
            % 31 33
            if not(ismac)
                jf = get(widgetsObj.hPixelRegion, 'javaframe');
                jf.setGroupName('Sinks');
            end % if
            % 36 43
            % 37 43
            % 38 43
            % 39 43
            % 40 43
            % 41 43
            setappdata(widgetsObj.hPixelRegion, 'MPlayListener', CreateImageListener(widgetsObj));
        else
            % 44 47
            % 45 47
            figure(widgetsObj.hPixelRegion);
        end % if
    else
        % 49 51
        widgetsObj.hPixelRegion = [];
        if ishandle(h)
            delete(h);
        end % if
    end % if
    % 55 57
end % function
function listener = CreateImageListener(widgetsObj)
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    pkg = findpackage('hg');
    cl = pkg.findclass('image');
    prop = cl.findprop('cdata');
    listener = handle.listener(handle(widgetsObj.himage), prop, 'PropertyPostSet', cellhorzcat(@local_ClosePixelRegion, widgetsObj.hPixelRegion));
    % 66 69
    % 67 69
end % function
function local_ClosePixelRegion(hco, ev, hPix)
    % 70 75
    % 71 75
    % 72 75
    % 73 75
    delete(hPix);
    % 75 77
end % function
function centerPixelRegionCursor(sp_api, hPixelRegionFig)
    % 78 92
    % 79 92
    % 80 92
    % 81 92
    % 82 92
    % 83 92
    % 84 92
    % 85 92
    % 86 92
    % 87 92
    % 88 92
    % 89 92
    % 90 92
    image_rect = sp_api.getVisibleImageRect();
    new_center_x = plus(image_rect(1.0), mrdivide(image_rect(3.0), 2.0));
    new_center_y = plus(image_rect(2.0), mrdivide(image_rect(4.0), 2.0));
    % 94 96
    pixregion_sp = findobj(hPixelRegionFig, 'Tag', 'PixelRegionPanel');
    rect_api = getappdata(pixregion_sp, 'imrectAPI');
    pixregion_rect = rect_api.getPosition();
    old_center_x = plus(pixregion_rect(1.0), mrdivide(pixregion_rect(3.0), 2.0));
    old_center_y = plus(pixregion_rect(2.0), mrdivide(pixregion_rect(4.0), 2.0));
    % 100 102
    delta_x = minus(new_center_x, old_center_x);
    delta_y = minus(new_center_y, old_center_y);
    % 103 105
    rect_api.setPosition(plus(pixregion_rect, horzcat(delta_x, delta_y, 0.0, 0.0)));
    % 105 107
end % function
function centerPixelRegionCursorAndResize(sp_api, hPixelRegionFig)
    % 108 127
    % 109 127
    % 110 127
    % 111 127
    % 112 127
    % 113 127
    % 114 127
    % 115 127
    % 116 127
    % 117 127
    % 118 127
    % 119 127
    % 120 127
    % 121 127
    % 122 127
    % 123 127
    % 124 127
    % 125 127
    image_rect = sp_api.getVisibleImageRect();
    pixregion_sp = findobj(hPixelRegionFig, 'Tag', 'PixelRegionPanel');
    rect_api = getappdata(pixregion_sp, 'imrectAPI');
    % 129 132
    % 130 132
    new_dx = mrdivide(image_rect(3.0), 2.0);
    new_dy = mrdivide(image_rect(4.0), 2.0);
    % 133 136
    % 134 136
    new_x = minus(plus(image_rect(1.0), mrdivide(image_rect(3.0), 2.0)), mrdivide(new_dx, 2.0));
    new_y = minus(plus(image_rect(2.0), mrdivide(image_rect(4.0), 2.0)), mrdivide(new_dy, 2.0));
    % 137 140
    % 138 140
    rect_api.setPosition(horzcat(new_x, new_y, new_dx, new_dy));
    % 140 142
end % function
