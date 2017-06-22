function schema
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    pkg = findpackage('Aero');
    c = schema.class(pkg, 'Camera');
    % 12 33
    % 13 33
    % 14 33
    % 15 33
    % 16 33
    % 17 33
    % 18 33
    % 19 33
    % 20 33
    % 21 33
    % 22 33
    % 23 33
    % 24 33
    % 25 33
    % 26 33
    % 27 33
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    sdata = vertcat(cellhorzcat('CoordTransformFcn', 'off', 'MATLAB array', @nullCoordTransform), cellhorzcat('PositionFcn', 'off', 'MATLAB array', @doFirstOrderChaseCameraDynamics), {'Position','off','MATLAB array',[-150.0,-50.0,0.0]}, {'Offset','off','MATLAB array',[-150.0,-50.0,0.0]}, {'AimPoint','off','MATLAB array',[0.0,0.0,0.0]}, {'UpVector','off','MATLAB array',[0.0,0.0,-1.0]}, {'ViewAngle','off','MATLAB array',[3.0]}, {'ViewExtent','off','MATLAB array',[-50.0,50.0]}, {'xlim','off','MATLAB array',[-50.0,50.0]}, {'ylim','off','MATLAB array',[-50.0,50.0]}, {'zlim','off','MATLAB array',[-50.0,50.0]}, {'PrevTime','off','MATLAB array',[0.0]}, {'UserData','off','MATLAB array',[]});
    % 33 51
    % 34 51
    % 35 51
    % 36 51
    % 37 51
    % 38 51
    % 39 51
    % 40 51
    % 41 51
    % 42 51
    % 43 51
    % 44 51
    % 45 51
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    for k=1.0:size(sdata, 1.0)
        p = schema.prop(c, sdata{k, 1.0}, sdata{k, 3.0});
        p.AccessFlags.Serialize = sdata{k, 2.0};
        p.FactoryValue = sdata{k, 4.0};
    end % for
end % function
