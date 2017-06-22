function postWrite(hWriter, hIntermediate, hCustomizer, Options)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    WriteOKFlag = hWriter.verifyFileName();
    % 15 17
    % 16 17
    if WriteOKFlag
        % 18 19
        s_applyTransforms(hWriter, hCustomizer);
        % 20 22
        % 21 22
        FileName = hWriter.FileName;
        % 23 25
        % 24 25
        PageOutput = hWriter.PageOutput;
        PageDescription = hWriter.PageDescription;
        LayoutInfo = hWriter.LayoutInfo;
        % 28 32
        % 29 32
        % 30 32
        % 31 32
        warning('off', 'MATLAB:xlswrite:AddSheet')
        % 33 35
        % 34 35
        HEADER_ROW = LayoutInfo.HEADER_ROW;
        NAME_COLUMN_OFFSET = LayoutInfo.NAME_COLUMN_OFFSET;
        % 37 39
        % 38 39
        for idx=1.0:length(PageOutput)
            % 40 41
            WritePage = PageOutput{idx};
            WritePageDescription = PageDescription(idx);
            % 43 45
            % 44 45
            HeaderLabels = WritePageDescription.HeaderLabels;
            IDLabels = WritePageDescription.IDLabels;
            % 47 49
            % 48 49
            WritePage(HEADER_ROW, plus(NAME_COLUMN_OFFSET, 1.0):end) = ctranspose(vertcat(IDLabels, HeaderLabels));
            % 50 53
            % 51 53
            % 52 53
            SheetName = sprintf('Objects %d', idx);
            % 54 56
            % 55 56
            [Success, Message] = xlswrite(hWriter.FileName, WritePage, SheetName);
            % 57 58
        end % for
        % 59 61
        % 60 61
        warning('on', 'MATLAB:xlswrite:AddSheet')
        % 62 67
        % 63 67
        % 64 67
        % 65 67
        % 66 67
    end % if
    % 68 69
end % function
function s_applyTransforms(hWriter, hCustomizer)
    % 71 84
    % 72 84
    % 73 84
    % 74 84
    % 75 84
    % 76 84
    % 77 84
    % 78 84
    % 79 84
    % 80 84
    % 81 84
    % 82 84
    % 83 84
    if not(isempty(hCustomizer))
        % 85 86
        PageOutput = hWriter.PageOutput;
        PageDescription = hWriter.PageDescription;
        LayoutInfo = hWriter.LayoutInfo;
        % 89 91
        % 90 91
        for idx=1.0:length(PageOutput)
            % 92 93
            CurrentPage = PageOutput{idx};
            CurrentPageDescription = PageDescription(idx);
            % 95 97
            % 96 97
            ClassTransform = hCustomizer.getTransform(CurrentPageDescription.ClassName, 'Class');
            % 98 101
            % 99 101
            % 100 101
            if not(isempty(ClassTransform))
                % 102 103
                CurrentPage{LayoutInfo.CLASS_ROW, LayoutInfo.CLASS_COLUMN} = ClassTransform{2.0};
                % 104 105
            end % if
            % 106 112
            % 107 112
            % 108 112
            % 109 112
            % 110 112
            % 111 112
            IncludeTransform = hCustomizer.getTransform(CurrentPageDescription.ClassName, 'Include');
            % 113 116
            % 114 116
            % 115 116
            if not(isempty(IncludeTransform))
                % 117 118
                IncludeOrder = IncludeTransform{2.0};
                % 119 121
                % 120 121
                HeaderLabels = CurrentPageDescription.HeaderLabels;
                % 122 124
                % 123 124
                [junk, HeaderIndices, IncludeIndices] = intersect(HeaderLabels, IncludeOrder);
                % 125 130
                % 126 130
                % 127 130
                % 128 130
                % 129 130
                [SortInclude, SortIDX] = sort(IncludeIndices);
                OrderedHeaderIndices = HeaderIndices(SortIDX);
                % 132 134
                % 133 134
                CurrentPageDescription.HeaderLabels = HeaderLabels(OrderedHeaderIndices);
                % 135 138
                % 136 138
                % 137 138
                NumIDLabels = length(CurrentPageDescription.IDLabels);
                PageColumnsID = 1.0:plus(LayoutInfo.NAME_COLUMN_OFFSET, NumIDLabels);
                % 140 141
                PageColumnsHeaders = plus(OrderedHeaderIndices, plus(LayoutInfo.NAME_COLUMN_OFFSET, NumIDLabels));
                % 142 145
                % 143 145
                % 144 145
                CurrentPage = CurrentPage(:, horzcat(ctranspose(PageColumnsID(:)), ctranspose(PageColumnsHeaders(:))));
                % 146 147
            end % if
            % 148 153
            % 149 153
            % 150 153
            % 151 153
            % 152 153
            NameTransform = hCustomizer.getTransform(CurrentPageDescription.ClassName, 'Name');
            % 154 157
            % 155 157
            % 156 157
            if not(isempty(NameTransform))
                % 158 159
                PropNamesOriginal = NameTransform{2.0};
                PropNamesNew = NameTransform{3.0};
                % 161 163
                % 162 163
                HeaderLabels = CurrentPageDescription.HeaderLabels;
                % 164 166
                % 165 166
                [junk, HeaderIndices, NameIndices] = intersect(HeaderLabels, PropNamesOriginal);
                % 167 173
                % 168 173
                % 169 173
                % 170 173
                % 171 173
                % 172 173
                HeaderLabels(HeaderIndices) = PropNamesNew(NameIndices);
                % 174 176
                % 175 176
                CurrentPageDescription.HeaderLabels = HeaderLabels;
            end % if
            % 178 180
            % 179 180
            PageOutput{idx} = CurrentPage;
            PageDescription(idx) = CurrentPageDescription;
        end % for
        % 183 185
        % 184 185
        hWriter.PageOutput = PageOutput;
        hWriter.PageDescription = PageDescription;
    end % if
    % 188 189
end % function
