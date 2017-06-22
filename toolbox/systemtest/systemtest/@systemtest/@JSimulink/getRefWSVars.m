function wsVars = getRefWSVars(pathstring, modelname)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    wsVars = [];
    modelopen = false;
    opendiagrams = find_system('type', 'block_diagram');
    for i=1.0:length(opendiagrams)
        if strcmp(modelname, opendiagrams(i))
            modelopen = true;
            break
        end % if
    end % for
    if not(modelopen)
        load_system(pathstring);
    end % if
    vars = get_param(modelname, 'ReferencedWSVars');
    if not(isempty(vars))
        vars = rmfield(vars, 'ReferencedBy');
        wsVars = struct2cell(vars);
    end % if
end % function
