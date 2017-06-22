function buildDatabase(this)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    clearDatabase(this);
    % 12 15
    % 13 15
    w = which('-all', 'hdlblocks.m');
    % 15 17
    plugins = {};
    % 17 19
    for i=1.0:length(w)
        % 19 25
        % 20 25
        % 21 25
        % 22 25
        % 23 25
        fid = fopen(w{i}, 'r');
        if ne(fid, -1.0)
            % 26 29
            % 27 29
            file = char(ctranspose(fread(fid)));
            fclose(fid);
            % 30 32
            idx = min(findstr(file, '='));
            % 32 34
            structname = deblank(file(9.0:minus(idx, 1.0)));
            structname = strtrim(structname);
            % 35 38
            % 36 38
            idx = findstr(file, char(10.0));
            if ~(isempty(idx))
                file(1.0:idx(1.0)) = [];
            end
            try
                laste = lasterr;
                eval(file);
                pluginStruct = eval(structname);
                % 45 48
                % 46 48
                supported = true;
                if isfield(pluginStruct, 'supportedplatforms')
                    platform = computer;
                    supported = find(strcmpi(platform, pluginStruct.supportedplatforms));
                end
                al = true;
                if isfield(pluginStruct, 'license')
                    al = pluginStruct.license;
                end
                if supported && al
                    plugins{plus(end, 1.0)} = pluginStruct;
                end
            catch
                % 60 62
                lasterr(laste);
                % 62 65
                % 63 65
            end % try
        end
    end % for
    % 67 71
    % 68 71
    % 69 71
    classes = [];
    for ii=1.0:length(plugins)
        % 72 74
        for jj=1.0:length(plugins{ii}.package)
            package = findpackage(plugins{ii}.package{jj});
            if ~(isempty(package))
                classes = vertcat(classes, horzcat(package.findclass));
            end
        end % for
        % 79 81
        for jj=1.0:length(plugins{ii}.controlfile)
            if ~(isempty(plugins{ii}.controlfile{jj}))
                this.ConfigFiles(plus(end, 1.0)).Path = '';
                this.ConfigFiles(end).FileName = plugins{ii}.controlfile{jj};
            end
        end % for
        % 86 88
        for jj=1.0:length(plugins{ii}.library)
            if ~(isempty(plugins{ii}.library{jj}))
                this.LibraryDB{plus(end, 1.0)} = plugins{ii}.library{jj};
            end
        end % for
    end % for
    % 93 97
    % 94 97
    % 95 97
    for ii=1.0:length(classes)
        c = classes(ii);
        p = c.Package;
        cname = c.Name;
        pname = p.Name;
        classname = horzcat(pname, '.', cname);
        descTag = hdllegalizefieldname(classname);
        obj = eval(classname);
        % 104 106
        if ~(isa(obj, 'hdlcoder.HDLImplementation'))
            warning(horzcat(this.MessageID, 'invalidHDLImplementationClassFound'), 'Skipping invalid hdl implementation class ''%s''', classname);
        else
            % 108 111
            % 109 111
            blocks = obj.getBlocks;
            if isempty(blocks)
                % 112 115
                % 113 115
                continue;
            end
            if ~(iscell(blocks))
                blocks = cellhorzcat(blocks);
            end
            % 119 121
            description = obj.getDescription;
            if isempty(description) || ~(isfield(description, 'ShortListing')) || ~(isfield(description, 'HelpText')) || ~(ischar(description.ShortListing)) || ~(ischar(description.HelpText))
                % 122 129
                % 123 129
                % 124 129
                % 125 129
                % 126 129
                % 127 129
                if ~(isempty(description))
                    warning(horzcat(this.MessageID, 'invalidHDLImplementationDescription'), 'Invalid description for HDLImplementation class ''%s''', classname);
                    % 130 132
                end
                description = struct('ShortForm', classname, 'HelpText', '');
            end
            % 134 136
            description.ClassName = classname;
            description.SupportedBlocks = blocks;
            % 137 139
            for ii=1.0:length(blocks)
                curBlock = blocks{ii};
                % 140 142
                curTag = hdllegalizefieldname(curBlock);
                % 142 144
                if ~(isfield(this.BlockDB, curTag))
                    % 144 147
                    % 145 147
                    this.BlockDB.(curTag) = struct('SimulinkPath', curBlock, 'Implementations', cellhorzcat(cellhorzcat(classname)));
                else
                    % 148 151
                    % 149 151
                    % 150 153
                    % 151 153
                    curImpls = this.BlockDB.(curTag).Implementations;
                    dupClassName = checkForDuplicateShortListing(this, curImpls, description);
                    if ~(isempty(dupClassName))
                        warning(horzcat(this.MessageID, 'duplicateShortListing'), 'Duplicate short listing ''%s'' found in ''%s'' and ''%s''', description.ShortListing, dupClassName, classname);
                        % 156 159
                        % 157 159
                    end
                    % 159 161
                    this.BlockDB.(curTag).Implementations = cat(1.0, curImpls, cellhorzcat(classname));
                    % 161 163
                end
            end % for
            % 164 167
            % 165 167
            this.DescriptionDB.(descTag) = description;
            % 167 169
        end
        % 169 171
    end % for
end
