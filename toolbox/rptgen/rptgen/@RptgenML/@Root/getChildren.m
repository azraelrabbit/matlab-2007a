function c = getChildren(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    c = this.ReportList;
    if isa(c, 'RptgenML.Library')
        c = getChildren(c(1.0));
        % 9 13
        % 10 13
        % 11 13
        if isempty(c)
            c = locGetSearchText;
        end % if
    else
        if usejava('jvm')
            % 17 20
            % 18 20
            if isempty(c) || not(any(ishandle(c)))
                c = locGetSearchText;
            else
                c(plus(end, 1.0)) = locGetSearchText;
            end % if
            % 24 27
            % 25 27
            eval(com.mathworks.jmi.Matlab, 'refreshReportList(RptgenML.Root,true);', [], 0.0);
        else
            this.refreshReportList(true);
            % 29 32
            % 30 32
            c = getChildren(this);
        end % if
    end % if
function msg = locGetSearchText
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    msg = RptgenML.Message(xlate('Searching...                                   '), xlate('Searching the path for Report Generator files.'));
