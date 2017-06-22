function ccopenfcn(codeSection)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    hand = get_param(gcb, 'handle');
    % 17 19
    % 18 19
    data = get_param(hand, 'RTWdata');
    % 20 22
    % 21 22
    ansTopEmpty = 1.0;
    ansBottomEmpty = 1.0;
    ansMiddleEmpty = 1.0;
    if length(data)
        if isfield(data, 'Top')
            cr = find(eq(data.Top, sprintf('\n')));
            data.Top(cr) = [];
            ansTop = ctranspose(reshape(data.Top, mrdivide(length(data.Top), length(cr)), length(cr)));
            ansTopEmpty = 0.0;
        end % if
        if isfield(data, 'Middle')
            cr = find(eq(data.Middle, sprintf('\n')));
            data.Middle(cr) = [];
            ansMiddle = ctranspose(reshape(data.Middle, mrdivide(length(data.Middle), length(cr)), length(cr)));
            ansMiddleEmpty = 0.0;
        end % if
        if isfield(data, 'Bottom')
            cr = find(eq(data.Bottom, sprintf('\n')));
            data.Bottom(cr) = [];
            ansBottom = ctranspose(reshape(data.Bottom, mrdivide(length(data.Bottom), length(cr)), length(cr)));
            ansBottomEmpty = 0.0;
        end % if
    end % if
    if ansTopEmpty
        ansTop = '';
    end % if
    if ansBottomEmpty
        ansBottom = '';
    end % if
    if ansMiddleEmpty
        ansMiddle = '';
    end % if
    % 54 56
    % 55 56
    if eq(length(findstr(codeSection, 'Function')), 0.0)
        prompt = cellhorzcat(horzcat('Top of ', codeSection), horzcat('Bottom of ', codeSection));
        def = cellhorzcat(ansTop, ansBottom);
        lineNo = [10.0 ;  10.0];
    else
        prompt = cellhorzcat(horzcat(codeSection, ' Declaration Code'), horzcat(codeSection, ' Execution Code'), horzcat(codeSection, ' Exit Code'));
        % 62 63
        def = cellhorzcat(ansTop, ansMiddle, ansBottom);
        lineNo = [5.0 ;  10.0 ;  10.0];
    end % if
    title = horzcat(codeSection, ' Custom Code');
    answer = inputdlg(prompt, title, lineNo, def, 'on');
    if eq(length(answer), 0.0)
        % 69 70
        return;
    end % if
    % 72 74
    % 73 74
    newdataempty = 1.0;
    newdata.TLCFile = 'custcode';
    newdata.Location = codeSection;
    temp = answer{1.0};
    if length(temp)
        temp = vertcat(ctranspose(temp), mtimes(sprintf('\n'), ones(1.0, size(temp, 1.0))));
        newdata.Top = ctranspose(temp(:));
        newdataempty = 0.0;
    end % if
    temp = answer{2.0};
    if ne(length(findstr(codeSection, 'Function')), 0.0)
        if length(temp)
            temp = vertcat(ctranspose(temp), mtimes(sprintf('\n'), ones(1.0, size(temp, 1.0))));
            newdata.Middle = ctranspose(temp(:));
            newdataempty = 0.0;
        end % if
        temp = answer{3.0};
        if length(temp)
            temp = vertcat(ctranspose(temp), mtimes(sprintf('\n'), ones(1.0, size(temp, 1.0))));
            newdata.Bottom = ctranspose(temp(:));
            newdataempty = 0.0;
        end % if
    else
        if length(temp)
            temp = vertcat(ctranspose(temp), mtimes(sprintf('\n'), ones(1.0, size(temp, 1.0))));
            newdata.Bottom = ctranspose(temp(:));
            newdataempty = 0.0;
        end % if
    end % if
    % 103 105
    % 104 105
    if newdataempty
        set_param(hand, 'RTWdata', []);
    else
        set_param(hand, 'RTWdata', newdata);
    end % if
end % function
