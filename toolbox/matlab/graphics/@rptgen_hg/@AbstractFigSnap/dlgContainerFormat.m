function dlgStruct = dlgContainerFormat(this, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    dlgStruct = this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('ImageFormat', 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 2.0])), cellhorzcat(this.dlgWidget('isCapture', 'DialogRefresh', true, 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgWidget('CaptureWindowDecorations', 'Enabled', this.isCapture, 'RowSpan', [2.0 2.0], 'ColSpan', [2.0 2.0]))), xlate('Format'), 'LayoutGrid', [2.0 2.0], 'ColStretch', [0.0 1.0], varargin{:});
    % 9 23
    % 10 23
    % 11 23
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
end % function
