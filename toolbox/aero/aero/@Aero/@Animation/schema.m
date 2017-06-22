function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    pkg = findpackage('Aero');
    c = schema.class(pkg, 'Animation');
    % 12 29
    % 13 29
    % 14 29
    % 15 29
    % 16 29
    % 17 29
    % 18 29
    % 19 29
    % 20 29
    % 21 29
    % 22 29
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    sdata = {'Name','off','string','';'Figure','off','MATLAB array',[];'FigureCustomizationFcn','off','MATLAB array',[];'Bodies','off','MATLAB array',{};'Camera','off','handle',[];'TimeScaling','off','double',[1.0];'TStart','off','double',[nan];'TFinal','off','double',[nan];'TCurrent','off','double',[0.0];'FramesPerSecond','off','double',[12.0];'MLAnimTimer','off','MATLAB array',[]};
    % 30 45
    % 31 45
    % 32 45
    % 33 45
    % 34 45
    % 35 45
    % 36 45
    % 37 45
    % 38 45
    % 39 45
    % 40 45
    % 41 45
    % 42 45
    % 43 45
    % 44 45
    for k=1.0:size(sdata, 1.0)
        p = schema.prop(c, sdata{k, 1.0}, sdata{k, 3.0});
        p.AccessFlags.Serialize = sdata{k, 2.0};
        p.FactoryValue = sdata{k, 4.0};
        if any(strmatch(sdata{k, 1.0}, {'MLAnimTimer'}, 'exact'))
            p.Visible = 'off';
            p.AccessFlags.publicSet = 'off';
        end % if
    end % for
end % function
