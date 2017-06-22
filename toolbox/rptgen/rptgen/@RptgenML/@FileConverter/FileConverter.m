function obj = FileConverter(varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if eq(rem(length(varargin), 2.0), 1.0)
        rgRoot = varargin{1.0};
        varargin = varargin(2.0:end);
        obj = find(rgRoot, '-depth', 1.0, '-isa', mfilename('class'));
        if not(isempty(obj))
            obj = obj(1.0);
        else
            obj = feval(mfilename('class'));
            if isempty(down(rgRoot))
                connect(obj, rgRoot, 'up');
            else
                connect(obj, down(rgRoot), 'right');
            end % if
        end % if
        % 24 27
        % 25 27
        if isempty(obj.SrcFileName)
            try
                % 28 30
                xmlExt = char(getExtension(com.mathworks.toolbox.rptgencore.output.OutputFormat.getFormat('db')));
            catch
                xmlExt = 'xml';
            end % try
            % 33 35
            pwdXmlFiles = dir(horzcat('*.', xmlExt));
            % 35 37
            if gt(length(pwdXmlFiles), 0.0)
                for i=length(pwdXmlFiles):-1.0:1.0
                    if strcmpi(pwdXmlFiles(i).name, 'rptstylesheets.xml') || strcmpi(pwdXmlFiles(i).name, 'rptcomps2.xml') || strcmpi(pwdXmlFiles(i).name, 'rptcomps.xml') || strcmpi(pwdXmlFiles(i).name, 'demos.xml') || strcmpi(pwdXmlFiles(i).name, 'info.xml')
                        % 39 44
                        % 40 44
                        % 41 44
                        % 42 44
                        fileDate(i) = 0.0;
                        pwdXmlFiles(i).name = '';
                    else
                        fileDate(i) = datenum(pwdXmlFiles(i).date);
                    end % if
                end % for
                [lastDate, dateIndex] = max(fileDate);
                currFile = fullfile(pwd, pwdXmlFiles(dateIndex).name);
                obj.SrcFileName = currFile;
            end % if
        end % if
        % 54 56
        set(obj, varargin{:});
        % 56 58
        if not(isempty(rgRoot.Editor))
            ed = DAStudio.EventDispatcher;
            ed.broadcastEvent('HierarchyChangedEvent', rgRoot);
            rgRoot.Editor.view(obj);
        end % if
    else
        obj = feval(mfilename('class'));
        set(obj, varargin{:});
    end % if
