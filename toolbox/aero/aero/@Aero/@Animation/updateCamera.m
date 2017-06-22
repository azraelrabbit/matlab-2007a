function updateCamera(h, t)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    cam = h.Camera;
    cam.update(t, h.Bodies);
    % 11 12
    xform = h.Camera.CoordTransformFcn;
    % 13 14
    if isa(xform, 'function_handle')
        % 15 19
        % 16 19
        % 17 19
        % 18 19
        upVector = xform(uminus(cam.UpVector([1.0 3.0 2.0])), [0.0 0.0 0.0]);
        pos = xform(uminus(cam.Position([1.0 3.0 2.0])), [0.0 0.0 0.0]);
        aimPt = xform(uminus(cam.AimPoint([1.0 3.0 2.0])), [0.0 0.0 0.0]);
        % 22 23
        minxyz = horzcat(cam.xlim(1.0), cam.ylim(1.0), cam.zlim(1.0));
        maxxyz = horzcat(cam.xlim(2.0), cam.ylim(2.0), cam.zlim(2.0));
        % 25 26
        hgmin = xform(uminus(minxyz([1.0 3.0 2.0])), [0.0 0.0 0.0]);
        hgmax = xform(uminus(maxxyz([1.0 3.0 2.0])), [0.0 0.0 0.0]);
        % 28 31
        % 29 31
        % 30 31
        if ishandle(h.Figure)
            ax = get(h.Figure, 'CurrentAxes');
            set(ax, 'xlim', sort(horzcat(hgmin(1.0), hgmax(1.0))), 'ylim', sort(horzcat(hgmin(2.0), hgmax(2.0))), 'zlim', sort(horzcat(hgmin(3.0), hgmax(3.0))), 'DataAspectRatio', [1.0 1.0 1.0], 'CameraUpVector', upVector, 'CameraPosition', pos, 'CameraTarget', aimPt, 'CameraViewAngle', cam.ViewAngle);
            % 34 44
            % 35 44
            % 36 44
            % 37 44
            % 38 44
            % 39 44
            % 40 44
            % 41 44
            % 42 44
            % 43 44
            drawnow
            % 45 46
        end % if
    else
        % 48 49
        warning('Aero:Animation:CorruptCamera', 'Animation''s camera object has a corrupted coordinate transform function.  Try correcting the camera''s CoordTransformFcn or delete and re-create the animation');
    end % if
    % 51 53
    % 52 53
    h.TCurrent = t;
    % 54 55
end % function
