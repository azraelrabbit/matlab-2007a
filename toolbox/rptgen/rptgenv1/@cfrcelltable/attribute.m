function c = attribute(c, action, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    c = feval(action, c, varargin{:});
end
function c = start(c)
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    c.att.isArrayFromWorkspace = logical(1);
    % 14 16
    formatFrame = controlsframe(c, 'Formatting Options');
    headerFrame = controlsframe(c, 'Header/Footer Options');
    % 17 19
    controlList = {'TableTitle';'WorkspaceVariableName';'allAlign';'isBorder';'isPgwide';'isInverted';'numHeaderRows';'Footer';'ColumnWidths';'numFooterRows'};
    % 19 29
    % 20 29
    % 21 29
    % 22 29
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    c = controlsmake(c, controlList);
    % 29 31
    set(c.x.WorkspaceVariableNameTitle, 'HorizontalAlignment', 'left');
    % 31 33
    set(c.x.numFooterRows, 'enable', LocOnOff(strcmp(c.att.Footer, 'LASTROWS')));
    % 33 36
    % 34 36
    formatFrame.FrameContent = vertcat(cellhorzcat(vertcat(cellhorzcat(c.x.TableTitleTitle, c.x.TableTitle), cellhorzcat(c.x.allAlignTitle, c.x.allAlign), cellhorzcat(c.x.ColumnWidthsTitle, c.x.ColumnWidths))), cellhorzcat(c.x.isBorder), cellhorzcat(c.x.isPgwide), cellhorzcat(c.x.isInverted));
    % 36 43
    % 37 43
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    headerFrame.FrameContent = vertcat(cellhorzcat(cellhorzcat(c.x.numHeaderRowsTitle, c.x.numHeaderRows)), {[3.0]}, cellhorzcat(c.x.Footer(1.0)), cellhorzcat(c.x.Footer(2.0)), cellhorzcat(cellhorzcat(c.x.Footer(3.0), c.x.numFooterRows)));
    % 43 49
    % 44 49
    % 45 49
    % 46 49
    % 47 49
    c.x.LayoutManager = vertcat(cellhorzcat(c.x.WorkspaceVariableNameTitle), cellhorzcat(cellhorzcat('indent', c.x.WorkspaceVariableName)), {[5.0]}, cellhorzcat(formatFrame), cellhorzcat(headerFrame));
    % 49 55
    % 50 55
    % 51 55
    % 52 55
    % 53 55
    c = resize(c);
end
function c = refresh(c)
end
function c = resize(c)
    % 59 65
    % 60 65
    % 61 65
    % 62 65
    % 63 65
    c = controlsresize(c);
end
function c = Update(c, whichControl, varargin)
    % 67 71
    % 68 71
    % 69 71
    switch whichControl
    case 'WorkspaceVariableName'
        [c.att.WorkspaceVariableName, errMsg] = rptgenutil('VariableNameCheck', c.x.WorkspaceVariableName, c.att.WorkspaceVariableName, logical(1));
        % 73 76
        % 74 76
        statbar(c, errMsg, not(isempty(errMsg)));
    case 'Footer'
        c = controlsupdate(c, whichControl, varargin{:});
        set(c.x.numFooterRows, 'enable', LocOnOff(strcmp(c.att.Footer, 'LASTROWS')));
    otherwise
        % 80 82
        c = controlsupdate(c, whichControl, varargin{:});
    end
end
function strOnOff = LocOnOff(logOnOff)
    % 85 88
    % 86 88
    if logOnOff
        strOnOff = 'on';
    else
        strOnOff = 'off';
    end
end
