function ov2 = v1convert(ov2, sv1)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    ov2.SysLoopType = sv1.SysLoopType(2.0:end);
    % 9 12
    % 10 12
    ov2.Active = sv1.isActive;
    % 12 15
    % 13 15
    ov2.MdlName = sv1.MdlName;
    ov2.MdlCurrSys = sv1.MdlCurrSys;
    % 16 18
    if ischar(sv1.isMask)
        ov2.isMask = sv1.isMask;
    else
        if sv1.isMask
            ov2.isMask = 'functional';
        else
            ov2.isMask = 'none';
        end % if
    end % if
    if ischar(sv1.isLibrary)
        ov2.isLibrary = sv1.isLibrary;
    else
        if sv1.isLibrary
            ov2.isLibrary = 'on';
        else
            ov2.isLibrary = 'off';
        end % if
    end % if
end % function
