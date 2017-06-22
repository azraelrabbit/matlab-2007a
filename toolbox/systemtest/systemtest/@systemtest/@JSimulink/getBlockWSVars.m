function wsVarsBlk = getBlockWSVars
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    block = gcb;
    wsVarsBlk = {};
    if gt(length(block), 0.0)
        blk = get_param(gcb, 'Object');
        if not(isa(blk, 'Simulink.SubSystem'))
            wsVars = get_param(gcs, 'ReferencedWSVars');
            blk_handle = blk.Handle;
            for i=1.0:length(wsVars)
                for j=1.0:length(wsVars(i).ReferencedBy)
                    if eq(wsVars(i).ReferencedBy(j), blk_handle)
                        wsVarsBlk{plus(length(wsVarsBlk), 1.0)} = wsVars(i).Name;
                    end % if
                end % for
            end % for
        end % if
    end % if
end % function
