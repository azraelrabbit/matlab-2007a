function dlg = gr_dlgDisplayOptions(this, titleTypeOpts, captionTypeOpts, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    dlgContent = {};
    % 9 11
    if gt(nargin, 1.0) && ~(isempty(titleTypeOpts))
        if isfield(titleTypeOpts, 'property_name')
            pTitleType = titleTypeOpts.property_name;
        else
            pTitleType = 'TitleType';
        end
        wTitleType = this.dlgWidget(pTitleType, 'DialogRefresh', 1.0, 'RowSpan', [4.0 4.0], 'ColSpan', [2.0 2.0]);
        % 17 21
        % 18 21
        % 19 21
        tTitle = this.dlgText(wTitleType.Name);
        wTitleType = rmfield(wTitleType, 'Name');
        % 22 24
        wTitle = titleTypeOpts.(get(this, pTitleType));
        if strncmpi(wTitle, '-', 1.0)
            wTitle = this.dlgWidget(wTitle(2.0:end));
            % 26 28
            if ~(strcmp(wTitle.Type, 'checkbox'))
                wTitle = rmfield(wTitle, 'Name');
            end
        else
            wTitle = this.dlgText(wTitle);
        end
        wTitle.ColSpan = [3.0 4.0];
        dlgContent{plus(end, 1.0), 1.0} = wTitleType;
    else
        wTitle = this.dlgWidget('Title', 'ColSpan', [2.0 4.0]);
        % 37 39
        tTitle = this.dlgText(wTitle.Name);
        wTitle = rmfield(wTitle, 'Name');
    end
    % 41 43
    if gt(nargin, 2.0) && ~(isempty(captionTypeOpts))
        if isfield(captionTypeOpts, 'property_name')
            pCaptionType = captionTypeOpts.property_name;
        else
            pCaptionType = 'CaptionType';
        end
        % 48 50
        wCaptionType = this.dlgWidget(pCaptionType, 'DialogRefresh', 1.0, 'RowSpan', [5.0 5.0], 'ColSpan', [2.0 2.0]);
        % 50 55
        % 51 55
        % 52 55
        % 53 55
        tCaptionType = this.dlgText(wCaptionType.Name, 'RowSpan', [5.0 5.0], 'ColSpan', [1.0 1.0]);
        % 55 58
        % 56 58
        wCaptionType = rmfield(wCaptionType, 'Name');
        % 58 60
        wCaption = captionTypeOpts.(get(this, 'CaptionType'));
        if strncmpi(wCaption, '-', 1.0)
            wCaption = this.dlgWidget(wCaption(2.0:end), 'RowSpan', [5.0 6.0], 'Type', 'editarea');
            % 62 65
            % 63 65
            wCaption = rmfield(wCaption, 'Name');
        else
            % 66 68
            wCaption = this.dlgText(wCaption, 'RowSpan', [5.0 5.0]);
        end
        wCaption.ColSpan = [3.0 4.0];
        dlgContent{plus(end, 1.0), 1.0} = wCaptionType;
        dlgContent{plus(end, 1.0), 1.0} = tCaptionType;
    else
        wCaption = this.dlgWidget('Caption', 'Type', 'editarea', 'RowSpan', [5.0 6.0], 'ColSpan', [1.0 4.0]);
        % 74 78
        % 75 78
        % 76 78
    end
    % 78 80
    if strcmp(this.ViewportType, 'zoom')
        % 80 82
        vpArgs = cellhorzcat('Name', xlate('Max size'));
        wZoomViz = true;
    else
        vpArgs = {};
        wZoomViz = false;
    end
    wViewportSize = this.dlgWidget('ViewportSize', vpArgs{:});
    tViewportSize = this.dlgText(wViewportSize.Name);
    wViewportSize = rmfield(wViewportSize, 'Name');
    % 90 92
    wDocHorizAlign = this.dlgWidget('DocHorizAlign');
    tDocHorizAlign = this.dlgText(wDocHorizAlign.Name);
    wDocHorizAlign = rmfield(wDocHorizAlign, 'Name');
    % 94 96
    wViewportType = this.dlgWidget('ViewportType');
    tViewportType = this.dlgText(wViewportType.Name);
    wViewportType = rmfield(wViewportType, 'Name');
    % 98 100
    dlg = this.dlgContainer(vertcat(dlgContent, vertcat(cellhorzcat(this.dlgSet(tViewportType, 'ColSpan', [1.0 1.0], 'RowSpan', [1.0 1.0])), cellhorzcat(this.dlgSet(wViewportType, 'DialogRefresh', 1.0, 'ColSpan', [2.0 2.0], 'RowSpan', [1.0 1.0])), cellhorzcat(this.dlgWidget('ViewportZoom', 'Enabled', wZoomViz, 'ColSpan', [3.0 3.0], 'RowSpan', [1.0 1.0])), cellhorzcat(this.dlgText('%', 'ColSpan', [4.0 4.0], 'RowSpan', [1.0 1.0])), cellhorzcat(this.dlgSet(tViewportSize, 'ColSpan', [1.0 1.0], 'RowSpan', [2.0 2.0])), cellhorzcat(this.dlgSet(wViewportSize, 'Enabled', ~(strcmp(this.ViewportType, 'none')), 'ColSpan', [2.0 3.0], 'RowSpan', [2.0 2.0])), cellhorzcat(this.dlgWidget('ViewportUnits', 'Enabled', ~(strcmp(this.ViewportType, 'none')), 'ColSpan', [4.0 4.0], 'RowSpan', [2.0 2.0])), cellhorzcat(this.dlgSet(tDocHorizAlign, 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgSet(wDocHorizAlign, 'RowSpan', [3.0 3.0], 'ColSpan', [2.0 4.0])), cellhorzcat(this.dlgSet(tTitle, 'RowSpan', [4.0 4.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgSet(wTitle, 'RowSpan', [4.0 4.0])), cellhorzcat(wCaption))), xlate('Display Options'), 'LayoutGrid', [6.0 4.0], 'ColStretch', [0.0 0.0 1.0 0.0], 'RowStretch', [0.0 0.0 0.0 0.0 0.0 1.0], varargin{:});
    % 100 142
    % 101 142
    % 102 142
    % 103 142
    % 104 142
    % 105 142
    % 106 142
    % 107 142
    % 108 142
    % 109 142
    % 110 142
    % 111 142
    % 112 142
    % 113 142
    % 114 142
    % 115 142
    % 116 142
    % 117 142
    % 118 142
    % 119 142
    % 120 142
    % 121 142
    % 122 142
    % 123 142
    % 124 142
    % 125 142
    % 126 142
    % 127 142
    % 128 142
    % 129 142
    % 130 142
    % 131 142
    % 132 142
    % 133 142
    % 134 142
    % 135 142
    % 136 142
    % 137 142
    % 138 142
    % 139 142
    % 140 142
end
