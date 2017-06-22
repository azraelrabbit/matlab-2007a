function libC = listLibraryComponents(this)
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
    if isempty(this.Library)
        if usejava('jvm')
            libC = RptgenML.Message(xlate('Searching...'), xlate('Searching the path for Report Generator components.'));
            % 14 20
            % 15 20
            % 16 20
            % 17 20
            % 18 20
            feval(com.mathworks.jmi.Matlab, 'showLibrary', cellhorzcat(this), 0.0, []);
            return;
        else
            showLibrary(this);
            libC = getChildren(this.Library);
        end % if
    else
        if isa(this.Library, 'RptgenML.Message')
            libC = this.Library;
        else
            libC = getChildren(this.Library);
        end % if
    end % if
