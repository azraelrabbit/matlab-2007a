function move(h, trans, rot)
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
    h.Position = trans;
    h.Rotation = rot;
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    if not(isa(h.CoordTransformFcn, 'function_handle'))
        error('Aero:Body:InvalidCoordTransformHandle', 'To use a custom coordinate transform function, set the CoordTransformFcn property to a valid function handle.');
    end % if
    % 26 27
    [abTrans, abRot] = h.CoordTransformFcn(trans, rot);
    % 28 30
    % 29 30
    hgTrans = uminus(abTrans([1.0 3.0 2.0]));
    hgRot = uminus(abRot([1.0 3.0 2.0]));
    % 32 35
    % 33 35
    % 34 35
    if ishandle(h.ViewingTransform)
        % 36 48
        % 37 48
        % 38 48
        % 39 48
        % 40 48
        % 41 48
        % 42 48
        % 43 48
        % 44 48
        % 45 48
        % 46 48
        % 47 48
        TR = makehgtform('translate', hgTrans, 'yrotate', hgRot(2.0), 'zrotate', hgRot(3.0), 'xrotate', hgRot(1.0));
        % 49 55
        % 50 55
        % 51 55
        % 52 55
        % 53 55
        % 54 55
        set(h.ViewingTransform, 'Matrix', TR);
        % 56 57
    end % if
    % 58 59
end % function
