function TransformerBlocksCopyFcn(block, NumberOfInternalModels)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    IsLibrary = strcmp(get_param(bdroot(block), 'BlockDiagramType'), 'library');
    % 22 23
    for i=1.0:NumberOfInternalModels
        % 24 25
        i_str = num2str(i);
        % 26 28
        % 27 28
        if not(strcmp(get_param(horzcat(block, '/From', i_str), 'BlockType'), 'Ground'))
            if IsLibrary
                set_param(horzcat(block, '/From', i_str), 'GotoTag', 'LibraryTag');
            else
                tag = tempname;
                set_param(horzcat(block, '/From', i_str), 'GotoTag', tag(minus(end, 7.0):end));
            end % if
        end % if
        % 36 38
        % 37 38
        if not(strcmp(get_param(horzcat(block, '/Goto1', i_str), 'BlockType'), 'Terminator'))
            if IsLibrary
                set_param(horzcat(block, '/Goto1', i_str), 'GotoTag', 'LibraryTag');
            else
                tag = tempname;
                set_param(horzcat(block, '/Goto1', i_str), 'GotoTag', tag(minus(end, 7.0):end));
            end % if
        end % if
        % 46 48
        % 47 48
        if not(strcmp(get_param(horzcat(block, '/Goto2', i_str), 'BlockType'), 'Terminator'))
            if IsLibrary
                set_param(horzcat(block, '/Goto2', i_str), 'GotoTag', 'LibraryTag');
            else
                tag = tempname;
                set_param(horzcat(block, '/Goto2', i_str), 'GotoTag', tag(minus(end, 7.0):end));
            end % if
        end % if
    end % for
end % function
