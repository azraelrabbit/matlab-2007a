function c = attribute(c, action, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    c = feval(action, c, varargin{:});
function c = start(c)
    % 8 12
    % 9 12
    % 10 12
    mainFrame = controlsframe(c, 'File to Import');
    prevFrame = controlsframe(c, 'File Content');
    % 13 15
    c = controlsmake(c);
    % 15 17
    c.x.PreviewWindow = uicontrol(c.x.all, 'String', '', 'style', 'edit', 'Max', 2.0, 'Min', 0.0, 'HorizontalAlignment', 'left', 'Enable', 'inactive');
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    mainFrame.FrameContent = vertcat(cellhorzcat(num2cell(c.x.FileName)), {[2.0]}, cellhorzcat(cellhorzcat(c.x.ImportTypeTitle, num2cell(ctranspose(c.x.ImportType)))));
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    prevFrame.FrameContent = cellhorzcat(c.x.PreviewWindow);
    % 31 33
    c.x.LayoutManager = vertcat(cellhorzcat(mainFrame), {[2.0]}, cellhorzcat(prevFrame));
    % 33 37
    % 34 37
    % 35 37
    LocPreview(c);
    % 37 39
    c = resize(c);
function c = refresh(c)
    % 40 42
function c = resize(c)
    % 42 53
    % 43 53
    % 44 53
    % 45 53
    % 46 53
    % 47 53
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    c = controlsresize(c);
function c = Update(c, whichControl, varargin)
    % 54 63
    % 55 63
    % 56 63
    % 57 63
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    c = controlsupdate(c, whichControl, varargin{:});
    % 63 65
    switch whichControl
    case 'FileName'
        LocPreview(c);
    end % switch
function strOnOff = LocOnOff(logOnOff)
    % 69 74
    % 70 74
    % 71 74
    % 72 74
    if logOnOff
        strOnOff = 'on';
    else
        strOnOff = 'off';
    end % if
function LocPreview(c)
    % 79 83
    % 80 83
    % 81 83
    if not(isempty(c.att.FileName))
        fid = fopen(c.att.FileName, 'r');
        if gt(fid, 0.0)
            msgString = ctranspose(char(fread(fid, 256.0, 'char')));
            fclose(fid);
            % 87 89
            if not(isempty(msgString))
            else
                % 90 92
                msgString = sprintf('Warning - File "%s" contains no ASCII text.', c.att.FileName);
            end % if
        else
            msgString = sprintf('Error - Could not open file "%s".', c.att.FileName);
        end % if
    else
        msgString = 'Please specify a file to import';
    end % if
    % 99 101
    set(c.x.PreviewWindow, 'String', msgString);
