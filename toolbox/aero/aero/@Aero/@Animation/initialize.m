function initialize(h)
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
    skyColor = [.8 .8 .9];
    % 13 14
    if ishandle(h.Figure)
        % 15 16
        delete(h.Figure);
        % 17 19
        % 18 19
        for k=1.0:numel(h.Bodies)
            b = h.Bodies{k};
            b.PatchHandles = [];
            b.ViewingTransform = [];
        end % for
    end % if
    % 25 26
    if gt(numel(h.Name), 0.0)
        figTitle = h.Name;
    else
        figTitle = 'Aero.Animation';
    end % if
    % 31 32
    h.Figure = figure('Color', skyColor, 'Name', figTitle, 'Renderer', 'OpenGL', 'UserData', h, 'Visible', 'off', 'NumberTitle', 'off', 'MenuBar', 'none', 'PaperPositionMode', 'auto', 'IntegerHandle', 'off', 'HandleVisibility', 'on');
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
    % 45 46
    if not(isa(h.Camera, 'Aero.Camera'))
        h.Camera = Aero.Camera;
    end % if
    % 49 50
    ax = axes;
    set(ax, 'xlim', h.Camera.xlim, 'ylim', h.Camera.ylim, 'zlim', h.Camera.zlim, 'Visible', 'off', 'Projection', 'perspective', 'units', 'normal', 'DrawMode', 'normal', 'PlotBoxAspectRatioMode', 'manual', 'PlotBoxAspectRatio', [1.0 1.0 1.0], 'DataAspectRatioMode', 'manual', 'DataAspectRatio', [1.0 1.0 1.0], 'CameraViewAngleMode', 'manual', 'CameraViewAngle', h.Camera.ViewAngle, 'CameraTarget', h.Camera.AimPoint);
    % 52 67
    % 53 67
    % 54 67
    % 55 67
    % 56 67
    % 57 67
    % 58 67
    % 59 67
    % 60 67
    % 61 67
    % 62 67
    % 63 67
    % 64 67
    % 65 67
    % 66 67
    for k=1.0:numel(h.Bodies)
        h.Bodies{k}.generatePatches(ax);
    end % for
    % 70 73
    % 71 73
    % 72 73
    if isa(h.FigureCustomizationFcn, 'function_handle')
        h.FigureCustomizationFcn(h.Figure);
    end % if
    % 76 77
end % function
