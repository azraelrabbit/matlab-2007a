function setstate(hSB, state)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    hFig = get(hSB, 'FigureHandle');
    % 13 15
    p_state = [];
    % 15 18
    % 16 18
    index = string2index(hSB, state.currentpanel);
    set(hSB, 'CurrentPanel', index);
    % 19 21
    names = fieldnames(rmfield(state, 'currentpanel'));
    % 21 23
    for i=1.0:length(names)
        % 23 25
        hPanel = getpanelhandle(hSB, names{i});
        % 25 28
        % 26 28
        if not(isequal(hPanel, 0.0))
            if isempty(hPanel)
                hPanel = constructAndSavePanel(hSB, names{i});
            end
            % 31 35
            % 32 35
            % 33 35
            if isstruct(hPanel)
                p_state = getfield(state, names{i});
                feval(hPanel.setstate, hFig, p_state);
            else
                p_state = getfield(state, names{i});
                setstate(hPanel, p_state);
            end
        else
            % 42 44
            if not(isempty(strfind(lower(lasterr), sprintf('tag does not match any currently installed panels.'))))
                % 44 46
                warning(horzcat('File contains information not usable by this version of ', 'FDATool.', char(10.0), 'Loading remaining data.'));
                % 46 48
            end
        end
    end % for
end
