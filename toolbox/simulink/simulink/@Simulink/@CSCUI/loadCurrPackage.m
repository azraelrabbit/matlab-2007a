function loadCurrPackage(hUI)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    try
        % 6 9
        % 7 9
        before_cscIndex = hUI.Index(1.0);
        before_msIndex = hUI.Index(2.0);
        before_CSCActiveSubTab = hUI.CSCActiveSubTab;
        % 11 14
        % 12 14
        try_prior_csc = false;
        try_prior_ms = false;
        % 15 20
        % 16 20
        % 17 20
        % 18 20
        if ge(length(hUI.AllDefns{1.0}), plus(before_cscIndex, 1.0)) && ge(length(hUI.AllDefns{2.0}), plus(before_msIndex, 1.0))
            % 20 23
            % 21 23
            before_cscName = hUI.AllDefns{1.0}(plus(before_cscIndex, 1.0)).get('Name');
            before_msName = hUI.AllDefns{2.0}(plus(before_msIndex, 1.0)).get('Name');
            % 24 27
            % 25 27
            try_prior_csc = true;
            try_prior_ms = true;
        end
        % 29 32
        % 30 32
        hUI.Index(1.0) = 0.0;
        hUI.Index(2.0) = 0.0;
        % 33 38
        % 34 38
        % 35 38
        % 36 38
        hUI.CSCActiveSubTab = before_CSCActiveSubTab;
        % 38 40
        hw = waitbar(0.0, horzcat('Loading definitions of package "', hUI.CurrPackage, '"'), 'Name', 'Please wait...');
        % 40 44
        % 41 44
        % 42 44
        tmpstr = 'processcsc(''GetCSCDefns'', hUI.CurrPackage, true)';
        [errs1, hUI.AllDefns{1.0}] = evalc(tmpstr);
        waitbar(.5, hw);
        % 46 48
        tmpstr = 'processcsc(''GetMemorySectionDefns'', hUI.CurrPackage, true)';
        [errs2, hUI.AllDefns{2.0}] = evalc(tmpstr);
        waitbar(1.0, hw);
        % 50 54
        % 51 54
        % 52 54
        if try_prior_csc
            matchidx = strmatch(before_cscName, hUI.Alldefns{1.0}.get('Name'), 'exact');
            if not(isempty(matchidx))
                hUI.Index(1.0) = minus(matchidx, 1.0);
            end
        end
        % 59 63
        % 60 63
        % 61 63
        if try_prior_ms
            matchidx = strmatch(before_msName, hUI.Alldefns{2.0}.get('Name'), 'exact');
            if not(isempty(matchidx))
                hUI.Index(2.0) = minus(matchidx, 1.0);
            end
        end
        % 68 71
        % 69 71
        for idx=1.0:length(hUI.AllDefns{1.0})
            % 71 73
            tmp = hUI.Alldefns{1.0}(idx).get('TypeComment');
            tmp = convertForEditarea(tmp);
            hUI.Alldefns{1.0}(idx).set('TypeComment', tmp);
            % 75 77
            tmp = hUI.Alldefns{1.0}(idx).get('DeclareComment');
            tmp = convertForEditarea(tmp);
            hUI.Alldefns{1.0}(idx).set('DeclareComment', tmp);
            % 79 81
            tmp = hUI.Alldefns{1.0}(idx).get('DefineComment');
            tmp = convertForEditarea(tmp);
            hUI.Alldefns{1.0}(idx).set('DefineComment', tmp);
        end % for
        % 84 86
        for idx=1.0:length(hUI.AllDefns{2.0})
            % 86 88
            tmp = hUI.Alldefns{2.0}(idx).get('Comment');
            tmp = convertForEditarea(tmp);
            hUI.Alldefns{2.0}(idx).set('Comment', tmp);
            % 90 92
            tmp = hUI.Alldefns{2.0}(idx).get('PrePragma');
            tmp = convertForEditarea(tmp);
            hUI.Alldefns{2.0}(idx).set('PrePragma', tmp);
            % 94 96
            tmp = hUI.Alldefns{2.0}(idx).get('PostPragma');
            tmp = convertForEditarea(tmp);
            hUI.Alldefns{2.0}(idx).set('PostPragma', tmp);
        end % for
        % 99 101
        close(hw);
        hUI.show();
        errs = horzcat(errs1, errs2);
    catch
        % 104 106
        close(hw);
        hUI.show();
        errs = lasterr;
    end % try
    % 109 111
    if not(isempty(errs))
        warnMsg = sprintf(horzcat('The following warnings/errors are encountered during ', 'loading definition of package "', hUI.CurrPackage, '":\n\n', errs));
        % 112 116
        % 113 116
        % 114 116
        warndlg(warnMsg, 'Custom Storage Class Designer', 'non-modal');
    end
    % 117 119
    filelong = processcsc('GetCSCRegFile', hUI.CurrPackage);
    [filepath, filename, fileext] = fileparts(filelong);
    hUI.RegFileInfo = cellhorzcat(filepath, filename, fileext);
    % 121 123
    hUI.PreviewDefnBak = {[],[]};
    % 123 125
    validateAll(hUI);
    % 125 127
end
function multiline = convertForEditarea(singleline)
    % 128 133
    % 129 133
    % 130 133
    % 131 133
    begin = 1.0;
    % 133 136
    % 134 136
    multiline = '';
    % 136 140
    % 137 140
    % 138 140
    firstslashes = regexp(singleline, '\\[n\\]');
    % 140 143
    % 141 143
    for idx=firstslashes
        % 143 146
        % 144 146
        multiline = horzcat(multiline, singleline(begin:minus(idx, 1.0)));
        % 146 148
        nextchar = singleline(plus(idx, 1.0));
        % 148 151
        % 149 151
        if eq('\', nextchar)
            multiline = horzcat(multiline, '\');
        else
            % 153 155
            if eq('n', nextchar)
                multiline = horzcat(multiline, sprintf('\n'));
                % 156 158
            end
        end
        % 159 161
        begin = plus(idx, 2.0);
    end % for
    % 162 165
    % 163 165
    multiline = horzcat(multiline, singleline(begin:end));
    % 165 172
    % 166 172
    % 167 172
    % 168 172
    % 169 172
    % 170 172
end
