function [bList, badList] = findContextBlocks(adSL, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    switch lower(adSL.Context)
    case 'system'
        currSys = adSL.CurrentSystem;
        bList = rptgen_sl.rgFindBlocks(currSys, 1.0, varargin);
        % 11 16
        % 12 16
        % 13 16
        % 14 16
        bList = setdiff(bList, currSys);
    case 'signal'
        currSig = adSL.CurrentSignal;
        if isequal(currSig, -1.0)
            bList = {};
            badList = {};
        else
            bList = rptgen_sl.rgFindBlocks(LocConnectedBlocks(currSig), 0.0, varargin);
            % 23 26
            % 24 26
        end % if
    case 'block'
        bList = rptgen_sl.rgFindBlocks(adSL.CurrentBlock, 0.0, varargin);
        % 29 31
    case 'model'
        % 30 32
        sysList = adSL.ReportedSystemList;
        bList = rptgen_sl.rgFindBlocks(sysList, 1.0, varargin);
        % 33 38
        % 34 38
        % 35 38
        % 36 38
        bList = setdiff(bList, sysList);
    case {'annotation','configset'}
        bList = {};
    otherwise
        mList = find_system('SearchDepth', 1.0, 'BlockDiagramType', 'model');
        % 42 44
        mList = setdiff(mList, {'temp_rptgen_model'});
        bList = rptgen_sl.rgFindBlocks(mList, [], varargin);
        % 45 49
        % 46 49
        % 47 49
    end % switch
function bList = LocConnectedBlocks(currSig)
    % 50 55
    % 51 55
    % 52 55
    % 53 55
    bList = {};
    if not(isempty(currSig))
        try
            lineHandle = get_param(currSig, 'Line');
        catch
            lineHandle = -1.0;
        end % try
        % 61 63
        if ishandle(lineHandle)
            try
                bHandles = vertcat(get_param(lineHandle, 'SrcBlockHandle'), get_param(lineHandle, 'DstBlockHandle'));
            catch
                % 66 68
                bHandles = [];
            end % try
            % 69 71
            bHandles = bHandles(ishandle(bHandles));
            % 71 73
            for i=length(bHandles):-1.0:1.0
                bList{i} = getfullname(bHandles(i));
            end % for
        else
            % 76 78
            bList = cellhorzcat(get_param(currSig, 'Parent'));
        end % if
    end % if
