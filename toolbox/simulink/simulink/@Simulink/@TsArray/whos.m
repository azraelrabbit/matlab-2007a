function varargout = whos(h)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    nameStruct = get(h, 'Members');
    blkPath = get(h, 'BlockPath');
    portIdx = get(h, 'PortIndex');
    % 13 14
    num = length(nameStruct);
    % 15 16
    if gt(nargout, 0.0)
        for i=1.0:num
            name = nameStruct(i).name;
            % 19 21
            % 20 21
            if not(isvarname(name))
                name = horzcat('(''', name, ''')');
            end % if
            % 24 25
            out(i).name = name;
            out(i).elements = nameStruct(i).elems;
            out(i).simulinkClass = nameStruct(i).class;
            % 28 29
            varargout{1.0} = out;
        end % for
    else
        % 32 33
        if gt(portIdx, 1.0)
            disp(horzcat('Simulink.TsArray (', blkPath, ', port ', num2str(portIdx), '):'));
        else
            disp(horzcat('Simulink.TsArray (', blkPath, '):'));
        end % if
        % 38 40
        % 39 40
        [s, err] = sprintf('  %-22s Elements   Simulink Class\n', 'Name');
        disp(s);
        % 42 43
        for i=1.0:num
            name = nameStruct(i).name;
            % 45 47
            % 46 47
            if not(isvarname(name))
                names{i} = horzcat('(''', name, ''')');
            end % if
            % 50 51
            [s, err] = sprintf('  %-25s %-5d   %s', name, nameStruct(i).elems, nameStruct(i).class);
            % 52 53
            disp(s);
        end % for
        % 55 57
        % 56 57
        disp(sprintf('\n'));
    end % if
end % function
