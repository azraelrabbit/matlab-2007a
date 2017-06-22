function dlgStruct = dlgIOParameters(this, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    dlgStruct = this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('UseMdlIOParam', 'DialogRefresh', 1.0)), cellhorzcat(this.dlgWidget('TimeOut', 'Enabled', not(this.UseMdlIOParam))), cellhorzcat(this.dlgWidget('StatesOut', 'Enabled', not(this.UseMdlIOParam))), cellhorzcat(this.dlgWidget('MatrixOut', 'Enabled', not(this.UseMdlIOParam)))), xlate('I/O Parameters'), varargin{:});
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
end % function
