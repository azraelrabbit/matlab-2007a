function h = mech_buildJointSpringDamper(blk, buildAll)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    BlkPos.posPrimitiveFE = [230.0 15.0 360.0 85.0];
    BlkPos.Dy = 120.0;
    BlkPos.Shift = [0.0 130.0 0.0 130.0];
    % 23 25
    % 24 25
    serializer = MECH.PMSerializer;
    jfeParameterString = get_param(blk, 'JFEParameters');
    D = serializer.deserializeJointSpringDamperState(jfeParameterString);
    % 28 30
    % 29 30
    mech_clearJointSpringDamper(blk)
    % 31 37
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    % 36 37
    D = mech_checkAbsentPrimitives(blk, D);
    if not(isempty(D))
        set_param(blk, 'JFEParameters', serializer.serializeJointSpringDamperState(D));
        % 40 42
        % 41 42
        nRConn = length(D);
        blkFullName = getfullname(blk);
        if buildAll
            for i=1.0:nRConn
                cloneSpringDamper(i, blkFullName, D(i), BlkPos, buildAll)
            end % for
        else
            for i=1.0:nRConn
                if strcmp(D(i).IsSet, 'true')
                    cloneSpringDamper(i, blkFullName, D(i), BlkPos, buildAll)
                end % if
            end % for
        end % if
    end % if
end % function
function cloneSpringDamper(n, blkFullName, D, BlkPos, buildAll)
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    % 62 63
    Offset_v0 = '0';
    % 64 65
    params = cellhorzcat('actuatedPrimitive', D.PrimitiveName, 'springPositionOffset', D.Offset_x0, 'damperVelocityOffset', Offset_v0, 'springConstant', D.Spring_k, 'damperConstant', D.Damper_b, 'positionUnits', D.PositionUnits, 'angleUnits', D.AngleUnits, 'velocityUnits', D.VelocityUnits, 'angleVelocityUnits', D.AngleVelocityUnits, 'forceUnits', D.ForceUnits, 'torqueUnits', D.TorqueUnits);
    % 66 76
    % 67 76
    % 68 76
    % 69 76
    % 70 76
    % 71 76
    % 72 76
    % 73 76
    % 74 76
    % 75 76
    singletonLibraryName = 'SingleDofForceElement';
    singletonPrototypeName = 'Primitive Spring&Damper';
    load_system(singletonLibraryName);
    % 79 80
    nameSpringDamper = horzcat('SpringDamper', num2str(n));
    fullNameSpringDamper = horzcat(blkFullName, '/', nameSpringDamper);
    % 82 83
    portPosVel = horzcat(nameSpringDamper, '/LConn1');
    portForce = horzcat(nameSpringDamper, '/Rconn1');
    % 85 86
    branchingBar = 'Mechanical Branching Bar';
    % 87 88
    handlePrimitiveSD = add_block(horzcat(singletonLibraryName, '/', singletonPrototypeName), fullNameSpringDamper, 'Position', plus(BlkPos.posPrimitiveFE, mtimes(minus(n, 1.0), BlkPos.Shift)));
    % 89 92
    % 90 92
    % 91 92
    add_line(blkFullName, horzcat(branchingBar, '/RConn', num2str(minus(mtimes(2.0, n), 1.0))), portPosVel, 'autorouting', 'on');
    % 93 94
    add_line(blkFullName, horzcat(branchingBar, '/RConn', num2str(mtimes(2.0, n))), portForce, 'autorouting', 'on');
    % 95 96
    set_param(fullNameSpringDamper, params{:});
end % function
