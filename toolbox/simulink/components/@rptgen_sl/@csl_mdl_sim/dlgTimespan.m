function dlgStruct = dlgTimespan(this, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    dlgStruct = this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('UseMdlTimespan', 'DialogRefresh', 1.0)), cellhorzcat(this.dlgWidget('StartTime', 'Enabled', not(this.UseMdlTimespan))), cellhorzcat(this.dlgWidget('EndTime', 'Enabled', not(this.UseMdlTimespan)))), xlate('Timespan'), varargin{:});
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
end % function
