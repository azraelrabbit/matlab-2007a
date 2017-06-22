function obj = pildialog(hBlock)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    obj = pilverification.pildialog(hBlock);
    % 12 14
    % 13 14
    obj.Block = hBlock;
    % 15 17
    % 16 17
    parent = obj.Block.getParent;
        while not(isa(parent, 'Simulink.BlockDiagram'))
        parent = parent.getParent;
    end % while
    obj.Root = parent;
    % 22 29
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    pil_interface = obj.getPILInterface;
    if isempty(pil_interface)
        try
            obj.resetPILInterface;
        catch
            [lastMsg, lastId] = lasterr;
            switch lastId
            case cellhorzcat(pil_get_error_id('errorBadSystemPath'), pil_get_error_id('errorBadConfiguration'))
            otherwise
                % 38 39
                rethrow(lasterror);
            end % switch
        end % try
    end % if
end % function
