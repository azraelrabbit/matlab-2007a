function [boo, offending_name] = utChkforSlashInName(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    boo = false;
    offending_name = '';
    if not(isempty(strfind(h.Name, '/')))
        boo = true;
        offending_name = h.Name;
        return
    end
    % 14 16
    try
        members = struct2cell(get(h));
    catch
        return
    end % try
    % 20 22
    for k=1.0:length(members)
        if isa(members{k}, 'Simulink.Timeseries')
            if not(isempty(strfind(members{k}.Name, '/')))
                boo = true;
                offending_name = members{k}.Name;
                return
            end
        else
            if any(ismember(class(members{k}), {'Simulink.ModelDataLogs','Simulink.SubsysDataLogs','Simulink.StateflowDataLogs','Simulink.ScopeDataLogs','Simulink.TsArray'}))
                [boo, offending_name] = utChkforSlashInName(members{k});
                if boo
                    return
                end
            end
        end
    end % for
end
