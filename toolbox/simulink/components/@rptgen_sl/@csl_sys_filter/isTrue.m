function tf = isTrue(c, sys)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if lt(nargin, 2.0)
        sys = get(rptgen_sl.appdata_sl, 'CurrentSystem');
    end
    % 9 11
    if isempty(sys)
        tf = logical(0);
        c.status('No system found for filter', 2.0);
    else
        if lt(LocNumBlocks(sys), c.minNumBlocks)
            tf = logical(0);
        else
            if lt(LocNumSubSys(sys), c.minNumSubSystems)
                tf = logical(0);
            else
                tf = LocMaskTest(c.isMask, sys);
            end
        end
    end
end
function nb = LocNumBlocks(sys)
    try
        nb = length(get_param(sys, 'Blocks'));
    catch
        nb = 0.0;
    end % try
end
function ns = LocNumSubSys(sys)
    % 33 36
    % 34 36
    try
        subsys = rptgen_sl.rgFindBlocks(sys, 1.0, {'BlockType','\<SubSystem>\'});
    catch
        % 38 40
        subsys = {};
    end % try
    ns = minus(length(subsys), length(find(strcmp(subsys, sys))));
end
function tf = LocMaskTest(isMask, sys)
    % 44 47
    % 45 47
    if strcmp(isMask, 'either')
        tf = logical(1);
    else
        try
            slType = get_param(sys, 'type');
        catch
            % 52 54
            tf = logical(0);
            return
        end % try
        % 56 58
        if strcmp(slType, 'block_diagram')
            hasMask = logical(0);
        else
            try
                hasMask = strcmp(get_param(sys, 'Mask'), 'on');
            catch
                hasMask = 'no';
            end % try
        end
        % 66 68
        if strcmp(isMask, 'no')
            tf = not(hasMask);
        else
            tf = hasMask;
        end
    end
end
